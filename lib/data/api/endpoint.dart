final class Endpoint {
  final String path;
  final String method;
  final Map<String, dynamic>? queryParameters;

  const Endpoint({required this.path, required this.method, this.queryParameters});
}
