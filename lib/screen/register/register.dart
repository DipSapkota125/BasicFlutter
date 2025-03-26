import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'SignUp',
                  style: TextStyle(
                    fontSize: size.width * 0.08,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: size.height * 0.05),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'fullName',
                    hintText: 'PLease enter fullName',
                    border: OutlineInputBorder(),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'PLease enter your email',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: "Please Enter your Password",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: size.height * 0.02),

                SizedBox(height: size.height * 0.03),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text('Submit', style: TextStyle(fontSize: 18)),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already't have an account? "),
                    TextButton(onPressed: () {}, child: Text('Login')),
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
