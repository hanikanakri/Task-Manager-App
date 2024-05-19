class ApiURLs {
  static const String baseURL = 'https://dummyjson.com/';

  ///auth
 static const String login ="${baseURL}auth/login";


 //home page
  static const String baseHomePage="${baseURL}todos";
  static const String getNotes= baseHomePage;
  static const String deleteNotes= "$baseHomePage/";

  static const String getNotesPagination= baseHomePage;
}
