import 'package:flutter/material.dart';
import 'package:my_first_app/Screens/firebase_login_screen.dart';
import 'package:my_first_app/api_services/firebase_api.dart';

class SignUpScreenFirebase extends StatefulWidget {
  const SignUpScreenFirebase({super.key});

  @override
  State<SignUpScreenFirebase> createState() => _SignUpScreenFirebaseState();
}

class _SignUpScreenFirebaseState extends State<SignUpScreenFirebase> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  var phone = '';

  @override
  void initState() {
    super.initState();
    countryController.text = '+91';
  }

  @override
  void dispose() {
    passController.dispose();
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SignUp',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TextFormField(
            //   validator: (value) {
            //     if (value!.isEmpty) {
            //       return 'Email is required';
            //     }
            //     return null;
            //   },
            //   controller: emailController,
            //   decoration: const InputDecoration(
            //     hintText: 'Enter your Email',
            //     border: OutlineInputBorder(),
            //   ),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            // TextField(
            //   controller: passController,
            //   decoration: const InputDecoration(
            //     hintText: 'Enter your Password',
            //     border: OutlineInputBorder(),
            //   ),
            // ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 40,
                  child: TextField(
                    controller: countryController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        // border: OutlineInputBorder(),
                        ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      // border: OutlineInputBorder(),
                      hintText: "Phone",
                    ),
                    onChanged: (value) {
                      phone = value;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                FirebaseApi.instance
                    .signUp(emailController.text, passController.text);
                //   .then((value) {
                // if (value != null) {
                //   Navigator.pushAndRemoveUntil(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => const ToDoScreen(),
                //     ),
                //     (route) => false,
                //   );
                // }
                // });
              },
              child: const Text('SignUp'),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                FirebaseApi.instance.signInWithGoogle();
              },
              child: const Text('Login With Google'),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                FirebaseApi.instance.phoneVerify(countryController.text, phone);
              },
              child: const Text('Login With Phone'),
            ),
            const SizedBox(height: 25),
            GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FirebaseLoginScreen(),
                  ),
                  (route) => false,
                );
              },
              child: const Text('Already have an account? Login'),
            )
          ],
        ),
      ),
    );
  }
}
