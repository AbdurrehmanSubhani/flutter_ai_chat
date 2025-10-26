import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_ai_chat/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter_ai_chat/services/ai_chat_service.dart';
import 'package:flutter_ai_chat/services/user_manager_service.dart';
import 'package:flutter_ai_chat/services/chat_manager_service.dart';
import 'package:flutter_ai_chat/services/theme_manager_service.dart';
// @stacked-import

import 'test_helpers.mocks.dart';

@GenerateMocks(
  [],
  customMocks: [
    MockSpec<NavigationService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<BottomSheetService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<DialogService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<AiChatService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<UserManagerService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<ChatManagerService>(onMissingStub: OnMissingStub.returnDefault),
    MockSpec<ThemeManagerService>(onMissingStub: OnMissingStub.returnDefault),
// @stacked-mock-spec
  ],
)
void registerServices() {
  getAndRegisterNavigationService();
  getAndRegisterBottomSheetService();
  getAndRegisterDialogService();
  getAndRegisterAiChatService();
  getAndRegisterUserManagerService();
  getAndRegisterChatManagerService();
  getAndRegisterThemeManagerService();
// @stacked-mock-register
}

MockNavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

MockBottomSheetService getAndRegisterBottomSheetService<T>({
  SheetResponse<T>? showCustomSheetResponse,
}) {
  _removeRegistrationIfExists<BottomSheetService>();
  final service = MockBottomSheetService();

  when(
    service.showCustomSheet<T, T>(
      enableDrag: anyNamed('enableDrag'),
      enterBottomSheetDuration: anyNamed('enterBottomSheetDuration'),
      exitBottomSheetDuration: anyNamed('exitBottomSheetDuration'),
      ignoreSafeArea: anyNamed('ignoreSafeArea'),
      isScrollControlled: anyNamed('isScrollControlled'),
      barrierDismissible: anyNamed('barrierDismissible'),
      additionalButtonTitle: anyNamed('additionalButtonTitle'),
      variant: anyNamed('variant'),
      title: anyNamed('title'),
      hasImage: anyNamed('hasImage'),
      imageUrl: anyNamed('imageUrl'),
      showIconInMainButton: anyNamed('showIconInMainButton'),
      mainButtonTitle: anyNamed('mainButtonTitle'),
      showIconInSecondaryButton: anyNamed('showIconInSecondaryButton'),
      secondaryButtonTitle: anyNamed('secondaryButtonTitle'),
      showIconInAdditionalButton: anyNamed('showIconInAdditionalButton'),
      takesInput: anyNamed('takesInput'),
      barrierColor: anyNamed('barrierColor'),
      barrierLabel: anyNamed('barrierLabel'),
      customData: anyNamed('customData'),
      data: anyNamed('data'),
      description: anyNamed('description'),
    ),
  ).thenAnswer(
    (realInvocation) =>
        Future.value(showCustomSheetResponse ?? SheetResponse<T>()),
  );

  locator.registerSingleton<BottomSheetService>(service);
  return service;
}

MockDialogService getAndRegisterDialogService() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();
  locator.registerSingleton<DialogService>(service);
  return service;
}

MockAiChatService getAndRegisterAiChatService() {
  _removeRegistrationIfExists<AiChatService>();
  final service = MockAiChatService();
  locator.registerSingleton<AiChatService>(service);
  return service;
}

MockUserManagerService getAndRegisterUserManagerService() {
  _removeRegistrationIfExists<UserManagerService>();
  final service = MockUserManagerService();
  locator.registerSingleton<UserManagerService>(service);
  return service;
}

MockChatManagerService getAndRegisterChatManagerService() {
  _removeRegistrationIfExists<ChatManagerService>();
  final service = MockChatManagerService();
  locator.registerSingleton<ChatManagerService>(service);
  return service;
}

MockThemeManagerService getAndRegisterThemeManagerService() {
  _removeRegistrationIfExists<ThemeManagerService>();
  final service = MockThemeManagerService();
  locator.registerSingleton<ThemeManagerService>(service);
  return service;
}
// @stacked-mock-create

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
