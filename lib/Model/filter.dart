class Filter {
  String filterName;
  List<double> matrix;

  Filter(this.filterName, this.matrix);

  // Copy constructor (copyWith method)
  Filter copyWith({
    String? filterName,
    List<double>? matrix,
  }) {
    return Filter(
      filterName ?? this.filterName,
      matrix ?? this.matrix,
    );
  }
}
