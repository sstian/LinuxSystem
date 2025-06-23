const express = require("express");
const streamHelper = require("../helper/stream");

const router = express.Router();

router.get("/", (req, res) => {
  streamHelper.getAllStreams()
  .then(data => res.json(data))
  .catch(next);
});

module.exports = router;
