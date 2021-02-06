class GlobalEndpoint {
  // static const BASE_URL = 'http://192.168.1.22:8001/';
  static const BASE_URL = 'https://scallingupnutrition.faftech.my.id/';
  static const BASE_API_URL = BASE_URL + 'api/';
  static const BASE_STORAGE_URL = BASE_URL + 'storage/images/informasiedukasi/';

  static const LOGIN_URL = BASE_API_URL + 'users/login';
  static const REGISTER_URL = BASE_API_URL + 'users/register';

  static const EDUCATION_URL = BASE_API_URL + 'education';
  static const EDUCATION_CATEGORY_URL = BASE_API_URL + 'education-category';
  static const USER_URL = BASE_API_URL + 'users/detail/';
  static const USERS_URL = BASE_API_URL + 'users';
  static const CHILDREN_URL = BASE_API_URL + 'children';
  static const IMMUNIZATION_URL = BASE_API_URL + 'immunization-schedule';
  static const PREGNANCY_URL = BASE_API_URL + 'cek-kehamilan';
}