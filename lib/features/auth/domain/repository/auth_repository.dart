import '/core/api/core_models/base_result_model.dart';
import '/core/api/data_source/remote_data_source.dart';
import '/core/api/http/api_urls.dart';
import '/core/api/http/http_method.dart';
import '/features/auth/data/login_request_model.dart';
import '/features/auth/data/login_respond_model.dart';

class AuthRepository {
  static Future<BaseResultModel> logIn(LoginRequestModel data) async {
    var res = await RemoteDataSource.request<LoginRespondModel>(
      converter: (json) => LoginRespondModel.fromJson(json),
      method: HttpMethod.post,
      url: ApiURLs.login,
      withAuthentication: false,
      data: data.toJson(),
    );
    return res;
  }
}
