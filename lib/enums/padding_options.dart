enum PaddingOptions {
  padding4(4),
  padding8(8),
  padding12(12),
  padding16(16),
  padding20(20),
  padding24(24),
  padding36(36);

  const PaddingOptions(this.value);

  final int value;
}

final List<int> paddingOptions = [4, 8, 12, 16, 20, 24, 36];
