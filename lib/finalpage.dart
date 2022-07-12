import 'package:flutter/material.dart';
import 'formpage1.dart';
import 'formpage2.dart';

class FinalPage extends StatelessWidget {
  late final String name3, email3, mobile3, address3, state3, city3;

  FinalPage(
      {Key? key,
      required this.name3,
      required this.email3,
      required this.mobile3,
      required this.address3,
      required this.city3,
      required this.state3})
      : super(key: key);

  static const String id = 'final_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Final Page'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    Text(name3),
                    const SizedBox(height: 24),
                    Text(email3),
                    const SizedBox(height: 24),
                    Text(mobile3),
                    const SizedBox(height: 24),
                    Text(address3),
                    const SizedBox(height: 24),
                    Text(city3),
                    const SizedBox(height: 24),
                    Text(state3),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
