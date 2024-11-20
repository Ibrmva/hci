import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/presentation/components/new_sign_in_btn.dart';
import 'package:flutter_application_1/feature/presentation/fav_page.dart';
import 'package:flutter_application_1/feature/presentation/page.dart';
import 'package:flutter_application_1/feature/presentation/signInPages/auth_page.dart';
import 'package:flutter_application_1/feature/presentation/signInPages/registration.dart';
import 'package:flutter_application_1/feature/presentation/components/stack.dart';
import 'package:flutter_application_1/feature/presentation/theme/app_fonts.dart';
import 'package:flutter_application_1/feature/presentation/components/text_field.dart';
import 'package:flutter_application_1/feature/presentation/components/forgot_pass_btn.dart';
import 'package:flutter_application_1/feature/presentation/components/colored_btn.dart';
import 'package:flutter_application_1/feature/presentation/components/sign_up_btn.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();




  // Future signIn() async {
  //   await FirebaseAuth.instance
  //       .signInWithEmailAndPassword(email: _emailController.text, password: _emailController.text);
  // }

  // @override
  // void dispose() {
  //   _emailController.dispose();
  //   _passwordController.dispose();
  //   super.dispose();
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MyStack(
        child: Stack(
          children: [
            Center(
              child: Container(
                  width: 290.w,
                  height: 420.h,
                  decoration: BoxDecoration(
                      color: const Color(0xffFFFEFE),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 33,
                        ),
                        const Center(
                          child: Text(
                            "Login",
                            style: AppFonts.s18w700,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 11, bottom: 6),
                              child: Text(
                                "Email",
                                style: AppFonts.s12w700.copyWith(
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                            ),
                            
                            TextData(controller: _emailController, obscureText: false),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 11, bottom: 6),
                              child: Text(
                                "Password",
                                style: AppFonts.s12w700.copyWith(
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                            ),
                            TextData(
                              controller: _passwordController,
                              obscureText: true,
                            ),
                          ],
                        ),
                        Padding(
                            padding: const EdgeInsets.only(
                              top: 11,
                            ),
                                                                            
                            // child: MyButton(onTap: () {Navigator.push(context, MaterialPageRoute(builder:(context) => ListItemsPage()));AuthPage authPage = AuthPage();}),
                            child: MyButton(onTap:() async {
                              try {
                                await FirebaseAuth.instance.signInWithEmailAndPassword(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                );
                                Navigator.push(context, MaterialPageRoute(builder:(context) => ListItemsPage()));AuthPage authPage = AuthPage();
                              } catch (e){
                                 print('Error signing in: $e');
                              }
                            }),
                            ),
   
                        SignUpBtn(onPressed: () {}),
                        ForgotPassBtn(onPressed: () {}),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
// onTap: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) =>
//                                           const ListItemsPage()));
//                             }