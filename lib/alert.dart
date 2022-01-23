class Alert{
  int action; //where 0 is mailbox opened, 1 is mailbox closed, 2 is object placed in mailbox, 3 is object removed from mailbox
  String? weight;
  DateTime date;
  Alert(this.action, double weight, this.date){
    this.weight = weight.toString() + "kg";
  }
}