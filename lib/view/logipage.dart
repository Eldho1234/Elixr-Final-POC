import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:sampleloginusingapi/model/activity_model.dart';
import 'package:sampleloginusingapi/model/model.dart';
import 'package:sampleloginusingapi/redux/app_state.dart';
import 'package:sampleloginusingapi/redux/app_store.dart';
import 'package:sampleloginusingapi/view/home.dart';
import 'package:sampleloginusingapi/view/signup_page.dart';
import 'package:sampleloginusingapi/widgets/custom_snackbar.dart';


class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _EmailController = TextEditingController();

  final TextEditingController _PasswordController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  bool shopass = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Lests Sign you in ",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Welcome Back,",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600)),
                    Text("You have been missed",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _EmailController,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.account_box_sharp),
                      labelText: "Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  textInputAction: TextInputAction.next,
                  validator: (email) {
                    if (email == null || email.isEmpty) {
                      return "please enter a email";
                    }
                    if (!isEmailVAlid(email)) {
                      return 'Enter a valid email';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _PasswordController,
                  obscureText: shopass,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.visibility_off,
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              if (shopass) {
                                shopass = false;
                              } else {
                                shopass = true;
                              }
                            });
                          },
                          icon: Icon(shopass == true
                              ? Icons.visibility_off
                              : Icons.visibility)),
                      labelText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  textInputAction: TextInputAction.done,
                  validator: (Password) {
                    if (Password!.isEmpty || Password.length < 6) {
                      return 'Enter a valid password,length should bw greater than 6';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 40, left: 8, right: 8, bottom: 8),
                child: SizedBox(
                  height: size.height * 0.0750,
                  child:ElevatedButton(onPressed: (){
                    StoreProvider.of<AppState>(context).dispatch(loginAction( email: _EmailController.text, password: _PasswordController.text,));
                  if(_EmailController.text==store.state.user!.emailId && _PasswordController.text==store.state.user!.password){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login successful"),backgroundColor:Color.fromARGB(255, 147, 64, 255) ,));
                        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>HomePage()));
                        }else if(_EmailController.text!=store.state.user!.emailId && _PasswordController.text!=store.state.user!.password){
                          print("else");
                          Duration(milliseconds: 2);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Failed"),backgroundColor:Color.fromARGB(255, 147, 64, 255) ,));
                          print("object");
                        }
                  },child: Text("login"),
                   style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(255, 147, 64, 255)),
                        )
                  ) ,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 40, left: 8, right: 8),
                  child: Center(
                    child: RichText(
                        text: TextSpan(children: <TextSpan>[
                      const TextSpan(
                          text: "Dont have an account ?\t",
                          style: TextStyle(color: Colors.black, fontSize: 15)),
                      TextSpan(
                          text: "Register here",
                          style:
                              const TextStyle(color:  Color.fromARGB(255, 147, 64, 255), fontSize: 15),
                          recognizer: TapGestureRecognizer()..onTap=(){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
                          }),
                    ])),
                  )),
            ],
          ),
        ),
      ),
    );
  }
  //  bool checkLoginCredentials() {
  //   String enteredEmail = _EmailController.text;
  //   String enteredPassword = _PasswordController.text;
  //   return enteredEmail == store.state.user!.emailId && enteredPassword == store.state.user!.password;
  // }
}

bool isEmailVAlid(String email) {
  final RegExp emailREgx = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  return emailREgx.hasMatch(email);

}
