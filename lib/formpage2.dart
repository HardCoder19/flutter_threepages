import 'package:flutter/material.dart';
import 'package:flutter_threepages/finalpage.dart';

class Form2 extends StatelessWidget {
  final formGlobalKey1 = GlobalKey<FormState>();
  late final String name2, email2, mobile2;
  late String address, city, state;
  static const String id = 'form2_screen';
  Form2(
      {Key? key,
      required this.name2,
      required this.email2,
      required this.mobile2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Form 2'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: formGlobalKey1,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Address"),
                    onSaved: (value) {
                      address = value!;
                      print(' address: $address');
                    },
                    validator: (value) {
                      if (value?.length == 0) {
                        return "address is Required";
                      } else if ((value?.length)! < 3) {
                        return 'address must be more than 2 charater';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    decoration: InputDecoration(labelText: "City"),
                    onSaved: (ct) {
                      city = ct!;
                      print(' city: $city');
                    },
                    validator: (ct) {
                      if (ct?.length == 0) {
                        return "city is Required";
                      } else if ((ct?.length)! < 3) {
                        return 'city must be more than 2 charater';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    decoration: InputDecoration(labelText: "state"),
                    onSaved: (State1) {
                      state = State1!;
                      print(' State: $state');
                    },
                    validator: (State1) {
                      if (State1?.length == 0) {
                        return "address is Required";
                      } else if ((State1?.length)! < 3) {
                        return 'address must be more than 2 charater';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                      onPressed: () {
                        if (formGlobalKey1.currentState!.validate()) {
                          formGlobalKey1.currentState!.save();
                          // use the email provided here
                        }

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FinalPage(
                                    name3: name2,
                                    email3: email2,
                                    mobile3: mobile2,
                                    address3: address,
                                    city3: city,
                                    state3: state)));
                      },
                      child: Text("Submit"))
                ],
              ),
            ),
          ),
        ));
  }
}
