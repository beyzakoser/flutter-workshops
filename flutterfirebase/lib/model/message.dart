class Message {
  final String senderId;
  final String senderEmail;
  final String receiverId;
  final String message;
  final DateTime date;

  Message(
      {required this.senderId,
      required this.senderEmail,
      required this.receiverId,
      required this.message,
      required this.date});

  Map<String, dynamic> toMap() {
    return {
      "senderId": senderId,
      "senderEmail": senderEmail,
      "receiverId": receiverId,
      "message": message,
      "date": date,
    };
  }
}
