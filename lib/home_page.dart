import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.only(top: 40)),
              const Text('Bluetooth mouse'),
              const Padding(padding: EdgeInsets.only(top: 40)),
              SizedBox(
                width: 200,
                child: TextField(
                  decoration: const InputDecoration(labelText: 'Enter price'),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 40)),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Check'),
              )
            ],
          ),
        ),
      ),
    );
  }
}