//
//----------------------------------------------
// Original project: NavigationTransitions
//
// Follow me on Mastodon: https://iosdev.space/@StewartLynch
// Follow me on Threads: https://www.threads.net/@stewartlynch
// Follow me on Bluesky: https://bsky.app/profile/stewartlynch.bsky.social
// Follow me on X: https://x.com/StewartLynch
// Follow me on LinkedIn: https://linkedin.com/in/StewartLynch
// Email: slynch@createchsol.com
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch
//----------------------------------------------
// Copyright © 2026 CreaTECH Solutions (Stewart Lynch). All rights reserved.

struct Destination: Identifiable, Hashable {
    let id: String
    let name: String
    let country: String
    let imageName: String
    let summary: String
    let symbolName: String
    
    static let samples: [Destination] = [
        Destination(
            id: "lake-louise",
            name: "Lake Louise",
            country: "Canada",
            imageName: "LakeLouise",
            summary: "Glacial water, rugged peaks, and quiet mornings in the Canadian Rockies.",
            symbolName: "mountain.2.fill"
        ),
        Destination(
            id: "algarve",
            name: "The Algarve",
            country: "Portugal",
            imageName: "Algarve",
            summary: "Golden cliffs and hidden coves shaped by the Atlantic Ocean.",
            symbolName: "water.waves"
        ),
        Destination(
            id: "iceland",
            name: "Mossy Canyon",
            country: "Iceland",
            imageName: "Iceland",
            summary: "Waterfalls tumble through a cool green landscape of stone and moss.",
            symbolName: "cloud.rain.fill"
        ),
        Destination(
            id: "tuscany",
            name: "Val d’Orcia",
            country: "Italy",
            imageName: "Tuscany",
            summary: "Cypress-lined roads wind across the warm, rolling hills of Tuscany.",
            symbolName: "sun.max.fill"
        )
    ]
    
    static let sample = Destination.samples[0]
}
