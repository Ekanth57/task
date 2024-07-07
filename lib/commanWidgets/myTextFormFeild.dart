import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextFormField extends StatelessWidget {
  final String? hintText;
  final String? heading;
  final bool? isMandatory;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function(String?)? onchanged;
  final bool? isPassword;
  final TextStyle? style;
  final bool? isEmail;
  final double? opacity;
  final String? initialvalue;
  final TextEditingController? controller;
  final Key? refkey;
  final Widget? suffixIcon;
  final Function()? ontap;
  final int? maxText;
  final TextInputAction? textAction;
  final Function(String)? onFieldsubmitted;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final bool? isEnabled;
  final TextInputType? keyboardtype;
  final Function()? editingComplete;

  MyTextFormField({
    this.hintText,
    this.initialvalue,
    this.heading,
    this.validator,
    this.onSaved,
    this.isMandatory = true,
    this.isPassword = false,
    this.isEmail = false,
    this.isEnabled = true,
    this.controller,
    this.onchanged,
    this.opacity,
    this.refkey,
    this.suffixIcon,
    this.ontap,
    this.style,
    this.maxText,
    this.textAction,
    this.onFieldsubmitted,
    this.keyboardtype,
    this.focusNode,
    this.inputFormatters,
    this.editingComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        inputFormatters: inputFormatters,
        autocorrect: false,
        maxLength: maxText,
        maxLines: 1,
        onTap: ontap,
        onEditingComplete: editingComplete,
        style: TextStyle(
          color: Theme.of(context).textTheme.bodyText1!.color,
          fontWeight: FontWeight.w500,
          fontFamily: Theme.of(context).textTheme.subtitle1!.fontFamily,
          fontStyle: FontStyle.normal,
          fontSize: 15,

        ),

        decoration: InputDecoration(
          errorMaxLines: 3,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(color: Colors.grey, width: 2.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(color: Colors.grey, width: 2.0),
            ),
            hintText: hintText
              ),
              obscureText: isPassword! ? true : false,
              onChanged: onchanged,
              initialValue: initialvalue,
              controller: controller,
              key: refkey,
              onFieldSubmitted: onFieldsubmitted,
              validator: validator,
              onSaved: onSaved,
              enabled: isEnabled,
              keyboardType:
              keyboardtype != null ? keyboardtype : TextInputType.text,
              textInputAction: textAction,
            ),);

  }
}
