import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/provider/producto_provider.dart';
import 'package:shoes_app/src/pages/detalle_producto_page.dart';
import 'package:shoes_app/src/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductoProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shoes App',
        initialRoute: '/',
        routes: {
          '/': (_) => HomePage(),
          'detalle': (_) => DetalleProductoPage(),
        },
      ),
    );
  }
}
