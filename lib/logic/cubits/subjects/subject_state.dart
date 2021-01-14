part of 'subject_cubit.dart';

abstract class SubjectState extends Equatable {
  const SubjectState();
}

class SubjectInitial extends SubjectState {
  @override
  List<Object> get props => [];
}

class SubjectLoading extends SubjectState {
  @override
  List<Object> get props => [];
}
class SubjectFailure extends SubjectState {
  @override
  List<Object> get props => [];
}

class SubjectSuccess extends SubjectState {
  SubjectSuccess({this.subjects});

  final List<Subject> subjects;

  @override
  List<Object> get props => [subjects];
}
