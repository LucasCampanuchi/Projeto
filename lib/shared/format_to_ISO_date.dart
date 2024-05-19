String formatToISODate(String date) {
  print(date);

  return date.split('/').reversed.join('-');
}
