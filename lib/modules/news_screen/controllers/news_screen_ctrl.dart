import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_application_test/services/const.dart';

import '../../../models/artical_model.dart';
import '../../../services/storage.dart/local_storage_services.dart';

class NewsScreenController extends GetxController {
  Dio dio = Dio();
  RxBool isLoading = true.obs;
  RxList<Article> articles = RxList<Article>([]);
  RxList<Article> savedArticles = <Article>[].obs;
  RxInt currentIndex = 0.obs;
  RxInt currentPage = 1.obs;
  final RxString currentTopic = 'LATEST'.obs;
  RxString error = ''.obs;
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    getNewsView(currentTopic.value);
    loadSavedArticles();
    addScrollListener();
    super.onInit();
  }

  final Dio _dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    validateStatus: (status) => status! < 500,
  ));

  Future<void> getNewsView(String topic, {int page = 1}) async {
    final response = await _dio.get(
      '/top-headlines',
      queryParameters: {
        'country': 'us',
        'category': topic == 'LATEST' ? '' : topic.toLowerCase(),
        'apiKey': apiKey,
        'pageSize': 20,
        'page': page,
      },
    );

    try {
      debugPrint('response: ${response.data}');
      if (response.statusCode == 200) {
        final List<Article> newArticles = (response.data['articles'] as List)
            .map((article) => Article.fromJson(article))
            .toList();
        if (page == 1) {
          isLoading.value = true;
          articles.value = newArticles;
        } else {
          articles.addAll(newArticles);
        }
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint('error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchNewsCategory(String? topic) async {
    isLoading.value = true;
    try {
      if (topic != null) currentTopic(topic);
      await getNewsView(currentTopic.value);
    } catch (e) {
      error(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void addScrollListener() {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          loadMoreNews();
        }
      }
    });
  }

  void loadMoreNews() {
    if (!isLoading.value) {
      currentPage.value++;
      getNewsView(currentTopic.value, page: currentPage.value);
    }
  }

  void saveArticle(Article article) {
    LocalStorageService.saveArticle(article);
    loadSavedArticles();
  }

  void removeArticle(Article article) {
    LocalStorageService.removeArticle(article);
    loadSavedArticles();
  }

  bool isArticleSaved(Article article) {
    return savedArticles.any((a) => a.title == article.title);
  }

  void loadSavedArticles() {
    savedArticles.assignAll(LocalStorageService.getSavedArticles());
  }
}
