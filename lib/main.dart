import 'dart:ui';
import 'package:inicial/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: HomePage(),
      home: Frases(),
    );
  }
}

//Criacao de Home Page
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(
          color: Colors.black,
          child: const Text(
            "Menu",
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          ),
        ),
      ),
      drawer: Drawer(),
      backgroundColor: Colors.purple,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Ola",
            style: TextStyle(
              color: Colors.yellow,
              fontSize: 80,
              fontWeight: FontWeight.w700,
              letterSpacing: 6,
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            "My first App",
            style: TextStyle(
              color: Colors.orange,
              fontSize: 60,
              fontStyle: FontStyle.italic,
              letterSpacing: 5,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            "by",
            style: TextStyle(
              color: Colors.green,
              fontSize: 30,
              fontWeight: FontWeight.w700,
              letterSpacing: 4,
            ),
          ),
          Text(
            "Erico Nunes",
            style: TextStyle(
              color: Colors.green,
              fontSize: 50,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.italic,
              letterSpacing: 5,
            ),
          ),
        ],
      ),
    );
  }
}

//Criando Tela Inicial
class TelaInicial extends StatelessWidget {
  const TelaInicial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.green,

      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/space.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        /*child: Column(
          //mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Text(
              "space",
              style: TextStyle(color: Colors.red, fontSize: 20),
            ),
          ],
        ),*/
      ),
    );
  }
}

//3o exemplo de telas
class MeuWidget extends StatelessWidget {
  const MeuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          "Frase do dia",
        ),
      ),
      drawer: Drawer(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Topico 1"),
              SizedBox(
                height: 20,
              ),
              Text("Topico 2")
            ]),
      ),
      body: Container(),
      bottomNavigationBar: const BottomAppBar(
        color: Colors.red,
        child: Text(
          "All Rights Reserved",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}

//frases do dia usando stateful

class Frases extends StatefulWidget {
  const Frases({Key? key}) : super(key: key);

  @override
  State<Frases> createState() => _FrasesState();
}

void msg() {
  print("ola");
}

class _FrasesState extends State<Frases> {
  List<String> frases = [
    "Toda ação humana, quer se torne positiva ou negativa, precisa depender de motivação.",
    "Lute. Acredite. Conquiste. Perca. Deseje. Espere. Alcance. Invada. Caia. Seja tudo o quiser ser, mas, acima de tudo, seja você sempre.",
    "Tudo o que um sonho precisa para ser realizado é alguém que acredite que ele possa ser realizado.",
    "O insucesso é apenas uma oportunidade para recomeçar com mais inteligência.",
  ];

  String fraseGerada = "Clique Abaixo Para Gerar uma Frase";

  void gerar() {
    int escolha = Random().nextInt(frases.length);
    print(frases[escolha]);

    setState(() {
      fraseGerada = frases[escolha];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "Frases do dia",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(width: 3, color: Colors.amber),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Image.network(
                "https://cdn.w600.comps.canstockphoto.com.br/escrit%C3%B3rio-%C3%ADcone-estante-de-livros-vetor-eps_csp38664146.jpg"),
            Text(
              fraseGerada,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            RaisedButton (
              child: Text(
                "Nova Frase",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: gerar,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
