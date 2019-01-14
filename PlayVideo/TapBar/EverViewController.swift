//
//  EverViewController.swift
//  PlayVideo
//
//  Created by NikitaGrabar on 1/14/19.
//  Copyright © 2019 DenisBaturitskiy. All rights reserved.
//

import UIKit
import Alamofire
class EverViewController: UIViewController {
    
    @IBOutlet weak var EvertableView: UITableView!
    
    var more = [Results]() {
        didSet {
            self.EvertableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getMore()
        
        
    }
    func getMore() {
        NetManagerMore.getMore { (result: MoreDictionary) in
            self.more = result.results
        }
        
    }
    
}
extension EverViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return more.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = more[indexPath.row].title
        return cell
        
    }
    
}



extension EverViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyBord : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newVC = storyBord.instantiateViewController(withIdentifier: "ImageViewController") as! ImageViewController
        newVC.moreId = more[indexPath.row].id
        self.present(newVC, animated: true, completion: nil)
    }
    
}

