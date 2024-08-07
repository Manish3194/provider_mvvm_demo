import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_mvvm_demo/res/components/round_button.dart';
import 'package:provider_mvvm_demo/utils/app_string.dart';
import 'package:provider_mvvm_demo/view_model/auth_view_model.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  bool _isPasswordVisible = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();


  }

  @override
  Widget build(BuildContext context) {

    final authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: Text('SignUp'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              focusNode: emailFocusNode,
              decoration: const InputDecoration(
                hintText: 'Email',
                prefixIcon: Icon(Icons.email_outlined),
              ),
              onFieldSubmitted: (value) {
                Utils.fieldFocusChange(context, emailFocusNode, passwordFocusNode);
              },
            ),
            TextFormField(
              controller: _passwordController,
              obscureText: !_isPasswordVisible,
              obscuringCharacter: '*',
              focusNode: passwordFocusNode,
              decoration: InputDecoration(
                hintText: 'Password',
                prefixIcon: Icon(Icons.lock_outline),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: height * .1,),
            RoundButton(
              title: 'Sign Up',
              loading: authViewModel.signUploading,
              onPress: (){
                if(_emailController.text.isEmpty){
                  Utils.flushBarErrorMessage('Please Enter Email', context);

                }else if(_passwordController.text.isEmpty){
                  Utils.flushBarErrorMessage('Please Enter Password', context);

                }else if(_passwordController.text.length < 6){
                  Utils.flushBarErrorMessage('Password must me 6 character', context);
                }else {
                  Map data = {
                    'email' : _emailController.text.toString(),
                    'password' : _passwordController.text.toString(),
                  };
                  authViewModel.signUpApi(data , context);
                  print('api hit');
                }

              },
            ),
            SizedBox(height: height * .02,),
            InkWell(

                child: Text("Already have an account? Login")),
          ],
        ),
      ),
    );
  }
}


