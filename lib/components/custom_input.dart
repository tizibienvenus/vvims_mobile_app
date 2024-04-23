import 'package:flutter/material.dart';

import '../utils/colors.dart';
class CustomFormInputField extends StatefulWidget {

  CustomFormInputField({super.key,
    this.focusNode,
    required this.onChange,
    this.placeholder = '',
    this.suffixIcon,
    this.prefixIcon,
    this.isFilled = true,
    this.hasSuffix = false,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
    this.fillColor,
    this.hasBorder = false,
    this.borderColor = Colors.transparent,
    this.borderWidth = 2,
    this.hasPrefix = false,
    this.initialValue = '',
    this.obscureText = false,
    this.isEnabled = true,
    this.prefixColor
  });

  defaultValidator() {
    // if (value == null || value.isEmpty) {
    //   return 'Please enter some text';
    // }
    return null;
  }

  final String? prefixIcon;
  final String? suffixIcon;
  final bool hasSuffix;
  final bool hasPrefix;
  final String? placeholder;
  final void Function(String) onChange;
  final FocusNode? focusNode;
  final bool isFilled;
  final Color? fillColor;
  final EdgeInsets contentPadding;
  final bool hasBorder;
  final Color borderColor;
  final double borderWidth;
  final String initialValue;
   bool obscureText;
  final bool isEnabled;
  final Color? prefixColor;

  @override
  State<CustomFormInputField> createState() => _CustomFormInputFieldState();
}

class _CustomFormInputFieldState extends State<CustomFormInputField> {
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      style: Theme.of(context).textTheme.bodyText1?.copyWith(
          color: AppColors.grey,
          fontWeight: FontWeight.w500,
          fontSize: 16
      ),
      // validator: widget.hasValidation ? widget.validator : widget.defaultValidator,
      onChanged: widget.onChange,
      focusNode: widget.focusNode,
      initialValue: widget.initialValue,
      obscureText: widget.obscureText,
      enabled: widget.isEnabled,
      decoration: InputDecoration(
        hintText: widget.placeholder ?? '',
        filled: widget.isFilled,
        fillColor: widget.isFilled ? widget.fillColor : AppColors.white,
        hintStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
            color: AppColors.grey,
            fontSize: 16
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: widget.hasBorder ? BorderSide(
                width: 1,
                color: widget.hasBorder ? widget.borderColor : Colors.transparent
            )  :  BorderSide.none
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: widget.hasBorder ? BorderSide(
                width: 1,
                color:  widget.hasBorder ? widget.borderColor : Colors.transparent
            )  :  BorderSide.none
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: widget.hasBorder ? BorderSide(
                width: 1,
                color:  widget.hasBorder ? widget.borderColor : Colors.transparent
            )  :  BorderSide.none
        ),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: widget.hasBorder ? BorderSide(
                width: 1,
                color:  widget.hasBorder ? widget.borderColor : Colors.transparent
            )  :  BorderSide.none
        ),
        contentPadding: widget.contentPadding,
        prefixIcon: widget.hasPrefix ? Container(
          height: 15,
          width: 15,
          margin: const EdgeInsets.only(left: 5.0),
          child: Image.asset(widget.prefixIcon!,  height: 15, width: 15,  color: AppColors.grey, fit: BoxFit.contain,),
        ) : null,
        // suffixIcon: Row(
        //   children: [
        //     Icon(Icons.search),
        //     // IconButton(
        //     //     onPressed: (){},
        //     //     icon: Image.asset("assets/icons/search.svg", height: 20, width: 20, color: widget.obscureText ? AppColors.grey : AppColors.blue, fit: BoxFit.cover,)),
        //     // IconButton(
        //     //     onPressed: (){},
        //     //     icon: Image.asset("assets/icons/filter.png", height: 20, width: 20, color: widget.obscureText ? AppColors.grey : AppColors.blue, fit: BoxFit.cover,)),
        //   ],
        // ) ,
      ),
    );
  }
}
