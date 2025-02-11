import Foundation

func berlinClock(_ time: String) -> String {
    let components = time.split(separator: ":").compactMap { Int($0) }
    guard components.count == 3 else { return "Invalid time format" }
    
    let (hours, minutes, seconds) = (components[0], components[1], components[2])

    let secondsLamp = (seconds % 2 == 0) ? "Y" : "O"

    let fiveHourRow = String(repeating: "R", count: hours / 5) + String(repeating: "O", count: 4 - hours / 5)

    let singleHourRow = String(repeating: "R", count: hours % 5) + String(repeating: "O", count: 4 - (hours % 5))

    var fiveMinuteRow = ""
    for i in 1...11 {
        if i <= minutes / 5 {
            fiveMinuteRow += (i % 3 == 0) ? "R" : "Y"
        } else {
            fiveMinuteRow += "O"
        }
    }

    let singleMinuteRow = String(repeating: "Y", count: minutes % 5) + String(repeating: "O", count: 4 - (minutes % 5))

    return """
    \(secondsLamp)
    \(fiveHourRow)
    \(singleHourRow)
    \(fiveMinuteRow)
    \(singleMinuteRow)
    """
}

let time = "16:50:06"
print(berlinClock(time))
