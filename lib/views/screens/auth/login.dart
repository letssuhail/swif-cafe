import 'package:flutter/material.dart';
import 'package:swift_cafe/views/screens/custom_rout.dart';
import 'package:swift_cafe/views/screens/home.dart';

class SwiftCafeLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image or gradient
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/loginbackground.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.withOpacity(.3),
              image: const DecorationImage(
                image: AssetImage('assets/images/loginbg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Adjust Column size
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/coffee_logo.png',
                      height: 80,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Swift',
                      style: TextStyle(
                        fontSize: 64,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'Café',
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Latte but never late',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white60,
                        fontFamily: 'Poppins',
                        shadows: [
                          Shadow(
                            blurRadius:
                                20.0, // Controls the blur radius of the shadow
                            color:
                                Colors.white.withOpacity(0.5), // Shadow color
                            offset: Offset(2.0, 2.0), // Shadow offset
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    const TextField(
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        hintText: 'User Name',
                        hintStyle: TextStyle(
                          color: Colors.white60,
                          fontFamily: 'Inter',
                          fontSize: 14,
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const TextField(
                      cursorColor: Colors.white,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          color: Colors.white60,
                          fontFamily: 'Inter',
                          fontSize: 14,
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF4D2B1A),
                              Color(0xFFA7745A),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.transparent,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(CustomPageRoute(
                                    child: HomePage(),
                                    direction: AxisDirection.left))
                                // Handle login action
                                ;
                          },
                          child: const Text('Login',
                              style:
                                  TextStyle(fontSize: 20, fontFamily: 'Inter')),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Color(0xffF8F8F8)),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.transparent,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {
                            // Handle signup action
                          },
                          child: const Text('Signup',
                              style:
                                  TextStyle(fontSize: 20, fontFamily: 'Inter')),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () {
                        // Handle privacy policy action
                      },
                      child: const Text(
                        'Privacy Policy',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Inter',
                          color: Colors.white60,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
