import 'package:belajargetx2/model/claim_model.dart';
import 'package:http/http.dart' as http;

class ClaimService {
  static Uri ADD_URL =
      Uri.parse("https://syclara.qmuaji.com/connectdb/add.php");

  Future<String> addClaim(ClaimModel claimModel) async {
    final response = await http.post(ADD_URL, body: claimModel.toJsonAdd());
    if (response.statusCode == 200) {
      print("Add Response : " + response.body);
      return response.body;
    } else {
      return "Error";
    }
  }
}
