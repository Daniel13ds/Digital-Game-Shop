"use strict";

require("core-js/stable");

require("regenerator-runtime/runtime");

var _express = _interopRequireDefault(require("express"));

var _config = _interopRequireDefault(require("./config"));

var _router = _interopRequireDefault(require("./router"));

require("./database");

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { "default": obj }; }

var PORT = process.env.PORT || 5000;
var app = (0, _express["default"])();
(0, _config["default"])(app);
(0, _router["default"])(app);
app.listen(PORT, function () {
  return console.log("El servidor ha sido inicializado: http://localhost:".concat(PORT));
});