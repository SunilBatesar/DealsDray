import 'package:deals_dray_test/Components/Constants/style_sheet.dart';
import 'package:deals_dray_test/Utils/app_validator.dart';
import 'package:deals_dray_test/main.dart';
import 'package:flutter/material.dart';

class CommonTextField extends StatefulWidget {
  final String labelText;
  final TextInputType keyboardType;
  final bool isPassword;
  final TextEditingController? controller;
  final AppValidator? validator;

  const CommonTextField({
    super.key,
    required this.labelText,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.controller,
    this.validator,
  });

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  bool _isPasswordVisible = false;
    final AppTextTheme _textTheme = AppTextTheme();


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword && !_isPasswordVisible,
      validator:
          widget.validator != null
              ? (value) => widget.validator!.validator(value)
              : null,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: _textTheme.fs15Normal.copyWith(
          color: cnstSheet.colors.grey,
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: cnstSheet.colors.grey),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: cnstSheet.colors.primary),
        ),
        suffixIcon:
            widget.isPassword
                ? IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                )
                : null,
      ),
      keyboardType: widget.keyboardType,
    );
  }
}
