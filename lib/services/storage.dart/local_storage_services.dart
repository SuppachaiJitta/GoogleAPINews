import 'package:hive/hive.dart';
import '../../models/artical_model.dart';

class LocalStorageService {
  static final Box<Article> _savedArticlesBox =
      Hive.box<Article>('savedArticles');

  static List<Article> getSavedArticles() => _savedArticlesBox.values.toList();

  static void saveArticle(Article article) {
    if (!_savedArticlesBox.values.any((a) => a.title == article.title)) {
      _savedArticlesBox.add(article);
    }
  }

  static void removeArticle(Article article) {
    final key = _savedArticlesBox.keys.firstWhere(
      (k) => _savedArticlesBox.get(k)?.title == article.title,
      orElse: () => null,
    );
    if (key != null) {
      _savedArticlesBox.delete(key);
    }
  }
}
