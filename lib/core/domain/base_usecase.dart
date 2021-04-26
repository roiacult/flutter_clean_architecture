abstract class StreamUseCase<D> {
  Stream<D> buildStream();
}

abstract class SimpleUseCase<D> {
  Future<D> build();
}

abstract class ParamUseCase<P, D> {
  Future<D> build(P param);
}
