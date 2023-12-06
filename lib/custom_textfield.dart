import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? textEditingController;
  final bool isAddress;
  final String? label;
  final String? hintText;
  final Widget? suffixIcon;
  final bool isPassword;
  final bool? isEnabled;
  final bool? hasLabel;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormtter;
  final VoidCallback? onTap;
  final String? error;
  final ValueChanged<String>? onValueChanged;
  final TextInputType keyboardType;
  const CustomTextFormField({
    super.key,
    this.isAddress = false,
    this.label,
    this.onTap,
    this.inputFormtter,
    this.onValueChanged,
    this.hintText,
    this.error,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.textEditingController,
    this.isPassword = false,
    this.validator,
    this.isEnabled,
    this.hasLabel,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isPasswordShow = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          enabled: widget.isEnabled,
          onTap: widget.onTap,
          onChanged: widget.onValueChanged,
          keyboardType: widget.keyboardType,
          controller: widget.textEditingController,
          obscureText: isPasswordShow ? false : widget.isPassword,
          validator: widget.validator,
          decoration: InputDecoration(
            label: Text("${widget.label}"),
            hintText: widget.hintText,
            suffixIcon: (() {
              if (widget.isPassword) {
                return showPasswordIcon(widget.isPassword);
              }
            }()),
          ),
        ),
      ],
    );
  }

  showPasswordIcon(bool isPassword) {
    if (isPassword) {
      if (isPasswordShow) {
        return IconButton(
          icon: const Icon(
            Icons.visibility,
          ),
          onPressed: () => setState(() {
            isPasswordShow = !isPasswordShow;
          }),
        );
      }
      return IconButton(
        icon: const Icon(
          Icons.visibility_off,
        ),
        onPressed: () => setState(() {
          isPasswordShow = !isPasswordShow;
        }),
      );
    }
  }
}
