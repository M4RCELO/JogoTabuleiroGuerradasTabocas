import 'dart:ui';

import 'efeitos.dart';
import 'tabuleiro.dart';


class Movimentacao{

  Efeito efeito = new Efeito();

  void andaPeca(){

    if(jogador==1){
      Offset toTarget = targetLocation - Offset(pecaRect1.left, pecaRect1.top) ;
      if (stepDistance < toTarget.distance) {
        andando = false;
        color_dado = 0xff000000;
        Offset stepToTarget = Offset.fromDirection(toTarget.direction, stepDistance);
        pecaRect1 = pecaRect1.shift(stepToTarget);
      } else {
        if (players[vez] > 9 && aux_players[vez] < 9 &&
            targetLocation.dx == coord_casas[16] &&
            targetLocation.dy == coord_casas[17]) {
          desloc_x[vez] = coord_casas[mult - 2];
          desloc_y[vez] = coord_casas[mult - 1];
          setTargetLocation();
          andando = false;
          color_dado = 0xff000000;
        } else if (players[vez] > 16 && aux_players[vez] < 16 &&
            targetLocation.dx == coord_casas[30] &&
            targetLocation.dy == coord_casas[31]) {
          desloc_x[vez] = coord_casas[mult - 2];
          desloc_y[vez] = coord_casas[mult - 1];
          setTargetLocation();
          andando = false;
          color_dado = 0xff000000;
        }else if(targetLocation.dx == coord_casas[0] && targetLocation.dy == coord_casas[1]){
          if(bloq_efeito1){
            bloq_cria_casa1 = true;
            efeito.casa1();
            jogador=1;
          }
        }else if(targetLocation.dx == coord_casas[8] && targetLocation.dy == coord_casas[9]) {
          if (bloq_efeito5) {
            bloq_cria_casa5 = true;
            estou_na_casa5=true;
            efeito.casa5();
          }
        }else if(targetLocation.dx == coord_casas[12] && targetLocation.dy == coord_casas[13]) {
          if (bloq_efeito7) {
            bloq_cria_casa7 = true;
            efeito.casa7();
          }
        }else if(targetLocation.dx == coord_casas[16] && targetLocation.dy == coord_casas[17]) {
          if (bloq_efeito9) {
            bloq_cria_casa9 = true;
            efeito.casa9();
          }
        }else{
          andando = true;
          color_dado = 0xffffffff;
        }
        pecaRect1 = pecaRect1.shift(toTarget);
      }
    }


    else if(jogador==2){
      Offset toTarget = targetLocation - Offset(pecaRect2.left, pecaRect2.top) ;
      if (stepDistance < toTarget.distance) {
        andando = false;
        color_dado = 0xff000000;
        Offset stepToTarget = Offset.fromDirection(toTarget.direction, stepDistance);
        pecaRect2 = pecaRect2.shift(stepToTarget);
      } else {
        if (players[vez] > 9 && aux_players[vez] < 9 &&
            targetLocation.dx == coord_casas[16] &&
            targetLocation.dy == coord_casas[17]) {
          desloc_x[vez] = coord_casas[mult - 2];
          desloc_y[vez] = coord_casas[mult - 1];
          setTargetLocation();
          andando = false;
          color_dado = 0xff000000;
        } else if (players[vez] > 16 && aux_players[vez] < 16 &&
            targetLocation.dx == coord_casas[30] &&
            targetLocation.dy == coord_casas[31]) {
          desloc_x[vez] = coord_casas[mult - 2];
          desloc_y[vez] = coord_casas[mult - 1];
          setTargetLocation();
          andando = false;
          color_dado = 0xff000000;
        }else if(targetLocation.dx == coord_casas[0] && targetLocation.dy == coord_casas[1]){
          if(bloq_efeito1){
            bloq_cria_casa1 = true;
            efeito.casa1();
            jogador=2;
          }
        }else if(targetLocation.dx == coord_casas[8] && targetLocation.dy == coord_casas[9]) {
          if (bloq_efeito5) {
            bloq_cria_casa5 = true;
            estou_na_casa5=true;
            efeito.casa5();
          }
        }else if(targetLocation.dx == coord_casas[12] && targetLocation.dy == coord_casas[13]) {
          if (bloq_efeito7) {
            bloq_cria_casa7 = true;
            efeito.casa7();
          }
        }else{
          andando = true;
          color_dado = 0xffffffff;
        }
        pecaRect2 = pecaRect2.shift(toTarget);
      }
    }


    else if(jogador==3){
      Offset toTarget = targetLocation - Offset(pecaRect3.left, pecaRect3.top) ;
      if (stepDistance < toTarget.distance) {
        andando = false;
        color_dado = 0xff000000;
        Offset stepToTarget = Offset.fromDirection(toTarget.direction, stepDistance);
        pecaRect3 = pecaRect3.shift(stepToTarget);
      } else {
        if (players[vez] > 9 && aux_players[vez] < 9 &&
            targetLocation.dx == coord_casas[16] &&
            targetLocation.dy == coord_casas[17]) {
          desloc_x[vez] = coord_casas[mult - 2];
          desloc_y[vez] = coord_casas[mult - 1];
          setTargetLocation();
          andando = false;
          color_dado = 0xff000000;
        } else if (players[vez] > 16 && aux_players[vez] < 16 &&
            targetLocation.dx == coord_casas[30] &&
            targetLocation.dy == coord_casas[31]) {
          desloc_x[vez] = coord_casas[mult - 2];
          desloc_y[vez] = coord_casas[mult - 1];
          setTargetLocation();
          andando = false;
          color_dado = 0xff000000;
        }else if(targetLocation.dx == coord_casas[0] && targetLocation.dy == coord_casas[1]){
          if(bloq_efeito1){
            bloq_cria_casa1 = true;
            efeito.casa1();
            jogador=3;
          }
        }else if(targetLocation.dx == coord_casas[8] && targetLocation.dy == coord_casas[9]) {
          if (bloq_efeito5) {
            bloq_cria_casa5 = true;
            estou_na_casa5=true;
            efeito.casa5();
          }
        }else if(targetLocation.dx == coord_casas[12] && targetLocation.dy == coord_casas[13]) {
          if (bloq_efeito7) {
            bloq_cria_casa7 = true;
            efeito.casa7();
          }
        }else{
          andando = true;
          color_dado = 0xffffffff;
        }
        pecaRect3 = pecaRect3.shift(toTarget);
      }
    }


  }
}