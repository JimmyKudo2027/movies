
import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;
  final String label;
  final IconData prefix;
  final bool isPassword;
  final bool isClickable;
  final IconData? suffix;
  final Function()? onTap;
  final String? Function(String)? validate;
  final Function(String value)? onSubmit;
  final Function(String value)? onChange;
  DefaultTextFormField({
    required this.controller,
    required this.type,
    this.validate,
    required this.label,
    required this.prefix,
    this.isPassword = false,
    this.isClickable = true,
    this.suffix,
    this.onTap,
    this.onSubmit,
    this.onChange,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onTap: onTap,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      validator: (value) {
        if(value!.isEmpty){
          return "This Field Can't Be Empty";
        }else{
          return null;
        }
      },
      decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(prefix),
          suffixIcon: suffix != null ? Icon(suffix) : null,
          border: OutlineInputBorder()),
    );
  }
}
