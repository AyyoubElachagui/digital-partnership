class NotificationModel {
  final String title;
  final String description;
  final String dateString;

  NotificationModel({
    required this.title,
    required this.dateString,
    required this.description,
  });
}

NotificationModel notificationModel = NotificationModel(
  title: 'Payment confirm',
  description:
      'Lorem ipsum dolor sit amet consectetur. Ultrici es tincidunt eleifend vitae',
  dateString: '15 min ago.',
);
