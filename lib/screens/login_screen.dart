import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:lookmyvenue_app/screens/signup_screen.dart';
import '../ui/ui_helper.dart';
import '../ui/widgets/forgetPassButton_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'navigation.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();

  final TextEditingController _emailControler = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String initialCountry = 'IN';
  PhoneNumber number = PhoneNumber(isoCode: 'IN');

  @override
  void dispose() {
    // TODO: implement dispose
    _emailControler.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.setContext(context);
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/myjpeg.jpg"),
                fit: BoxFit.fill)
        ),
        //color: UIHelper.LOGINSCREEN_PRIMARY_COLOR,
        child: Column(
          children: <Widget>[_topBar, _bottomBar,
            // ClipRRect(
            //   borderRadius:
            //   const BorderRadius.all(Radius.circular(16.0)),
            //   child: AspectRatio(
            //       aspectRatio: 1.0,
            //       child: Image.asset('assets/myjpeg.jpg')),
            // ),
          ],
        ),
      ),
    );
  }

  Widget get _topBar => Center(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(10, 50, 10, 50),
      child: Text(
        UIHelper.signInLower,
        style: TextStyle(
          color: Colors.white,
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
                UIHelper.welcome,
                style: TextStyle(
                    fontSize: UIHelper.dynamicSp(70),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1),
              ),
              const Text("Sign in with Mobile no. to continue"),
              // _myPhoneField(),
              // _textField(UIHelper.mobile, false, true),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: TextField(
                  controller: _emailControler,
                  style: const TextStyle(color: Colors.grey),
                  textAlign: TextAlign.left,
                  obscureText: false,
                  autocorrect: false,
                  onSubmitted: (value){
                    print(value);
                  },
                  cursorColor: Colors.grey,
                  maxLines: 1,
                  decoration: const InputDecoration(
                    isDense: true,
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: UIHelper.email,
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              // _textField(UIHelper.password, false, false),
              _textField(UIHelper.password, true, false),
              const ForgetPasswordButton(
                color: UIHelper.LOGINSCREEN_PRIMARY_COLOR,
                rightPadding: 0,
              ),
               Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    _loginButton,
                    // const SizedBox(height: 10),
                    _signupButton,
                  ],
               ),
            ],
          ),
        ),
      ),
    ),
  );
  Widget _myPhoneField() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
        child: InternationalPhoneNumberInput(
          maxLength: 10,
          onInputChanged: (PhoneNumber number) {
            print(number.phoneNumber);
          },
          onFieldSubmitted: (value){
            print("FINALLLL "+value);
          },
          selectorConfig: const SelectorConfig(
            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
          ),
          ignoreBlank: false,
          autoValidateMode: AutovalidateMode.disabled,
          selectorTextStyle: const TextStyle(color: Colors.black),
          initialValue: number,
          textFieldController: controller,
          formatInput: false,
          inputDecoration: const InputDecoration(
            isDense: true,
            prefixIconConstraints: BoxConstraints(minWidth: 10, minHeight: 10),
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black54)),
            hintStyle: TextStyle(color: Colors.black54),
          ),
          keyboardType:
          const TextInputType.numberWithOptions(signed: true, decimal: true),
          inputBorder: const OutlineInputBorder(),
          onSaved: (PhoneNumber number) {
            print('On Saved: $number');
          },
        ),
    );
  }
  Widget _textField(String text, bool obscure, bool isNum) {
    if(isNum == true){
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
          },
          cursorColor: Colors.grey,
          maxLines: 1,
          maxLength: 10,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          decoration: InputDecoration(
            prefixIcon: const Text('+91'),
              isDense: true,
              prefixIconConstraints: const BoxConstraints(minWidth: 10, minHeight: 10),
              border: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54)),
              hintText: text,
              hintStyle: const TextStyle(color: Colors.black54),
          ),
        ),
      );
    }
    else {
      return Padding(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
        child: TextField(
          controller: _passwordController,
          style: const TextStyle(color: Colors.grey),
          textAlign: TextAlign.left,
          obscureText: obscure,
          autocorrect: false,
          onSubmitted: (value){
            print(value);
          },
          cursorColor: Colors.grey,
          maxLines: 1,
          decoration: InputDecoration(
            isDense: true,
            border: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
            hintText: text,
            hintStyle: const TextStyle(color: Colors.grey),
          ),
        ),
      );
    }
  }

  Widget get _loginButton => Center(
    child: Padding(
        padding: const EdgeInsets.only(top: 70),
        child: SizedBox(
          height: 50,
          width: 100,
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
                  states.contains(MaterialState.disabled) ? UIHelper.LOGINSCREEN_Login_COLOR : UIHelper.LOGINSCREEN_Login_COLOR,
                ),
                shape: MaterialStateProperty.all(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),),
                ),
              ),
              onPressed: () {
                signIn();
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const NavigationHomeScreen()),
                // );
              },
              child: const Text(
                UIHelper.signInLower,
                style: TextStyle(
                    fontSize: 20, color: UIHelper.SPOTIFY_TEXT_COLOR),
              ),
            ),
          ),
        )),
  );
  Widget get _signupButton => Center(
    child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: SizedBox(
          height: 50,
          width: 100,
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignupScreen()),
                );
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
  Future signIn() async {

    try {
      var result = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailControler.text.trim(),
          password: _passwordController.text.trim()
      );
      if(result.user != null){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const NavigationHomeScreen()),
        );
      }
    } on Exception catch (e) {
      // TODO
      var errorMsg = e.toString();
      _showDialog(errorMsg);
    }
  }
  Future<void> _showDialog(String e) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('An error occurred'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text(
                  'error occured'
                ),
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
