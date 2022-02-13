// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UIHelper {
  // STRING
  static const String createAccount = "Create\nAccount";
  static const String welcomeBack = "Welcome\nBack";
  static const String greet = "Greetings";
  static const String name = "Name";
  static const String welcome = "Welcome";
  static const String email = "Email address";
  static const String username = "Username";
  static const String password = "Password";
  static const String mobile = "Mobile Number";
  static const String login = "Login";
  static const String signIn = "Sign In";
  static const String signUp = "SIGN UP";
  static const String signInLower = "Sign in";
  static const String signUpLower = "Sign up";
  static const String verifyOTP = "Verify OTP";
  static const String verifyOTPlower = "Enter the OTP";
  static const String stayLoggedIn = "Stay Logged In";
  static const String forgetPassword = "Forget Password?";
  static const String loginSpotify = "LOG IN WITH SPOTIFY ";
  static const String loginFacebook = "Login with Facebook";
  static const String emailRequired = "Email is required";
  static const String passwordRequired = "Password is required";
  static const String dontHaveAnAccount = "Don't have an account?";
  static const String signAccount = "Sign in to your Account";

  // MUZ LOGIN COLORS
  static const Color MUZ_PRIMARY_COLOR = Color(0XFF3C67F7);
  static const Color MUZ_BACKGROUND_COLOR = Color(0xFFF2F3F8);
  static const Color MUZ_SHADOW = Color(0x70000000);
  static const Color MUZ_BUTTONSHADOW = Color(0x403C67F7);
  static const Color MUZ_TEXT_COLOR = Color(0xFF5A7BB5);

  // WATERMELON LOGIN COLORS
  static const Color LOGINSCREEN_PRIMARY_COLOR = Color(0xFF3D6351);
  static const Color LOGINSCREEN_Login_COLOR = Color(0xFFDBA36F);
  static const Color LOGINSCREEN_Signup_COLOR = Color(0xFF3D6351);
  static const Color LOGINSCREEN_SHADOW = Color(0xFFF3E0E0
  );

  // PINEAPPLE LOGIN COLOR
  static const Color PINEAPPLE_PRIMARY_COLOR = Color(0xFF71CEEB);
  static const Color PINEAPPLE_SECONDARY_COLOR = Color(0xFFF1F0F2);
  static const Color PINEAPPLE_SHADOW = Color(0x30000000);

  // PEAR LOGIN COLOR
  static const Color PEAR_PRIMARY_COLOR = Color(0xFF4873FF);

  // AVOCADOS LOGIN COLOR
  static const Color AVOCADOS_PRIMARY_COLOR = Color(0xFF0B5D47);
  static const Color AVOCADOS_SECONDARY_COLOR = Color(0xFFFEA839);

  // GLOBAL COLORS
  static const Color SPOTIFY_COLOR = Color(0xFF1DB954);
  static const Color SPOTIFY_TEXT_COLOR = Color(0xFFF4F6FC);
  static const Color SPOTIFY_SHADOW = Color(0x401DB954);
  static const Color WHITE = Colors.white;
  // ignore: constant_identifier_names
  static const Color BLACK = Colors.black;
  static const Color THEME_PRIMARY = Color(0XFF575C79);
  static const Color THEME_LIGHT = Color(0XFF8489A8);
  static const Color THEME_DARK = Color(0XFF2D334D);
  static const Color BACKGROUND_COLOR = Color(0XFFAEB2D1);
  static const Color FACEBOOK_COLOR = Color(0xFFF3B5998);

  // SPACE
  static dynamicHeight(double height) =>  ScreenUtil().setHeight(height);
  static dynamicWidth(double width) => ScreenUtil().setWidth(width);
  static dynamicSp(double fontsize) => ScreenUtil().setSp(fontsize);
}
