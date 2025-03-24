class ApiResponse<T> {
  int? code;
  String? message;
  T? data;

  ApiResponse({this.code = -1, this.message, this.data});
  static ApiResponse<T> fromResponse<T>(
      dynamic json, T Function(Map<String, dynamic>) mapper) {
    final data = ApiResponse<T>(
        code: json['code'],
        message: json['message'],
        data: json['data'] != null ? mapper(json['data']) : null);
    return data;
  }
}
