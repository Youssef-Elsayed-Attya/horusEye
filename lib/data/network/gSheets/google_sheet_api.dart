import 'package:gsheets/gsheets.dart';
import 'package:horus_eye/data/network/gSheets/feedback_model.dart';

class GoogleSheetsApi {
  //form google cloud console
  static const _credentials = r'''
  {
  "type": "service_account",
  "project_id": "horuseye-406820",
  "private_key_id": "29d544140f349776f4aea0482837ff6e6d19f3dc",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCsAl0Vm5GGkr63\nuGh3X7RLxo5v96kiGiQh859MbwgjvTJ+UN4dADGCxxVDYNlqyunfz4RXy1AL2XrG\n0dgkndU0jc17PRYt84ITEX0TDHvIrob3GjOqd9DYu37frAnL0/3kPPIh9bN4UD+9\nI+QyGh+6Z1L0zGHA212l2DdCYeuy3npdaiJqAl+0ovQh3dMEUl+WVE3YQkIbe8qx\nKwH+299El6B3cT7MWqy1cfMdhmW4HN7p5KyjlyBfXHgXVBfrx0YWtFUC8dNK2ht5\nQRLbdGTA2qPwkhS6N+YtG7+kBGVjwUnf/rdsRYlhKCgVXFIeTGv1TpGacnUWd05c\ngmsTTt0VAgMBAAECggEAE55KZRxC9xUWHQiym4jmHK1nEgSufPX70IaDkPlp9X+O\n+oK5LpgWzYps1aw+Z/SAQ7dcqhHFjbBulS4aZ6S7zDxvJwLy3GdVWtzoBcvq81ra\niGTr5yG2x31tDVBHJsEFSGqeGDr4jvyiJG2rSX6ax00hFEwaSx+J+RAlz1OxSQtw\nU5CLU3aVP3KA+v8ZJiFpY9xjDV3082j9+eVeo3rO5gAFU3U9jWDe5MS2LKthxtsy\nIJ6V18burKurlXRSswoy8PlV7rXb3bLPUSvpNJrAmYYuZApdlkr5WB6TwlEGw+Le\nqVoZapAzs7xvIJ7xhgmHCF6v8LWLxNaOsAO2LAqisQKBgQDnUTLjjGJRgJTlsGjD\nEqUAQM6JvX4BOR5GlScojorYAFPc6CCb5RbwY1RQdLVv+iShbShP7dDo7s+1mGy2\nMPZl2AOBb2IPAJU5DpS7DbxDXT+M0HOhFwDyDxLfG3Mgv6C6mOoJ2YwYwj/pAEvi\nPXoweyBUY2iUL/ViMDj5DIdLEQKBgQC+XRKcoTJVLr8OTDEq/h2wqk3Ze/AxL5BN\nV1SUrmKrrNzg3msiyKG/VHMa1VrLoA3v8AJpFBpMcpn89mImOAhMqV2hlJQ9/Z1W\n7mK60Nzuobb0WwJfPLB0WX41YSnGRnPZyVqJOtI6EsY1O+Hyt5wbyJ6divcgzcTR\nXMchq6aJxQKBgQCg0jdLNML2XysmNevgFApbjrMJ2JDOUOPXtsMu00t8uV2U7F4f\nhLraDnUEKuAqJgNpp/aq+3CPQdlvK7YJRSlJzVFCoCnQvFsC/DwzgG0veJlCUXrS\nuKeTox8/tlnontIkaUPt7S4V2JeOawJXHN7i7fegNCz1OhKkXVp+7FLzwQKBgQCo\nEHvSFO7fDbpX4SS3lEqaIoFAtY9FnXyFC8j8y0kJ0D/ht/xWZVOIHALTefIDPHeR\nkhBOvRTK0ZLqJoxYubd6Fz023npSkIpMqYI49RVZCSUBbygU9PvEfQ5UCkhbaO/3\nIzHvXiMkalbbwNam9zu3u9Ntu7abG4/cV1DnhSgvEQKBgCprCZQYWs45Cu9GU0WZ\ndgB9U64Vz4kxn36TbX2u5y561b0XYtO742lLorfSm4XOf/TJjhqC7bLb6LtAf3ax\n1qsx5OdrppByBRSYNdeIvI+6gZP+8XPRTzhcfwd33IN3gnNwA9WW6RrKyJBx1MV3\nfz2K8n5hlE/sPH2hXGW94gdZ\n-----END PRIVATE KEY-----\n",
  "client_email": "gsheets@horuseye-406820.iam.gserviceaccount.com",
  "client_id": "104878464988712205634",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/gsheets%40horuseye-406820.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}
  ''';

  // form google sheet
  static final _spreadsheetId = '1Y19F4AHcuJfe90v2hczUEpy4NfIM3FlS02QKwUZLsNg';
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _worksheet;

  static Future init() async {
    try {
      final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
      _worksheet = await _getWorkSheet(spreadsheet, title: 'horus_feedback');
      final firstRow = FeedbackFields.getFileds();
      _worksheet!.values.insertRow(1, firstRow);
    }catch(e)
    {
      print('init Error $e');
    }
  }

  static Future<Worksheet> _getWorkSheet(Spreadsheet spreadsheet,
      {required String title}) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }
  static Future insert(Map<String,dynamic> rowList)async{

    if (_worksheet==null) return;
   _worksheet!.values.map.appendRow(rowList);
  }
}
