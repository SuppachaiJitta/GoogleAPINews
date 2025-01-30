import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_application_test/models/artical_model.dart';
import 'package:news_application_test/services/components/custom_image.dart';

import 'sizer.dart';

class ArticleCard extends StatelessWidget {
  final Article article;
  final Function() onTap;
  final bool isSaved;

  const ArticleCard({
    super.key,
    required this.article,
    required this.onTap,
    required this.isSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomNetWorkImage(
          imageUrl: article.urlToImage,
          width: Sizer(context).getScreenWidth(30),
          height: Sizer(context).getScreenHeight(15),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Sizer(context).getScreenHeight(5),
                  child: Text(
                    article.title ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 2,
                  ),
                ),
                article.description == null
                    ? const SizedBox()
                    : SizedBox(
                        height: Sizer(context).getScreenHeight(5),
                        child: Text(
                          article.description!,
                          style: const TextStyle(
                            fontSize: 12,
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 2,
                        ),
                      ),
                article.publishedAt == null
                    ? const SizedBox()
                    : SizedBox(
                        height: Sizer(context).getScreenHeight(2),
                        child: Text(
                          "Post At ${DateFormat('dd/MM/yy HH:mm').format(article.publishedAt!)}",
                          style: const TextStyle(
                            fontSize: 12,
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 2,
                        ),
                      ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Icon(
            isSaved ? Icons.bookmark : Icons.bookmark_border,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}
