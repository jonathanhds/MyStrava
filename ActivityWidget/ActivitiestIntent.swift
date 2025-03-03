import AppIntents

struct ActivitiesIntent: AppIntent, WidgetConfigurationIntent {

  static var title: LocalizedStringResource = "Choose an activity type"

  @Parameter(title: "Activity Type", default: ActivityType.all, optionsProvider: ActivityTypeQuery())
  var activityType: ActivityType?
}

struct ActivityType: Identifiable, Equatable, Hashable {
  var id: String { self.name }
  let name: String
  let value: String

  static var all: Self = ActivityType(name: "All", value: "all")

  static var options: [Self] = [
    ActivityType.all,
    ActivityType(name: "Tennis", value: "Tennis"),
    ActivityType(name: "Gym", value: "WeightTraining"),
  ]
}

extension ActivityType: AppEntity {

  var displayRepresentation: DisplayRepresentation {
    DisplayRepresentation(stringLiteral: name)
  }

  static var defaultQuery: ActivityTypeQuery {
    ActivityTypeQuery()
  }

  static var typeDisplayRepresentation: TypeDisplayRepresentation {
    TypeDisplayRepresentation(name: "Activity Type")
  }
}

struct ActivityTypeQuery: DynamicOptionsProvider, EntityQuery {

  func results() async throws -> [ActivityType] {
    ActivityType.options
  }

  func entities(for identifiers: [String]) async throws -> [ActivityType] {
    ActivityType.options.compactMap { activity in
      identifiers.contains(activity.id) ? activity : nil
    }
  }

  func defaultResult() async -> ActivityType? {
    ActivityType.all
  }
}
