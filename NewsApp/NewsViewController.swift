//
//  ViewController.swift
//  NewsApp
//
//  Created by tarek on 01/11/2018.
//  Copyright © 2018 Youssef. All rights reserved.
//

import UIKit
import SDWebImage

/**
 *
 * ViewController of the main ( first view )
 *
 **/
class NewsViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    @IBOutlet weak var newsCollectionView: UICollectionView!
    
    //This is a category array for UI display puposes, there is no action made on this array
    var categories = ["Reise", "Sport","Geschäft","Bourse","Technik","Kultur"]
    var newsViewModels = [NewsViewModel]()
    var selectedIndexPath: IndexPath?
    lazy var service: Service = {
        return Service()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Init the static view
        initView()
        
        // Fetch data from server
        initData()
    }
    
    //Navigation title
    func initView() {
        self.navigationController?.navigationBar.topItem?.title = "News Magazine"
    }
    
    //call service method fetchNews in order to populate the newsCollectionView with data
    func initData() {
        service.fetchNews { (infos, error) in
            if let err = error {
                print("failed ", err)
            }
            self.newsViewModels = infos?.map({return NewsViewModel(info: $0)}) ?? []
            self.newsCollectionView.reloadData()
        }
    }
}

// NewsViewController extension for the delegate and the dataSource
extension NewsViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.categoriesCollectionView {
            return categories.count
        } else {
            return self.newsViewModels.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.categoriesCollectionView {
            // Down cast cell as CategoryCell
            let cell = categoriesCollectionView.dequeueReusableCell(withReuseIdentifier: "categorieCell", for: indexPath) as! CategoryCell
            cell.nameLabel.text = categories[indexPath.row]
            return cell
        } else{
            // Down cast cell as NewsCell
            let cell: NewsCell = newsCollectionView.dequeueReusableCell(withReuseIdentifier: "newsCell", for: indexPath) as! NewsCell
            let newsViewModel = self.newsViewModels[indexPath.row]
            cell.newsViewModel = newsViewModel
            return cell
        }
    }
    
    //Prepare for segue to send data to NewsDetailViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetails" {
            if let indexPath = self.newsCollectionView?.indexPath(for: sender as! NewsCell) {
                let destination = segue.destination as! NewsDetailViewController
                let news = self.newsViewModels[indexPath.row]
                destination.infoTitle = news.title
                destination.infoBody = news.newsBody
                destination.infoURL = news.url
                destination.infoImage = news.image
            }
        }
    }
}




