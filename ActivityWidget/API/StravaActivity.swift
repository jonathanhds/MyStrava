import Foundation

struct StravaActivity: Identifiable, Hashable, Equatable, Codable {
  let id: Double
  let name: String
  let distance: Double
  let movingTime: Double
  let elapsedTime: Double
  let startDate: String
  let type: String

  enum CodingKeys: String, CodingKey {
    case id
    case name
    case distance
    case movingTime = "moving_time"
    case elapsedTime = "elapsed_time"
    case startDate = "start_date"
    case type = "sport_type"
  }
}
