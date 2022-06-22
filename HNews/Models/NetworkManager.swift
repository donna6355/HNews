//
//  NetworkManager.swift
//  HNews
//
//  Created by Donna on 2022/06/17.
//

import Foundation

class NetworkManager: ObservableObject{
    
    @Published var posts = [Post]() //with Published, please use the DispatchQueue, the main Thread!!
    
    func fetchData(){
        if let url = URL(string:"http://hn.algolia.com/api/v1/search?tags=front_page") {
            
            let session = URLSession(configuration:.default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil{
                    let decoder = JSONDecoder()
                    if let safeData = data{
                        do{
                            let result = try  decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = result.hits
                            }
                        }catch{
                            print(error)
                        }
                    }
                }
            }
            task.resume()
            
        }
    }
}
