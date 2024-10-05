import 'package:flutter/material.dart';

import 'package:base/models/request/paging_model.dart';
import 'package:base/utils/commons/functions/shared_preference_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';
import 'package:auto_route/auto_route.dart';

// config
import 'package:base/configs/routes/app_router.dart';

// domain - data
import 'package:base/features/auth/data/models/request/sign_up_request.dart';
import 'package:base/features/auth/domain/repositories/auth_repository.dart';
import 'package:base/features/test/data/models/response/house_response.dart';
import 'package:base/features/test/domain/entities/house_entities.dart';
import 'package:base/features/test/domain/repositories/house_type_repository.dart';

// utils
import 'package:base/utils/constants/asset_constant.dart';
import 'package:base/utils/commons/functions/api_utils.dart';
import 'package:base/utils/commons/widgets/widgets_common_export.dart';
import 'package:base/utils/extensions/extensions_export.dart';
import 'package:base/utils/constants/api_constant.dart';

part 'test_controller.g.dart';

@riverpod
class TestController extends _$TestController {
  @override
  FutureOr<void> build() {

  }

  Future<List<HouseEntities>> getHouses(
    PagingModel request,
    BuildContext context,
  ) async {
    List<HouseEntities> dataListNameHere = [];

    state = const AsyncLoading();
    final houseTypeRepository = ref.read(houseTypeRepositoryProvider);
    final authRepository = ref.read(authRepositoryProvider);
    final user = await SharedPreferencesUtils.getInstance('user_token');

    state = await AsyncValue.guard(() async {
      final response = await houseTypeRepository.getHouseTypeData(
        // accessToken: APIConstants.prefixToken + user!.tokens.accessToken,
        request: request,
      );
      dataListNameHere = response.payload;

      // return dataListNameHere;
    });

    if (state.hasError) {
      state = await AsyncValue.guard(() async {
        final statusCode = (state.error as DioException).onStatusDio();
        await handleAPIError(
          statusCode: statusCode,
          stateError: state.error!,
          context: context,
          // onCallBackGenerateToken: () async => await reGenerateToken(
          //   authRepository,
          //   context,
          // ),
        );

        // if (state.hasError) {
        //   await ref.read(signInControllerProvider.notifier).signOut(context);
        //   return [];
        // }

        // if (statusCode != StatusCodeType.unauthentication.type) {
        //   return [];
        // }

        // return await getHouses(context);
        // return [];
      });
    }

    return dataListNameHere;
  }
}
