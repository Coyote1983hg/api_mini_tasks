
 class IpInfoModel {
  final String? ip;
  final String? city;
  final String? region;
  final String? country;
  final String? location;
  final String? organization;
  final String? postalCode;
  final String? timezone;

  IpInfoModel({
    required this.ip,
    required this.city,
    required this.region,
    required this.country,
    required this.location,
    required this.organization,
    required this.postalCode,
    required this.timezone,
  });

  factory IpInfoModel.fromJson(Map<String, dynamic> json) {
    return IpInfoModel(
      ip: json['ip'],
      city: json['city'],
      region: json['region'],
      country: json['country'],
      location: json['location'],
      organization: json['organization'],
      postalCode: json['postalCode'],
      timezone: json['timezone'],
    );
  }
}
