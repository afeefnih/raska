import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({Key? key}) : super(key: key);

  @override
  _ArticleScreenState createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  final PageController _carouselController = PageController();
  
  // Sample articles data
  final List<Map<String, String>> articles = [
    {
      "title": "Sustainable Tip #1: Reducing Food Waste",
      "content": "Learn how reducing food waste can contribute to zero hunger...",
      "link": "https://example.com/article1"
    },
    {
      "title": "Sustainable Tip #2: Supporting Local Farmers",
      "content": "Buying from local farmers helps sustain communities...",
      "link": "https://example.com/article2"
    },
    // Add more articles as needed
  ];

  // Method to open links in the browser
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            
            SizedBox(
              height: 200,
              child: PageView(
                controller: _carouselController,
                children: articles.map((article) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            article["title"]!,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            article["content"]!,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 10),
            // SmoothPageIndicator for Carousel
            SmoothPageIndicator(
              controller: _carouselController,
              count: articles.length,
              effect: ExpandingDotsEffect(
                dotColor: Colors.grey,
                activeDotColor: Theme.of(context).primaryColor,
                dotHeight: 8,
                dotWidth: 8,
              ),
            ),
            const SizedBox(height: 20),
            
            // News and Educational Content Section
            Expanded(
              child: ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  final article = articles[index];
                  return ListTile(
                    title: Text(
                      article["title"]!,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(article["content"]!),
                    trailing: const Icon(Icons.open_in_new),
                    onTap: () => _launchURL(article["link"]!),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
