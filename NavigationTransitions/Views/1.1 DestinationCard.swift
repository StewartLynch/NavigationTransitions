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

struct DestinationCard: View {
    let destination: Destination

    var body: some View {
        Color.clear
            .aspectRatio(0.78, contentMode: .fit)
            .overlay {
                Image(destination.imageName)
                    .resizable()
                    .scaledToFill()
            }
            .overlay {
                LinearGradient(
                colors: [.clear, .black.opacity(0.8)],
                startPoint: .center,
                endPoint: .bottom
                )
            }
            .overlay(alignment: .bottomLeading) {
                VStack(alignment: .leading, spacing: 2) {
                    Text(destination.name)
                        .font(.headline)
                    Text(destination.country)
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.8))
                }
                .foregroundStyle(.white)
                .padding(12)
            }
            .clipped()
            .clipShape(.rect(cornerRadius: 18))
            .contentShape(.rect)
    }
}

#Preview {
    DestinationCard(destination: Destination.sample)
}
