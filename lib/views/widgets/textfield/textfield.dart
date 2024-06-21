import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class TextFieldWidget extends StatefulWidget {
  //required
  final TextEditingController controller;
  
  //optional
  final bool? readOnly;
  final void Function()? onTap;
  final TextAlign? textAlign;
  final bool? isCurrency;
  final String? labelText;
  final String? hintText;
  final bool? withoutLabel;
  final bool? obsecureText;
  final String? errorText;
  final TextInputType? keyboardType;
  final int? minLines;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final List<TextInputFormatter>? inputFormatter;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  //constructor
  const TextFieldWidget({
    Key? key,
    required this.controller,
    this.obsecureText,
    this.errorText,
    this.keyboardType,
    this.minLines,
    this.validator,
    this.onSaved,
    this.readOnly,
    this.onTap,
    this.textAlign,
    this.suffixIcon,
    this.prefixIcon,
    this.withoutLabel,
    this.labelText,
    this.hintText,
    this.isCurrency,
    this.inputFormatter,
    this.onFieldSubmitted,
    this.onChanged,
  }) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly ?? false,
      canRequestFocus: widget.readOnly != null ? !widget.readOnly! : true,
      onTap: widget.onTap,
      keyboardType: widget.keyboardType,
      minLines: widget.minLines,
      maxLines: (widget.minLines != null) ? widget.minLines! + 2 : 1,
      controller: widget.controller,
      obscureText: widget.obsecureText ?? false,
      inputFormatters: widget.inputFormatter,
      onFieldSubmitted: widget.onFieldSubmitted,
      onChanged: widget.onChanged,
      textAlign: widget.textAlign ?? TextAlign.start,
      style: const TextStyle(fontSize: 14),
      decoration: InputDecoration(
        suffixIcon: widget.suffixIcon,
        suffixIconConstraints: const BoxConstraints(
          minWidth: 35,
          minHeight: 0,
        ),
        prefixIcon: widget.prefixIcon,
        prefixIconConstraints: const BoxConstraints(
          minWidth: 35,
          minHeight: 0,
        ),
        prefixText: widget.isCurrency == true ? "Rp." : null,
        labelText: widget.labelText,
        hintText: widget.hintText ?? widget.labelText,
        fillColor: widget.readOnly == true ? const Color.fromARGB(15, 169, 169, 169) : Colors.white,
      ),
      validator: widget.validator,
      onSaved: widget.onSaved,
    );
  }
}
