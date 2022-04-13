import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,

  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _frases = [
    "Não é o exterior, e sim o interior que conta",
    "Um novo dia traz novas oportunidades",
    "O passado pode machucar. Mas como eu vejo eh: voce pode fugir dele, ou aprender com ele",
    "Continue a nadar, a nadar, a nadar....."
  ];

  var _fraseGerada = "Clique abaixo para gerar uma nova frase da Disney!";

  void _gerarFrase(){
    var numeroSorteado = Random().nextInt(_frases.length);

    setState(() {
      _fraseGerada = _frases[numeroSorteado];
    });
      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Frases do dia"),
        backgroundColor: Colors.red.shade200,

    ),
      body: Container(
        padding: EdgeInsets.all(16),
        width: double.infinity, //ajusta a tela de exibição para 100% apresentado
        decoration: BoxDecoration(
          border: Border.all(width: 3, color: Colors.deepOrange.shade100),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, //alinhamento tela
          crossAxisAlignment: CrossAxisAlignment.center,
          children:<Widget> [ //conteudos da tela
            Image.asset("assets/images/logo.png"), // caminho imagem
            Text(
              _fraseGerada,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 17,
              fontStyle: FontStyle.italic,
              color: Colors.black
            ),
            ),
           FloatingActionButton(
             child: Icon(Icons.book_outlined, color: Colors.black,),
             backgroundColor: Colors.red.shade50,
             foregroundColor: Colors.white,
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(7.0))),
             elevation: 10,
              onPressed: _gerarFrase),

          ],
        ),
      ),
    );
  }
}
