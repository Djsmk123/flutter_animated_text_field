Animated Text Custom Field which can be used to animate text field and errors by modifying the text field widget.
It use custom fade animation from package [simple_animations](https://pub.dev/packages/simple_animations) to animate the text field and errors and hide error after interval of time (default 10 seconds).


## Features
- Easy to handle errors
- Easy to handle text field
- Keep remove boilerplate code
- String extension to Capitalize first letter of string
- Some Validation are already added
    - Email
    - Password
    - Phone
    - Url
    - Credit Card:Add following card types
      - Visa
      - MasterCard
      - American Express
      - Diners Club
      - Discover
      - JCB
      - UnionPay
      - Maestro
      - Mir
      - Forbrugsforeningen
      - dankort
      - Laser
      - InstaPayment
      - Laser
      - Switch
      - RuPay
    - CVV
    - Date
    - Time
    - IP Address
    - IP4 Address
    - IP6 Address
    - JSON
    - Pin Code
    - Passport Number
    - Latitude
    - Longitude

## Getting started
- Add the dependency to your pubspec.yaml file
  
  ``` 
    dependencies:
        animated_text_custom_field: 
    ```
  for latest version check [animated_text_custom_field](https://pub.dev/packages/animated_text_field)

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

- Use String extension to Check if string is valid email
    ```
        String email = "test@test.com";
          if (email.isEmail()) {
            //do something
            }
    ``` 
## Output

![output sample1](https://i.imgur.com/nwy25kB.png)

![Output sample2](https://i.imgur.com/Lncmbbz.png)
  

## Usage

A simple usage example:
- open code folder "example" in code editor (VS Code, Android Studio, etc).
- run the following command in terminal
```
    flutter run -d chrome
```

## Properties and Methods

| Property              | Type                      | Description                                 |
|-----------------------|---------------------------|---------------------------------------------|
| controller            | TextEditingController     | TextEditing Controller used to control text |  
| errorDuration         | Duration                  | Default value second 10.                    |
| errorStyle            | TextStyle                 | TextStyle for Error Text Widget             |
| errorKey              | String                    | Key for error                               |
| fadeAnimationDuration | double                    | Default value 1.5 seconds                   |
| customErrorWidget     | Widget                    | Custom Error Widget                         |
| decoration            | CustomTextInputDecoration | Custom Input Decoration(Input decoration)   |
| validator             | String Function(String?)  | Validator for text field (required)         |

Other methods and properties are inherited from TextFormField widget.

## Extension Methods

| Method                   | Description                                 |
|--------------------------|---------------------------------------------|
| isEmail                  | Check if string is valid email              |
| isPassword               | Check if string is valid password           |
| hasPasswordLength        | Check if string has password length         |
| isPhoneNumber            | Check if string is valid phone number       |
| isUrl                    | Check if string is valid url                |
| isName                   | Check if string is valid name               |
| isVisaCard               | Check if string is valid visa credit card   |
| isMasterCard             | Check if string is valid master card        |
| isAmericanExpressCard    | Check if string is valid american express   |
| isDinersClubCard         | Check if string is valid diners club        |
| isDiscoverCard           | Check if string is valid discover           |
| isJCBCard                | Check if string is valid JCB                |
| isUnionPayCard           | Check if string is valid union pay          |
| isMaestroCard            | Check if string is valid maestro            |
| isMirCard                | Check if string is valid mir                |
| isForbrugsforeningenCard | Check if string is valid forbrugsforeningen |
| isDankortCard            | Check if string is valid dankort            |
| isLaserCard              | Check if string is valid laser              |
| isInstaPaymentCard       | Check if string is valid insta payment      |
| isSwitchCard             | Check if string is valid switch             |
 | isSoloCard               | Check if string is valid solo               |
| isRuPayCard              | Check if string is valid ruPay              |
| isCVV                    | Check if string is valid cvv                |
| isCVV2                   | Check if string is valid cvv2               |
| isExpiryDate             | Check if String is valid Expiry Date        |
| isCreditCard             | Check if String is valid credit card        |
| isIP                     | Check if String is valid IP                 |
| isIP4                    | Check if String is valid IP4                |
| isIP6                    | Check if String is valid IP6                |
| isJSON                   | Check if String is valid JSON               |
| isPinCode                | Check if String is valid Pin Code           |
| isPassportNumber         | Check if String is valid Passport Number    |
| isLatitude               | Check if String is valid Latitude           |
| isLongitude              | Check if String is valid Longitude          |
| capitalize               | Capitalize first letter of string           |
| isValidTime              | Check if String is valid Time               |
| isValidDate              | Check if String is valid Date               |


## Contributing

- Fork it
- Create your feature branch (git checkout -b my-new-feature)
- Commit your changes (git commit -am 'Add some feature')
- Push to the branch (git push origin my-new-feature)
- Create new Pull Request
- If you have any questions, please open an issue.
- If you found a bug, please open an issue.
- If you have a feature request, please open an issue.
- If you want to contribute, please submit a pull request.
- If you use this package, please add a star on GitHub.
- If you use this package, please tweet about it.
- If you use this package, please mention it in a blog post.




