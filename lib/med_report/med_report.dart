//Data model for medical reports
class MedReport {
  String date;
  String time;
  String location;
  String appointmentType;
  String doctor;
  CheckUpData checkup;
  String remarks;
  List files;
  String diagnosis;

  MedReport(
    this.date,
    this.time,
    this.location,
    this.appointmentType,
    this.doctor,
    this.checkup,
    this.remarks,
    this.files,
    this.diagnosis,
  );
}

class CheckUpData {
  String systolic;
  String diastolic;
  String cholesterol;
  String glucose;

  CheckUpData(
    this.systolic,
    this.diastolic,
    this.cholesterol,
    this.glucose,
  );
}
