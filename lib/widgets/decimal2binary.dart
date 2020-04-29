import 'package:demo_app/models/converter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DecimalToBinary extends StatelessWidget {
  Widget build(BuildContext context) {
    return Expanded(
        flex: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Row(children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      color: Colors.blue,
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "1",
                        style: TextStyle(fontSize: 26, color: Colors.white),
                      ),
                      onPressed: () =>
                          Provider.of<ConverterModel>(context, listen: false)
                              .addDigito(1),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      color: Colors.blue,
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "2",
                        style: TextStyle(fontSize: 26, color: Colors.white),
                      ),
                      onPressed: () =>
                          Provider.of<ConverterModel>(context, listen: false)
                              .addDigito(1),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      color: Colors.blue,
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "3",
                        style: TextStyle(fontSize: 26, color: Colors.white),
                      ),
                      onPressed: () =>
                          Provider.of<ConverterModel>(context, listen: false)
                              .addDigito(3),
                    ),
                  ),
                ),
              ]),
            ),
            Expanded(
              flex: 1,
              child: Row(children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      color: Colors.blue,
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "4",
                        style: TextStyle(fontSize: 26, color: Colors.white),
                      ),
                      onPressed: () =>
                          Provider.of<ConverterModel>(context, listen: false)
                              .addDigito(4),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      color: Colors.blue,
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "5",
                        style: TextStyle(fontSize: 26, color: Colors.white),
                      ),
                      onPressed: () =>
                          Provider.of<ConverterModel>(context, listen: false)
                              .addDigito(5),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      color: Colors.blue,
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "6",
                        style: TextStyle(fontSize: 26, color: Colors.white),
                      ),
                      onPressed: () =>
                          Provider.of<ConverterModel>(context, listen: false)
                              .addDigito(6),
                    ),
                  ),
                ),
              ]),
            ),
            Expanded(
              flex: 1,
              child: Row(children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      color: Colors.blue,
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "7",
                        style: TextStyle(fontSize: 26, color: Colors.white),
                      ),
                      onPressed: () =>
                          Provider.of<ConverterModel>(context, listen: false)
                              .addDigito(7),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      color: Colors.blue,
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "8",
                        style: TextStyle(fontSize: 26, color: Colors.white),
                      ),
                      onPressed: () =>
                          Provider.of<ConverterModel>(context, listen: false)
                              .addDigito(8),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      color: Colors.blue,
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "9",
                        style: TextStyle(fontSize: 26, color: Colors.white),
                      ),
                      onPressed: () =>
                          Provider.of<ConverterModel>(context, listen: false)
                              .addDigito(9),
                    ),
                  ),
                ),
              ]),
            ),
            Expanded(
              flex: 1,
              child: Row(children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      color: Colors.blue,
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "0",
                        style: TextStyle(fontSize: 26, color: Colors.white),
                      ),
                      onPressed: () =>
                          Provider.of<ConverterModel>(context, listen: false)
                              .addDigito(0),
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ));
  }
}
