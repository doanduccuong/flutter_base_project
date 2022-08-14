import 'package:flutter/material.dart';

import '../utils/utils.dart';
import 'app_label_text_field.dart';

class AppEmailInput extends AppLabelTextField {
  AppEmailInput({
    Key? key,
    String? highlightText,
    TextStyle? labelStyle,
    TextStyle? textStyle,
    TextEditingController? textEditingController,
    ValueChanged<String>? onChanged,
    bool enabled = true,
  }) : super(
          key: key,
          textEditingController: textEditingController,
          onChanged: onChanged,
          labelText: "Email",
          labelStyle: labelStyle,
          textStyle: textStyle,
          hintText: "",
          highlightText: highlightText ?? "*",
          textInputType: TextInputType.emailAddress,
          enabled: enabled,
          validator: (text) {
            return null;
            //TODO add a regex for email
            // if (Utils.isEmail(text ?? "") || (text ?? "").isEmpty) {
            //   return "";
            // } else {
            //   return "Email invalid";
            // }
          },
        );
}
