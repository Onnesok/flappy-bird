import 'dart:io';
import 'package:flame/components.dart';
import '../game/pipe_position.dart';
import '../components/pipe.dart';
import '../game/configuration.dart';

class PipeGroup extends PositionComponent{
  PipeGroup();

  @override
  Future<void> onLoad() async {
    addAll([
      Pipe(pipePosition: PipePosition.top, height: 100),
      Pipe(pipePosition: PipePosition.bottom, height: 200),
    ]);
  }
}