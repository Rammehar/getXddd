import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'failure.dart';

class BodyText extends Equatable {
  final String value;

  BodyText._(this.value);

  static Either<Failure, BodyText> create(String value) {
    if (value.isEmpty)
      return Left(Failure('BodyText cannot be empty of null'));
    else
      return Right(BodyText._(value));
  }

  @override
  List<Object> get props => [value];
}
