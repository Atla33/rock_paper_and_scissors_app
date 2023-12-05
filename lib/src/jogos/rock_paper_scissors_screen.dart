import 'dart:math';
import 'package:flutter/material.dart';

class RockPaperScissorsScreen extends StatefulWidget {
  const RockPaperScissorsScreen({Key? key}) : super(key: key);

  @override
  _RockPaperScissorsScreenState createState() =>
      _RockPaperScissorsScreenState();
}

class _RockPaperScissorsScreenState extends State<RockPaperScissorsScreen> {
  var _imagemApp = AssetImage("images/pedra_papel_tesoura.png");
  var _mensagem = "Escolha uma opção abaixo";

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    switch (escolhaApp) {
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this._imagemApp = AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("images/tesoura.png");
        });
        break;
    }

    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra")) {
      setState(() {
        this._mensagem =
            "Parabéns!!! Você ganhou :) Escolha uma opção abaixo para jogar novamente.";
      });
    } else if ((escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
        (escolhaApp == "papel" && escolhaUsuario == "pedra")) {
      setState(() {
        this._mensagem =
            "Você perdeu :( Escolha uma opção abaixo para tentar novamente.";
      });
    } else {
      setState(() {
        this._mensagem =
            "Empatamos ;) Escolha uma opção abaixo para jogar novamente.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pedra, Papel e Tesoura"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _mensagem,
              style: TextStyle(fontSize: 24.0, color: Colors.blueGrey),
            ),
            SizedBox(height: 20),
            Image(image: _imagemApp),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => _opcaoSelecionada("pedra"),
                  child: Image.asset("images/pedra.png", height: 100),
                ),
                GestureDetector(
                  onTap: () => _opcaoSelecionada("papel"),
                  child: Image.asset("images/papel.png", height: 100),
                ),
                GestureDetector(
                  onTap: () => _opcaoSelecionada("tesoura"),
                  child: Image.asset("images/tesoura.png", height: 100),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
