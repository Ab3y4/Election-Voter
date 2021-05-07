// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "signup_to_your_text": "Signup to Your Account",
  "nic_hint": "NIC",
  "phone_hint": "Phone Number",
  "election_hint": "Election ID",
  "submit_button_s_up": "Submit",
  "otp_hint": "OTP",
  "login_button": "Login",
  "next_button": "Next",
  "successfully_voted_text": "Successfully Voted",
  "you_will_be_automatically_text": "You will be automatically redirected to the Language screen"
};
static const Map<String,dynamic> fr = {
  "signup_to_your_text": "ගිනුම සකසා ගන්න",
  "nic_hint": "ජා.හැ.අ",
  "phone_hint": "දුරකතන අOකය (+94)",
  "election_hint": "ඡන්ද අOකය",
  "submit_button_s_up": "යොමු කරන්න",
  "otp_hint": "රහස් අOකය",
  "login_button": "ඇතුල් වන්න",
  "next_button": "ඉදිරියට",
  "successfully_voted_text": "ඡන්දය යොමු කිරීම සාර්තකයි",
  "you_will_be_automatically_text": "ඔබව නැවත භාෂා තේරීමේ කවුලුව සදහා ඉබේම යොමු කෙරේ"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "fr": fr};
}
