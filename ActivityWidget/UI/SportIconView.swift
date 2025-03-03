import SwiftUI

struct SportIconView: View {

  let sport: String

  var body: some View {
    image
      .font(.largeTitle)
      .frame(width: 70, height: 70)
  }

  private var image: Image {
    switch sport {
//    case "AlpineSki":
//    case "BackcountrySki":
//    case "Badminton":
//    case "Canoeing":
//    case "Crossfit":
//    case "EBikeRide":
//    case "Elliptical":
//    case "EMountainBikeRide":
//    case "Golf":
//    case "GravelRide":
//    case "Handcycle":
//    case "HighIntensityIntervalTraining":
//    case "Hike":
//    case "IceSkate":
//    case "InlineSkate":
//    case "Kayaking":
//    case "Kitesurf":
//    case "MountainBikeRide":
//    case "NordicSki":
//    case "Pickleball":
//    case "Pilates":
    case "Racquetball": Image(systemName: "figure.badminton")
//    case "Ride":
//    case "RockClimbing":
//    case "RollerSki":
//    case "Rowing":
    case "Run": Image(systemName: "figure.run")
//    case "Sail":
//    case "Skateboard":
//    case "Snowboard":
//    case "Snowshoe":
//    case "Soccer":
//    case "Squash":
//    case "StairStepper":
//    case "StandUpPaddling":
//    case "Surfing":
//    case "Swim":
//    case "TableTennis":
    case "Tennis": Image(systemName: "figure.tennis")
//    case "TrailRun":
//    case "Velomobile":
//    case "VirtualRide":
//    case "VirtualRow":
//    case "VirtualRun":
    case "Walk": Image(systemName: "figure.walk")
    case "WeightTraining": Image(systemName: "figure.core.training")
//    case "Wheelchair":
//    case "Windsurf":
//    case "Workout":
    case "Yoga": Image(systemName: "figure.yoga")
    default: Image(systemName: "figure.run")
    }
  }
}
