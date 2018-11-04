//
//  News.swift
//  NewsApp
//
//  Created by tarek on 02/11/2018.
//  Copyright © 2018 Youssef. All rights reserved.
//

import Foundation

/**
 *
 * Model struct for the news info
 *
 **/
struct News: Decodable {
    let newsId: Int
    let newsTitle: String
    let newsSubTitle: String
    let newsOriImage: String
    let newsThumbImage: String
    let newsShortDesc: String
    let newsBody: String
    let newsUrl: String
}
