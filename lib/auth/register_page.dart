import 'package:dopsi/auth/widget/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool obscureText = true;
  String _selectedValue = "";
  final String _petOwner = "I am a pet owner";
  final String _lookingForPet = "I am looking for a pet";
  final TextEditingController _todoController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;
    return Scaffold(
      body: SizedBox(
        width: width,
        height: height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Hello Dear!',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Welcome to Dopsi!",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 80, right: 20, left: 20),
                child: TextFormField(
                  controller: _nameController,
                  validator: (value) => value!.trim().isEmpty
                      ? 'Please enter a valid name'
                      : null,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintText: 'Name',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, right: 20, left: 20),
                child: TextFormField(
                  controller: _emailController,
                  validator: (input) => !input!.contains('@')
                      ? 'Please enter a valid email'
                      : null,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintText: 'Email',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, right: 20, left: 20),
                child: TextFormField(
                  controller: _phoneController,
                  validator: (input) => input!.trim().length != 10
                      ? 'Please enter a valid phone number'
                      : null,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintText: 'Mobile Phone',
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, right: 20, left: 20),
                child: TextFormField(
                  validator: (input) =>
                      input!.trim().isEmpty ? 'Please choose one' : null,
                  controller: _todoController,
                  onTap: () {
                    showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25.0),
                        ),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 200,
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 50,
                                color: Colors.grey[200],
                                child: const Center(
                                  child: Text(
                                    "What do you want to do?",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListView(
                                  children: <Widget>[
                                    ListTile(
                                      title: Text(
                                        _petOwner,
                                        style: const TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          _selectedValue = _petOwner;
                                        });
                                        Navigator.pop(context, _selectedValue);
                                      },
                                    ),
                                    ListTile(
                                      title: Text(
                                        _lookingForPet,
                                        style: const TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          _selectedValue = _lookingForPet;
                                        });
                                        Navigator.pop(context, _selectedValue);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ).then(
                      (value) => _todoController.text = value,
                    );
                  },
                  readOnly: true,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      hintText: 'What do you want to do?',
                      suffixIcon: const Icon(Icons.arrow_drop_down)),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: TextFormField(
                  controller: _passwordController,
                  validator: (input) => input!.length < 6
                      ? 'Password must be at least 6 characters'
                      : null,
                  obscureText: obscureText,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      icon: obscureText
                          ? const Icon(Icons.remove_red_eye_outlined)
                          : const Icon(Icons.remove_red_eye),
                    ),
                    hintText: 'Password',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Button(
                width: width,
                text: 'Sign up',
                withIcon: false,
                onPressed: () {},
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Sign in'),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // void _signUp() async {
  //   if (_formKey.currentState!.validate()) {
  //     _formKey.currentState!.save();
  //     try {
  //       User? user = (await FirebaseAuth.instance
  //               .createUserWithEmailAndPassword(
  //                   email: _email, password: _password))
  //           .user;
  //       await FirebaseFirestore.instance
  //           .collection('users')
  //           .document(user!.uid)
  //           .setData({
  //         'name': _nameController.text,
  //         'email': _emailController.text,
  //         'about': _todoController.text,
  //         'phone': _phoneController.text,
  //         'password': _passwordController.text,
  //       });
  //       Navigator.pop(context);
  //     } catch (e) {
  //       print(e.message);
  //     }
  //   }
  // }
}
