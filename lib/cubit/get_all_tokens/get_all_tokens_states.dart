abstract class GetAllTokensStates{}

class GetAllTokensLoadingState extends GetAllTokensStates{}

class GetAllTokensSuccessState extends GetAllTokensStates{
  final List<String> tokens;

  GetAllTokensSuccessState({required this.tokens});
}

class GetAllTokensErrorState extends GetAllTokensStates{
  final String error;
  GetAllTokensErrorState(this.error);

}
