//
//  ContentView.swift
//  H4X0R News
//
//  Created by Oluwakamiye Akindele on 10/12/2019.
//  Copyright © 2019 Oluwakamiye Akindele. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List (networkManager.posts){ post in
                Text(post.title)
            }
        .navigationBarTitle("H4X0R News")
        }
        .onAppear{
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
