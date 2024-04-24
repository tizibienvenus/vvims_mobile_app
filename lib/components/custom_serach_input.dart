import 'package:flutter/material.dart';
import 'package:vvims/config/app_colors.dart';

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
    return  Container(
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 16
              ),
              onChanged: widget.onChange,
              focusNode: widget.focusNode,
              initialValue: widget.initialValue,
              obscureText: widget.obscureText,
              enabled: widget.isEnabled,
              decoration: InputDecoration(
                hintText: widget.placeholder ?? '',
                filled: widget.isFilled,
                fillColor: widget.isFilled ? widget.fillColor : AppColors.white,
                hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
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
              ),
            ),
          ),

          InkWell(
            child: Image.asset(""),
          )
        ],
      ),
    );
  }
}
