const fs = require("fs");
const path = require("path");
const yaml = require("json-yaml");
const express = require("express");
const addRequestId = require("express-request-id")();
const bodyParser = require("body-parser");
const cors = require("cors");
const swaggerUi = require("swagger-ui-express");
const swaggerStats = require("swagger-stats");
const rfs = require("rotating-file-stream");
const morgan = require("morgan");

function addRequestScopedLogger(req, res, next) {
  req.logger = logger.child({ requestId: req.id });
  next();
}

const app = express();
app.use(addRequestId);
app.use(addRequestScopedLogger);
app.use(bodyParser.json());
app.use(cors());

app.disable("x-powered-by");

// expose OpenAPI specification
const swaggerSpec = yaml.load(fs.readFileSync("./api/swagger.yaml", "utf-8"));
app.get("/", (req, res) => res.redirect("/docs"));
app.use("/docs", (req, res, next) => {
  req.swaggerDoc = swaggerSpec;
  next();
}, swaggerUi.serve, swaggerUi.setup(swaggerSpec));
app.use(swaggerStats.getMiddleware({ swaggerSpec }))

// create a rotating write stream
const accessLogStream = rfs.createStream("access.log", {
  interval: "1d", // rotate daily
  path: path.join(__dirname, "../log/access")
});
app.use(morgan("combined", { stream: accessLogStream }));

app.use("/api/v1/info/streams", require("./controller/stream"));

// error handler for all routes
app.use((err, req, res, next) => {
  logger.error(err);
  res.status(500).send({ error: err.message });
});

module.exports = app;
