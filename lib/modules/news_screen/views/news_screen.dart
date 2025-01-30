import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/components/article_card.dart';
import '../../../services/components/custom_button_group.dart';
import '../../../services/enum/topic_enum.dart';
import '../../details_article_screen/views/details_article_screen.dart';
import '../../save_article_screen/views/save_article_screen.dart';
import '../controllers/news_screen_ctrl.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NewsScreenController controller = Get.put(NewsScreenController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('News App With Google Api'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark_border),
            onPressed: () {
              Get.to(const SavedArticlesScreen());
            },
          ),
        ],
      ),
      body: Obx(
        () => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: CustomButtonGroup(
                  options: Category.values.map((e) => e.label).toList(),
                  selectedIndex: controller.currentIndex.value,
                  onChanged: (index) {
                    controller.currentIndex.value = index;
                    controller.fetchNewsCategory(Category.values[index].query);
                  },
                ),
              ),
            ),
            controller.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : controller.articles.isEmpty
                    ? const Center(
                        child: Text('No articles available'),
                      )
                    : Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: ListView.builder(
                            controller: controller.scrollController,
                            itemCount: controller.articles.length,
                            itemBuilder: (context, index) {
                              final article = controller.articles[index];
                              return GestureDetector(
                                onTap: () {
                                  Get.to(
                                    DetailsArticleScreen(
                                      articles: controller.articles,
                                      indexSelected: index.obs,
                                    ),
                                  );
                                },
                                child: Obx(
                                  () => ArticleCard(
                                    article: article,
                                    isSaved: controller.isArticleSaved(article),
                                    onTap: () {
                                      if (controller.isArticleSaved(article)) {
                                        controller.removeArticle(article);
                                      } else {
                                        controller.saveArticle(article);
                                      }
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}
