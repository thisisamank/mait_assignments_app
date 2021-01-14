part of 'sections_cubit.dart';

@immutable
abstract class SectionsState {}

class SectionsInitial extends SectionsState {}


class StudentSectionLoading extends SectionsState {
  @override
  List<Object> get props => [];
}

class StudentSectionsLoaded extends SectionsState {
  final List<Section> section;

  StudentSectionsLoaded({this.section});

  @override
  List<Object> get props => [section];
}

class StudentSectionFailure extends SectionsState {
  @override
  List<Object> get props {}
}