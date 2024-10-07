class ApiUrls {
  static const String root = 'https://drug.actnow-ye.com';
  static const String registerinUrl = '$root/api/register';
  static const String loginUrl = '$root/api/login';
  static const String getProfileUrl = '$root/api/profile';
  static const String donationUrl = 'https://drug.actnow-ye.com/api/drugs';
  static const String allCategurys ='https://drug.actnow-ye.com/api/categories';
  static const String approvedCategory ="https://drug.actnow-ye.com/api/drugs?status=approved";
  static const String pendingCategory ="https://drug.actnow-ye.com/api/drugs?status=pending";
  static const String rejectedCategory ="https://drug.actnow-ye.com/api/drugs?status=rejected";
}
