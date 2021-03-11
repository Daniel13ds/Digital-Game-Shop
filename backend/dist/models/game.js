"use strict";

function _typeof(obj) { "@babel/helpers - typeof"; if (typeof Symbol === "function" && typeof Symbol.iterator === "symbol") { _typeof = function _typeof(obj) { return typeof obj; }; } else { _typeof = function _typeof(obj) { return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; }; } return _typeof(obj); }

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var _mongoose = _interopRequireWildcard(require("mongoose"));

var _validator = _interopRequireDefault(require("validator"));

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { "default": obj }; }

function _getRequireWildcardCache() { if (typeof WeakMap !== "function") return null; var cache = new WeakMap(); _getRequireWildcardCache = function _getRequireWildcardCache() { return cache; }; return cache; }

function _interopRequireWildcard(obj) { if (obj && obj.__esModule) { return obj; } if (obj === null || _typeof(obj) !== "object" && typeof obj !== "function") { return { "default": obj }; } var cache = _getRequireWildcardCache(); if (cache && cache.has(obj)) { return cache.get(obj); } var newObj = {}; var hasPropertyDescriptor = Object.defineProperty && Object.getOwnPropertyDescriptor; for (var key in obj) { if (Object.prototype.hasOwnProperty.call(obj, key)) { var desc = hasPropertyDescriptor ? Object.getOwnPropertyDescriptor(obj, key) : null; if (desc && (desc.get || desc.set)) { Object.defineProperty(newObj, key, desc); } else { newObj[key] = obj[key]; } } } newObj["default"] = obj; if (cache) { cache.set(obj, newObj); } return newObj; }

var Schema = _mongoose["default"].Schema;
var GameSchema = new Schema({
  logo: {
    type: String,
    required: true,
    unique: true
  },
  title: {
    type: String,
    required: true,
    unique: false,
    trim: true
  },
  description: {
    type: String,
    required: false,
    unique: false,
    trim: true
  },
  distributor: {
    type: String,
    required: true,
    unique: false
  },
  date: {
    type: String,
    required: true,
    unique: false,
    trim: true
  },
  price: {
    type: Number,
    required: true,
    unique: false
  },
  personal_score: {
    type: Number,
    required: false,
    unique: false
  },
  global_score: {
    type: Number,
    required: false,
    unique: false
  },
  progress: {
    type: Number,
    required: false,
    unique: false
  },
  user_id: {
    type: Array,
    required: false,
    unique: false
  }
}, {
  versionKey: false
});

var Game = _mongoose["default"].model('Game', GameSchema);

var _default = Game;
exports["default"] = _default;