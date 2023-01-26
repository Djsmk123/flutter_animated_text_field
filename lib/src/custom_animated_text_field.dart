import 'dart:async';

import 'package:animated_text_field/src/custom_input_decoration.dart';
import 'package:animated_text_field/src/fade_animation.dart';
import 'package:animated_text_field/src/services/text_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final Duration? errorDuration;
  final TextStyle? errorStyle;
  final String errorKey;
  final bool? obscureText;
  final CustomTextInputDecoration? decoration;
  final bool? enabled;
  final bool? autofocus;
  final bool? readOnly;
  final TextInputType? keyboardType;
  final bool? autocorrect;
  final bool? enableSuggestions;
  final bool? enableInteractiveSelection;
  final bool? showCursor;
  final bool? expands;
  final ScrollController? scrollController;
  final MaxLengthEnforcement? maxLengthEnforced;
  final EdgeInsets? scrollPadding;
  final bool? enableIMEPersonalizedLearning;
  final EdgeInsets? contentPadding;
  final Function(String?) validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onSaved;

  final VoidCallback? onEditingComplete;
  final int? maxLength;

  final VoidCallback? onTap;

  final ScrollPhysics? scrollPhysics;
  final TextAlign? textAlign;

  const CustomTextField(
      {super.key,
      this.controller,
      this.maxLength,
      this.decoration,
      required this.errorKey,
      this.textAlign,
      this.obscureText,
      this.scrollController,
      this.enabled,
      this.autofocus,
      this.keyboardType,
      this.readOnly,
      this.autocorrect,
      this.scrollPhysics,
      this.enableSuggestions,
      this.enableInteractiveSelection,
      this.showCursor,
      this.expands,
      this.maxLengthEnforced,
      this.scrollPadding,
      this.enableIMEPersonalizedLearning,
      this.contentPadding,
      this.onChanged,
      this.onFieldSubmitted,
      this.onSaved,
      required this.validator,
      this.onEditingComplete,
      this.onTap,
      this.errorStyle,
      this.errorDuration});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late Timer? timer;
  var periodicTimer = Timer.periodic(const Duration(seconds: 1), (timer) {});
  hideError() async {
    periodicTimer = Timer.periodic(
        widget.errorDuration ?? const Duration(seconds: 10), (timer) {
      if (TextErrorservice.getError(errorKey: widget.errorKey) != "") {
        setState(() {
          TextErrorservice.resetError(errorKey: widget.errorKey);
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      hideError();
    });
  }

  @override
  void dispose() {
    super.dispose();
    periodicTimer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    String? errorText = TextErrorservice.getError(errorKey: widget.errorKey);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeAnimation(
          1.5,
          TextFormField(
            controller: widget.controller,
            decoration: widget.decoration != null
                ? InputDecoration(
                    icon: widget.decoration!.icon,
                    iconColor: widget.decoration!.iconColor,
                    label: widget.decoration!.label,
                    labelText: widget.decoration!.labelText,
                    labelStyle: widget.decoration!.labelStyle,
                    floatingLabelStyle: widget.decoration!.floatingLabelStyle,
                    helperText: widget.decoration!.helperText,
                    helperStyle: widget.decoration!.helperStyle,
                    helperMaxLines: widget.decoration!.helperMaxLines,
                    hintText: widget.decoration!.hintText,
                    hintStyle: widget.decoration!.hintStyle,
                    hintMaxLines: widget.decoration!.hintMaxLines,
                    errorText: null,
                    floatingLabelAlignment:
                        widget.decoration!.floatingLabelAlignment,
                    floatingLabelBehavior:
                        widget.decoration!.floatingLabelBehavior,
                    isDense: widget.decoration!.isDense,
                    contentPadding: widget.decoration!.contentPadding,
                    isCollapsed: widget.decoration!.isCollapsed,
                    prefix: widget.decoration!.prefix,
                    prefixIcon: widget.decoration!.prefixIcon,
                    prefixIconConstraints:
                        widget.decoration!.prefixIconConstraints,
                    prefixText: widget.decoration!.prefixText,
                    prefixStyle: widget.decoration!.prefixStyle,
                    suffix: widget.decoration!.suffix,
                    suffixIcon: widget.decoration!.suffixIcon,
                    suffixIconConstraints:
                        widget.decoration!.suffixIconConstraints,
                    suffixText: widget.decoration!.suffixText,
                    suffixStyle: widget.decoration!.suffixStyle,
                    enabled: widget.decoration!.enabled,
                    semanticCounterText: widget.decoration!.semanticCounterText,
                    alignLabelWithHint: widget.decoration!.alignLabelWithHint,
                    filled: widget.decoration!.filled,
                    fillColor: widget.decoration!.fillColor,
                    focusColor: widget.decoration!.focusColor,
                    hoverColor: widget.decoration!.hoverColor,
                    errorBorder: widget.decoration!.errorBorder,
                    focusedBorder: widget.decoration!.focusedBorder,
                    focusedErrorBorder: widget.decoration!.focusedErrorBorder,
                    disabledBorder: widget.decoration!.disabledBorder,
                    enabledBorder: widget.decoration!.enabledBorder,
                    border: widget.decoration!.border,
                    errorMaxLines: 0,
                    errorStyle: const TextStyle(color: Colors.red),
                    counter: widget.decoration!.counter,
                    counterText: widget.decoration!.counterText,
                    counterStyle: widget.decoration!.counterStyle,
                    suffixIconColor: widget.decoration!.suffixIconColor,
                  )
                : null,
            textAlign: widget.textAlign ?? TextAlign.start,
            obscureText: widget.obscureText ?? false,
            enabled: widget.enabled ?? true,
            autofocus: widget.autofocus ?? false,
            readOnly: widget.readOnly ?? false,
            autocorrect: widget.autocorrect ?? true,
            enableSuggestions: widget.enableSuggestions ?? true,
            enableInteractiveSelection:
                widget.enableInteractiveSelection ?? true,
            showCursor: widget.showCursor ?? true,
            expands: widget.expands ?? false,
            maxLengthEnforcement: null,
            scrollController: widget.scrollController,
            scrollPhysics:
                widget.scrollPhysics ?? const BouncingScrollPhysics(),
            scrollPadding: widget.scrollPadding ?? const EdgeInsets.all(20),
            keyboardType: widget.keyboardType ?? TextInputType.text,
            maxLength: widget.maxLength,
            enableIMEPersonalizedLearning:
                widget.enableIMEPersonalizedLearning ?? true,
            onChanged: widget.onChanged,
            onFieldSubmitted: widget.onFieldSubmitted,
            onSaved: widget.onSaved,
            validator: (String? value) {
              var error = widget.validator(value);

              if (error != null) {
                setState(() {
                  TextErrorservice.addError(
                      errorKey: widget.errorKey, errorMessage: error);
                });
              } else {
                setState(() {
                  TextErrorservice.resetError(errorKey: widget.errorKey);
                });
              }
              return null;
            },
            onEditingComplete: widget.onEditingComplete,
            onTap: widget.onTap,
          ),
        ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 20),
            child: FadeAnimation(
                2,
                Row(
                  children: [
                    const Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: Text(
                        errorText,
                        maxLines: 3,
                        style: widget.errorStyle ??
                            const TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                )),
          )
      ],
    );
  }
}
