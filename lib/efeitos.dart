import 'tabuleiro.dart';

class Efeito{

  void casa1(){
    bloq_efeito1=false;
    andando = false;
    color_dado = 0xff000000;
    if(bloq_cria_casa1)cria_casa1=true;
    else{
      cria_casa1=false;
      andando = true;
      color_dado = 0xffffffff;
    }
  }

  void casa5(){
    bloq_efeito5=false;
    andando = false;
    color_dado = 0xff000000;
    if(bloq_cria_casa5)cria_casa5=true;
    else{
      cria_casa5=false;
      andando = true;
      color_dado = 0xffffffff;
    }
  }
  void casa7(){
    bloq_efeito7=false;
    andando = false;
    color_dado = 0xff000000;
    if(bloq_cria_casa7)cria_casa7=true;
    else{
      cria_casa7=false;
      andando = true;
      color_dado = 0xffffffff;
    }
  }

  void casa9(){
    bloq_efeito9=false;
    andando = false;
    color_dado = 0xff000000;
    if(bloq_cria_casa9)cria_casa9=true;
    else{
      cria_casa9=false;
      andando = true;
      color_dado = 0xffffffff;
    }
  }


  void vencedor(){
    desloc_x[vez] = coord_casas[48];
    desloc_y[vez] = coord_casas[49];
    setTargetLocation();
    print("win jogador "+jogador.toString());
  }

}