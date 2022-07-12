import 'package:flutter/material.dart';
import 'formpage2.dart';

class Form1 extends StatelessWidget with InputValidationMixin {
  final formGlobalKey = GlobalKey<FormState>();
  late String name, email1, mobile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Form 1'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: formGlobalKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Name"),
                    onSaved: (value) {
                      name = value!;
                      print(' name: $name');
                    },
                    validator: (value) {
                      String patttern = r'(^[a-zA-Z ]*$)';
                      RegExp regExp = new RegExp(patttern);
                      if (value?.length == 0) {
                        return "Name is Required";
                      } else if (!regExp.hasMatch(value!)) {
                        return "Name must be a-z and A-Z";
                      } else if (value.length < 3) {
                        return 'Name must be more than 2 charater';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Email"),
                    onSaved: (email) {
                      email1 = email!;
                      print(' email: $email1');
                    },
                    validator: (email) {
                      if (isEmailValid(email!))
                        return null;
                      else
                        return 'Enter a valid email address';
                    },
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Mobile Number",
                    ),
                    maxLength: 10,
                    onSaved: (number) {
                      mobile = number!;
                      print(' mobile: $mobile');
                    },
                    validator: (number) {
                      if (isMobileValid(number!))
                        return null;
                      else
                        return 'Enter a valid mobile number';
                    },
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                      onPressed: () {
                        if (formGlobalKey.currentState!.validate()) {
                          formGlobalKey.currentState!.save();
                          // use the email provided here
                        }

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Form2(
                                  name2: name, email2: email1, mobile2: mobile),
                            ));
                      },
                      child: Text("Submit"))
                ],
              ),
            ),
          ),
        ));
  }
}

mixin InputValidationMixin {
  bool isMobileValid(String mobile) => mobile.length == 10;

  bool isEmailValid(String email) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return regex.hasMatch(email);
  }
}
