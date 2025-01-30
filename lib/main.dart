import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_application_test/app.dart';
import 'models/artical_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(ArticleAdapter());
  Hive.registerAdapter(SourceAdapter());

  await Hive.openBox<Article>('savedArticles');

  runApp(const MyApp());
}
