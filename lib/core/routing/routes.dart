import 'package:flutter/material.dart';
import 'package:mpoints_app/core/constants/global.dart';
import 'package:mpoints_app/features/auth/screen/otp_verify_screen.dart';
import 'package:mpoints_app/features/auth/screen/register_screen.dart';
import 'package:mpoints_app/features/auth/screen/welcome_screen.dart';
import 'package:mpoints_app/features/navigation_screen.dart';
import 'package:mpoints_app/features/profile/screen/transaction_history_screen.dart';
import 'package:mpoints_app/features/shops/screen/partner_shop_screen.dart';
import 'package:mpoints_app/features/shops/screen/promotion_detail_screen.dart';
import 'package:mpoints_app/features/shops/screen/promotion_screen.dart';
import 'package:mpoints_app/features/shops/screen/shop_detail_screen.dart';

import '../../features/auth/screen/otp_request_screen.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.welcome:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case AppRoutes.requestOtp:
        return MaterialPageRoute(builder: (_) => const OtpRequestScreen());
      case AppRoutes.verifyOtp:
        final args = (settings.arguments ?? <String, dynamic>{}) as Map;
        return MaterialPageRoute(
            builder: (_) =>
                OtpVerifyScreen(phoneNumber: args['phoneNumber'] ?? ''));
      case AppRoutes.register:
        final args = (settings.arguments ?? <String, dynamic>{}) as Map;
        return MaterialPageRoute(
            builder: (_) => RegisterScreen(
                  phoneNumber: args['phoneNumber'],
                ));
      case AppRoutes.home:
        return MaterialPageRoute(
            builder: (_) => const NavigationScreen(
                  page: 0,
                ));
      case AppRoutes.shop:
        return MaterialPageRoute(
            builder: (_) => const NavigationScreen(
                  page: 1,
                ));
      case AppRoutes.shopDetails:
        final args = (settings.arguments ?? <String, dynamic>{}) as Map;
        return MaterialPageRoute(
            builder: (_) => ShopDetailScreen(
                  id: args['id'],
                  name: args['name'],
                  data: args['data'],
                ));
      case AppRoutes.promotionList:
        return MaterialPageRoute(builder: (_) => const PromotionScreen());
      case AppRoutes.promotionDetails:
        final args = (settings.arguments ?? <String, dynamic>{}) as Map;
        return MaterialPageRoute(
            builder: (_) => PromotionDetailScreen(
                  id: args['id'],
                  title: args['title'],
                  data: args['data'],
                ));
      case AppRoutes.partnerShop:
        return MaterialPageRoute(builder: (_) => const PartnerShopScreen());
      case AppRoutes.profile:
        return MaterialPageRoute(
            builder: (_) => const NavigationScreen(
                  page: 2,
                ));
      case AppRoutes.transactionHistory:
        return MaterialPageRoute(
            builder: (_) => const TransactionHistoryScreen());
      case AppRoutes.setting:
        return MaterialPageRoute(
            builder: (_) => const NavigationScreen(
                  page: 3,
                ));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
