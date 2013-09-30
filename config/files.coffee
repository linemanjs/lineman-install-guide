module.exports = require(process.env["LINEMAN_MAIN"]).config.extend "files",
  webfonts:
    root: "fonts"

  js:
    vendor: ["vendor/js/jquery.js","vendor/js/**/*.js"]
