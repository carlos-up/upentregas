class Project {
  final String projectName;
  final String apiKey;
  final String appId;
  final String projectId;
  final String databaseUrl;
  final String storageBucket;
  final String senderId;

  Project({
    this.projectName,
    this.apiKey,
    this.appId,
    this.projectId,
    this.databaseUrl,
    this.storageBucket,
    this.senderId,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
        projectName: json['project_name'],
        apiKey: json['api_key'],
        appId: json['app_id'],
        databaseUrl: json['database_url'],
        projectId: json['project_id'],
        senderId: json['sender_id'],
        storageBucket: json['storage_bucket']);
  }

  // Override toString to have a beautiful log of Project object
  @override
  String toString() {
    return 'Project: {projectName = $projectName, apiKey = $apiKey, appId = $appId, databaseUrl = $databaseUrl, projectId = $projectId, senderId = $senderId, storageBucket = $storageBucket }';
  }
}
