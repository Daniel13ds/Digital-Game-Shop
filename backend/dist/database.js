"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var _mongoose = _interopRequireDefault(require("mongoose"));

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { "default": obj }; }

function asyncGeneratorStep(gen, resolve, reject, _next, _throw, key, arg) { try { var info = gen[key](arg); var value = info.value; } catch (error) { reject(error); return; } if (info.done) { resolve(value); } else { Promise.resolve(value).then(_next, _throw); } }

function _asyncToGenerator(fn) { return function () { var self = this, args = arguments; return new Promise(function (resolve, reject) { var gen = fn.apply(self, args); function _next(value) { asyncGeneratorStep(gen, resolve, reject, _next, _throw, "next", value); } function _throw(err) { asyncGeneratorStep(gen, resolve, reject, _next, _throw, "throw", err); } _next(undefined); }); }; }

var uri = process.env.MONGO_URI;
var options = {
  useNewUrlParser: true,
  useUnifiedTopology: true,
  useFindAndModify: false,
  useCreateIndex: true
};
_mongoose["default"].Promise = global.Promise;

_mongoose["default"].connect(uri, options).then(function () {
  console.log("Conectado a MongoDB 💾");
})["catch"](function (error) {
  console.log(error);
});

function connect() {
  return _connect.apply(this, arguments);
}

function _connect() {
  _connect = _asyncToGenerator( /*#__PURE__*/regeneratorRuntime.mark(function _callee() {
    return regeneratorRuntime.wrap(function _callee$(_context) {
      while (1) {
        switch (_context.prev = _context.next) {
          case 0:
            _context.next = 2;
            return _mongoose["default"].connect('mongodb://localhost/digitalshop', {
              useNewUrlParser: true
            });

          case 2:
            console.log('Database: Connected');

          case 3:
          case "end":
            return _context.stop();
        }
      }
    }, _callee);
  }));
  return _connect.apply(this, arguments);
}

var _default = connect;
exports["default"] = _default;