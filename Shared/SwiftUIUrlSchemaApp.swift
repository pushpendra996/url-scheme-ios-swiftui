//
//  SwiftUIUrlSchemaApp.swift
//  Shared
//
//  Created by Pushpendra Saini on 04/07/22.
//

import SwiftUI

@main
struct SwiftUIUrlSchemaApp: App {
    @State var urlStreaming : Int = 0
    var body: some Scene {
        WindowGroup {
            Group {
                if urlStreaming == 0 {
                    ContentView()
                } else {
                    WebView()
                }
            }
            .onOpenURL { url in
                print(url.absoluteString)
                if (url.valueOf("name") == "PK") {
                    urlStreaming = 1
                } else {
                    urlStreaming = 0
                }
                print(url.valueOf("name")!)
                print(url.valueOf("age")!)
            }
        }
    }
}


extension URL {
    func valueOf(_ queryParameterName: String) -> String? {
        guard let url = URLComponents(string: self.absoluteString) else { return nil }
        return url.queryItems?.first(where: { $0.name == queryParameterName })?.value
    }
}
