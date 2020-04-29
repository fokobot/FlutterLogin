import 'package:demo_app/models/converter.dart';
import 'package:demo_app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/widgets/binary2decimal.dart';
import 'package:demo_app/widgets/decimal2binary.dart';
import 'package:provider/provider.dart';

class Converter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <
          Widget>[
        Container(
          alignment: Alignment.centerLeft,
          child: MaterialButton(
            padding: const EdgeInsets.all(8.0),
            child:
                Consumer<ConverterModel>(builder: (context, converter, child) {
              return Text(
                converter.estado ? "Binary -> Decimal" : "Decimal -> Binary",
                style: TextStyle(fontSize: 20, color: Colors.deepOrangeAccent),
              );
            }),
            onPressed: () => Provider.of<ConverterModel>(context, listen: false)
                .changeState(),
          ),
        ),
        Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.centerRight,
            child: Consumer<ConverterModel>(
              builder: (context, converter, child) {
                return Text(
                  '${converter.binary.toString()}',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:
                          Color(int.parse("#FF5722".replaceAll('#', '0xff'))),
                      fontSize: 35),
                );
              },
            )),
        Container(
          alignment: Alignment.centerRight,
          child: Consumer<ConverterModel>(
            builder: (context, converter, child) {
              return Text(
                '${converter.decimal.toString()}',
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(int.parse("#FF5722".replaceAll('#', '0xff'))),
                    fontSize: 35),
              );
            },
          ),
        ),
        Consumer<ConverterModel>(builder: (context, converter, child) {
          return converter.estado ? BinaryToDecimal() : DecimalToBinary();
        }),
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
                color: Color(int.parse("#0069C0".replaceAll('#', '0xff'))),
                onPressed: () =>
                    Provider.of<ConverterModel>(context, listen: false).reset(),
                child: Text("Reset",
                    style: new TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ))),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
                color: Color(int.parse("#0069C0".replaceAll('#', '0xff'))),
                onPressed: () =>
                    Provider.of<UserModel>(context, listen: false).signOut(),
                child: Text("Cerrar Sesión",
                    style: new TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ))),
          ),
        ),
      ]),
    );
  }
}
