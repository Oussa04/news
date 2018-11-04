//
//  Service.swift
//  NewsApp
//
//  Created by tarek on 02/11/2018.
//  Copyright © 2018 Youssef. All rights reserved.
//

import Foundation

/**
 *
 * Service class to fetch data from Web API service
 *
 **/
class Service {
    static let shared = Service()
    
    //base url for API end point
    let jsonUrl = "https://www.gamesundbusiness.de"

    func fetchNews( complete: @escaping ( [News]?,Error? )->() ) {
        //API end point
        guard let url = URL(string: jsonUrl+"/index.php?id=581") else {return}
        
            URLSession.shared.dataTask(with: url) { (data, response, err) in
                if let err = err {
                    complete(nil, err)
                    print("Failed to fetch courses:", err)
                    return
                }
                guard let data = data else {return}
                do{
                    let infos = try! JSONDecoder().decode([News].self, from: data)
                    DispatchQueue.main.async {
                        //returns a list of infos from API end point
                        complete(infos, nil)
                    }
                } 
    }.resume()
    }
}
