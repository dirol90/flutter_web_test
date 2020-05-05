class AppStatus {
  final bool app1;
  final bool app2;
  final bool app3;
  final bool app4;
  final bool app5;
  final int parsingDate;

  AppStatus(this.app1, this.app2, this.app3, this.app4, this.app5, this.parsingDate);

  AppStatus.fromJson(Map<String, dynamic> json)
      : app1 = json['app1'],
        app2 = json['app2'],
        app3 = json['app3'],
        app4 = json['app4'],
        app5 = json['app5'],
        parsingDate = json['parsingDate']
  ;

}