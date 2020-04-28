import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final PageController controller;
  final int page;

  DrawerTile(this.icon, this.text, this.controller, this.page);

  @override
  Widget build(BuildContext context) {
    //Material, é usado para dar um efeito visual ao clicar
    return Material(
      color: Colors.transparent,
      child: InkWell(
        child: Container(
          height: 60,
          child: Row(
            children: <Widget>[
              Icon(icon, // vem por parametro
                  size: 32,
                  color: controller.page.round() == page
                      ? Theme.of(context).primaryColor
                      : Colors.grey[700]),
              SizedBox(width: 32),
              Text(
                text, //Vem por parametro
                style: TextStyle(
                    fontSize: 16,
                    color: controller.page.round() == page
                        ? Theme.of(context).primaryColor
                        : Colors.grey[700]),
              )
            ],
          ),
        ),
        onTap: () {
          Navigator.of(context).pop();
          controller.jumpToPage(page);
        },
      ),
    );
  }
}
