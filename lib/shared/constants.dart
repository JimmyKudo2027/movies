import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// https://genflix.online/movie/tt3480822

String noImageFound =
    'https://www.escapeauthority.com/wp-content/uploads/2116/11/No-image-found.jpg';

String imageWith400w({required String path}){
  return 'https://image.tmdb.org/t/p/w400$path';
}
String imageWith200w({required String path}){
  return 'https://image.tmdb.org/t/p/w200$path';
}

void navigateTo({required BuildContext context, required Widget route}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => route));
}

void launchURL({required String movieTrailer}) async {
  if (Platform.isIOS) {
    if (await canLaunch(movieTrailer)) {
      await launch(movieTrailer, forceSafariVC: false);
    } else {
      if (await canLaunch(movieTrailer)) {
        await launch(movieTrailer);
      } else {
        throw 'Could not launch $movieTrailer';
      }
    }
  } else {
    String url = movieTrailer;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
