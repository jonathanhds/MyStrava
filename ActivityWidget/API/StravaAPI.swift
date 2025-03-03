import Foundation

enum StravaAPIError: Error {
  case invalidURL(String)
  case genericError(Error)
}

final class StravaAPI {
  private let baseURL = "https://www.strava.com/api/v3"
  private let accessToken = "[ACCESS TOKEN HERE]"

  func fetchActivities() async throws(StravaAPIError) -> [StravaActivity] {
    let urlString = "\(baseURL)/athlete/activities"
    guard let url = URL(string: urlString) else {
      throw .invalidURL(urlString)
    }

    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")

    do {
      let (data, _) = try await URLSession.shared.data(for: request)
      return try JSONDecoder().decode([StravaActivity].self, from: data)
    } catch {
      throw .genericError(error)
    }
  }
}
