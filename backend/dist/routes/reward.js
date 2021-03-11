"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var _express = _interopRequireDefault(require("express"));

var _reward = _interopRequireDefault(require("../controllers/reward"));

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { "default": obj }; }

var rewardRoutes = _express["default"].Router();

rewardRoutes.post('/', _reward["default"].createReward);
rewardRoutes.get('/', _reward["default"].getRewards);
rewardRoutes.get('/:_id', _reward["default"].getRewardById);
rewardRoutes["delete"]('/:_id', _reward["default"].deleteRewardById);
rewardRoutes.put('/:_id', _reward["default"].upadateRewardById);
var _default = rewardRoutes;
exports["default"] = _default;