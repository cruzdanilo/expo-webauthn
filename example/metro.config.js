const path = require("path");

const root = path.resolve(__dirname, ".."); // eslint-disable-line no-undef
module.exports = {
  resolver: {
    extraNodeModules: { "expo-webauthn": root },
  },
  watchFolders: [root],
};
