class AppRoutes {
  static const base = '/';
  static const welcome = '/welcome';

  static const requestOtp = '/request-otp';
  static const verifyOtp = '/verify-otp';
  static const register = '/register';
  static const home = '/home';
  static const shop = '/shop';
  static const shopDetails = '/shop-details';
  static const partnerShop = '/partner-shops';
  static const profile = '/profile';
  static const setting = '/setting';
  static const transactionHistory = '/transactions-history';
  static const editProfile = '/edit-profile';
  static const promotionList = '/promotions-list';
  static const promotionDetails = '/promotions-details';
}

class LocalStorages {
  static const showWelcome = 'showWelcome';
  static const accessToken = 'accessToken';
  static const refreshToken = 'refreshToken';
  static const registerToken = 'registerToken';
  static const biometricToken = 'biometricToken';
  static const isAuthenticated = 'isAuthenticated';
  static const accessTokenExpiry = 'accessTokenExpiry';
  static const refreshTokenExpiry = 'refreshTokenExpiry';
  static const biometricTokenExpiry = 'biometricTokenExpiry';
}

class TableNames {
  static const bannerSlides = 'bannerSlides';
  static const pointTransactions = 'pointTransactions';
}