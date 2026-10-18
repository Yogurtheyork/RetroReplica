import Foundation

struct DayPhoto: Identifiable {
    let id: String
    let imageName: String
    let day: String
}

struct FriendPost: Identifiable {
    let id: String
    let name: String
    let avatarName: String
    let photoName: String
    var isTicket = false
}

enum SampleData {
    static let days: [DayPhoto] = [
        .init(id: "mon", imageName: "TravelLake", day: "週一"),
        .init(id: "tue", imageName: "TravelGarden", day: "週二"),
        .init(id: "wed", imageName: "TravelCity", day: "週三"),
        .init(id: "thu", imageName: "AvatarCamera", day: "週四"),
        .init(id: "fri", imageName: "TravelLake", day: "週五"),
        .init(id: "sat", imageName: "TravelGarden", day: "週六"),
        .init(id: "sun", imageName: "TravelCity", day: "週日")
    ]
    static let friends: [FriendPost] = [
        .init(id: "rain", name: "rainxiao", avatarName: "AvatarCamera", photoName: "TravelLake", isTicket: true),
        .init(id: "shake", name: "shakefan", avatarName: "TravelCity", photoName: "TravelGarden"),
        .init(id: "york", name: "york", avatarName: "TravelGarden", photoName: "TravelCity")
    ]
    static let moreFriends: [FriendPost] = [
        .init(id: "lin", name: "linlin", avatarName: "TravelLake", photoName: "TravelCity"),
        .init(id: "yu", name: "yuting", avatarName: "TravelGarden", photoName: "TravelLake"),
        .init(id: "chen", name: "chen", avatarName: "AvatarCamera", photoName: "TravelGarden")
    ]
}
