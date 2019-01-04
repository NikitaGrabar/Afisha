//
//  ViewCity.swift
//  PlayVideo
//
//  Created by Admin on 28.12.2018.
//  Copyright © 2018 DenisBaturitskiy. All rights reserved.
//

import UIKit

class ViewCity: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - Properties
    var newsArray = [NameCity](){
        didSet {
            self.tableView.reloadData()
        }
    }
    
    
    
    
    // MARK: -
    // MARK: - ViewController lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        getNews()
        
    }
    
    // MARK: - Configure methods
    
    
    // MARK: - NetManager methods
    func getNews() {
        NetManager.getNews { (result: [NameCity]) in
            self.newsArray = result
    }
    
}

}


 extension ViewCity: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = newsArray[indexPath.row].name
        return cell
    }
  

}

extension ViewCity : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBord : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newVC = storyBord.instantiateViewController(withIdentifier: "TapBar")
        self.present(newVC, animated: true, completion: nil)
    }
    
}



