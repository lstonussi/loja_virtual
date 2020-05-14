import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lojavirtual/data/product_data.dart';
import 'package:lojavirtual/tiles/product_tile.dart';

class CategoryScreen extends StatelessWidget {
  final DocumentSnapshot snapshot;
  //Diferença entre QuerySnapshot x DocumentSnapshot
  //QuerySnapshot - Fotografia de uma coleção, podendo acessar cada um dos documentos
  //DocumentSnapshot - Fotografia de apenas uma documento
  CategoryScreen(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(snapshot.data['title']),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.grid_on),
              ),
              Tab(
                icon: Icon(Icons.list),
              )
            ],
          ),
        ),
        body: FutureBuilder<QuerySnapshot>(
          future: Firestore.instance
              .collection("products")
              .document(snapshot.documentID)
              .collection('items')
              .getDocuments(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(
                child: CircularProgressIndicator(),
              );
            else
              return TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  //O GridView.Builder não carrega todos os produtos de uma vez, para nao sobrecarregar
                  GridView.builder(
                    padding: EdgeInsets.all(4),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, //Cross = vertical, Main = Horizontal
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 4,
                        childAspectRatio: 0.65 // razão entre comp e larg
                        ),
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      return ProductTile(
                        'grid',
                        ProductData.fromDocument(
                          snapshot.data.documents[index],
                        ),
                      );
                    },
                  ),
                  ListView.builder(
                    padding: EdgeInsets.all(4),
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      return ProductTile(
                        'list',
                        ProductData.fromDocument(
                            snapshot.data.documents[index]),
                      );
                    },
                  ),
                ],
              );
          },
        ),
      ),
    );
  }
}
