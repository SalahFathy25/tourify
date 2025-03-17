import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField(
      {super.key,
      required this.controller,
      required this.label,
      required this.validator,
      required this.keyboardType,
      this.obscure = false,
      this.enabled = false});
  final TextEditingController controller;
  final String label;
  final String? Function(String?) validator;
  final TextInputType keyboardType;
  final bool obscure;
  final bool enabled;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _isObscure;
  void initState() {
    super.initState();
    _isObscure = widget.obscure;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: widget.enabled
            ? IconButton(
                onPressed: () {
                  setState(
                    () {
                      _isObscure = !_isObscure;
                    },
                  );
                },
                icon: _isObscure
                    ? Icon(Icons.visibility_off_outlined)
                    : Icon(Icons.visibility_outlined),
              )
            : null,
      ),
      keyboardType: widget.keyboardType,
      obscureText: _isObscure,
      validator: widget.validator,
    );
  }
}
