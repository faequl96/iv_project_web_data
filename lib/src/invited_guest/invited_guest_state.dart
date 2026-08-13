part of 'invited_guest_cubit.dart';

class const InvitedGuestState({
  final bool isLoadingCheck = false,
  final bool isLoadingUpsert = false,
  final bool isLoadingGetById = false,
  final bool isLoadingGetsByInvitationId = false,
  final bool isLoadingUpdateById = false,
  final InvitedGuestResponse? invitedGuest,
  final List<InvitedGuestResponse>? invitedGuests = const [],
  final bool isContainsError = false,
}) extends Equatable {
  InvitedGuestState copyWith({
    bool? isLoadingCheck,
    bool? isLoadingUpsert,
    bool? isLoadingGetById,
    bool? isLoadingGetsByInvitationId,
    bool? isLoadingUpdateById,
    CopyWithValue<InvitedGuestResponse?>? invitedGuest,
    CopyWithValue<List<InvitedGuestResponse>?>? invitedGuests,
    bool? isContainsError,
  }) {
    return InvitedGuestState(
      isLoadingCheck: isLoadingCheck ?? this.isLoadingCheck,
      isLoadingUpsert: isLoadingUpsert ?? this.isLoadingUpsert,
      isLoadingGetById: isLoadingGetById ?? this.isLoadingGetById,
      isLoadingGetsByInvitationId: isLoadingGetsByInvitationId ?? this.isLoadingGetsByInvitationId,
      isLoadingUpdateById: isLoadingUpdateById ?? this.isLoadingUpdateById,
      invitedGuest: invitedGuest != null ? invitedGuest.value : this.invitedGuest,
      invitedGuests: invitedGuests != null ? invitedGuests.value : this.invitedGuests,
      isContainsError: isContainsError ?? this.isContainsError,
    );
  }

  void emitState() => GlobalContextService.value.read<InvitedGuestCubit>().emitState(this);

  @override
  List<Object?> get props => [
    isLoadingCheck,
    isLoadingUpsert,
    isLoadingGetById,
    isLoadingGetsByInvitationId,
    isLoadingUpdateById,
    invitedGuest,
    isContainsError,
  ];
}
