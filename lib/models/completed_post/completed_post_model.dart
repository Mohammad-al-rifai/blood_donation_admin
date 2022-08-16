class CompletedPost {
  CompletedPost({
    required this.status,
    required this.message,
    required this.PercentOfComplete,
  });
  late final String status;
  late final String message;
  late final int PercentOfComplete;

  CompletedPost.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    PercentOfComplete = json['Percent_Of_Complete'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['Percent_Of_Complete'] = PercentOfComplete;
    return _data;
  }
}