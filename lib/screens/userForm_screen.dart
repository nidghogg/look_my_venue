import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../ui/ui_helper.dart';
import 'navigation.dart';

class UserFormScreen extends StatefulWidget {
  const UserFormScreen({Key? key}) : super(key: key);

  @override
  _UserFormScreenState createState() => _UserFormScreenState();
}

class _UserFormScreenState extends State<UserFormScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.setContext(context);
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/myjpeg.jpg"), fit: BoxFit.fill)),
        //color: UIHelper.LOGINSCREEN_PRIMARY_COLOR,
        child: Column(
          children: <Widget>[
            _topBar,
            _bottomBar,
          ],
        ),
      ),
    );
  }

  Widget get _topBar => Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 50, 15, 50),
          child: Text(
            UIHelper.profile,
            style: TextStyle(
              color: Colors.black,
              fontSize: UIHelper.dynamicSp(120),
              fontWeight: FontWeight.w200,
            ),
          ),
        ),
      );
  Widget get _bottomBar => Expanded(
        child: Container(
          width: double.parse('380.45'),
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
                    UIHelper.profilelower,
                    style: TextStyle(
                        fontSize: UIHelper.dynamicSp(70),
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1),
                  ),
                  const Text("Please complete your profile"),
                  _textField(
                      "Enter your name", false, _nameController),
                  _textField(
                      "Enter your email address", false, _emailController),
                  _textField("Enter password", true, _passwordController),
                  _textField("Confirm password", true, _confirmPasswordController),
                  _signupButton,
                ],
              ),
            ),
          ),
        ),
      );

  Widget _textField(String text, bool obscure, TextEditingController ctrl) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 20, 10),
      child: TextField(
        controller: ctrl,
        keyboardType: TextInputType.number,
        style: const TextStyle(color: Colors.grey),
        textAlign: TextAlign.start,
        obscureText: obscure,
        autocorrect: false,
        onSubmitted: (value) {
          print(value);
        },
        onChanged: (value) {
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
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) =>
                          states.contains(MaterialState.disabled)
                              ? UIHelper.LOGINSCREEN_Signup_COLOR
                              : UIHelper.LOGINSCREEN_Signup_COLOR,
                    ),
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NavigationHomeScreen()),
                    );
                  },
                  child: const Text(
                    'Create',
                    style: TextStyle(
                        fontSize: 20, color: UIHelper.SPOTIFY_TEXT_COLOR),
                  ),
                ),
              ),
            )),
      );
}
