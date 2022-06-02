import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class EnemySprite extends PositionComponent {
  EnemySprite({
    required double length,
    Color? color,
  })  : this.length = length,
        this.color = color ?? Colors.greenAccent,
        super(
          anchor: Anchor.center,
          size: Vector2.all(length),
        );

  late double length;
  late Color color;

  @override
  void onGameResize(Vector2 gameSize) {
    position = Vector2(gameSize.x / 2.0, gameSize.y / 5.0);
  }

  @override
  void update(double dt) {
    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawRect(
        Rect.fromLTWH(0, 0, length, length), Paint()..color = color);
  }
}
