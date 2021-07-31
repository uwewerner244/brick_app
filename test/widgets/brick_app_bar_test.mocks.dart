// Mocks generated by Mockito 5.0.13 from annotations
// in brick_app/test/widgets/brick_app_bar_test.dart.
// Do not manually edit this file.

import 'dart:ui' as _i3;

import 'package:brick_app/service/preferences_service.dart' as _i2;
import 'package:flutter/material.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

/// A class which mocks [PreferencesService].
///
/// See the documentation for Mockito's code generation for more information.
class MockPreferencesService extends _i1.Mock
    implements _i2.PreferencesService {
  MockPreferencesService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get apiKey =>
      (super.noSuchMethod(Invocation.getter(#apiKey), returnValue: '')
          as String);
  @override
  set apiKey(String? apiKey) =>
      super.noSuchMethod(Invocation.setter(#apiKey, apiKey),
          returnValueForMissingStub: null);
  @override
  String get userToken =>
      (super.noSuchMethod(Invocation.getter(#userToken), returnValue: '')
          as String);
  @override
  set userToken(String? userToken) =>
      super.noSuchMethod(Invocation.setter(#userToken, userToken),
          returnValueForMissingStub: null);
  @override
  bool get hasListeners =>
      (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false)
          as bool);
  @override
  dynamic set(String? key, String? value) =>
      super.noSuchMethod(Invocation.method(#set, [key, value]));
  @override
  String get(String? key) =>
      (super.noSuchMethod(Invocation.method(#get, [key]), returnValue: '')
          as String);
  @override
  void addListener(_i3.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#addListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void removeListener(_i3.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#removeListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
  @override
  void notifyListeners() =>
      super.noSuchMethod(Invocation.method(#notifyListeners, []),
          returnValueForMissingStub: null);
  @override
  String toString() => super.toString();
}

/// A class which mocks [NavigatorObserver].
///
/// See the documentation for Mockito's code generation for more information.
class MockNavigatorObserver extends _i1.Mock implements _i4.NavigatorObserver {
  @override
  void didPush(_i4.Route<dynamic>? route, _i4.Route<dynamic>? previousRoute) =>
      super.noSuchMethod(Invocation.method(#didPush, [route, previousRoute]),
          returnValueForMissingStub: null);
  @override
  void didPop(_i4.Route<dynamic>? route, _i4.Route<dynamic>? previousRoute) =>
      super.noSuchMethod(Invocation.method(#didPop, [route, previousRoute]),
          returnValueForMissingStub: null);
  @override
  void didRemove(
          _i4.Route<dynamic>? route, _i4.Route<dynamic>? previousRoute) =>
      super.noSuchMethod(Invocation.method(#didRemove, [route, previousRoute]),
          returnValueForMissingStub: null);
  @override
  void didReplace(
          {_i4.Route<dynamic>? newRoute, _i4.Route<dynamic>? oldRoute}) =>
      super.noSuchMethod(
          Invocation.method(
              #didReplace, [], {#newRoute: newRoute, #oldRoute: oldRoute}),
          returnValueForMissingStub: null);
  @override
  void didStartUserGesture(
          _i4.Route<dynamic>? route, _i4.Route<dynamic>? previousRoute) =>
      super.noSuchMethod(
          Invocation.method(#didStartUserGesture, [route, previousRoute]),
          returnValueForMissingStub: null);
  @override
  void didStopUserGesture() =>
      super.noSuchMethod(Invocation.method(#didStopUserGesture, []),
          returnValueForMissingStub: null);
  @override
  String toString() => super.toString();
}
