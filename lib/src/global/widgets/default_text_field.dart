import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultTextField extends StatelessWidget {
  final String? labelText;
  final String? initialValue;
  final Function(String)? onChanged;

  final bool obscureText;
  final bool readOnly;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final Widget? suffixIcon;

  final TextInputType? keyboardType;

  final TextEditingController? controller;

  final Iterable<String>? autofillHints;
  final List<TextInputFormatter>? inputFormatters;

  final Icon? prefixIcon;

  final String? Function(String?)? validator;

  const DefaultTextField({
    this.controller,
    this.initialValue,
    this.onChanged,
    this.labelText,
    this.obscureText = false,
    this.prefixIcon,
    this.validator,
    this.minLines,
    this.maxLines,
    this.maxLength,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.autofillHints,
    this.inputFormatters,
    this.readOnly = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      onChanged: onChanged,
      keyboardType: TextInputType.text,
      obscureText: maxLines == 1 ? false : obscureText,
      validator: validator,
      minLines: minLines,
      maxLines: obscureText ? 1 : maxLines,
      maxLength: maxLength,
      autofillHints: autofillHints,
      inputFormatters: inputFormatters,
      readOnly: readOnly,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
