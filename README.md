<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

Animated Text Custom Field which can be used to animate text field and errors by modifying the text field widget.
It use custom fade animation from package [simple_animations](https://pub.dev/packages/simple_animations) to animate the text field and errors and hide error after interval of time (default 10 seconds).


## Features
- Easy to handle errors
- Easy to handle text field
- Keep remove boilerplate code
- Some Validation are already added
    - Email
    - Password
    - Phone
    - Url



## Getting started
- Add the dependency to your pubspec.yaml file
  ``` 
    dependencies:
        animated_text_custom_field: ^0.0.1
    ```
- Import the package
    ```
        import 'package:animated_text_custom_field/animated_text_custom_field.dart';
    ```
- Use the widget
    ```
        CustomTextField(
                        errorKey: 'password',
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: CustomTextInputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          hintText: "Enter your password",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 2,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.blue,
                              width: 2,
                            ),
                          ),
                        ),
                        validator: (String? value) {
                          if (value != null) {
                            if (!TextErrorservice.isValidPasswordLength(value,  //using TextErrorService to validate password 
                                length: 8)) {
                              return "Password must be at least 8 characters";
                            }
                          }
                          return null;
                        },
                      ),
    ```


## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder.

```
flutter run 

```

## Output

![output sample1](./outputs/1.png)

![Output sample2](./outputs/2.png)
