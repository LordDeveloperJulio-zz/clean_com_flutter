abstract class FailureSearch implements Exception{}

class InvalideTextError implements FailureSearch {}

class DatasourceError implements FailureSearch {
  final String message;

  DatasourceError({this.message});

}