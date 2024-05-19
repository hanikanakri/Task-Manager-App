import '/core/api/core_models/base_result_model.dart';
import '/core/api/data_source/remote_data_source.dart';
import '/core/api/http/api_urls.dart';
import '/core/api/http/http_method.dart';
import '/features/home_page/data/delete_note_respond_model.dart';
import '/features/home_page/data/get_all_notes_respond_model.dart';
import '/features/home_page/data/get_pagination_notes_respond_moedl.dart';
import '/features/home_page/data/update_note_request_model.dart';
import '/features/home_page/data/update_note_respond_model.dart';

class HomePAgeRepository {
  static Future<BaseResultModel> getNotes() async {
    var res = await RemoteDataSource.request<GetAllNotesRespondModel>(
      converter: (json) => GetAllNotesRespondModel.fromJson(json),
      method: HttpMethod.get,
      url: ApiURLs.getNotes,
      withAuthentication: false,
    );
    return res;
  }

  static Future<BaseResultModel> deleteNote(int id) async {
    var res = await RemoteDataSource.request<DeleteNoteRespondModel>(
      converter: (json) => DeleteNoteRespondModel.fromJson(json),
      method: HttpMethod.delete,
      url: "${ApiURLs.deleteNotes}$id",
      withAuthentication: false,
    );
    return res;
  }

  static Future<BaseResultModel> updateNote(
      UpdateNoteRequestModel data, int id) async {
    var res = await RemoteDataSource.request<UpdateNoteRespondModel>(
      converter: (json) => UpdateNoteRespondModel.fromJson(json),
      method: HttpMethod.put,
      data: data.toJson(),
      url: "${ApiURLs.deleteNotes}$id",
      withAuthentication: false,
    );
    return res;
  }

  static Future<BaseResultModel> getPaginationNotes(data) async {
    return await RemoteDataSource.request<GetPaginationNotesRespondModel>(
      converter: (json) => GetPaginationNotesRespondModel.fromJson(json),
      method: HttpMethod.get,
      queryParameters: data.toJson(),
      withAuthentication: true,
      url: ApiURLs.getNotesPagination,
    );
  }
}
