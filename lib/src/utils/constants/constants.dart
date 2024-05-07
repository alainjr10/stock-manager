import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xff08080B);
const kSecondaryColor = Color(0xffFBFAFB);
const kTertiaryColor = Color(0xff3094BA);
const kGreyColor = Color(0xffE2E3E4);
const kErrorColor = Color(0xffFF0000);

const kBtnTextStyle = TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600);

const kBtnRadius = 12.0;
const kCardRadius = 12.0;

const kBackgroundColor = Color(0xff03192A);

final dioDefault = Dio(
  BaseOptions(
    connectTimeout: const Duration(seconds: 12),
    receiveTimeout: const Duration(seconds: 12),
    sendTimeout: const Duration(seconds: 12),
  ),
);
