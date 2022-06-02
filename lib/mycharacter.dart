// import 'dart:ui';
// import 'package:flame/collisions.dart';
// import 'package:flame/components.dart';
// import 'package:flame/game.dart';
// import 'package:flame/geometry.dart';
// import 'package:flutter/material.dart';
//
// enum MyCharacterAnimationType {
//   walkTop,
//   walkRight,
//   walkBottom,
//   walkLeft,
// }
//
// class MyCharcter extends PositionComponent
//     with HasHitboxes, Collidable, HasGameRef {
//   // アニメーション設定
//   static final Map<MyCharacterAnimationType, Map<String, dynamic>>
//       _animationImages = {
//     MyCharacterAnimationType.walkBottom: {
//       'fileName': 'down.png',
//       'data': SpriteAnimationData.sequenced(
//           amount: 3, stepTime: 0.2, textureSize: Vector2(32, 32))
//     },
//     MyCharacterAnimationType.walkLeft: {
//       'fileName': 'left.png',
//       'data': SpriteAnimationData.sequenced(
//           amount: 3, stepTime: 0.2, textureSize: Vector2(32, 32))
//     },
//     MyCharacterAnimationType.walkTop: {
//       'fileName': 'up.png',
//       'data': SpriteAnimationData.sequenced(
//           amount: 3, stepTime: 0.2, textureSize: Vector2(32, 32))
//     },
//     MyCharacterAnimationType.walkRight: {
//       'fileName': 'right.png',
//       'data': SpriteAnimationData.sequenced(
//           amount: 3, stepTime: 0.2, textureSize: Vector2(32, 32))
//     },
//   };
//
//   // アニメーショングループコンポーネント
//   late SpriteAnimationGroupComponent _animationGroup;
//
//   // 当たり判定
//   late HitboxPolygon _hitbox;
//
//   // 移動速度
//   double _moveSpeed = 3;
//
//   // コンストラクタ
//   MyCharacter({required double x, required double y, required double width, required double height}) : super(position: Vector2(x, y), size: Vector2(width, height));
//
//   @override
//   Future<void> onLoad() async {
//
//     // キャラクターアニメーションの作成
//     _animationGroup = await _createCharaAnimation(this.size);
//     add(_animationGroup);
//
//     // 当たり判定の作成
//     _hitbox = HitboxPolygon([
//       Vector2(-1, -1),
//       Vector2(-1, 1),
//       Vector2(1, 1),
//       Vector2(1, -1),
//     ]);
//     addHitbox(_hitbox);
//
//     await super.onLoad();
//
//   }
//
//   @override
//   void update(double dt) {
//
//     // アニメーションの状態によって歩く向きの切り替え
//     switch(this._animationGroup.current){
//       case MyCharacterAnimationType.walkTop:
//         this.position += Vector2(0, _moveSpeed  * -1);
//         break;
//       case MyCharacterAnimationType.walkRight:
//         this.position += Vector2(_moveSpeed, 0);
//         break;
//       case MyCharacterAnimationType.walkBottom:
//         this.position += Vector2(0, _moveSpeed);
//         break;
//       case MyCharacterAnimationType.walkLeft:
//         this.position += Vector2(_moveSpeed * -1, 0);
//         break;
//     }
//
//     super.update(dt);
//
//   }
//
//   void changeAnimation(MyCharacterAnimationType animationType){
//     this._animationGroup.current = animationType;
//   }
//
//   void changeMoveSpeed(double speed){
//     this._moveSpeed = speed;
//   }
//
//   Future<SpriteAnimationGroupComponent> _createCharaAnimation(Vector2 charaSize) async {
//
//     Map<MyCharacterAnimationType, SpriteAnimation> animations = {};
//     _animationImages.forEach((key, map) async {
//       animations[key] = await gameRef.loadSpriteAnimation(map['fileName'], map['data']);
//     });
//
//     var component = SpriteAnimationGroupComponent<MyCharacterAnimationType>(
//       animations: animations,
//       current: MyCharacterAnimationType.walkBottom,
//       position: Vector2(0, 0),
//       size: charaSize,
//     );
//
//     return component;
//   }
//
//   // デバッグ用ペイント生成
//   final hitboxPaint = Paint()
//     ..color = Colors.lightBlueAccent
//     ..style = PaintingStyle.stroke
//     ..strokeWidth = 2;
//   final dotPaint = Paint()
//     ..color = Colors.blueAccent
//     ..style = PaintingStyle.fill;
//
//   @override
//   void render(Canvas canvas) {
//     super.render(canvas);
//     // デバッグ用に当たり判定部分を描画
//     _hitbox.render(canvas, hitboxPaint);
//     _hitbox.localVertices().forEach((p) => canvas.drawCircle(p.toOffset(), 4, dotPaint));
//   }
//
//   @override
//   void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
//
//     // 画面端の衝突判定
//     if (other is ScreenCollidable) {
//       // キャラクターを止める
//       this._moveSpeed = 0;
//
//       // 衝突判定外の位置に調整
//       var x = this.position.x;
//       var y = this.position.y;
//       x = (x <= 0 ? 1 : x);
//       y = (y <= 0 ? 1 : y);
//       intersectionPoints.forEach((pos) {
//         if (pos.x >= this.gameRef.canvasSize.x){
//           x = this.gameRef.canvasSize.x - this.size.x - 1;
//         }
//         if (pos.y >= this.gameRef.canvasSize.y){
//           y = this.gameRef.canvasSize.y - this.size.y - 1;
//         }
//       });
//
//       this.position = Vector2(x, y);
//
//     }
//   }
// }
