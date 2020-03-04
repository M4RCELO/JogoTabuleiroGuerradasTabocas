import 'package:flame/palette.dart';
import 'package:flame/position.dart';
import 'package:flame/text_config.dart';
import 'package:flutter/cupertino.dart';
import 'tabuleiro.dart';

class Criacao{
  TextConfig config = TextConfig(fontSize: 15, fontFamily: 'Awesome Font',color: BasicPalette.white.color);
  Canvas c;

  Criacao(Canvas canvas){
    c = canvas;
  }

  void tabuleiro(){

    //Função que cria o tabuleiro
    void BuildBox(int x, int y, double w, double h,int cor,String num, int x_num, int y_num){

      //Lógica implementada para a captura das coordenadas de cada casa do tabuleiro
      if(bloq) {
        if(num!="FIM"){
          if (int.parse(num) < 9 || int.parse(num) > 16) {
            coord_casas.add((screenCenterX + x) + 5);
            coord_casas.add((screenCenterY + y) + 4);
          } else {
            coord_casas.add((screenCenterX + x)+16);
            coord_casas.add((screenCenterY + y)+5);
          }
        }else{
          coord_casas.add((screenCenterX + x) + 5);
          coord_casas.add((screenCenterY + y) + 4);
          bloq = false;
        }
      }

      Rect boxRect = Rect.fromLTWH(screenCenterX + x, screenCenterY+y, w, h);
      Paint boxPaint = Paint();
      boxPaint.color = Color(cor);
      c.drawRect(boxRect, boxPaint);

      config.render(c, num, Position(screenCenterX+x_num, screenCenterY+y_num));
    }

    int posi_x = -200;
    int posi_y = 120;

    //Criação tabuleiro
    for(int i=0;i<25;i++){
      int n = i+1;
      //Casas de 1 até 9
      if(i<9){
        if(i==0 || i==4 || i==6 || i==8){
          if(i==8){
            BuildBox(posi_x+1,posi_y, 50, 30,0xffFF0000,n.toString(),posi_x+20,posi_y+7);
          }else BuildBox(posi_x,posi_y, 30, 30,0xffFF0000,n.toString(),posi_x+11,posi_y+7);
        }
        else BuildBox(posi_x,posi_y, 30, 30,0xff0000FF,n.toString(),posi_x+11,posi_y+7);
        if(i<8)posi_y = posi_y-31;
        //Casas de 10 até 16
      }else if(i>=9 && i<16){
        posi_x = posi_x+51;
        if(i==10 || i==11 || i==14) BuildBox(posi_x,posi_y, 50, 30,0xffFF0000,n.toString(),posi_x+20,posi_y+7);
        else BuildBox(posi_x,posi_y, 50, 30,0xff0000FF,n.toString(),posi_x+17,posi_y+7);
        if(i==15)posi_x = posi_x+20;
        //Casas de 17 até o FIM
      }else if(i>=16){
        posi_y = posi_y+31;
        if(i==17) BuildBox(posi_x,posi_y, 30, 30,0xffFF0000,n.toString(),posi_x+6,posi_y+7);
        else if(i==24) BuildBox(posi_x,posi_y, 30, 30,0xffFF0000,"FIM",posi_x+2,posi_y+7);
        else BuildBox(posi_x,posi_y, 30, 30,0xff0000FF,n.toString(),posi_x+6,posi_y+7);
      }
    }

  }

  void criacaoDado(){
    Rect boxRect2 = Rect.fromLTWH(screenCenterX-25, screenCenterY+100, 50, 50);
    Paint boxPaint2 = Paint();
    boxPaint2.color = Color(color_dado);
    c.drawRect(boxRect2, boxPaint2);
  }

  //Defini o local de criação das imagens
  void iniImage(){
    pecaRect1 = Rect.fromLTWH(screenCenterX-250, screenCenterY+125, 20, 20);
    pecaRect2 = Rect.fromLTWH(screenCenterX-280, screenCenterY+125, 20, 20);
    pecaRect3 = Rect.fromLTWH(screenCenterX-310, screenCenterY+125, 20, 20);
    casa1Rect = Rect.fromLTWH(screenCenterX-80,screenCenterY-70, 150, 150);
    casa5Rect = Rect.fromLTWH(screenCenterX-80,screenCenterY-70, 150, 150);
    casa7Rect = Rect.fromLTWH(screenCenterX-80,screenCenterY-70, 150, 150);
    casa9Rect = Rect.fromLTWH(screenCenterX-80,screenCenterY-70, 150, 150);
    bt_certoRect = Rect.fromLTWH(screenCenterX-80, screenCenterY+100, 50, 50);
    bt_erradoRect = Rect.fromLTWH(screenCenterX+25, screenCenterY+100, 50, 50);
    //Funciona como uma chave para a função "iniImage" só ser acessada uma vez
    criaImage = false;
  }

  void criaBts(){
    //Cria bt_certo
    bt_certoRect = Rect.fromLTWH(screenCenterX-80, screenCenterY+100, 50, 50);
    Paint bt_certoPaint = Paint();
    bt_certoPaint.color = Color(0xff008000);
    c.drawRect(bt_certoRect, bt_certoPaint);

    //Cria bt_certo
    bt_erradoRect = Rect.fromLTWH(screenCenterX+25, screenCenterY+100, 50, 50);
    Paint bt_erradoPaint= Paint();
    bt_erradoPaint.color = Color(0xffFF0000);
    c.drawRect(bt_erradoRect, bt_erradoPaint);
  }

  void criaCasas(int casa){
    if(casa==1)casa1.renderRect(c, casa1Rect.inflate(2));
    else if(casa==5)casa5.renderRect(c, casa5Rect.inflate(2));
    else if(casa==7){casa7.renderRect(c, casa7Rect.inflate(2)); criaBts();}
    else if(casa==9){casa9.renderRect(c, casa9Rect.inflate(2)); criaBts();}
  }

  void criaPecas(){
    peca.renderRect(c, pecaRect1.inflate(2));
    peca2.renderRect(c, pecaRect2.inflate(2));
    peca3.renderRect(c, pecaRect3.inflate(2));
  }

}