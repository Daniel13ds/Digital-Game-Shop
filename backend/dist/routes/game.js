"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var _express = _interopRequireDefault(require("express"));

var _game = _interopRequireDefault(require("../controllers/game"));

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { "default": obj }; }

var gameRoutes = _express["default"].Router();

gameRoutes.post('/', _game["default"].createGame);
gameRoutes.get('/', _game["default"].getGames);
gameRoutes.get('/:_id', _game["default"].getGameById);
gameRoutes["delete"]('/:_id', _game["default"].deleteGameById);
gameRoutes.put('/:_id', _game["default"].updateGameById);
var _default = gameRoutes;
exports["default"] = _default;