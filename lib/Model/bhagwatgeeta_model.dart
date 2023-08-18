class Posts {
  String shloka;
  String translation;


  Posts(
      {required this.translation, required this.shloka, });

  factory Posts.fromMap({required Map Data}) {
    return Posts(
      translation: Data['translation'],
      shloka: Data['shloka'],

    );
  }
}
