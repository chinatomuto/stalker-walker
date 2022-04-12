//
//  InstagramBrain.swift
//  stalker walker
//
//  Created by nato on 11/04/2022.
//

import Foundation

protocol InstagramManagerDelegate {
    func didUpdateInstagram(_ instagramManager: InstagramManager, instagram: InstagramModel)
    func didFailWithError(error: Error)
}

struct InstagramManager {
    
    var delegate: InstagramManagerDelegate
    
    let headers = [
        "X-Access-Token": "opp",
        "X-RapidAPI-Host": "instagram85.p.rapidapi.com",
        "X-RapidAPI-Key": "91124114ebmsh5ede0ded1dbce01p1c6769jsn75127b39da86"
    ]

    let request = NSMutableURLRequest(url: NSURL(string: "https://instagram85.p.rapidapi.com/account/jlo/info")! as URL,
                                      cachePolicy: .useProtocolCachePolicy,
                                      timeoutInterval: 10.0)
    
    
    //func fetchInfo(userName: String) {
   //     print(userName)
  //  }
    
    //fetchInfo(userName)
    
    
    

    func getIgInfo() {
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                self.delegate.didFailWithError(error: error!)
                print(error!)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse!)
            }
            
            if let safeData = data {
                if let instagram = self.parseJSON(safeData) {
                    self.delegate.didUpdateInstagram(self, instagram: instagram)
                }
            }
            
            
        })

        dataTask.resume()

    }
    
    


    
    func parseJSON(_ instagramData: Data) -> InstagramModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(InstagramData.self, from: instagramData)
            let full_name = decodedData.data.full_name
            let biography = decodedData.data.biography
            let locked = decodedData.data.is_private
            let post = decodedData.data.figures.posts
            let followers = decodedData.data.figures.followers
            let following = decodedData.data.figures.following
            let picture = decodedData.data.profile_picture.normal
            
            let instagram = InstagramModel(fullName: full_name, bio: biography, locked: locked, post: post, followers: followers, following: following, profilePicture: picture)
            
            return instagram
            
            
        } catch {
            delegate.didFailWithError(error: error)
            return nil
        }
    }
    
    
    
    
}
