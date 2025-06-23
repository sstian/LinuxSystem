const app = require("./app");
const config = require("./config");
const logger = require("./logger");

const listener = app.listen(config.get("port"), () => {
  const addy = listener.address();
  logger.info(`running on http ${addy.address}:${addy.port}`);
});
