import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone_flutter/Widgets/text_field_input.dart';
import 'package:instagram_clone_flutter/utils/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController= TextEditingController();
  final TextEditingController passController= TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 32),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
            children:<Widget> [
              Flexible(child: Container(),flex: 2,),
              //svg image
              SvgPicture.asset('assets/ic_instagram.svg',
              color:primaryColor,
              height: 64,),
               SizedBox(height: 64,),
              //input for email
              TextFieldInput(textEditingController: emailController, hintText:'Enter your Email', textInputType: TextInputType.emailAddress),
              SizedBox(
                height: 24,
              ),

              //input for password
              TextFieldInput(textEditingController: passController, hintText:'Enter your Password', textInputType: TextInputType.text,
              isPass: true,),
              SizedBox(
                height: 24,
              ),
              //bottom login
              InkWell(
                child: Container(
                  child: const Text('Log In'),
                  width: double.infinity,
                  alignment:  Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                    color: blueColor
                  ),
                ),
              ),
              SizedBox(height: 12,),
              Flexible(child: Container(),flex: 1,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget> [
                  Container(
                    child: Text('Dont have an account?'),
                    padding: EdgeInsets.symmetric(vertical: 8),

                  ),
                  GestureDetector(
                    onTap: (){},
                    child: Container(

                      child: Text('Sign Up',
                        style: TextStyle(fontWeight: FontWeight.bold),),
                      padding: EdgeInsets.symmetric(vertical: 8),


                    ),
                  )
                ],
              )
              // transitioning to signing up
            ],
            ),
          )),
    );
  }
}
