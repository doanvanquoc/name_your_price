import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductInfo {
  final String name;
  final int price;

  ProductInfo(this.name, this.price);
}

final products = [
  ProductInfo('Wireless mouse', 3),
  ProductInfo('Keyboard', 5),
  ProductInfo('Camera', 8),
  ProductInfo('Speaker', 4),
  ProductInfo('Ipad', 1000)
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentProductIndex = 0;
  int? _inputPrice;
  String _result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.only(top: 40)),
              Text(products[_currentProductIndex].name),
              const Padding(padding: EdgeInsets.only(top: 40)),
              SizedBox(
                width: 200,
                child: TextField(
                  onChanged: (value) {
                    _inputPrice = int.tryParse(value);
                  },
                  key: const Key('priceInput'),
                  decoration: const InputDecoration(labelText: 'Enter price'),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 40)),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _result =
                        _inputPrice == products[_currentProductIndex].price
                            ? 'pass'
                            : 'fail';
                    // if (_currentProductIndex < 4) _currentProductIndex++;
                  });
                },
                child: const Text('Check'),
              ),
              Visibility(
                  visible: _result.isNotEmpty ? true : false,
                  child: Text(_result, key: const Key('result'))),
              Visibility(
                visible: _result.isNotEmpty ? true : false,
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _result = '';
                        if (_currentProductIndex < 4) _currentProductIndex++;
                      });
                    },
                    child: const Text("Next")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
