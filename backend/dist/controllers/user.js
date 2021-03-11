"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var _user = _interopRequireDefault(require("../models/user"));

var _bcrypt = _interopRequireDefault(require("bcrypt"));

var _jsonwebtoken = _interopRequireDefault(require("jsonwebtoken"));

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { "default": obj }; }

function asyncGeneratorStep(gen, resolve, reject, _next, _throw, key, arg) { try { var info = gen[key](arg); var value = info.value; } catch (error) { reject(error); return; } if (info.done) { resolve(value); } else { Promise.resolve(value).then(_next, _throw); } }

function _asyncToGenerator(fn) { return function () { var self = this, args = arguments; return new Promise(function (resolve, reject) { var gen = fn.apply(self, args); function _next(value) { asyncGeneratorStep(gen, resolve, reject, _next, _throw, "next", value); } function _throw(err) { asyncGeneratorStep(gen, resolve, reject, _next, _throw, "throw", err); } _next(undefined); }); }; }

var userController = {
  registerUser: function () {
    var _registerUser = _asyncToGenerator( /*#__PURE__*/regeneratorRuntime.mark(function _callee(req, res) {
      var body, userNew;
      return regeneratorRuntime.wrap(function _callee$(_context) {
        while (1) {
          switch (_context.prev = _context.next) {
            case 0:
              body = req.body;
              _context.prev = 1;
              _context.next = 4;
              return _user["default"].create(body);

            case 4:
              userNew = _context.sent;
              res.status(201).json(userNew);
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

    function registerUser(_x, _x2) {
      return _registerUser.apply(this, arguments);
    }

    return registerUser;
  }(),
  getUsers: function () {
    var _getUsers = _asyncToGenerator( /*#__PURE__*/regeneratorRuntime.mark(function _callee2(req, res) {
      var users;
      return regeneratorRuntime.wrap(function _callee2$(_context2) {
        while (1) {
          switch (_context2.prev = _context2.next) {
            case 0:
              _context2.prev = 0;
              _context2.next = 3;
              return _user["default"].find();

            case 3:
              users = _context2.sent;
              res.status(200).json(users);
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

    function getUsers(_x3, _x4) {
      return _getUsers.apply(this, arguments);
    }

    return getUsers;
  }(),
  getUserById: function () {
    var _getUserById = _asyncToGenerator( /*#__PURE__*/regeneratorRuntime.mark(function _callee3(req, res) {
      var _id, user;

      return regeneratorRuntime.wrap(function _callee3$(_context3) {
        while (1) {
          switch (_context3.prev = _context3.next) {
            case 0:
              _id = req.params.id;
              _context3.prev = 1;
              _context3.next = 4;
              return _user["default"].findById(_id);

            case 4:
              user = _context3.sent;
              res.status(200).json(user);
              _context3.next = 11;
              break;

            case 8:
              _context3.prev = 8;
              _context3.t0 = _context3["catch"](1);
              res.status(500).json({
                error: _context3.t0
              });

            case 11:
            case "end":
              return _context3.stop();
          }
        }
      }, _callee3, null, [[1, 8]]);
    }));

    function getUserById(_x5, _x6) {
      return _getUserById.apply(this, arguments);
    }

    return getUserById;
  }(),
  deleteUserByID: function () {
    var _deleteUserByID = _asyncToGenerator( /*#__PURE__*/regeneratorRuntime.mark(function _callee4(req, res) {
      var _id, user;

      return regeneratorRuntime.wrap(function _callee4$(_context4) {
        while (1) {
          switch (_context4.prev = _context4.next) {
            case 0:
              _id = req.params.id;
              _context4.prev = 1;
              _context4.next = 4;
              return _user["default"].findByIdAndDelete(_id);

            case 4:
              user = _context4.sent;
              res.status(200).json(user);
              _context4.next = 11;
              break;

            case 8:
              _context4.prev = 8;
              _context4.t0 = _context4["catch"](1);
              res.status(500).json({
                error: _context4.t0
              });

            case 11:
            case "end":
              return _context4.stop();
          }
        }
      }, _callee4, null, [[1, 8]]);
    }));

    function deleteUserByID(_x7, _x8) {
      return _deleteUserByID.apply(this, arguments);
    }

    return deleteUserByID;
  }(),
  updateUserById: function () {
    var _updateUserById = _asyncToGenerator( /*#__PURE__*/regeneratorRuntime.mark(function _callee5(req, res) {
      var _id, body, user;

      return regeneratorRuntime.wrap(function _callee5$(_context5) {
        while (1) {
          switch (_context5.prev = _context5.next) {
            case 0:
              _id = req.params.id;
              body = req.body;
              _context5.prev = 2;
              _context5.next = 5;
              return _user["default"].findByIdAndUpdate(_id, body);

            case 5:
              user = _context5.sent;

              if (!user) {
                res.status(404).json({
                  error: "no existe el usuario"
                });
              }

              res.status(200).json({
                message: "actualización correcta"
              });
              _context5.next = 13;
              break;

            case 10:
              _context5.prev = 10;
              _context5.t0 = _context5["catch"](2);
              res.status(500).json({
                error: "Error de servidor"
              });

            case 13:
            case "end":
              return _context5.stop();
          }
        }
      }, _callee5, null, [[2, 10]]);
    }));

    function updateUserById(_x9, _x10) {
      return _updateUserById.apply(this, arguments);
    }

    return updateUserById;
  }(),
  loginUser: function () {
    var _loginUser = _asyncToGenerator( /*#__PURE__*/regeneratorRuntime.mark(function _callee6(req, res) {
      var body, user, validUser, token;
      return regeneratorRuntime.wrap(function _callee6$(_context6) {
        while (1) {
          switch (_context6.prev = _context6.next) {
            case 0:
              body = req.body;
              console.log(body);
              _context6.prev = 2;
              _context6.next = 5;
              return _user["default"].findOne({
                username: body.username
              });

            case 5:
              user = _context6.sent;

              if (user) {
                _context6.next = 9;
                break;
              }

              res.status(400).json({
                error: 'not valid user'
              });
              throw new Error();

            case 9:
              _context6.next = 11;
              return _bcrypt["default"].compare(body.password + "", user.password + "");

            case 11:
              validUser = _context6.sent;

              if (validUser) {
                token = _jsonwebtoken["default"].sign({
                  _id: user._id
                }, process.env.JWT_KEY, {
                  expiresIn: '1h'
                });
                res.status(200).json({
                  message: 'valid user',
                  token: token
                });
              } else {
                res.status(400).json({
                  error: 'not valid password'
                });
              }

              _context6.next = 18;
              break;

            case 15:
              _context6.prev = 15;
              _context6.t0 = _context6["catch"](2);
              console.log(_context6.t0);

            case 18:
            case "end":
              return _context6.stop();
          }
        }
      }, _callee6, null, [[2, 15]]);
    }));

    function loginUser(_x11, _x12) {
      return _loginUser.apply(this, arguments);
    }

    return loginUser;
  }(),
  validate: function () {
    var _validate = _asyncToGenerator( /*#__PURE__*/regeneratorRuntime.mark(function _callee7(req, res, next) {
      var token;
      return regeneratorRuntime.wrap(function _callee7$(_context7) {
        while (1) {
          switch (_context7.prev = _context7.next) {
            case 0:
              if (!req.headers.authorization) {
                res.status(401).json({
                  error: 'Unauthorized'
                });
              }

              _context7.prev = 1;
              token = _jsonwebtoken["default"].verify(req.headers.authorization, process.env.JWT_KEY);
              req.body._id = token.username;
              next();
              _context7.next = 10;
              break;

            case 7:
              _context7.prev = 7;
              _context7.t0 = _context7["catch"](1);
              return _context7.abrupt("return", res.status(401).json({
                error: 'Unvalid Token'
              }));

            case 10:
            case "end":
              return _context7.stop();
          }
        }
      }, _callee7, null, [[1, 7]]);
    }));

    function validate(_x13, _x14, _x15) {
      return _validate.apply(this, arguments);
    }

    return validate;
  }()
};
var _default = userController;
exports["default"] = _default;