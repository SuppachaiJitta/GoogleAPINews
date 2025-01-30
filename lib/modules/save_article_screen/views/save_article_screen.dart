import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_application_test/services/components/article_card.dart';
import '../../details_article_screen/views/details_article_screen.dart';
import '../controllers/save_article_screen_ctrl.dart';

class SavedArticlesScreen extends StatelessWidget {
  const SavedArticlesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SaveArticleScreenController controller = Get.put(SaveArticleScreenController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Articles'),
        backgroundColor: Colors.blue,
      ),
      body: Obx(() {
        return controller.savedArticles.isEmpty
            ? const Center(child: Text('No saved articles'))
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ListView.builder(
                  itemCount: controller.savedArticles.length,
                  itemBuilder: (context, index) {
                    final article = controller.savedArticles[index];
                    return GestureDetector(
                      onTap: () {
                        Get.to(
                          () => DetailsArticleScreen(
                            articles: controller.savedArticles,
                            indexSelected: index.obs,
                          ),
                        );
                      },
                      child: ArticleCard(
                        article: article,
                        isSaved: true,
                        onTap: () {
                          controller.removeArticle(article);
                        },
                      ),
                    );
                  },
                ),
              );
      }),
    );
  }
}
