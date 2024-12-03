abstract class HomeEvents {}

class SendRequestEvent extends HomeEvents {
  String question;
  SendRequestEvent({required this.question});
}
