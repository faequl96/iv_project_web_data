part of 'invited_guest_cubit.dart';

class InvitedGuestState extends Equatable {
  const InvitedGuestState({
    this.isLoadingCheck = false,
    this.isLoadingUpsert = false,
    this.isLoadingGetById = false,
    this.isLoadingGetsByInvitationId = false,
    this.isLoadingUpdateById = false,
    this.invitedGuest,
    this.invitedGuestUpdateById,
    this.invitedGuests = const [],
    this.isContainsError = false,
  });

  final bool isLoadingCheck;
  final bool isLoadingUpsert;
  final bool isLoadingGetById;
  final bool isLoadingGetsByInvitationId;
  final bool isLoadingUpdateById;
  final InvitedGuestResponse? invitedGuest;
  final InvitedGuestResponse? invitedGuestUpdateById;
  final List<InvitedGuestResponse>? invitedGuests;
  final bool isContainsError;

  InvitedGuestState copyWith({
    bool? isLoadingCheck,
    bool? isLoadingUpsert,
    bool? isLoadingGetById,
    bool? isLoadingGetsByInvitationId,
    bool? isLoadingUpdateById,
    CopyWithValue<InvitedGuestResponse?>? invitedGuest,
    CopyWithValue<InvitedGuestResponse?>? invitedGuestUpdateById,
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
      invitedGuestUpdateById: invitedGuestUpdateById != null ? invitedGuestUpdateById.value : this.invitedGuestUpdateById,
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
