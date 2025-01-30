import 'package:get/get.dart';
import 'package:news_application_test/models/artical_model.dart';
import 'package:news_application_test/services/storage.dart/local_storage_services.dart';

class SaveArticleScreenController extends GetxController {
  RxList<Article> savedArticles = <Article>[].obs;

  @override
  void onInit() {
    loadSavedArticles();
    super.onInit();
  }

  void loadSavedArticles() {
    savedArticles.assignAll(LocalStorageService.getSavedArticles());
  }

  void removeArticle(Article article) {
    LocalStorageService.removeArticle(article);
    loadSavedArticles();
  }
}
