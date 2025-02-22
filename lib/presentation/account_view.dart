import 'package:flutter/material.dart';

class AccountView extends StatelessWidget {
  final String name;
  const AccountView({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AccountView')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(name),
              SizedBox(height: 8),
              ElevatedButton(
                  onPressed: () {}, child: Text('go back to home page')),
            ],
          ),
        ),
      ),
    );
  }
}
