"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var _cors = _interopRequireDefault(require("cors"));

var _bodyParser = _interopRequireDefault(require("body-parser"));

var _morgan = _interopRequireDefault(require("morgan"));

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { "default": obj }; }

var config = function config(app) {
  app.disable('x-powered-by');
  app.use(_bodyParser["default"].json());
  app.use(_bodyParser["default"].urlencoded({
    extended: false
  }));
  app.use((0, _cors["default"])());
  app.use((0, _morgan["default"])('dev'));
};

var _default = config;
exports["default"] = _default;