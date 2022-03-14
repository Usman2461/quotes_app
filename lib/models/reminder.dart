class Reminder{
  String startTime;
  String endTime;
  String days;
  int times;

  Reminder(this.startTime, this.endTime, this.days, this.times);
}


List<Reminder> reminders =[
  Reminder("9:00 AM", "10:00 AM", "Everyday", 5,),
  Reminder("9:00 AM", "5:00 PM", "Weekdays", 10,),
  Reminder("11:00 AM", "12:00 AM", "Weekends", 10,),

];