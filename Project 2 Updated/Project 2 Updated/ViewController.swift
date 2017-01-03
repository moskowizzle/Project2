//
//  ViewController.swift
//  Project 2 Updated
//
//  Created by Andrew Moskowitz on 12/18/16.
//  Copyright © 2016 Andrew Moskowitz. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var articleTableView: UITableView!
    var articles: [Article]? = []
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleCell
        
        cell.articleHeadlineLabel.text = self.articles?[indexPath.item].headline
        cell.articleDescriptionLabel.text = self.articles?[indexPath.item].description
        cell.articleImageView.downloadImage(from: (self.articles?[indexPath.item].imageUrl!)!)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let articleVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "article") as! ArticleViewController
        
        articleVC.url = self.articles?[indexPath.item].url
        
        self.present(articleVC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    func fetchData() {
        let urlRequest = URLRequest(url: URL(string: "https://newsapi.org/v1/articles?source=fox-sports&sortBy=latest&apiKey=e485a31dbe5b43f19ae899ba6029d1f8")!)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if error != nil {
                print(error)
                return
            }
            
            self.articles = [Article]()
            
            do {
                
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: Any]
                
                if let articlesFromJson = json["articles"] as? [[String: Any]] {
                    for articleFromJson in articlesFromJson {
                        let article = Article()
                        if let title = articleFromJson["title"] as? String, let description = articleFromJson["description"] as? String, let url = articleFromJson["url"] as? String, let urlToImage = articleFromJson["urlToImage"] as? String {
                            
                            article.headline = title
                            article.url = url
                            article.description = description
                            article.imageUrl = urlToImage
                        }
                        self.articles?.append(article)
                    }
                }
                DispatchQueue.main.async {
                    self.articleTableView.reloadData()
                }
            } catch let error {
                print(error)
            }
        }
        task.resume()
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension UIImageView {
    func downloadImage(from url: String) {
        
        let urlRequest = URLRequest(url: URL(string: url)!)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if error != nil {
                print(error)
                return
            }
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
        }
        task.resume()
    }
}
