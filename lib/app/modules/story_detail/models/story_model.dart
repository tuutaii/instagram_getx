enum MediaType { image, video }

class Story {
  final Duration duration;
  final MediaType mediaType;
  final String url;
  const Story({
    required this.mediaType,
    required this.duration,
    required this.url,
  });
}

final List<Story> stories = [
  const Story(
      mediaType: MediaType.image,
      duration: Duration(seconds: 5),
      url:
          "https://images.unsplash.com/photo-1534103362078-d07e750bd0c4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"),
  const Story(
      mediaType: MediaType.image,
      duration: Duration(seconds: 2),
      url: "https://media.giphy.com/media/moyzrwjUIkdNe/giphy.gif"),
  const Story(
      mediaType: MediaType.image,
      duration: Duration(seconds: 3),
      url:
          "https://images.unsplash.com/photo-1534103362078-d07e750bd0c4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"),
  const Story(
      mediaType: MediaType.image,
      duration: Duration(seconds: 3),
      url:
          "https://images.unsplash.com/photo-1534103362078-d07e750bd0c4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"),
];
