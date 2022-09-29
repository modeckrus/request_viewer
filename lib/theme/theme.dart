import 'package:flutter/material.dart';

import 'dark_theme.dart';

class MyTheme extends StatelessWidget {
  final MyThemeData data;
  final Widget child;
  const MyTheme({Key? key, required this.data, required this.child})
      : super(key: key);
  static final MyThemeData _kFallbackTheme = MyThemeData.fallback();
  @override
  Widget build(BuildContext context) {
    return _InheritedTheme(
      theme: data,
      child: child,
    );
  }

  static MyThemeData of(BuildContext context) {
    final _InheritedTheme? inheritedTheme =
        context.dependOnInheritedWidgetOfExactType<_InheritedTheme>();
    final MyThemeData theme = inheritedTheme?.theme ?? _kFallbackTheme;
    return theme;
  }
}

class _InheritedTheme extends InheritedTheme {
  const _InheritedTheme({
    Key? key,
    required this.theme,
    required Widget child,
  }) : super(key: key, child: child);

  final MyThemeData theme;

  @override
  Widget wrap(BuildContext context, Widget child) {
    return MyTheme(data: theme, child: child);
  }

  @override
  bool updateShouldNotify(_InheritedTheme old) {
    final ok = theme != old.theme;
    return ok;
  }
}

