import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Criar Conta"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(hintText: 'Nome Completo'),
              keyboardType: TextInputType.text,
              //text é o proprio texto do campo
              validator: (text) {
                if (text.isEmpty) return "Nome não preenchido.";
              },
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'E-mail'),
              keyboardType: TextInputType.emailAddress,
              //text é o proprio texto do campo
              validator: (text) {
                if (text.isEmpty || !text.contains('@'))
                  return "E-mail inválido";
              },
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'Senha'),
              obscureText: true,
              validator: (text) {
                if (text.isEmpty || text.length < 6) return "Senha inválida";
              },
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'Endereço'),
              validator: (text) {
                if (text.isEmpty) return "Endereço não preenchido";
              },
            ),
            SizedBox(
              height: 16,
            ),
            //Para deixar o botão mais alto (altura) coloca-se um sizedBox
            SizedBox(
              height: 44,
              child: RaisedButton(
                child: Text(
                  'Criar Conta',
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
