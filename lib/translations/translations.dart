import 'package:get/get.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en": {
          "welcome_back_massage": "Welcome Back , you've been missed!",          
          "email": "Email",
          "email_not_valid": "Please enter a valid Email ",
          "password": "Password",
          "password_not_valid":"Please enter a valid Password",
          "confirm_password":"Confirm Password",
          "password_not_match":"Passwords do not match",
          "login": "Login",
          "not_a_member": "Not a member?",
          "register_now": " Register Now",
          "have_account": "Already have an account?",
          "login_now":" Login now"
        },
        "ar": {
          "welcome_back_massage": "اهلا بك مجدداً ",
          "email": "البريد الالكتروني",
          "email_not_valid":"من فضلك ادخل بريد الكتروني صحيح",
          "password": "كلمة المرور",
          "password_not_valid":"من فضلك ادخل كلمة مرور صحيحة",
          "confirm_password":"تاكيد كلمة المرور",
          "password_not_match":"كلمات المرور غير متطابقة",
          "login": "تسجيل الدخول",
          "not_a_member": "لست عضوا؟ ",
          "register_now": " انشئ حساب",
          "have_account": "هل لديك حساب؟ ",
          "login_now":"سجل الدخول " 
          
        },
      };
}
