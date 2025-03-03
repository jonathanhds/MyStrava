import WidgetKit
import SwiftUI

struct ActivityWidget: Widget {
  let kind: String = "ActivityWidget"

  /// There are three types of configurations:
  /// - **StaticConfiguration**: Displays simple static data
  /// - **IntentConfiguration**: It uses the new App Intents framework, offering a Swift-native way to define widget configuration without needing '.intentdefinition' files.
  /// - **AppIntentConfiguration**: users can customize it directly from the widget picker using SiriKit Intents
  /// - **ActivityConfiguration**: Used for Live Activity

  var body: some WidgetConfiguration {
    AppIntentConfiguration(
      kind: kind,
      intent: ActivitiesIntent.self,
      provider: ActivityTimelineProvider()
    ) { entry in
      ActivityWidgetEntry(entry: entry)
        .containerBackground(.fill.tertiary, for: .widget)
    }
    .contentMarginsDisabled()
    .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
  }
}

#Preview(as: .systemSmall) {
  ActivityWidget()
} timeline: {
  ActivitiesEntry(activities: [.init(
    id: 1,
    name: "Morning tennis",
    distance: 5,
    movingTime: 50,
    elapsedTime: 60,
    startDate: "2018-05-02T07:30:00Z",
    type: "Tennis"
  )])
}
