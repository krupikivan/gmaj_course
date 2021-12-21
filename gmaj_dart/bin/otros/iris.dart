void main() {
  AppSession _session = AppSession();
  final now = DateTime.now();
  const threshold = Duration(minutes: 20);
  final other = _session.updatedAt.add(threshold);
  print('Other: $other\nNow:$now');
  print(now.isBefore(other));
}

class AppSession {
  AppSession({DateTime updatedAt}) : _updatedAt = updatedAt ?? DateTime.now();

  factory AppSession.fromJson(Map<String, dynamic> json) {
    return AppSession(updatedAt: DateTime.parse(json['updatedAt']));
  }

  DateTime get updatedAt {
    return _updatedAt;
  }

  Map<String, dynamic> toJson() {
    return {
      'updatedAt':
          DateTime.now().subtract(const Duration(minutes: 9)).toIso8601String()
    };
  }

  final DateTime _updatedAt;
}
