import Cocoa
import SwiftUI

var greeting = "Hello, playground"

let now = Date.now
let tomorrow = Date.now.addingTimeInterval(86400)
let range = now...tomorrow

var components = DateComponents()
components.hour = 8
components.minute = 0

print(components)
let date = Calendar.current.date(from:components) ?? .now
