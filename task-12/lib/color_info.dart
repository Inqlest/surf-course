class ColorInfo {
  final String colorName;
  final String? hex;

  ColorInfo({required this.colorName, this.hex});

  factory ColorInfo.fromJson(Map<String, dynamic> json) {
    return ColorInfo(
      colorName: json['name'] ?? '',
      hex: json['value'],
    );
  }
}
