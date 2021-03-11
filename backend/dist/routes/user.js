"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var _express = _interopRequireDefault(require("express"));

var _user = _interopRequireDefault(require("../controllers/user"));

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { "default": obj }; }

var userRoutes = _express["default"].Router();

userRoutes.post('/register', _user["default"].registerUser);
userRoutes.post('/login', _user["default"].loginUser);
userRoutes.get('/', _user["default"].getUsers);
userRoutes.get('/:id', _user["default"].getUserById);
userRoutes["delete"]('/:id', _user["default"].deleteUserByID);
userRoutes.put('/:id', _user["default"].updateUserById);
var _default = userRoutes;
exports["default"] = _default;