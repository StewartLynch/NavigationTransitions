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

struct GalleryView: View {
    private let destinations = Destination.samples
    @State private var isShowingInfo = false
    @State private var presentedDestination: Destination?
    @State private var selection = PhotoPresentationChoice.automatic
    @Namespace private var transitionNamespace

    private let columns = [
        GridItem(.adaptive(minimum: 150, maximum: 220), spacing: 16)
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Text("OPEN PHOTOS USING")
                        .font(.caption.weight(.semibold))
                        .foregroundStyle(.secondary)
                        .padding(.bottom)
                    
                    Picker("Open photos using", selection: $selection) {
                        ForEach(PhotoPresentationChoice.allCases) { choice in
                            Text(choice.title)
                                .tag(choice)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding(.bottom)

                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(destinations) { destination in
                            switch selection {
                            case .automatic, .navigationZoom :
                                NavigationLink(value: destination) {
                                    DestinationCard(destination: destination)
                                        .matchedTransitionSource(
                                            id: destination.id,
                                            in: transitionNamespace
                                        )
                                }
                                .buttonStyle(.plain)
                            case  .fullScreenCover, .fullScreenCrossFade:
                                Button {
                                    presentedDestination = destination
                                } label: {
                                    DestinationCard(destination: destination)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Wanderlust")
            .navigationDestination(for: Destination.self) { destination in
                if selection == .navigationZoom {
                    DestinationDetailView(destination: destination)
                        .navigationTransition(
                            .zoom(
                                sourceID: destination.id,
                                in: transitionNamespace
                            )
                        )
                } else {
                    DestinationDetailView(destination: destination)
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("About", systemImage: "info.circle") {
                        isShowingInfo = true
                    }
                }
            }
            .fullScreenCover(isPresented: $isShowingInfo) {
                AboutView()
                    .navigationTransition(.crossFade)
                    .presentationBackground(Color.clear)
//                    .inNavStack()
//                    .presentationBackground(Color(.systemBackground))
//                    .presentationDetents([.medium])
            }
            .fullScreenCover(item: $presentedDestination) { destination in
                if selection == .fullScreenCover {
                    DestinationDetailView(destination: destination)
                        .inNavStack()
                } else {
                    DestinationDetailView(destination: destination)
                        .inNavStack()
                        .navigationTransition(.crossFade)
                }
            }
        }
    }
}

#Preview {
    GalleryView()
}
