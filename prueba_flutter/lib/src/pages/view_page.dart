import 'dart:async';

import 'package:flutter/material.dart';

class ViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ViewPageState();
  }
}

class _ViewPageState extends State<ViewPage> {
  ScrollController _scrollController = new ScrollController();
  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _agregar5();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        //_fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Prueba para trabajar en el proyecto"),
      ),
      body: Stack(
        children: <Widget>[
          _crearLista(),
          _crearLista(),
          _crearLista(),
          _crearLista(),
          _crearLista(),
          _crearLoading(),
        ],
      ),
    );
  }

  Widget _crearLista() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Flexible(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _listaNumeros.length,
                itemBuilder: (BuildContext context, int index) {
                  final imagen = _listaNumeros[index];
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: FadeInImage(
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.25,
                      placeholder: NetworkImage(
                          "https://loading.io/mod/spinner/spinner/sample.gif"),
                      image: NetworkImage(
                          "https://picsum.photos/500/300/?image=$imagen"),
                    ),
                  );
                },
                controller: _scrollController,
              ),
            ),
          )
        ],
      ),
    );
  }

  void _agregar5() {
    for (var i = 1; i < 4; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }

    setState(() {});
  }

  Future<Null> _fetchData() async {
    _isLoading = true;
    setState(() {});
    return new Timer(new Duration(seconds: 2), respuestaHTTP);
  }

  void respuestaHTTP() {
    _isLoading = false;
    _agregar5();
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        duration: new Duration(milliseconds: 200), curve: Curves.linear);
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(
            height: 15.0,
          )
        ],
      );
    } else {
      return Container();
    }
  }

  Future<void> _refrescarPage() async {
    final Duration duration = Duration(milliseconds: 2000);
    //new Timer(duration, (){
    //_listaNumeros.clear();
    //_ultimoItem++;
    //_agregar5();
    //});
    return Future.delayed(duration);
  }
}
