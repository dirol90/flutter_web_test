
import 'package:flutter_web/object/Payments.dart';

import 'UserCredentials.dart';

class User {
  final String id;
  final int creationDateTime;
  final String fbId;
  final String telegramId;

  final bool isGamblingAppPromotion;
  final bool isBettingAppPromotion;
  final bool isDatingAppPromotion;
  final bool isNutraAppPromotion;
  final bool isCryptoAppPromotion;

  final int balance;
  final int lastVisit;
  final List<String> urisList;
  final List<Payment> paymentsList;

  final UserCredentials uc;


  User(this.id, this.creationDateTime, this.fbId, this.telegramId,
      this.isGamblingAppPromotion, this.isBettingAppPromotion,
      this.isDatingAppPromotion, this.isNutraAppPromotion,
      this.isCryptoAppPromotion, this.balance, this.lastVisit, this.urisList,
      this.paymentsList, this.uc);

  Map<String, dynamic> toJson() =>
      {
        '\"id\"': id,
        '\"creationDateTime\"': creationDateTime.toString(),
        '\"fbId\"': fbId,

        '\"telegramId\"': telegramId,
        '\"isGamblingAppPromotion\"': isGamblingAppPromotion.toString(),
        '\"isBettingAppPromotion\"': isBettingAppPromotion.toString(),

        '\"isDatingAppPromotion\"': isDatingAppPromotion.toString(),
        '\"isNutraAppPromotion\"': isNutraAppPromotion.toString(),
        '\"isCryptoAppPromotion\"': isCryptoAppPromotion.toString(),

        '\"balance\"': balance.toString(),
        '\"lastVisit\"': lastVisit.toString(),
        '\"urisList\"': urisList.toString(),

        '\"paymentsList\"': paymentsList.toString(),
        '\"uc\"': uc.toJson().toString(),
      };

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        creationDateTime = json['creationDateTime'],
        fbId = json['fbId'],

        telegramId = json['telegramId'],
        isGamblingAppPromotion = json['isGamblingAppPromotion'],
        isBettingAppPromotion = json['isBettingAppPromotion'],

        isDatingAppPromotion = json['isDatingAppPromotion'],
        isNutraAppPromotion = json['isNutraAppPromotion'],
        isCryptoAppPromotion = json['isCryptoAppPromotion'],

        balance = json['balance'],
        lastVisit = json['lastVisit'],
        urisList = json['urisList'],

        paymentsList = json['paymentsList'],
        uc = json['uc'];


}