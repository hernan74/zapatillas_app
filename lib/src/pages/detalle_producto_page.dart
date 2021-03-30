import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/provider/producto_provider.dart';

class DetalleProductoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
            ),
            Hero(tag: 'imagen', child: _ContenedorProducto()),
            SizedBox(
              height: 40.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  _DescripcionProducto(),
                  _PanelCompra(),
                  _ColoresZapatilla(),
                  SizedBox(height: 40.0,),
                  _BotonesInferiores()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ContenedorProducto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final color =
        Provider.of<ProductoProvider>(context).colorZapatillaSeleccionado;
    return Container(
      width: double.infinity,
      height: 450.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        color: Color(0xffFFD54F),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Image(
              image: AssetImage('assets/$color'),
              height: 280.0,
              fit: BoxFit.cover,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    offset: Offset(40, 70),
                    blurRadius: 100.0,
                    color: Color(0xffF89F3B))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DescripcionProducto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Nike Air Max 720',
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          'The Nike Air Max 720 goes bigger than  over before with Nike\'s tallest Air unit yet offtering more air  underfoot for unimaginable, all-day comfort Has Air...',
          style: TextStyle(fontSize: 17.0, color: Colors.grey),
        ),
      ],
    );
  }
}

class _PanelCompra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            '\$ 180.0',
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          ),
          Expanded(child: SizedBox()),
          ElevatedButton(
            onPressed: () {},
            child: Text('Add to cart'),
            style: ButtonStyle(
                minimumSize: MaterialStateProperty.all<Size>(Size(120, 40)),
                elevation: MaterialStateProperty.all<double>(0),
                backgroundColor: MaterialStateProperty.all(Color(0xffFF9F00)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)))),
          ),
        ],
      ),
    );
  }
}

class _ColoresZapatilla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.0,
      color: Colors.red,
    );
  }
}

class _BotonesInferiores extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70.0,
      color: Colors.blueAccent,
    );
  }
}
