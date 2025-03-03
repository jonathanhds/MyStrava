import SwiftUI
import WidgetKit

struct ActivityWidgetEntry: View {

  @Environment(\.widgetFamily) var family

  let entry: ActivitiesEntry

  var body: some View {
    if let activity = entry.activities.last {
      switch family {
      case .systemLarge:
        ActivityWidgetEntryLarge(activities: Array(entry.activities.prefix(3)))
      case .systemMedium:
        ActivityWidgetEntryMedium(activity: activity)
      default:
        ActivityWidgetEntrySmall(activity: activity)
      }
    } else {
      Text(entry.showErrorMessage ?? "No activities found")
    }
  }
}

private struct ActivityWidgetEntrySmall: View {

  let activity: StravaActivity

  var body: some View {
    VStack {
      SportIconView(sport: activity.type)

      VStack {
        Text(activity.name)
          .font(.title3)

        Text(activity.formattedDate())
          .font(.caption)
      }
    }
  }
}

private struct ActivityWidgetEntryMedium: View {

  let activity: StravaActivity

  var body: some View {
    ActivityRow(activity: activity)
  }
}

private struct ActivityWidgetEntryLarge: View {

  let activities: [StravaActivity]

  var body: some View {
    VStack {
      ForEach(activities) { activity in
        ActivityRow(activity: activity)
          .padding(.vertical)
      }
    }
  }
}

private struct ActivityRow: View {

  let activity: StravaActivity

  init(activity: StravaActivity) {
    self.activity = activity
  }

  var body: some View {
    HStack {
      SportIconView(sport: activity.type)

      VStack {
        Text(activity.name)
          .font(.title2)

        Text(activity.formattedDate())
      }
    }
  }

}
