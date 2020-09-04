class TodoItem {
  String content;
  bool isDone;

  TodoItem({
    String content,
    bool isDone,
  }) {
    this.content = content;
    this.isDone = isDone;
  }

  TodoItem.fromJson(Map<String, dynamic> json) {
    this.content = json["title"];
    this.isDone = json["status"];
  }
}
