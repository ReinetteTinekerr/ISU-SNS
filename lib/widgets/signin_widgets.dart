import 'package:flutter/material.dart';
import 'package:university_chat_app/core/pages/home/menu_item.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({
    Key? key,
    required this.labelText,
  }) : super(key: key);

  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        labelText,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class RadioButton<T extends Enum> extends StatelessWidget {
  const RadioButton({
    Key? key,
    required this.title,
    required this.value,
    this.groupValue,
    required this.onChanged,
    required this.onTap,
  }) : super(key: key);

  final ValueChanged<T?> onChanged;
  final ValueChanged<T> onTap;
  final String title;
  final T value;
  final T? groupValue;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: InkWell(
        child: Text(title),
        onTap: () => onTap(value),
      ),
      leading: Radio<T>(
        value: value,
        groupValue: groupValue,
        onChanged: (T? value) => onChanged(value),
      ),
    );
  }
}

class TextForm extends StatelessWidget {
  const TextForm({
    Key? key,
    required this.labelText,
    this.prefixIcon,
    this.controller,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
    this.suffixIcon,
    this.autofillHints,
  }) : super(key: key);

  final String labelText;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final ValueChanged? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Iterable<String>? autofillHints;

  final border = const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      keyboardType: keyboardType,
      obscureText: obscureText,
      autofillHints: autofillHints,
      decoration: prefixIcon == null
          ? InputDecoration(
              labelText: labelText,
              border: border,
            )
          : InputDecoration(
              labelText: labelText,
              border: border,
              prefixIcon: Icon(prefixIcon),
              suffixIcon: suffixIcon,
            ),
      validator: validator,
    );
  }
}
