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

struct DestinationDetailView: View {
    let destination: Destination
    var body: some View {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    DestinationHero(
                        imageName: destination.imageName,
                        name: destination.name
                    )
                    DestinationDescription(
                        country: destination.country,
                        summary: destination.summary,
                        symbolName: destination.symbolName
                    )
                }
            }
            .ignoresSafeArea(edges: .top)
            .toolbarBackground(.hidden, for: .navigationBar)
    }
}

private struct DestinationHero: View {
    let imageName: String
    let name: String

    var body: some View {
        Color.clear
            .frame(maxWidth: .infinity)
            .frame(height: 460)
            .overlay {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
            }
            .overlay(alignment: .bottomLeading) {
                Text(name)
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                    .padding(24)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.linearGradient(
                        colors: [.clear, .black.opacity(0.75)],
                        startPoint: .top,
                        endPoint: .bottom
                    ))
            }
            .clipped()
    }
}

private struct DestinationDescription: View {
    let country: String
    let summary: String
    let symbolName: String

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            Label(country, systemImage: symbolName)
                .font(.headline)
                .foregroundStyle(.tint)
            Text(summary)
                .font(.title3)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 24)
        .padding(.bottom, 32)
    }
}

#Preview {
    DestinationDetailView(destination: Destination.sample)
}
