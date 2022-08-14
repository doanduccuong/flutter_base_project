part of 'app_cubit.dart';

class AppInitial extends Equatable {
  final UserEntity? user;
  final LoadStatus fetchProfileStatus;
  final LoadStatus signOutStatus;

  const AppInitial({
    this.user,
    this.fetchProfileStatus = LoadStatus.initial,
    this.signOutStatus = LoadStatus.initial,
  });

  AppInitial copyWith({
    UserEntity? user,
    LoadStatus? fetchProfileStatus,
    LoadStatus? signOutStatus,
  }) {
    return AppInitial(
      user: user ?? this.user,
      fetchProfileStatus: fetchProfileStatus ?? this.fetchProfileStatus,
      signOutStatus: signOutStatus ?? this.signOutStatus,
    );
  }

  AppInitial removeUser() {
    return AppInitial(
      user: user,
      fetchProfileStatus: fetchProfileStatus,
      signOutStatus: signOutStatus,
    );
  }

  @override
  List<Object?> get props => [
        user,
        fetchProfileStatus,
        signOutStatus,
      ];
}
