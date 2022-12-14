import 'package:flutter/material.dart';

class SizeConfig {
  static double _screenWidth = 0;
  static double _screenHeight = 0;
  static double _blockWidth = 0;
  static double _blockHeight = 0;
  static double screenwidth = 0;
  static double screenheight = 0;
  static double textMultiplier = 0;
  static double imageSizeMultiplier = 0;
  static double heightMultiplier = 0;
  static double widthMultiplier = 0;
  static bool isPortrait = true;
  static bool isMobilePortrait = false;

  static double blockSizeHorizontal = 0;

  static double blockSizeVertical = 0;

  void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
      isPortrait = true;
    } else {
      _screenHeight = constraints.maxWidth;
      _screenWidth = constraints.maxHeight;
      isPortrait = false;
      isMobilePortrait = false;
    }

    _blockWidth =
        // _screenWidth > 600 ? _screenWidth / 170 :
        _screenWidth / 100;
    _blockHeight =
        // _screenWidth > 600 ? _screenHeight / 170 :
        _screenHeight / 100;
    screenwidth = _screenWidth;
    screenheight = _screenHeight;
    textMultiplier =
        ((_blockHeight / _blockWidth) * (_blockHeight / _blockWidth));

    imageSizeMultiplier = _blockWidth;
    heightMultiplier = _blockHeight;
    widthMultiplier = _blockWidth;
    blockSizeHorizontal = _screenWidth / 100;
    blockSizeVertical = _screenHeight / 100;
  }
}
