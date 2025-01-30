import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../models/artical_model.dart';

class DetailsArticleScreenController extends GetxController {
  final List<Article> articles;
  RxInt currentIndex;

  DetailsArticleScreenController({required this.articles, required this.currentIndex});

  void nextArticle() {
    if (currentIndex.value < articles.length - 1) {
      currentIndex.value++;
    }
  }

  void previousArticle() {
    if (currentIndex.value > 0) {
      currentIndex.value--;
    }
  }

  Future<void> openArticleUrl(BuildContext context, Article article) async {
    final url = article.url;
    if (url != null && await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text('Could not launch $url'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
