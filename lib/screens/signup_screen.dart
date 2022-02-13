import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../ui/ui_helper.dart';
import 'otp_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  @override
  Widget build(BuildContext context) {
    ScreenUtil.setContext(context);
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/myjpeg.png"),
                fit: BoxFit.fitHeight)
        ),
        //color: UIHelper.LOGINSCREEN_PRIMARY_COLOR,
        child: Column(
          children: <Widget>[
            _topBar, _bottomBar,
            // ClipRRect(
            //   borderRadius:
            //   const BorderRadius.all(Radius.circular(16.0)),
            //   child: AspectRatio(
            //       aspectRatio: 1.0,
            //       child: Image.asset('assets/myjpeg.png')),
            // ),
          ],
        ),
      ),
    );
  }

  Widget get _topBar => Center(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(5, 50, 15, 50),
      child: Text(
        UIHelper.signUpLower,
        style: TextStyle(
          color: Colors.black,
          fontSize: UIHelper.dynamicSp(150),
          fontWeight: FontWeight.w200,
        ),
      ),
    ),
  );
  Widget get _bottomBar => Expanded(
    child: Container(
      width:  double.parse('380.45'),
      height: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(60), topRight: Radius.circular(60))),
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                UIHelper.greet,
                style: TextStyle(
                    fontSize: UIHelper.dynamicSp(70),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1),
              ),
              const Text("Sign Up with Mobile no. to continue"),
              _textField(UIHelper.mobile, false),
              _signupButton,
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   crossAxisAlignment: CrossAxisAlignment.end,
              //   children: <Widget>[
              //     // _loginButton,
              //     // const SizedBox(height: 10),
              //     _signupButton,
              //   ],
              // )
            ],
          ),
        ),
      ),
    ),
  );

  Widget _textField(String text, bool obscure) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
        child: TextField(
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.grey),
          textAlign: TextAlign.left,
          obscureText: obscure,
          autocorrect: false,
          onSubmitted: (value){
            print(value);
            validateNumber(value);
          },
          onChanged: (value){
            print(value);
            validateNumber(value);
          },
          cursorColor: Colors.grey,
          maxLines: 1,
          maxLength: 10,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          decoration: InputDecoration(
            isDense: true,
            prefixIcon: const Text("+91  "),
            prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
            border: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
            hintText: text,
            hintStyle: const TextStyle(color: Colors.grey),
          ),
        ),
      );
  }
  var myNum = "";
  validateNumber(String value) {
    myNum = value;
  }

  Widget get _signupButton => Center(
    child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: SizedBox(
          height: 50,
          width: double.infinity,
          child: Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: UIHelper.LOGINSCREEN_SHADOW,
                  blurRadius:
                  10.0, // has the effect of softening the shadow
                  spreadRadius:
                  1.0, // has the effect of extending the shadow
                  offset: Offset(
                    0.0, // horizontal, move right 10
                    5.0, // vertical, move down 10
                  ),
                ),
              ],
            ),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:  MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) =>
                  states.contains(MaterialState.disabled) ? UIHelper.LOGINSCREEN_Signup_COLOR : UIHelper.LOGINSCREEN_Signup_COLOR,
                ),
                shape: MaterialStateProperty.all(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),),
                ),
              ),
              onPressed: () {
                if(myNum.length == 10){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const OTPverify()),
                  );
                } else {
                  _showDialog();
                }
              },
              child: const Text(
                UIHelper.signUpLower,
                style: TextStyle(
                    fontSize: 20, color: UIHelper.SPOTIFY_TEXT_COLOR),
              ),
            ),
          ),
        )),
  );

  Future<void> _showDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Test alert box for error messages'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('This is a demo alert dialog.'),
               // Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
