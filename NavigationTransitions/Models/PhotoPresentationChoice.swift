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

import SwiftUI

enum PhotoPresentationChoice: String, CaseIterable, Identifiable {
    case automatic
    case navigationZoom
    case fullScreenCover
    case fullScreenCrossFade

    var id: Self { self }

    var title: LocalizedStringResource {
        switch self {
        case .automatic:
            "Automatic"
        case .navigationZoom:
            "Zoom"
        case .fullScreenCover:
            "Cover"
        case .fullScreenCrossFade:
            "Fade"
        }
    }
}
