//
//  NewsDetailViewController.swift
//  NewsApp
//
//  Created by tarek on 02/11/2018.
//  Copyright © 2018 Youssef. All rights reserved.
//

import UIKit
import SDWebImage
import Atributika

/**
 *
 * NewsDetailViewController of the main ( news details view )
 *
 **/
class NewsDetailViewController: UIViewController {

    // news attributs
    var infoTitle = ""
    var infoBody = ""
    var infoImage = ""
    var infoURL = ""
    
    //Service class instance
    lazy var service: Service = {
        return Service()
    }()
    
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsBody: UITextView!
    @IBOutlet weak var newsURL: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTitle.text = infoTitle
        newsImage.sd_setImage(with: URL(string: service.jsonUrl+infoImage), completed: nil)
        newsBody.attributedText = formatBody(text: infoBody)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //The See more Button opens browser with the news website link
    @IBAction func seeMoreButton(_ sender: Any) {
        UIApplication.shared.open(URL(string: service.jsonUrl+infoURL)!, options: [:], completionHandler: nil)
    }
    
    //formatBody function returns NSAttributedString to customize and display html attributs
    func formatBody(text: String) -> NSAttributedString {
        let textColor = #colorLiteral(red: 0.8392156863, green: 0.8392156863, blue: 0.8392156863, alpha: 1)
        let font = UIFont(name: "Merriweather-LightItalic", size: 16)
        let boldFont = UIFont(name: "Merriweather-Bold", size: 17)
        let strong = Style("strong").font(boldFont!).foregroundColor(textColor)
        let all = Style.font(font!).foregroundColor(textColor)
        return text.style(tags: strong).styleAll(all).attributedString
    }

}
