import 'dart:math';
import 'dart:ui';
import 'package:boxgame/criacao.dart';
import 'package:boxgame/efeitos.dart';
import 'package:boxgame/movimentacao.dart';
import 'package:flame/game.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

Sprite peca = Sprite('peca.png');
Sprite peca2 = Sprite('peca2.png');
Sprite peca3 = Sprite('peca3.png');
Sprite casa1 = Sprite('casa1.png');
Sprite casa5 = Sprite('casa5.png');
Sprite casa7 = Sprite('casa7.png');
Sprite casa9 = Sprite('casa9.png');

var coord_casas = [];
double screenCenterX;
double screenCenterY;
int color_dado= 0xffffffff;

Rect pecaRect1, pecaRect2, pecaRect3, bt_erradoRect, bt_certoRect, casa1Rect, casa5Rect, casa7Rect, casa9Rect;

bool criaImage = true;
bool bloq = true;

//Variavel que controla a criação da imagem, se true a imagem aparece na tela
bool bloq_cria_casa1;
//Se true cria a imagem da casa
bool cria_casa1 = false;
//Variavel que controla a chamada do efeito casa1
bool bloq_efeito1 = true;

bool bloq_cria_casa5;
bool cria_casa5 = false;
bool bloq_efeito5 = true;
bool estou_na_casa5 = false;

bool bloq_cria_casa7;
bool cria_casa7 = false;
bool bloq_efeito7 = true;

bool bloq_cria_casa9;
bool cria_casa9 = false;
bool bloq_efeito9 = true;

bool andando = true;
bool deslocamento = false;

var players = [0,0,0];
var aux_players = [0,0,0];
var desloc_x = [0.0,0.0,0.0];
var desloc_y = [0.0,0.0,0.0];
int jogador = 0;
int vez = 0;
Offset targetLocation;

int mult;
double stepDistance;

void setTargetLocation() {
  targetLocation = Offset(desloc_x[vez], desloc_y[vez]);
  deslocamento = true;
}

class Tabuleiro extends Game {
  Efeito efeito = new Efeito();
  Movimentacao movimentacao = new Movimentacao();
  Size screenSize;
  double get speed => 40;

  Random rnd = Random();

  //Função que reconhece o toque nos botões
  void onTapDown(TapDownDetails d) {
    if(d.globalPosition.dx >= screenCenterX - 25
        && d.globalPosition.dx <= screenCenterX + 25
        && d.globalPosition.dy >= screenCenterY + 100
        && d.globalPosition.dy <= screenCenterY + 150
    )if(andando)dado();

    if(d.globalPosition.dx >= screenCenterX - 80 //Esquerda
        && d.globalPosition.dx <= screenCenterX + 70 //Direita
        && d.globalPosition.dy >= screenCenterY - 75 //Superior
        && d.globalPosition.dy <= screenCenterY + 80 //Inferior
    ){
      if(players[vez]==1){
        //Desaparecer imagem
        bloq_cria_casa1 = false;
        efeito.casa1();
      }else if(players[vez]==7){
        players[vez]=4;
        desloc_x[vez] = coord_casas[6];
        desloc_y[vez] = coord_casas[7];
        setTargetLocation();
        bloq_cria_casa7 = false;
        efeito.casa7();
      }
    }

    // Botão certo da casa5
    if(d.globalPosition.dx >= screenCenterX - 100
        && d.globalPosition.dx <= screenCenterX -25
        && d.globalPosition.dy >= screenCenterY + 100
        && d.globalPosition.dy <= screenCenterY + 150
    ){
      if(estou_na_casa5){
        desloc_x[vez] = coord_casas[10];
        desloc_y[vez] = coord_casas[11];
        setTargetLocation();
        players[vez] = 6;
        bloq_cria_casa5 = false;
        estou_na_casa5 = false;
        efeito.casa5();
        print('certo');
      }
    }

    // Botão errado da casa5
    if(d.globalPosition.dx >= screenCenterX + 25
        && d.globalPosition.dx <= screenCenterX + 75
        && d.globalPosition.dy >= screenCenterY + 100
        && d.globalPosition.dy <= screenCenterY + 150
    ){
      if(estou_na_casa5){
        desloc_x[vez] = coord_casas[4];
        desloc_y[vez] = coord_casas[5];
        setTargetLocation();
        players[vez] = 3;
        bloq_cria_casa5 = false;
        estou_na_casa5 = false;
        efeito.casa5();
        print('errado');
      }
    }

  }

  void dado() {
    bloq_efeito1 = true;
    bloq_efeito5 = true;
    bloq_efeito7 = true;
    bloq_efeito9 = true;

    int n_rnd = 0;
    while (n_rnd == 0) {
      n_rnd = rnd.nextInt(7);
    }
    if(players[vez]==1) jogador-=1;
    if (jogador == 3) jogador = 0;
    jogador += 1;
    vez = jogador - 1;
    aux_players[vez] = players[vez];
    players[vez] = players[vez] + n_rnd;
    if(jogador==1) players[vez]=9;
    print(jogador.toString() + " " + players[vez].toString());
    mult = players[vez] * 2;
    if (players[vez] >= 25)
      efeito.vencedor();
    else if (players[vez] > 9 && aux_players[vez] < 9) {
      desloc_x[vez] = coord_casas[16];
      desloc_y[vez] = coord_casas[17];
      setTargetLocation();
    } else if (players[vez] > 16 && aux_players[vez] < 16) {
      desloc_x[vez] = coord_casas[30];
      desloc_y[vez] = coord_casas[31];
      setTargetLocation();
    }else if(players[vez]==1){
      desloc_x[vez] = coord_casas[mult-2];
      desloc_y[vez] = coord_casas[mult-1];
      setTargetLocation();
    }else{
      desloc_x[vez] = coord_casas[mult-2];
      desloc_y[vez] = coord_casas[mult-1];
      setTargetLocation();
    }
  }

  void render(Canvas canvas) {
    Criacao criacao = new Criacao(canvas);

    //Inicializando as variaveis
    screenCenterX = screenSize.width / 2;
    screenCenterY = screenSize.height / 2;

    //Criação do Dado
    criacao.criacaoDado();

    //Criando tabuleiro
    criacao.tabuleiro();

    //Criação da peca
    if(criaImage)criacao.iniImage();
    if(cria_casa1) criacao.criaCasas(1);
    if(cria_casa5) criacao.criaCasas(5);
    if(cria_casa7) criacao.criaCasas(7);
    if(cria_casa9) criacao.criaCasas(9);

    criacao.criaPecas();

  }

  void update(double t) {
    stepDistance = speed * t;
    if(deslocamento){
      movimentacao.andaPeca();
    }

  }

  void resize(Size size) {
    screenSize = size;
    super.resize(size);
  }

}