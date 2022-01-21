import 'package:flutter/material.dart';
import '../models/models.dart';
import '../screens/screens.dart';

// 1
class AppRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  // 2
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  // 3
  final AppStateManager appStateManager;

  // 4
  final GroceryManager groceryManager;

  // 5
  final ProfileManager profileManager;

  AppRouter({
    required this.appStateManager,
    required this.groceryManager,
    required this.profileManager,
  }) : navigatorKey = GlobalKey<NavigatorState>() {
    // todo: add listeners
    appStateManager.addListener(notifyListeners);

    groceryManager.addListener(notifyListeners);

    profileManager.addListener(notifyListeners);
  }

  // todo: dispose listeners
  @override
  void dispose() {
    appStateManager.removeListener(notifyListeners);

    groceryManager.removeListener(notifyListeners);

    profileManager.removeListener(notifyListeners);

    super.dispose();
  }

  // 6
  @override
  Widget build(BuildContext cont) {
    // 7
    return Navigator(
      // 8
      key: navigatorKey,

      // todo: add onpoppage
      onPopPage: _handlePopPage,

      // 9
      pages: [
        // TODO: Add SplashScreen
        if (!appStateManager.isInitialized) SplashScreen.page(),

        // TODO: Add LoginScreen
        if (appStateManager.isInitialized && ! 
        appStateManager.isLoggedIn) LoginScreen.page(),

        // TODO: Add OnboardingScreen
        if (appStateManager.isLoggedIn && 
            !appStateManager.isOnboardingComplete)
            OnboardingScreen.page(),
            
        // TODO: Add Home
        // TODO: Create new item
        // TODO: Select GroceryItemScreen
        // TODO: Add Profile Screen
        // TODO: Add WebView Screen
      ],
    );
  }

  // todo: Add _handlePopPage
  bool _handlePopPage(
      // 1
      Route<dynamic> route,

      // 2
      result) {
    // 3
    if (!route.didPop(result)) {
      // 4
      return false;
    }

    // 5
    // TODO: Handle Onboarding and splash
    // TODO: Handle when user closes grocery item screen
    // TODO: Handle when user closes profile screen
    // TODO: Handle when user closes Webview screen

    // 6
    return true;
  }

  // 10
  @override
  Future<void> setNewRoutePath(configuration) async => null;
}
