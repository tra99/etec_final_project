
import 'package:etec_final/src/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> with InputValidationMixin {
  
  final formGlobalKey = GlobalKey<FormState>();
  var email = TextEditingController();
  var password = TextEditingController();


  String errorPassword = "";
  bool SeePassword = true;
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: formGlobalKey,
            child: Stack(
              children: [
                Image.asset(
                  'assets/cover1.png',
                  height: MediaQuery.of(context).size.height*0.2,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height*0.15),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 35, 31, 32),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50))),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                'Welcome to Cammoto!',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Itim",
                                    fontStyle: FontStyle.italic),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Email',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            TextFormField(
                              maxLength: 30,
                              obscureText: false,
                              cursorColor: Colors.white,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  borderSide: const BorderSide(
                                      width: 2,
                                      style: BorderStyle.solid,
                                      color: Colors.blue),
                                ),
                                hintText: "Email",
                                labelText: 'Enter Email',
                                prefixIcon: Icon(
                                  Icons.mail,
                                  color: Colors.white,
                                ),
                              ),
                              controller: email,
                              validator: (email) {
                                print(email);
                                if (isEmailValid(email!)) {
                                  return null;
                                } else {
                                  return 'Enter a valid email address';
                                }
                              },
                            ),
                            const Text(
                              'Password',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            TextFormField(
                              controller: password,
                              validator: (password) {
                                if (isPasswordValid(password!)) {
                                  return null;
                                } else {
                                  return 'Enter a valid password';
                                }
                              },
                              cursorColor: Colors.white,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              obscureText: SeePassword,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    borderSide: const BorderSide(
                                        width: 2,
                                        style: BorderStyle.solid,
                                        color: Colors.blue)),
                                prefixIcon: Icon(
                                  Icons.key_rounded,
                                  color: Colors.white,
                                ),
                                labelText: 'Password',
                                hintText: 'Enter Password',
                                suffixIcon: GestureDetector(
                                  child: SeePassword
                                      ? Icon(
                                          Icons.remove_red_eye,
                                          color: Colors.white,
                                        )
                                      : Icon(
                                          Icons.highlight_off_sharp,
                                          color: Colors.white,
                                        ),
                                  onTap: () {
                                    setState(() {
                                      SeePassword = !SeePassword;
                                    });
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Confirm Password',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            TextFormField(
                              controller: password,
                              validator: (password) {
                                if (isPasswordValid(password!)) {
                                  return null;
                                } else {
                                  return 'Enter a valid password';
                                }
                              },
                              cursorColor: Colors.white,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              obscureText: SeePassword,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    borderSide: const BorderSide(
                                        width: 2,
                                        style: BorderStyle.solid,
                                        color: Colors.blue)),
                                prefixIcon: Icon(
                                  Icons.key_rounded,
                                  color: Colors.white,
                                ),
                                labelText: 'Confirm Password',
                                hintText: 'Repeated Password',
                                suffixIcon: GestureDetector(
                                  child: SeePassword
                                      ? Icon(
                                          Icons.remove_red_eye,
                                          color: Colors.white,
                                        )
                                      : Icon(
                                          Icons.highlight_off_sharp,
                                          color: Colors.white,
                                        ),
                                  onTap: () {
                                    setState(() {
                                      SeePassword = !SeePassword;
                                    });
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            
                            const SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: TextButton(
                                onPressed: () {
                                  if (formGlobalKey.currentState!.validate()) {
                                    print(email);
                                    print(password);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomePage()));
                                  }
                                },
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Inter",
                                  ),
                                ),
                                style: TextButton.styleFrom(
                                    foregroundColor:
                                        const Color.fromARGB(255, 35, 31, 32),
                                    backgroundColor:
                                        const Color.fromARGB(255, 217, 217, 217),
                                    padding: const EdgeInsets.only(
                                        left: 45, right: 45, top: 12, bottom: 12),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15))),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Don't have an account?",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: "Inter"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 6),
                                  child: GestureDetector(
                                    onTap: () {
                                      // Get.to(const SignUpPage());
                                    },
                                    child: const Text(
                                      'Sign up',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 245, 160, 31),
                                          fontSize: 24,
                                          fontFamily: "Inter"),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

mixin InputValidationMixin {
  bool isPasswordValid(String password) => password.length >= 8;
  bool isUsernameValid(String username) => username.isNotEmpty && username.length>=8;
  bool isEmailValid(String email) {
    RegExp regex = new RegExp(("[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}"));
    return regex.hasMatch(email);
  }
}
