//
//  ListViewService.swift
//  RedditApi
//
//  Created by Pierre ILYAMUKURU on 10/24/21.
//

import Foundation


// MARK: - ListViewServiceProtocol
protocol ListViewServiceProtocol {
    func fetchReddits(completion: @escaping(RedditModel?) -> ())
}


class ListViewService: ListViewServiceProtocol {
    
    static let sharedInstance = ListViewService()
    
    func fetchReddits(completion: @escaping(RedditModel?) -> ()) {
        let redditsURL = "https://www.reddit.com/.json"
        if let url = URL(string: redditsURL) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, urlResponse, error in
                if error != nil {
                    print(error?.localizedDescription as Any)
                    return
                }
                if let safeData = data {
                    do {
                        let decodedData = try JSONDecoder().decode(RedditModel.self, from: safeData)
                        completion(decodedData)
                    } catch {
                        print("error")
                        completion(nil)
                    }
                    
                }
            }
            task.resume()
        }

    }
}
