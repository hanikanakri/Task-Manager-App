import '/core/constants/app_theme.dart';
import '/core/utils/validators.dart';
import 'package:flutter/material.dart';



class CustomFileField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final IconData? icon;
  final bool? autofocus;
  final GestureTapCallback? onTap;
  final bool? general;

  const CustomFileField(
      {super.key,
      required this.onTap,
      required this.labelText,
      required this.hintText,
      this.icon,
      this.autofocus,
      this.general = true});

  @override
  State<CustomFileField> createState() => _CustomFileFieldState();
}

class _CustomFileFieldState extends State<CustomFileField> {
  late InputDecoration _inputDecoration;

  @override
  void initState() {
    super.initState();
    _inputDecoration = !widget.general!
        ? AppTheme.inputDecoration.copyWith(
            prefixIcon: Icon(
              widget.icon,
              size: 15,
            ),
          )
        : const InputDecoration(
            suffixIcon: Icon(
              Icons.add,
              size: 20,
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      controller: TextEditingController(text: ''),
      onTap: widget.onTap,
      decoration: _inputDecoration.copyWith(
          hintText: widget.hintText, label: Text(widget.labelText)),
      validator: (value) => Validator.nameValidate(value!, context),
    );
  }
}
