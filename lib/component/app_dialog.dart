import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
class AppDialog {
  static void defaultDialog({
    String title = "Alert",
    String message = "",
    String? textConfirm,
    String? textCancel,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    //TODO build a default dialog
  }

  static void showDatePicker(
      BuildContext context, {
        DateTime? minTime,
        DateTime? maxTime,
        DateChangedCallback? onConfirm,
        LocaleType locale = LocaleType.en,
        DateTime? currentTime,
      }) {
    DatePicker.showDatePicker(
      context,
      minTime: minTime,
      maxTime: maxTime,
      onConfirm: onConfirm,
      locale: LocaleType.vi,
      currentTime: currentTime,
      theme: const DatePickerTheme(),
    );
  }

  static void showDateTimePicker(
      BuildContext context, {
        DateTime? minTime,
        DateTime? maxTime,
        DateChangedCallback? onConfirm,
        LocaleType locale = LocaleType.en,
        DateTime? currentTime,
      }) {
    DatePicker.showDateTimePicker(
      context,
      minTime: minTime,
      maxTime: maxTime,
      onConfirm: onConfirm,
      locale: LocaleType.vi,
      currentTime: currentTime,
      theme: const DatePickerTheme(),
    );
  }
}
