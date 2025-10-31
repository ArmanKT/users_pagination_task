class Environment {
  static const appName = "USER LIST APP";
  static const appVersion = "1.0.0";

  //Api Keys
  static const int LIMIT_PER_PAGE = 10; // Pagination limit 

  //DEV MODE ==> false if production
  static const bool DEV_MODE = true;

  // API END POINT URL
  static const MAIN_API_URL = DEV_MODE ? TEST_API_URL : LIVE_API_URL; // Don't touch here

  static const LIVE_API_URL = 'https://dummyjson.com'; //Live end Point URL

  static const TEST_API_URL = 'https://dummyjson.com'; //Local or demo or test URL

  // API END POINT URL END
}
