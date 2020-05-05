class Payment {
  final String id;
  final String user_id;
  final int sum;
  final int dateMilliseconds;
  final bool isPayed;
  final bool isDelited;
  final String paymentInfo;

  Payment(this.id, this.user_id,  this.sum, this.dateMilliseconds, this.isPayed, this.isDelited, this.paymentInfo);

  Payment.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        user_id = json['user_id'],
        sum = json['sum'],
        dateMilliseconds = json['dateMilliseconds'],
        isPayed = json['isPayed'],
        isDelited = json['isDelited'],
        paymentInfo = json['paymentInfo']
  ;

  Map<String, dynamic> toJson() =>
      {
        '\"id\"': id,
        '\"user_id\"': user_id,
        '\"sum\"': sum,

        '\"dateMilliseconds\"': dateMilliseconds,
        '\"isPayed\"': isPayed,
        '\"isDelited\"': isDelited,

        '\"paymentInfo\"': paymentInfo
      };

}