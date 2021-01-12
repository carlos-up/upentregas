class ProjectFirebase {
  String projectName;
  String apiKey;
  String appId;
  String projectId;
  String databaseUrl;
  String storageBucket;
  String senderId;

  ProjectFirebase({
    this.projectName,
    this.apiKey,
    this.appId,
    this.projectId,
    this.databaseUrl,
    this.storageBucket,
    this.senderId,
  });

  static ProjectFirebase fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ProjectFirebase(
        projectName: map['projectName'],
        apiKey: map['apiKey'],
        appId: map['appId'],
        projectId: map['projectId'],
        databaseUrl: map['databaseUrl'],
        storageBucket: map['storageBucket'],
        senderId: map['senderId']);
  }
}
