//
//  SXSnippyApp.swift
//  SXSnippy
//
//  Created by Evan Matthew on 14/3/2568 BE.
//

import SwiftUI
import FramelessWindow




struct VisualEffect: NSViewRepresentable {
   func makeNSView(context: Self.Context) -> NSView { return NSVisualEffectView() }
   func updateNSView(_ nsView: NSView, context: Context) { }
}


class GlobalDataModel : ObservableObject {
    @Published var snippetName: String = ""
    @Published var pathToAllSnipets: String = ""
    @Published var contentsOfSnippetGlobal: String = "blank"
    @Published var filesInTheFolder = [String]()
}

@main
struct SXSnippyApp: App {
    @StateObject private var globaldata = GlobalDataModel()
   
    var body: some Scene {
        MenuBarExtra {
            ContentView()
                .environmentObject(globaldata)
        } label: {
            Label("Snippy", systemImage: "list.clipboard")
        }
        .menuBarExtraStyle(.window)

        FramelessWindow("Snippies editor", id: "file-window") {
            editorView()
                .environmentObject(globaldata)
                .frame(minWidth: 400, minHeight: 400)
        
                    .background(VisualEffect())
                .fixedSize()
              
            
               // .background(LinearGradient(gradient: Gradient(colors: [.cyan, .blue, .gray]), startPoint: .top, endPoint: .bottom))
        } // .windowStyle(.hiddenTitleBar)
        .windowResizability(.contentSize)
    }
}
