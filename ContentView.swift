//
//  ContentView.swift
//  SXSnippy
//
//  Created by Evan Matthew on 14/3/2568 BE.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.openWindow) var openWindow
    @EnvironmentObject var globalfile: GlobalDataModel

    var body: some View {
        VStack {
            HStack {
                Text("Snippy")
                    .bold()
                    .font(.title2)
                Image(systemName: "pencil.and.list.clipboard")
                    .onAppear{
                        
                        let pathsManager = pathsManager()
                        
                        globalfile.pathToAllSnipets = pathsManager.filesLocationOnMac()
                        print(globalfile.pathToAllSnipets)
                        globalfile.filesInTheFolder = pathsManager.fileListed(onTheLocation: globalfile.pathToAllSnipets)
                        print(globalfile.filesInTheFolder)
                        
                    }

                Spacer()

                Button {
                    // Action for the button
                } label: {
                    Image(systemName: "questionmark.folder.fill")
                        .font(.system(size: 16))
                }
                .buttonStyle(PlainButtonStyle())

                Button {
                    let alertView = alertView()
                    alertView.alert(withMessage: "More")
                } label: {
                    Image("git")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                }
                .buttonStyle(PlainButtonStyle())
            }

            Divider()

            HStack {
                Button {
                    openWindow(id: "file-window")
                } label: {
                    Image(systemName: "plus")
                    Text("Add new ")
                }
                .buttonStyle(PlainButtonStyle())
                .padding(10)
                .font(.system(size: 16))

                Spacer()
            }
            
            Divider()
            
            List {
                ForEach($globalfile.filesInTheFolder, id: \.self) { $file in
                    Text(file) // assuming `file` has a property `name`
                }
            }

            
            
            
            Spacer()
        }
        .frame(width: 190, height: 200)
        .padding()
    }
}
