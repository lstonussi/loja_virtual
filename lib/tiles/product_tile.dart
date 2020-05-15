import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lojavirtual/data/product_data.dart';
import 'package:lojavirtual/screens/product_screen.dart';

class ProductTile extends StatelessWidget {
  final String type;
  final ProductData product;

  ProductTile(this.type, this.product);

  @override
  Widget build(BuildContext context) {
    //Poderia ser usado o gesture detector, porem o InkWell faz uma animação ao tocar
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductScreen(product),
          ),
        );
      },
      child: Card(
        child: type == 'grid'
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  //Mantém o tamanho em diferentes dispositivos, Largura/Altura
                  AspectRatio(
                    //Imagem retangular, para ser quadrada o valor deve ser 1.0
                    aspectRatio: 0.8,
                    child: Image.network(
                      product.images[0],
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            product.title,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "R\$ ${product.price.toStringAsFixed(2)}",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            : Row(
                children: <Widget>[
                  //Se o segundo flex for 2 ocupara o dobro de espaço do primeiro
                  //O flex divide a tela por igual
                  Flexible(
                    flex: 1,
                    child: Image.network(
                      product.images[0],
                      fit: BoxFit.cover,
                      height: 75,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            product.title,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "R\$ ${product.price.toStringAsFixed(2)}",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
