const { createLogger, format, transports } = require("winston");

const customFormat = format.printf(({ level, message, timestamp }) => {
  return `[${timestamp}] [${level.toUpperCase()}]: ${message}`;
});

module.exeports = (function () {
  return createLogger({
    level: "info",
    format: format.combine(
      format.splat(),
      format.metadata({ fillExcept: ["level", "message", "label", "timestamp"] }),
      format.timestamp(),
      // foramt.json()
      customFormat
    ),
    transports: [
      new transports.Console(),
      new transports.File({ filename: "log/output.log" })
    ]
  })
})();
