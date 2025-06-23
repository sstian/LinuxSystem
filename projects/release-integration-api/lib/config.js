const convict = require("convict");
const convictValidaator = require("convict-format-with-validator");
const yaml = require("yaml");

function Config() {
  convict.addParser({ extension: ["yml", "yaml"], parse: yaml.load });
  convict.addFormat(convictValidaator.ipaddress);

  const configSchema = convict({
    env: {
      doc: "The application environment",
      format: ["development", "test", "production"],
      default: "development",
      env: "MY_NODE_ENV"
    },
    logLevel: {
      doc: "Log Level",
      foramt: Object.keys(winston.config.syslog.levels),
      default: "info",
      env: "MY_LOG_LEVEL"
    },
    port: {
      doc: "Port to listen on",
      format: Number,
      default: 3300,
      arg: "port",
      env: "MY_NDOE_PORT"
    },
    cacheFolder: {
      doc: "Cache Folder to store data",
      format: String,
      default: "",
      env: "MY_CACHE_FOLDER"
    }
  });

  const env = configSchema.get("env");
  configSchema.loadFile(`./config/${env}.yml`);
  configSchema.validate({ allowed: "strict" });

  return configSchema;
}

module.exports = Config();
