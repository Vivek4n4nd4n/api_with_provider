import 'dart:convert';

import 'package:api_models/productscreen/bottombar/bottombar_screen.dart';
import 'package:api_models/productscreen/bottombar/homescreen.dart';
import 'package:api_models/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.title});

  final String title;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  login(username, password) async {
    try {
      Response response = await post(
          Uri.parse('https://fakestoreapi.com/auth/login/'),
          body: {'username': "johnd", 'password': "m38rmF\$"});
      if (response.statusCode == 200) {
        var data = JsonDecoder().convert(response.body.toString());
        print("token ${data['token']}");
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('accessToken', '${data['token']}');

        if (prefs.containsKey('accessToken')) {
          prefs.setString('username', '${data['username']}');
          prefs.setString('password', '${data['password']}');
          print('Login Success,${prefs.containsKey('accessToken')}  ####');
          print('username: ${prefs.containsKey('username')}  @@@@');
        }
        // ignore: use_build_context_synchronously
        // Navigator.push(context, MaterialPageRoute(builder: (context)=> BottomBarScreen()));
      } else {
        print('failed ***');
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Invalid Credentials...',
        style: TextStyle(color: Colors.red,fontSize: 25),),));
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.green,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    controller: usernameController,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                        hintText: 'username', border: InputBorder.none),
                        validator: (value) {
                          if(value == null || value.isEmpty){
                            return 'please Enter Valid user name';
                          } return null;
                        },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.green,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    controller: passwordController,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                        hintText: 'password', border: InputBorder.none),
                        validator: (value) {
                          if(value == null || value.isEmpty){
                            return 'please Enter correct password';
                          }return null;
                        },
                  ),
                ),
                const SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
if(_formkey.currentState!.validate()){

};login(usernameController.text, passwordController.text);

                }, child: const Text('Submit'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
