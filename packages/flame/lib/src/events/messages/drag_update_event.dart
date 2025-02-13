import 'package:flame/extensions.dart';
import 'package:flame/src/events/messages/position_event.dart';
import 'package:flutter/gestures.dart';

class DragUpdateEvent extends PositionEvent {
  DragUpdateEvent(this.pointerId, super.game, DragUpdateDetails details)
      : timestamp = details.sourceTimeStamp ?? Duration.zero,
        delta = details.delta.toVector2(),
        super(
          devicePosition: details.globalPosition.toVector2(),
        );

  final int pointerId;
  final Duration timestamp;
  final Vector2 delta;

  static final _nanPoint = Vector2.all(double.nan);

  @override
  Vector2 get localPosition {
    return renderingTrace.isEmpty ? _nanPoint : renderingTrace.last;
  }

  @override
  String toString() => 'DragUpdateEvent(devicePosition: $devicePosition, '
      'canvasPosition: $canvasPosition, '
      'delta: $delta, '
      'pointerId: $pointerId, timestamp: $timestamp)';
}
