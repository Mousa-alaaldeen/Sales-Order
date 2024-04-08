import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    
    required this.controller,
    required this.type,
    this.isPassword = false,
    this.prefix,
    this.suffix,
    this.validate,
    this.suffixPressed,
    this.onTap,
    this.isClickable = true,
    this.onFieldSubmitted, required this.hintText,
  });

  final TextEditingController controller;
  final TextInputType type;
  final bool isPassword;
  final IconData? prefix;
  final IconData? suffix;
  final FormFieldValidator<String>? validate;
  final VoidCallback? suffixPressed;
  final VoidCallback? onTap;
  final bool isClickable;
  final ValueChanged<String>? onFieldSubmitted;
  final String   hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      
      keyboardType: type,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText:hintText ,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        prefixIcon: prefix != null ? Icon(prefix) : null,
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(suffix),
              )
            : null,
      ),
      onFieldSubmitted: onFieldSubmitted,
      validator: validate,
      onTap: onTap,
      enabled: isClickable,
    );
  }
}
