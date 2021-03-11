"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var _reward = _interopRequireDefault(require("../models/reward"));

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { "default": obj }; }

function asyncGeneratorStep(gen, resolve, reject, _next, _throw, key, arg) { try { var info = gen[key](arg); var value = info.value; } catch (error) { reject(error); return; } if (info.done) { resolve(value); } else { Promise.resolve(value).then(_next, _throw); } }

function _asyncToGenerator(fn) { return function () { var self = this, args = arguments; return new Promise(function (resolve, reject) { var gen = fn.apply(self, args); function _next(value) { asyncGeneratorStep(gen, resolve, reject, _next, _throw, "next", value); } function _throw(err) { asyncGeneratorStep(gen, resolve, reject, _next, _throw, "throw", err); } _next(undefined); }); }; }

var rewardController = {
  createReward: function () {
    var _createReward = _asyncToGenerator( /*#__PURE__*/regeneratorRuntime.mark(function _callee(req, res) {
      var body, reward;
      return regeneratorRuntime.wrap(function _callee$(_context) {
        while (1) {
          switch (_context.prev = _context.next) {
            case 0:
              body = req.body;
              _context.prev = 1;
              _context.next = 4;
              return _reward["default"].create(body);

            case 4:
              reward = _context.sent;
              res.status(201).json(reward);
              _context.next = 11;
              break;

            case 8:
              _context.prev = 8;
              _context.t0 = _context["catch"](1);
              res.status(400).json({
                error: _context.t0
              });

            case 11:
            case "end":
              return _context.stop();
          }
        }
      }, _callee, null, [[1, 8]]);
    }));

    function createReward(_x, _x2) {
      return _createReward.apply(this, arguments);
    }

    return createReward;
  }(),
  getRewards: function () {
    var _getRewards = _asyncToGenerator( /*#__PURE__*/regeneratorRuntime.mark(function _callee2(req, res) {
      var rewards;
      return regeneratorRuntime.wrap(function _callee2$(_context2) {
        while (1) {
          switch (_context2.prev = _context2.next) {
            case 0:
              _context2.prev = 0;
              _context2.next = 3;
              return _reward["default"].find();

            case 3:
              rewards = _context2.sent;
              res.status(200).json(rewards);
              _context2.next = 10;
              break;

            case 7:
              _context2.prev = 7;
              _context2.t0 = _context2["catch"](0);
              res.status(400).json({
                error: _context2.t0
              });

            case 10:
            case "end":
              return _context2.stop();
          }
        }
      }, _callee2, null, [[0, 7]]);
    }));

    function getRewards(_x3, _x4) {
      return _getRewards.apply(this, arguments);
    }

    return getRewards;
  }(),
  getRewardById: function () {
    var _getRewardById = _asyncToGenerator( /*#__PURE__*/regeneratorRuntime.mark(function _callee3(req, res) {
      var _id, reward;

      return regeneratorRuntime.wrap(function _callee3$(_context3) {
        while (1) {
          switch (_context3.prev = _context3.next) {
            case 0:
              _id = req.params._id;
              _context3.prev = 1;
              _context3.next = 4;
              return _reward["default"].findById(_id);

            case 4:
              reward = _context3.sent;
              res.status(200).json(reward);
              _context3.next = 11;
              break;

            case 8:
              _context3.prev = 8;
              _context3.t0 = _context3["catch"](1);
              res.status(404).json({
                error: _context3.t0
              });

            case 11:
            case "end":
              return _context3.stop();
          }
        }
      }, _callee3, null, [[1, 8]]);
    }));

    function getRewardById(_x5, _x6) {
      return _getRewardById.apply(this, arguments);
    }

    return getRewardById;
  }(),
  deleteRewardById: function () {
    var _deleteRewardById = _asyncToGenerator( /*#__PURE__*/regeneratorRuntime.mark(function _callee4(req, res) {
      var _id, reward;

      return regeneratorRuntime.wrap(function _callee4$(_context4) {
        while (1) {
          switch (_context4.prev = _context4.next) {
            case 0:
              _id = req.params._id;
              _context4.prev = 1;
              _context4.next = 4;
              return _reward["default"].findByIdAndDelete(_id);

            case 4:
              reward = _context4.sent;
              res.status(200).json(reward);
              _context4.next = 11;
              break;

            case 8:
              _context4.prev = 8;
              _context4.t0 = _context4["catch"](1);
              res.status(404).json({
                error: _context4.t0
              });

            case 11:
            case "end":
              return _context4.stop();
          }
        }
      }, _callee4, null, [[1, 8]]);
    }));

    function deleteRewardById(_x7, _x8) {
      return _deleteRewardById.apply(this, arguments);
    }

    return deleteRewardById;
  }(),
  upadateRewardById: function () {
    var _upadateRewardById = _asyncToGenerator( /*#__PURE__*/regeneratorRuntime.mark(function _callee5(req, res) {
      var _id, body, reward;

      return regeneratorRuntime.wrap(function _callee5$(_context5) {
        while (1) {
          switch (_context5.prev = _context5.next) {
            case 0:
              _id = req.params._id;
              body = req.body;
              _context5.prev = 2;
              _context5.next = 5;
              return _reward["default"].findByIdAndUpdate(_id, body);

            case 5:
              reward = _context5.sent;

              if (!reward) {
                res.status(404).json({
                  error: error
                });
              } else {
                res.status(200).json(reward);
              }

              _context5.next = 12;
              break;

            case 9:
              _context5.prev = 9;
              _context5.t0 = _context5["catch"](2);
              res.status(500).json({
                error: _context5.t0
              });

            case 12:
            case "end":
              return _context5.stop();
          }
        }
      }, _callee5, null, [[2, 9]]);
    }));

    function upadateRewardById(_x9, _x10) {
      return _upadateRewardById.apply(this, arguments);
    }

    return upadateRewardById;
  }()
};
var _default = rewardController;
exports["default"] = _default;