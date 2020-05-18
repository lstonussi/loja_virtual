import 'package:flutter/material.dart';
import 'package:lojavirtual/screens/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrar"),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Criar Conta',
              style: TextStyle(fontSize: 15),
            ),
            textColor: Colors.white,
            onPressed: () {
              //O pushreplacement substitui a pagina anterior pela nova, e ao voltar volta para a tela anterior ao do login nesse caso
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => SignUpScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(hintText: 'E-mail'),
              keyboardType: TextInputType.emailAddress,
              //text é o proprio texto do campo
              validator: (text) {
                if (text.isEmpty || !text.contains('@')) {
                  return "E-mail inválido";
                }
                //Sempre tem que retornar alguma coisa, utiliza-se o null
                return null;
              },
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'Senha'),
              obscureText: true,
              validator: (text) {
                if (text.isEmpty || text.length < 6) {
                  return "Senha inválida";
                }
                //Sempre tem que retornar alguma coisa, utiliza-se o null
                return null;
              },
            ),
            Align(
              alignment: Alignment.centerRight,
              child: FlatButton(
                child: Text(
                  'Esqueci minha senha',
                  textAlign: TextAlign.right,
                ),
                onPressed: () {},
                padding: EdgeInsets.zero,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            //Para deixar o botão mais alto (altura) coloca-se um sizedBox
            SizedBox(
              height: 44,
              child: RaisedButton(
                child: Text(
                  'Entrar',
                  style: TextStyle(fontSize: 18),
                ),
                textColor: Colors.white,
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    //TODO: Criar codigo para fazer o login
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
