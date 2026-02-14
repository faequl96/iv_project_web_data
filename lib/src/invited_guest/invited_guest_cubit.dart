import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:iv_project_core/iv_project_core.dart';
import 'package:iv_project_model/iv_project_model.dart';

part 'invited_guest_state.dart';

class InvitedGuestCubit extends Cubit<InvitedGuestState> {
  InvitedGuestCubit() : super(const InvitedGuestState());

  void emitState(InvitedGuestState state) => emit(state);

  Future<bool> check(CheckInvitedGuestRequest request) async {
    try {
      emit(state.copyWith(isLoadingCheck: true, isContainsError: false));

      final url = Uri.parse('${ApiUrl.value}/invited-guest');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json', 'ngrok-skip-browser-warning': 'true'},
        body: jsonEncode(request.toJson()),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final InvitedGuestResponse invitedGuest = InvitedGuestResponse.fromJson(jsonDecode(response.body)['data']);

        emit(state.copyWith(isLoadingCheck: false, invitedGuest: invitedGuest.toCopyWithValue()));

        return true;
      }

      emit(state.copyWith(isLoadingCheck: false, isContainsError: true));

      return false;
    } catch (e) {
      emit(state.copyWith(isLoadingCheck: false, isContainsError: true));

      return false;
    }
  }

  Future<bool> upsertCreate(BulkCreateInvitedGuestRequest request) async {
    try {
      emit(
        state.copyWith(isLoadingUpsert: true, invitedGuests: <InvitedGuestResponse>[].toCopyWithValue(), isContainsError: false),
      );

      final url = Uri.parse('${ApiUrl.value}/invited-guests');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json', 'ngrok-skip-browser-warning': 'true'},
        body: jsonEncode(request.toJson()),
      );
      if (response.statusCode == 200) {
        final List<InvitedGuestResponse> invitedGuests = (jsonDecode(response.body)['data'] as List)
            .map((json) => InvitedGuestResponse.fromJson(json))
            .toList();

        emit(state.copyWith(isLoadingUpsert: false, invitedGuests: invitedGuests.toCopyWithValue()));

        return true;
      }

      emit(state.copyWith(isLoadingUpsert: false, isContainsError: true));

      return false;
    } catch (e) {
      emit(state.copyWith(isLoadingUpsert: false, isContainsError: true));

      return false;
    }
  }

  Future<bool> upsertEdit(BulkEditInvitedGuestRequest request) async {
    try {
      emit(
        state.copyWith(isLoadingUpsert: true, invitedGuests: <InvitedGuestResponse>[].toCopyWithValue(), isContainsError: false),
      );

      final url = Uri.parse('${ApiUrl.value}/invited-guests');
      final response = await http.patch(
        url,
        headers: {'Content-Type': 'application/json', 'ngrok-skip-browser-warning': 'true'},
        body: jsonEncode(request.toJson()),
      );
      if (response.statusCode == 200) {
        final List<InvitedGuestResponse> invitedGuests = (jsonDecode(response.body)['data'] as List)
            .map((json) => InvitedGuestResponse.fromJson(json))
            .toList();

        emit(state.copyWith(isLoadingUpsert: false, invitedGuests: invitedGuests.toCopyWithValue()));

        return true;
      }

      emit(state.copyWith(isLoadingUpsert: false, isContainsError: true));

      return false;
    } catch (e) {
      emit(state.copyWith(isLoadingUpsert: false, isContainsError: true));

      return false;
    }
  }

  Future<bool> getById(String id) async {
    try {
      emit(state.copyWith(isLoadingGetById: true, isContainsError: false));

      final url = Uri.parse('${ApiUrl.value}/invited-guest/id/$id');
      final response = await http.get(url, headers: {'ngrok-skip-browser-warning': 'true'});
      if (response.statusCode == 200) {
        final InvitedGuestResponse invitedGuest = InvitedGuestResponse.fromJson(jsonDecode(response.body)['data']);

        emit(state.copyWith(isLoadingGetById: false, invitedGuest: invitedGuest.toCopyWithValue()));

        return true;
      }

      emit(state.copyWith(isLoadingGetById: false, isContainsError: true));

      return false;
    } catch (e) {
      emit(state.copyWith(isLoadingGetById: false, isContainsError: true));

      return false;
    }
  }

  Future<bool> getsByInvitationId(String invitationId) async {
    try {
      emit(
        state.copyWith(
          isLoadingGetsByInvitationId: true,
          invitedGuests: <InvitedGuestResponse>[].toCopyWithValue(),
          isContainsError: false,
        ),
      );

      final url = Uri.parse('${ApiUrl.value}/invited-guests/invitation-id/$invitationId');
      final response = await http.get(url, headers: {'ngrok-skip-browser-warning': 'true'});
      if (response.statusCode == 200) {
        final List<InvitedGuestResponse> invitedGuests = (jsonDecode(response.body)['data'] as List)
            .map((json) => InvitedGuestResponse.fromJson(json))
            .toList();

        emit(state.copyWith(isLoadingGetsByInvitationId: false, invitedGuests: invitedGuests.toCopyWithValue()));

        return true;
      }

      emit(state.copyWith(isLoadingGetsByInvitationId: false, isContainsError: true));

      return false;
    } catch (e) {
      emit(state.copyWith(isLoadingGetsByInvitationId: false, isContainsError: true));

      return false;
    }
  }

  Future<bool> updateById(String id, UpdateInvitedGuestRequest request) async {
    try {
      emit(state.copyWith(isLoadingUpdateById: true, isContainsError: false));

      final url = Uri.parse('${ApiUrl.value}/invited-guest/id/$id');
      final response = await http.patch(
        url,
        headers: {'Content-Type': 'application/json', 'ngrok-skip-browser-warning': 'true'},
        body: jsonEncode(request.toJson()),
      );
      if (response.statusCode == 200) {
        final InvitedGuestResponse invitedGuest = InvitedGuestResponse.fromJson(jsonDecode(response.body)['data']);

        final newInvitedGuests = <InvitedGuestResponse>[];
        for (final item in state.invitedGuests ?? <InvitedGuestResponse>[]) {
          if (item.id == invitedGuest.id) newInvitedGuests.add(invitedGuest);
          if (item.id == invitedGuest.id) continue;
          newInvitedGuests.add(item);
        }

        emit(
          state.copyWith(
            isLoadingUpdateById: false,
            invitedGuest: invitedGuest.toCopyWithValue(),
            invitedGuests: newInvitedGuests.toCopyWithValue(),
          ),
        );

        return true;
      }

      emit(state.copyWith(isLoadingUpdateById: false, isContainsError: true));

      return false;
    } catch (e) {
      emit(state.copyWith(isLoadingUpdateById: false, isContainsError: true));

      return false;
    }
  }
}
