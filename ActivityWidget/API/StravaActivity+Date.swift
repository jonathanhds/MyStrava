import Foundation

extension StravaActivity {
  func formattedDate() -> String {
    let formatter = ISO8601DateFormatter()
    guard let date = formatter.date(from: startDate) else { return startDate }
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMM d, yyyy HH:mm"
    return dateFormatter.string(from: date)
  }
}
