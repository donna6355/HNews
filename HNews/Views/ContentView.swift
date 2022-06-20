//
//  ContentView.swift
//  HNews
//
//  Created by Donna on 2022/06/17.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    var body: some View {
        NavigationView{
            //            Hardcoding List
            //            List{
            //                Text('Morning')
            //            }
            
            //            List(<#T##data: RandomAccessCollection##RandomAccessCollection#>, rowContent: <#T##(Identifiable) -> View#>)
            List(networkManager.posts){ post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text("\(post.points)")
                        Text(post.title)
                    }
                }
                
            }
            .navigationTitle("HNews")
        }
        .onAppear { //similar to viewDidLoad
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//let posts = [
//    Post(id: "1", title: "Morning"),
//    Post(id: "2", title: "Afternoon"),
//    Post(id: "3", title: "Evening"),
//    Post(id: "4", title: "Night"),
//]
