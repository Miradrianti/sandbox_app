import 'package:flutter/material.dart';

import '../components/cards.dart';
import '../components/texts.dart';

class LoginPage extends StatefulWidget {
  // ignore: use_super_parameters
  const LoginPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
final _usernameController = TextEditingController();
final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        shadowColor: Colors.deepPurple.shade400,
        leading: Padding(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            }, 
            icon: Icon(Icons.arrow_back))),
        actions: <Widget>[
          Padding(
            padding: EdgeInsetsDirectional.only(end: 8.0),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
            children: <Widget>[

              SizedBox(height: 12),
            
              RegularCard(
                    child: Column(
                      children: <Widget>[
                        Image.asset('assets/icon.jpg',
                          width: 100,
                          height: 100,
                        ),
                        HeadlineText(text: 'Login'),
                      ],
                    ),
                  ),
              const SizedBox(height: 20,),

              RegularCard(child:
                Column(
                  children: [
                    TextField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        labelText: 'Username',
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    TextField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                      ),
                      obscureText: true,
                    ),
                  ],
                )
              ),

              const SizedBox(height: 12.0),
              
              ShadowlessCard(child:
                Column(
                  children: [
                    OverflowBar(
                      alignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          onPressed: () {
                            if  (_usernameController.text.isEmpty && _passwordController.text.isEmpty ) {
                              Navigator.pop(context);
                            } else {
                                _usernameController.clear();
                                _passwordController.clear();
                              }
                          },
                          style: TextButton.styleFrom(
                            shape: const BeveledRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(7.0)),
                            ),
                          ),
                          child: const Text('CANCEL'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 8.0,
                            shape: const BeveledRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(7.0)),
                            ),
                          ),
                          child: const Text('NEXT'),
                        ),
                      ],
                    ),
                  ],
                )
              ),
              
              const SizedBox(height: 12,),
            ],
        ),
      ),
    );
  }
}