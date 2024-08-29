class ApiLinks {
  static const String api = '192.168.1.6';
  static const String _baseUrl = 'http://$api/public';
  static const String returnSatListEndPoint = '$_baseUrl?command=returnSATList';
  static const String stbVersionEndPoint = '$_baseUrl?command=version';

  static String stbVersionEndPointUrl(String aPI) =>
      'http://$aPI/public?command=version';

  static String returnTPListEndPoint(int satId) =>
      '$_baseUrl?command=returnTPList&sat_id=$satId';
}
