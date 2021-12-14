enum PillStatus { completed, upcoming, failed }

extension FromPillStatus on PillStatus {
  String get status {
    switch (this) {
      case PillStatus.completed:
        return "completed";
      case PillStatus.upcoming:
        return "upcoming";
      case PillStatus.failed:
        return "failed";
    }
  }
}
