class MovieConfig {
  final String BASE_API_URL;
  final String BASE_IMAGE_API_URL;
  final String API_KEY;
  final String ACCESS_TOKEN;
  MovieConfig(
      {required this.BASE_API_URL,
      required this.BASE_IMAGE_API_URL,
      required this.API_KEY,
      required this.ACCESS_TOKEN});
}
