//
//  NetworkManager.swift
//  H4X0R News
//
//  Created by Oluwakamiye Akindele on 10/12/2019.
//  Copyright © 2019 Oluwakamiye Akindele. All rights reserved.
//

import Foundation

class NetworkManager: ObservableObject {
    static var baseUrl = "https://hn.algolia.com/api/v1/search?tags=front_page"
    
    @Published var posts = [Post]()
    
    func fetchData(){
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page"){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    
                } else {
                    let decoder = JSONDecoder()
                    if let safeData = data{
                        do{
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                            
                        } catch{
                            print(error)
                        }
                        
                    }
                    
                }
            }
            task.resume()
        }
    }
}
