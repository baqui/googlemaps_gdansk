import 'package:flutter/material.dart';

var pageList = [
  PageModel(
      imageUrl: "assets/illustration.png",
      title: "onboarding_title_1",
      body: "onboarding_description_1"),
  PageModel(
      imageUrl: "assets/illustration2.png",
      title: "onboarding_title_2",
      body: "onboarding_description_2"),
  PageModel(
      imageUrl: "assets/illustration3.png",
      title: "onboarding_title_2",
      body: "onboarding_description_2"),
];


class PageModel {
  var imageUrl;
  var title;
  var body;
  List<Color> titleGradient = [];
  PageModel({this.imageUrl, this.title, this.body, this.titleGradient});
}