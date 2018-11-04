//
//  NewsCell.swift
//  NewsApp
//
//  Created by tarek on 02/11/2018.
//  Copyright © 2018 Youssef. All rights reserved.
//

import UIKit

/**
 *
 * NewsCell class of the newsCollectionView
 *
 **/
class NewsCell: UICollectionViewCell {
    
    //cell outlets
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsShortDesc: UILabel!
    
    //Set the cell outlets with the newsViewModel attributes
    var newsViewModel: NewsViewModel! {
        didSet{
            newsTitle?.text = newsViewModel.title
            newsShortDesc?.text = newsViewModel.description
            newsImage?.sd_setImage(with: URL(string: Service.shared.jsonUrl+newsViewModel.image), completed: nil)
        }
    }
}
