import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/helpers/helpers.dart';
import 'package:shoes_app/provider/producto_provider.dart';

class DetalleProductoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    cambiarStatusLigth();
    final color =
        Provider.of<ProductoProvider>(context).colorZapatillaSeleccionado;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                width: double.infinity,
              ),
              Stack(children: [
                Hero(tag: color, child: _ContenedorProducto()),
                Positioned(
                  top: 60.0,
                  child: ElevatedButton(
                    onPressed: () {
                      cambiarStatusDark();
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.chevron_left,
                      size: 60.0,
                    ),
                    style: ButtonStyle(
                        minimumSize:
                            MaterialStateProperty.all<Size>(Size(40, 40)),
                        elevation: MaterialStateProperty.all<double>(0),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)))),
                  ),
                ),
              ]),
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
                    SizedBox(
                      height: 40.0,
                    ),
                    _BotonesInferiores()
                  ],
                ),
              )
            ],
          ),
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
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
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
          Hero(
            tag: 'buy',
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Buy Now'),
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all<Size>(Size(120, 40)),
                  elevation: MaterialStateProperty.all<double>(0),
                  backgroundColor: MaterialStateProperty.all(Color(0xffFF9F00)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)))),
            ),
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
      height: 40.0,
      child: Stack(
        children: [
          Positioned(
            left: 65.0,
            child: _CirculoColorZapatilla(
              valor: 'verde.png',
              color: Color(0xffCDDB3E),
            ),
          ),
          Positioned(
            left: 45.0,
            child: _CirculoColorZapatilla(
              valor: 'amarillo.png',
              color: Color(0xffFAB100),
            ),
          ),
          Positioned(
            left: 25.0,
            child: _CirculoColorZapatilla(
              valor: 'azul.png',
              color: Color(0xff4198F5),
            ),
          ),
          _CirculoColorZapatilla(
            valor: 'negro.png',
            color: Color(0xff405661),
          ),
          Positioned(
            bottom: -4.0,
            right: 0.0,
            child: ElevatedButton(
              onPressed: () {},
              child: Text('More Related'),
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all<Size>(Size(150, 30)),
                  elevation: MaterialStateProperty.all<double>(0),
                  backgroundColor: MaterialStateProperty.all(
                      Color(0xffFF9F00).withOpacity(0.4)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)))),
            ),
          )
        ],
      ),
    );
  }
}

class _CirculoColorZapatilla extends StatelessWidget {
  final String valor;
  final Color color;

  const _CirculoColorZapatilla({@required this.valor, @required this.color});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductoProvider>(context);
    bool seleccion = provider.colorZapatillaSeleccionado == valor;
    return GestureDetector(
      onTap: () => provider.colorZapatillaSeleccionado = valor,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: (seleccion) ? 40.0 : 35.0,
        width: (seleccion) ? 40.0 : 35.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0), color: color),
      ),
    );
  }
}

class _BotonesInferiores extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _BotonInferior(icono: Icons.favorite, color: Color(0xffF15355)),
        _BotonInferior(
            icono: FontAwesomeIcons.shoppingCart, color: Colors.grey),
        _BotonInferior(icono: FontAwesomeIcons.cog, color: Colors.grey)
      ],
    );
  }
}

class _BotonInferior extends StatelessWidget {
  final IconData icono;
  final Color color;

  const _BotonInferior({@required this.icono, @required this.color});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        child: FaIcon(
          icono,
          color: color,
          size: 30.0,
        ),
        style: ButtonStyle(
            minimumSize: MaterialStateProperty.all<Size>(Size(70, 70)),
            elevation: MaterialStateProperty.all<double>(10),
            backgroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all(CircleBorder())));
  }
}
