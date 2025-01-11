import 'dart:ui';

import 'package:equatable/equatable.dart';

class TileColor extends Equatable {
  final Color textColor;
  final Color backgroundColor;
  const TileColor({required this.textColor,
    required this.backgroundColor});

  @override
  List<Object?> get props => [
    textColor, backgroundColor
  ];

}