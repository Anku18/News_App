class Constants {
  static String TOP_HEADLINE_URL =
      "https://newsapi.org/v2/top-headlines?country=in&apiKey=4b2ea06f7e7b48beb7f5f1b248f24142";

  static String headlinesFor(String keyword) {
    return "https://newsapi.org/v2/everything?q=$keyword&apiKey=4b2ea06f7e7b48beb7f5f1b248f24142";
  }
}
