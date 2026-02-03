import 'package:flutter/material.dart';

class CazaTextField extends StatefulWidget {

  final TextEditingController controller;
  final String hintText;
  final IconData? prefixIcon;
  final bool isPassword;
  final String? Function(String?)? validator;

  const CazaTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.isPassword = false,
    this.validator,
  });

  @override
  State<CazaTextField> createState() => _CazaTextFieldState();
}

class _CazaTextFieldState extends State<CazaTextField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      validator: widget.validator,
      // This uses the 'inputDecorationTheme' we defined in AppTheme!
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
                onPressed: () => setState(() => _obscureText = !_obscureText),
              )
            : null,
      ),
    );
  }
}
