import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/provider/producto_provider.dart';

class ProductoHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
              height: 80.0,
            ),
            _Header(),
            SizedBox(
              height: 20.0,
            ),
            Hero(tag: 'imagen', child: _ContenedorProducto()),
            SizedBox(
              height: 30.0,
            ),
            _DescripcionProducto(),
            SizedBox(
              height: 30.0,
            ),
            _PanelCompra(),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          'For you',
          style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
        ),
        Expanded(child: SizedBox()),
        Icon(
          Icons.search,
          size: 40.0,
        )
      ],
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
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'detalle');
            },
            child: Container(
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
          ),
          SizedBox(
            height: 50.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _iconoTamanoZapatilla('7', context),
                _iconoTamanoZapatilla('7.5', context),
                _iconoTamanoZapatilla('8', context),
                _iconoTamanoZapatilla('8.5', context),
                _iconoTamanoZapatilla('9', context),
                _iconoTamanoZapatilla('9.5', context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _iconoTamanoZapatilla(String tamano, BuildContext context) {
  final provider = Provider.of<ProductoProvider>(context);
  bool seleccion = (provider.tamanoZapatillaSeleccionado == tamano);
  return GestureDetector(
    onTap: () {
      provider.tamanoZapatillaSeleccionado = tamano;
    },
    child: AnimatedContainer(
      duration: Duration(milliseconds: 500),
      height: (seleccion) ? 44.0 : 40.0,
      width: (seleccion) ? 44.0 : 40.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: (seleccion) ? Color(0xffFEA003) : Colors.white,
          boxShadow: <BoxShadow>[
            (seleccion)
                ? BoxShadow(
                    offset: Offset(5, 5),
                    blurRadius: 7.0,
                    color: Color(0xffFFAE24))
                : BoxShadow(color: Colors.white)
          ],
          borderRadius: BorderRadius.circular(10.0)),
      child: Text(
        tamano,
        style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: (seleccion) ? Colors.white : Color(0xffFFA000)),
      ),
    ),
  );
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
      decoration: BoxDecoration(
          color: Color(0xffF5F5F5), borderRadius: BorderRadius.circular(50.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            width: 30.0,
          ),
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
          SizedBox(
            width: 30.0,
          ),
        ],
      ),
    );
  }
}
