enum StatusCodes {
  success(1000),
  fail(2000),
  error(3000),
  // ignore: constant_identifier_names
  register_required(2100),
  invalidAccessToken(2010),
  unauthorized(2013);
  
  const StatusCodes(this.value);
  final int value;
}