import WidgetKit

struct ActivityTimelineProvider: AppIntentTimelineProvider {

  private let api = StravaAPI()

  func placeholder(in context: Context) -> ActivitiesEntry {
    ActivitiesEntry(activities: [
      .init(
        id: 1,
        name: "Morning tennis",
        distance: 5,
        movingTime: 50,
        elapsedTime: 60,
        startDate: "2018-05-02T07:30:00Z",
        type: "Tennis"
      )
    ])
  }

  func snapshot(
    for configuration: ActivitiesIntent,
    in context: Context
  ) async -> ActivitiesEntry {
    do {
      let activities = try await api.fetchActivities()
      return ActivitiesEntry(
        activities: filter(activities, by: configuration.activityType)
      )
    } catch {
      return ActivitiesEntry(showErrorMessage: error.localizedDescription)
    }
  }
  
  func timeline(
    for configuration: ActivitiesIntent,
    in context: Context
  ) async -> Timeline<ActivitiesEntry> {
    do {
      let activities = try await api.fetchActivities()
      let entry = ActivitiesEntry(
        activities: filter(activities, by: configuration.activityType)
      )
      return .init(entries: [entry], policy: .atEnd)
    } catch {
      let entry = ActivitiesEntry(showErrorMessage: error.localizedDescription)
      return .init(entries: [entry], policy: .atEnd)
    }
  }

  private func filter(_ activities: [StravaActivity], by type: ActivityType?) -> [StravaActivity] {
    guard let type else { return activities }
    guard type != ActivityType.all else { return activities }
    return activities.filter { $0.type == type.value }
  }
}
