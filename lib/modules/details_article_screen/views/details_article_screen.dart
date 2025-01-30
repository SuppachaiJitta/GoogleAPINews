import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/artical_model.dart';
import '../../../services/components/sizer.dart';
import '../controllers/details_article_screen_ctrl.dart';

class DetailsArticleScreen extends StatelessWidget {
  final List<Article> articles;
  final RxInt indexSelected;

  const DetailsArticleScreen({
    super.key,
    required this.articles,
    required this.indexSelected,
  });

  @override
  Widget build(BuildContext context) {
    final DetailsArticleScreenController controller = Get.put(
      DetailsArticleScreenController(
        articles: articles,
        currentIndex: indexSelected,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Screen'),
        backgroundColor: Colors.blue,
      ),
      body: Obx(() {
        final article = controller.articles[controller.currentIndex.value];
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  children: [
                    article.urlToImage == null
                        ? const SizedBox()
                        : CachedNetworkImage(
                            imageUrl: article.urlToImage!,
                            width: Sizer(context).getScreenWidth(90),
                            height: Sizer(context).getScreenHeight(30),
                            fit: BoxFit.contain,
                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) => Image.asset(
                              'assets/image/no_image.png',
                              width: 100,
                              height: 100,
                              fit: BoxFit.contain,
                            ),
                          ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        article.title ?? 'No Title',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        article.description ?? 'No Description',
                        style: const TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 12,
                      ),
                      child: Text(
                        article.content ?? 'No Content',
                        style: const TextStyle(fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 16.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: controller.previousArticle,
                    ),
                    GestureDetector(
                      onTap: () async {
                        controller.openArticleUrl(context, article);
                      },
                      child: Container(
                        width: Sizer(context).getScreenWidth(30),
                        height: Sizer(context).getScreenHeight(5),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        child: const Text(
                          'Read More',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward),
                      onPressed: controller.nextArticle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