abstract class MyThemeData {
  factory MyThemeData.fallback() => MyThemeData.dark();
  factory MyThemeData.dark() => MyThemeDataDark();
  late Brightness myBrightness;
  late Color? iconSuccess;
  late Color firstSplashGragient;
  late Color secondSplashGradient;
  late Color? mainColor;
  late Color? scaffoldColor;
  late Color? otherColor;
  late Color? friendCardColor;
  late Color? textAccentColor;
  late Color redColor;
  late Color? whiteColor;
  late Color? orangeColor;
  late Color? textColor2;
  late Color? greyTextColor;
  late Color? textColor3;
  late Color? purpleColor;
  late Color? backgroundColor;
  late Color? messageIconColor;
  late Color? fillColor;
  late Color? otherIconColor;
  late Color? borrowerTableColor;
  late Color warningBlueCard;
  late Color warningGreenCard;
  late Color warningRedCard;
  late Color? documentCardColor;
  late Color? myDropdownColor;
  late Color policePrivacyTextColor;
  late Color? investIconColor;
  late Color fingerprintDialogColor;
  late Color myMessage;
  late Color messageMe;
  late Color tabBarSelectColor;
  late Color enableBorderColor;
  late Color labelColor;
  late Color moreAndSettingsIconColor;
  late Color greenColor;
  late Color deleteColor;
  late Color greyColor;
  late Color avatarBackgroundColor;
  late Color avatarBorderColor;
  late Color scaffoldMessageColor;
  late Color backGroundPickerColor;
  late Color surfacePickerColor;
  late Color primaryPickerColor;
  late Color ownAccountCardColor;
  late Color ownAccountIconCardColor;
  late Color profileIconColor;
  late Color buttonColor;
  late Color greyTextColor2;
  late Color buttonColor2;
  late Color buttonColor3;
  late Color expansionTextColor;
  late Color personActionColor;
  late Color shimmerColor1;
  late Color shimmerColor2;
  late Color mainTextColor;
  late Color chartWhiteColor;
  late Color chartPrimaryColor;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MyThemeData &&
        other.myBrightness == myBrightness &&
        other.iconSuccess == iconSuccess &&
        other.firstSplashGragient == firstSplashGragient &&
        other.secondSplashGradient == secondSplashGradient &&
        other.mainColor == mainColor &&
        other.scaffoldColor == scaffoldColor &&
        other.otherColor == otherColor &&
        other.friendCardColor == friendCardColor &&
        other.textAccentColor == textAccentColor &&
        other.redColor == redColor &&
        other.whiteColor == whiteColor &&
        other.orangeColor == orangeColor &&
        other.textColor2 == textColor2 &&
        other.greyTextColor == greyTextColor &&
        other.textColor3 == textColor3 &&
        other.purpleColor == purpleColor &&
        other.backgroundColor == backgroundColor &&
        other.messageIconColor == messageIconColor &&
        other.fillColor == fillColor &&
        other.otherIconColor == otherIconColor &&
        other.borrowerTableColor == borrowerTableColor &&
        other.warningBlueCard == warningBlueCard &&
        other.warningGreenCard == warningGreenCard &&
        other.warningRedCard == warningRedCard &&
        other.documentCardColor == documentCardColor &&
        other.myDropdownColor == myDropdownColor &&
        other.policePrivacyTextColor == policePrivacyTextColor &&
        other.investIconColor == investIconColor &&
        other.fingerprintDialogColor == fingerprintDialogColor &&
        other.myMessage == myMessage &&
        other.messageMe == messageMe &&
        other.tabBarSelectColor == tabBarSelectColor &&
        other.enableBorderColor == enableBorderColor &&
        other.labelColor == labelColor &&
        other.moreAndSettingsIconColor == moreAndSettingsIconColor &&
        other.greenColor == greenColor &&
        other.deleteColor == deleteColor &&
        other.greyColor == greyColor &&
        other.avatarBackgroundColor == avatarBackgroundColor &&
        other.avatarBorderColor == avatarBorderColor &&
        other.scaffoldMessageColor == scaffoldMessageColor &&
        other.backGroundPickerColor == backGroundPickerColor &&
        other.surfacePickerColor == surfacePickerColor &&
        other.primaryPickerColor == primaryPickerColor &&
        other.ownAccountCardColor == ownAccountCardColor &&
        other.ownAccountIconCardColor == ownAccountIconCardColor &&
        other.profileIconColor == profileIconColor &&
        other.buttonColor == buttonColor &&
        other.greyTextColor2 == greyTextColor2 &&
        other.buttonColor2 == buttonColor2 &&
        other.buttonColor3 == buttonColor3 &&
        other.expansionTextColor == expansionTextColor &&
        other.personActionColor == personActionColor &&
        other.shimmerColor1 == shimmerColor1 &&
        other.shimmerColor2 == shimmerColor2 &&
        other.mainTextColor == mainTextColor &&
        other.chartWhiteColor == chartWhiteColor &&
        other.chartPrimaryColor == chartPrimaryColor;
  }

  @override
  int get hashCode {
    return myBrightness.hashCode ^
        iconSuccess.hashCode ^
        firstSplashGragient.hashCode ^
        secondSplashGradient.hashCode ^
        mainColor.hashCode ^
        scaffoldColor.hashCode ^
        otherColor.hashCode ^
        friendCardColor.hashCode ^
        textAccentColor.hashCode ^
        redColor.hashCode ^
        whiteColor.hashCode ^
        orangeColor.hashCode ^
        textColor2.hashCode ^
        greyTextColor.hashCode ^
        textColor3.hashCode ^
        purpleColor.hashCode ^
        backgroundColor.hashCode ^
        messageIconColor.hashCode ^
        fillColor.hashCode ^
        otherIconColor.hashCode ^
        borrowerTableColor.hashCode ^
        warningBlueCard.hashCode ^
        warningGreenCard.hashCode ^
        warningRedCard.hashCode ^
        documentCardColor.hashCode ^
        myDropdownColor.hashCode ^
        policePrivacyTextColor.hashCode ^
        investIconColor.hashCode ^
        fingerprintDialogColor.hashCode ^
        myMessage.hashCode ^
        messageMe.hashCode ^
        tabBarSelectColor.hashCode ^
        enableBorderColor.hashCode ^
        labelColor.hashCode ^
        moreAndSettingsIconColor.hashCode ^
        greenColor.hashCode ^
        deleteColor.hashCode ^
        greyColor.hashCode ^
        avatarBackgroundColor.hashCode ^
        avatarBorderColor.hashCode ^
        scaffoldMessageColor.hashCode ^
        backGroundPickerColor.hashCode ^
        surfacePickerColor.hashCode ^
        primaryPickerColor.hashCode ^
        ownAccountCardColor.hashCode ^
        ownAccountIconCardColor.hashCode ^
        profileIconColor.hashCode ^
        buttonColor.hashCode ^
        greyTextColor2.hashCode ^
        buttonColor2.hashCode ^
        buttonColor3.hashCode ^
        expansionTextColor.hashCode ^
        personActionColor.hashCode ^
        shimmerColor1.hashCode ^
        shimmerColor2.hashCode ^
        mainTextColor.hashCode ^
        chartWhiteColor.hashCode ^
        chartPrimaryColor.hashCode;
  }
}
