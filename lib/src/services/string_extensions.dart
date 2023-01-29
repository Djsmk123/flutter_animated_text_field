import 'dart:convert';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  bool isEmail() {
    final RegExp regex = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    return regex.hasMatch(this);
  }

  bool isPassword() {
    final RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    return regex.hasMatch(this);
  }

  bool hasPasswordLength({int length = 8}) {
    return this.length >= length;
  }

  bool isPhoneNumber() {
    final RegExp regex = RegExp(r'^[0-9]{10}$');
    return regex.hasMatch(this) && length == 10;
  }

  bool isUrl() {
    final RegExp regex =
        RegExp(r'^(http(s)?:\/\/)?((w){3}.)?youtu(be|.be)?(\.com)?\/.+$');
    return regex.hasMatch(this);
  }

  bool isName() {
    final RegExp regex = RegExp(r'^[a-zA-Z ]+$');
    return regex.hasMatch(this);
  }

  bool isVisaCard() {
    final RegExp regex = RegExp(r"^4[0-9]{0,15}$");
    return regex.hasMatch(this) && length == 16;
  }

  //check if master card
  bool isMasterCard() {
    final RegExp regex = RegExp(r"^5[1-5][0-9]{0,14}$");
    return regex.hasMatch(this) && length == 16;
  }

  //check if american express card
  bool isAmericanExpressCard() {
    final RegExp regex = RegExp(r"^3[47][0-9]{0,13}$");
    return regex.hasMatch(this) && length == 15;
  }

  //check if discover card
  bool isDiscoverCard() {
    final RegExp regex = RegExp(r"^6(?:011|5[0-9]{0,2})[0-9]{0,12}$");
    return regex.hasMatch(this) && length == 16;
  }

  //check if diners club card
  bool isDinersClubCard() {
    final RegExp regex = RegExp(r"^3(?:0[0-5]|[68][0-9])[0-9]{0,11}$");
    return regex.hasMatch(this) && length == 14;
  }

  //check if jcb card
  bool isJcbCard() {
    final RegExp regex = RegExp(r"^(?:2131|1800|35\d{0,2})\d{0,11}$");
    return regex.hasMatch(this) && length == 16;
  }

  //check if union pay card
  bool isUnionPayCard() {
    final RegExp regex = RegExp(r"^(62[0-9]{0,14,17})$");
    return regex.hasMatch(this) && length == 16;
  }

  //check if maestro card
  bool isMaestroCard() {
    final RegExp regex =
        RegExp(r"^(?:5[0678]\d\d|6304|6390|67\d\d)\d{0,8}(\d{1,3})?$");
    return regex.hasMatch(this) && length == 16;
  }

  //check if mir card
  bool isMirCard() {
    final RegExp regex = RegExp(
        r"^(220[0-4]|220[6-9]|221[0-8]|222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720)[0-9]{0,12}$");
    return regex.hasMatch(this) && length == 16;
  }

  //check if forbrugsforeningen card
  bool isForbrugsforeningenCard() {
    final RegExp regex = RegExp(r"^(600722|67\d{0,2})\d{0,12}$");
    return regex.hasMatch(this) && length == 16;
  }

  //check if dankort card
  bool isDankortCard() {
    final RegExp regex = RegExp(r"^(5019)\d{0,12}$");
    return regex.hasMatch(this) && length == 16;
  }

  //check if instapayment card
  bool isInstapaymentCard() {
    final RegExp regex = RegExp(r"^(637|638|639)\d{0,13}$");
    return regex.hasMatch(this) && length == 16;
  }

  //check if laser card
  bool isLaserCard() {
    final RegExp regex = RegExp(r"^(6304|6706|6709|6771)[0-9]{0,15}$");
    return regex.hasMatch(this) && length == 16;
  }

  //check if solo card
  bool isSoloCard() {
    final RegExp regex = RegExp(r"^(6334|6767)[0-9]{0,15}$");
    return regex.hasMatch(this) && length == 16;
  }

  //check if switch card
  bool isSwitchCard() {
    final RegExp regex =
        RegExp(r"^(4903|4905|4911|4936|564182|633110|6333|6759)[0-9]{0,15}$");
    return regex.hasMatch(this) && length == 16;
  }

  //check if ruPay card
  bool isRuPayCard() {
    final RegExp regex = RegExp(
        r"^(508[5-9][0-9]{0,12}|606985|6070[0-9]{0,12}|6071[0-9]{0,12}|6075[0-9]{0,12}|6077[0-9]{0,12}|608[0-9]{0,13}|6521[5-9][0-9]{0,12}|652[2-9][0-9]{0,12}|6530[0-9]{0,12}|6531[0-4][0-9]{0,12})$");
    return regex.hasMatch(this) && length == 16;
  }

  //check if credit card
  bool isCreditCard() {
    return isVisaCard() ||
        isMasterCard() ||
        isAmericanExpressCard() ||
        isDiscoverCard() ||
        isDinersClubCard() ||
        isJcbCard() ||
        isUnionPayCard() ||
        isMaestroCard() ||
        isMirCard() ||
        isForbrugsforeningenCard() ||
        isDankortCard() ||
        isInstapaymentCard() ||
        isLaserCard() ||
        isSoloCard() ||
        isSwitchCard() ||
        isRuPayCard();
  }

  bool isCvv() {
    final RegExp regex = RegExp(r'^[0-9]{3}$');
    return regex.hasMatch(this) && length == 3;
  }

  bool isCvv2() {
    final RegExp regex = RegExp(r'^[0-9]{4}$');
    return regex.hasMatch(this) && length == 4;
  }

  bool isExpiryDate() {
    final RegExp regex = RegExp(r'^[0-9]{2}\/[0-9]{2}$');
    return regex.hasMatch(this) && length == 5;
  }

  bool isIp4() {
    final RegExp regex = RegExp(
        r'^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$');
    return regex.hasMatch(this);
  }

  bool isIp6() {
    final RegExp regex = RegExp(r'^([0-9a-fA-F]{1,4}:){7,7}[0-9a-fA-F]{1,4}$');
    return regex.hasMatch(this);
  }

  bool isIp() {
    return isIp4() || isIp6();
  }

  bool isJson() {
    try {
      json.decode(this);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool isValidPinCode() {
    final RegExp regex = RegExp(r'^[0-9]{6}$');
    return regex.hasMatch(this) && length == 6;
  }

  bool isValidPassportNumber() {
    final RegExp regex = RegExp(r'^[a-zA-Z0-9]{9}$');
    return regex.hasMatch(this) && length == 9;
  }

  bool isValidDate() {
    /* Date format
    1) dd/mm/yyyy (e.g. 01/01/2019)
    2) dd-mm-yyyy (e.g. 01-01-2019)
    3) dd.mm.yyyy (e.g. 01.01.2019)
    4) dd mm yyyy (e.g. 01 01 2019)
    5) dd*mm*yyyy (e.g. 01*01*2019)
    6) dd,mm,yyyy (e.g. 01,01,2019)
     */
    final RegExp regex = RegExp(
        r'^(0[1-9]|[12][0-9]|3[01])[\/\.\-\s\*](0[1-9]|1[012])[\/\.\-\s\*](19|20)\d\d$');
    return regex.hasMatch(this) && length == 10;
  }

  bool isValidTime() {
    /* Time format
    1) hh:mm:ss (e.g. 01:01:01)
    2) hh:mm (e.g. 01:01)
    3) hh.mm AM/PM (e.g. 01.01 AM)
    4) hh:mm:ss AM/PM (e.g. 01:01:01 AM)
     */
    final RegExp regex = RegExp(
        r'^(0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9]$|^(0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$|^(0[0-9]|1[0-9]|2[0-3])\.[0-5][0-9]\s(AM|PM)$|^(0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]:[0-5][0-9]\s(AM|PM)$');
    return regex.hasMatch(this);
  }

  bool isLatitude() {
    final RegExp regex = RegExp(r'^-?([1-8]?[1-9]|[1-9]0)\.{1}\d{1,6}');
    return regex.hasMatch(this);
  }

  bool isLongitude() {
    final RegExp regex =
        RegExp(r'^-?((1[0-7]|[1-9])?\d(\.\d{1,6})?|180(\.0{1,6})?)');
    return regex.hasMatch(this);
  }
}
