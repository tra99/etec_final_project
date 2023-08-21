import 'package:etec_final/src/screens/authhelper.dart';
import 'package:etec_final/src/screens/forgetpss.dart';
import 'package:etec_final/src/screens/homepage.dart';
import 'package:etec_final/src/screens/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:cached_network_image/cached_network_image.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with InputValidationMixin {
  
  // email password login
  final formGlobalKey = GlobalKey<FormState>();
  var email = TextEditingController();
  var password = TextEditingController();

  // google login
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // facebook login
  // bool _isLoggedIn=false;
  // Map _userObj={};

  Future<User?> _handleSignIn() async {
    try {
      // Prompt the user to select a Google account.
      await _googleSignIn.signOut();
      GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;

      // Authenticate with Firebase using the Google account.
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential = await _auth.signInWithCredential(credential);
      return userCredential.user;
    } catch (e) {
      print("Error signing in with Google: $e");
      return null;
    }
  }

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
                  height: 500,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.23),
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
                              height: 30,
                            ),
                            LoginForm(),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Text('New here ? ',
                                    style: TextStyle(color: Colors.purpleAccent, fontSize: 20)),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => Signup()));
                                  },
                                  child: const Text('Get Registered Now!!',
                                      style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 186, 16, 216),fontWeight: FontWeight.bold)),
                                )
                              ],
                            ),
                            const SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 16),
                                  child: SizedBox(
                                    child: GestureDetector(onTap: ()async{
                                      User? user=await _handleSignIn();
                                      if(user != null){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage()));
                                        print('User signed in: ${user.displayName}');
                                      }else{
                                        print('Google sign in falied');
                                      }
                                    },
                                    child: Image.asset('icons/google.png',width: 40,)
                                    ),
                                  ),
                                ),
                                
                                Padding(
                                  padding: const EdgeInsets.only(right: 16),
                                  child: GestureDetector(
                                    onTap: () async {
                                      await showDialog<String>(
                                        context: context,
                                        builder: (BuildContext context) => AlertDialog(
                                          backgroundColor: Colors.grey.shade100,
                                          title: const Text('Under Maintenance',style: TextStyle(fontWeight: FontWeight.bold),),
                                          content: SizedBox(
                                            height: 400,
                                            child: Center(
                                              child: Image.asset('assets/maintanent.png',width: 200,),
                                            ),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () => Navigator.pop(context, 'Cancel'),
                                              child: Text('Cancel', style: TextStyle(color: Colors.blue.shade600)),
                                            ),
                                            TextButton(
                                              onPressed: () => Navigator.pop(context, 'OK'),
                                              child: Text('OK', style: TextStyle(color: Colors.blue.shade600)),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    child: Image.asset('icons/facebook.png', width: 40),
                                  ),
                                ),
                                  GestureDetector(
                                    onTap: () async {
                                      await showDialog<String>(
                                        context: context,
                                        builder: (BuildContext context) => AlertDialog(
                                          backgroundColor: Colors.grey.shade100,
                                          title: const Text('Under Maintenance',style: TextStyle(fontWeight: FontWeight.bold),),
                                          content: SizedBox(
                                            height: 400,
                                            child: Center(
                                              child: Image.asset('assets/maintanent.png',width: 200,),
                                            ),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () => Navigator.pop(context, 'Cancel'),
                                              child: Text('Cancel', style: TextStyle(color: Colors.blue.shade600)),
                                            ),
                                            TextButton(
                                              onPressed: () => Navigator.pop(context, 'OK'),
                                              child: Text('OK', style: TextStyle(color: Colors.blue.shade600)),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    child: Image.asset('icons/twitter.png', width: 40),
                                  ),
                              ],
                            )
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

class LoginForm extends StatefulWidget {
  LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  String? email;
  String? password;

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          // email
          TextFormField(
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.email_outlined),
              labelText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(100.0),
                ),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            onSaved: (val) {
              email = val;
            },
          ),
          const SizedBox(
            height: 20,
          ),

          // password
          TextFormField(
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: const Icon(Icons.lock_outline),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(100.0),
                ),
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
            obscureText: _obscureText,
            onSaved: (val) {
              password = val;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),

          const SizedBox(height: 30),

          SizedBox(
            height: 54,
            width: 184,
            child: ElevatedButton(
              onPressed: () {
                // Respond to button press

                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();

                  AuthenticationHelper()
                      .signIn(email: email!, password: password!)
                      .then((result) {
                    if (result == null) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => const HomePage()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          result,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ));
                    }
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24.0)))),
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
  void alertMessage(){
    
  }
}
