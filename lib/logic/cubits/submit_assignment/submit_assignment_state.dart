part of 'submit_assignment_cubit.dart';

@immutable
abstract class SubmitAssignmentState {}

class SubmitAssignmentInitial extends SubmitAssignmentState {}

class SubmitAssignmentUploading extends SubmitAssignmentState {}

class SubmitAssignmentSuccess extends SubmitAssignmentState {}

class SubmitAssignmentFailure extends SubmitAssignmentState {}
