//!SizeConfig shortcuts

//Get dimensions from [SizeConfig]

import './size_config.dart';

//BASE SPACING FOR A APP
const double _baseSpacing = 8;

//RELATIVE SPACING

//1X SPACING
const double space1x = _baseSpacing;

//2X SPACING
const double space2x = 2 * _baseSpacing;

//3X SPACING
const double space3x = 3 * _baseSpacing;

//4X SPACING
const double space4x = 4 * _baseSpacing;

//5X SPACING
const double space5x = 5 * _baseSpacing;

//SCREEN MULTIPLIERS
double get rWidthMultiplier => SizeConfig.widthMultiplier;
double get rHeightMultiplier => SizeConfig.heightMultiplier;

double rw(double width) => SizeConfig.setWidth(width);
double rh(double height) => SizeConfig.setHeight(height);
double rf(double size) => SizeConfig.setSp(size);
