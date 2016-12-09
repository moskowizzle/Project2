//
//  ViewController.swift
//  Project 2
//
//  Created by Andrew Moskowitz on 12/5/16.
//  Copyright © 2016 Andrew Moskowitz. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell") as! MainTableViewCell
        
        return cell
    }
    
    private func fetchData(closure: @escaping (String) -> ()) {
        
        let endpoint = "https://newsapi.org/v1/articles?source=fox-sports&sortBy=top&apiKey=e485a31dbe5b43f19ae899ba6029d1f8"
        let url = URLRequest(url: URL(string: endpoint)!)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: url) { (data, response, error) in
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            DispatchQueue.main.async {
                closure(String(data: responseData, encoding: String.Encoding.utf8)!)
            }
            
            
        }
        task.resume()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

