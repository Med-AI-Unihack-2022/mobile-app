//Data model class for each prescription information, used for navigation
class Prescription {
  String name;
  String image;
  String desc;
  String schedule;
  String startDate;
  String endDate;

  Prescription(
    this.name,
    this.desc,
    this.image,
    this.schedule,
    this.startDate,
    this.endDate,
  );
}
