class UserCredentials {
  final String login;
  final String password;
  final String hash;

  UserCredentials(this.login, this.password, this.hash);

  Map<String, dynamic> toJson() =>
      {
        '\"login\"': login,
        '\"password\"': password,
        '\"hash\"': hash,
      };

  UserCredentials.fromJson(Map<String, dynamic> json)
      : login = json['login'],
        password = json['password'],
        hash = json['hash']
  ;
}