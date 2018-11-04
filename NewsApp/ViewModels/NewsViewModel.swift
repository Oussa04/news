//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by tarek on 02/11/2018.
//  Copyright © 2018 Youssef. All rights reserved.
//

import Foundation
import UIKit

/**
 *
 * ModelView struct of the news
 *
 **/
struct NewsViewModel {
    
    //ViewModel attributes
    let image: String
    let title: String
    let description: String
    let newsBody: String
    let url: String
    
    //init with News Info data
    init(info: News) {
        self.title = info.newsTitle
        self.image = info.newsOriImage
        self.description = info.newsShortDesc
        self.newsBody = info.newsBody
        self.url = info.newsUrl
    }
}
