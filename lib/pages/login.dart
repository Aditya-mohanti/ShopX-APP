import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_x/pages/home.dart';
class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GoogleSignIn googleSignIn= new GoogleSignIn();
  final FirebaseAuth firebaseAuth= FirebaseAuth.instance;
  final _formkey=GlobalKey<FormFieldState>();
  TextEditingController _emailTextController=TextEditingController();
  TextEditingController _passwordTextController=TextEditingController();
  late SharedPreferences preferences;
  bool loading=false;
  bool isLogedin=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSignedIn();
  }
  void isSignedIn() async{
    setState(() {
      loading=true;
    });
    preferences=await SharedPreferences.getInstance();
    isLogedin=await googleSignIn.isSignedIn();
    if(isLogedin){
      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>HomePage()));
    }
    setState(() {
      loading=false;
    });
  }
  Future handleSignedIn() async {
    preferences = await SharedPreferences.getInstance();
    setState(() {
      loading = true;
    });
    GoogleSignInAccount? googleuser = await googleSignIn.signIn();
    GoogleSignInAuthentication? googleSignInAuthentication = await googleuser
        ?.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication?.accessToken,
      idToken: googleSignInAuthentication?.idToken,

    );
    final UserCredential authresult = await firebaseAuth.signInWithCredential(
        credential);
    final User? user = authresult.user;

    if (user != null) {
      final QuerySnapshot result = await FirebaseFirestore.instance
          .collection('users')
          .where('id',isEqualTo: user.uid)
          .get();
      final List<DocumentSnapshot> documents = result.docs;
      if(documents.length==0)
      {
        FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .set({
          "id":user.uid,
          "username":user.displayName,
          "profilepicture":user.photoURL,
        });
        await preferences.setString("id", user.uid);
        await preferences.setString("username", user.displayName??'');
        await preferences.setString("photoURL", user.photoURL??'');
      }else
      {
        await preferences.setString("id",documents[0]['id']);
        await preferences.setString("username",documents[0]['username']);
        await preferences.setString("photoURL",documents[0]['photoURL']);

      }
      Fluttertoast.showToast(msg: "Logged in successfuly");
      setState(() {
        loading=false;
      });
    }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(

        children: <Widget>[
          Image.asset(
            'assets/design.jpg',
          fit: BoxFit.cover,
          width: double.infinity,
            height: double.infinity,
          ),
          //// to show logo design
          Container(
            color: Colors.black.withOpacity(0.4),
            width: double.infinity,
            height: double.infinity,
          ),
          Container(

          ),
          Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: Center(
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white.withOpacity(0.5),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left:12.0),
                            child: TextFormField(
                              controller: _emailTextController,
                              decoration: InputDecoration(
                                hintText: "Email",
                                icon: Icon(Icons.email),

                              ),
                             validator: (value) {
                                if (value==null) {
                                  String pattern =
                                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                  RegExp regex = RegExp(pattern);
                                  if (!regex.hasMatch(value!))
                                    return 'Please make sure your email address is valid';
                                  else
                                    return null;
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white.withOpacity(0.5),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left:12.0),
                            child: TextFormField(
                              controller: _passwordTextController,
                              decoration: InputDecoration(
                                hintText: "Password",
                                icon: Icon(Icons.lock_outline),
                                //border: OutlineInputBorder(),
                              ),
                              validator: (value){
                                if (value==null) {
                                 return"This Password is incorrect";
                                }
                                else if(value.length<6){
                                  return"the password has to be atleast 6 characters long ";
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.blue,
                          elevation: 0.0,
                          child:MaterialButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (BuildContext)
                              {
                                return HomePage();
                              }));
                            },
                            minWidth: MediaQuery.of(context).size.width,
                            child: Text("Login",textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                            ),),
                          ),
                        ),
                      ),
                      Divider(color: Colors.white,),
                      Text("Other login in option",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.red,
                            elevation: 0.0,
                            child:MaterialButton(
                              onPressed: (){

                              },
                              minWidth: MediaQuery.of(context).size.width,
                              child: Text("Google",textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22.0,
                                ),),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ),

          Visibility(
            visible: loading ?? true,
            child: Center(
              child: Container(
                color: Colors.white.withOpacity(0.7),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar:Container(
          child:Padding(
            padding: const EdgeInsets.only(right:12.0,top:8.0,left: 12.0,),
            child: ElevatedButton(
              onPressed: () {
                handleSignedIn();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              child: Text(
                'SignIn /SignUp with Google',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
      ) ,
    );
  }

}
