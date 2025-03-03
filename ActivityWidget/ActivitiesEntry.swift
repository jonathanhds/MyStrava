import WidgetKit

struct ActivitiesEntry: TimelineEntry {
  let date: Date
  let activities: [StravaActivity]
  let showErrorMessage: String?

  init(activities: [StravaActivity]) {
    self.date = .now
    self.activities = activities
    self.showErrorMessage = nil
  }

  init(showErrorMessage: String) {
    self.date = .now
    self.showErrorMessage = showErrorMessage
    self.activities = []
  }
}
