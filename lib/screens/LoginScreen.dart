import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          "AMINGO",
          style: TextStyle(
            color: Colors.yellow,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: 4.3),
              const Center(
                child: Text(
                  "Welcome",
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              const Center(
                child: Text(
                  "Enter the OTP to sign into your account.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ),

              const SizedBox(height: 50),

              const Text(
                "Email Address",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 10),

              TextField(
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.yellow,
                decoration: InputDecoration(
                  hintText: "hello@example.com",
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: Colors.grey,
                  ),
                  filled: true,
                  fillColor: const Color(0xFF1E1E1E),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                    const BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.yellow,
                      width: 1.5,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                "OTP",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 10),

              TextField(
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  color: Colors.white,
                  letterSpacing: 4,
                ),
                cursorColor: Colors.yellow,
                decoration: InputDecoration(
                  hintText: "1111",
                  hintStyle:
                  const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: const Color(0xFF1E1E1E),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                    const BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.yellow,
                      width: 1.5,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),


              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    foregroundColor: Colors.black,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "LOGIN",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Resend OTP",
                    style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 6),
                  Text(
                    "in 10 seconds",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              Row(
                children: const [
                  Expanded(child: Divider(color: Colors.grey)),
                  Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "OR CONTINUE WITH",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  Expanded(child: Divider(color: Colors.grey)),
                ],
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    const Color(0xFF2A2A2A),
                    foregroundColor: Colors.white,

                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(12),
                      side: const BorderSide(
                          color: Colors.grey),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/google-removebg-preview.png',
                        height: 22,
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        "Sign in with Google",
                        style: TextStyle(
                          fontWeight:
                          FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 60),
            ],
          ),

        ),
      ),
    );
  }
}
