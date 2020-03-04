import 'package:boxgame/tabuleiro.dart';
import 'package:flame/util.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flame/flame.dart';
import 'package:flutter/gestures.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.landscapeLeft);
  Flame.images.loadAll(<String>[
    'peca.png',
    'peca2.png',
    'peca3.png',
    'casa1.png',
    'casa5.png',
    'casa7.png',
    'casa9.png'
  ]);

  Tabuleiro game = Tabuleiro();
  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = game.onTapDown;
  runApp(game.widget);
  flameUtil.addGestureRecognizer(tapper);

}