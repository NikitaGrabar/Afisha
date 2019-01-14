//
//  PlayerVC.swift
//  PlayVideo
//
//  Created by user on 27.12.2018.
//  Copyright © 2018 DenisBaturitskiy. All rights reserved.
//

import UIKit
import AVKit

class PlayerVC: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextButton: UIButton!

    
    // MARK: - Properties
    var player = AVPlayer()
    var textArray = ["Добрый вечер дорогие друзья","Здесь должно быть описание как пользоваться нашим приложением,но будет то что захочу я!!!","Смотрите лучше видео"]
    var textButtons = ["Далее","Далее","Выбрать город"]

    // MARK: - ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        startConfigure()
        playVideo()
        
        self.view.bringSubviewToFront(containerView)
        addNotification()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        removeNotification()
    }
   
    
    // MARK: - Configure methods
    func startConfigure() {
        pageControl.numberOfPages = textArray.count

    }
    
    func playVideo() {
        guard let path = Bundle.main.path(forResource: "videoPresent", ofType: "mov") else { return }
        self.player = AVPlayer(url: URL(fileURLWithPath: path))
        self.player.volume = 0

        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        playerLayer.videoGravity = .resizeAspectFill
        
        self.view.layer.addSublayer(playerLayer)
        self.player.play()
    }

    @objc func finishVideo() {
        self.player.seek(to: CMTime.zero)
        self.player.play()
    }
    
    func configureNextButton() {
        let item = collectionView.indexPathsForVisibleItems[0].row
        
        
        if item != textArray.count - 1{
            let indexPa = IndexPath(item: item + 1, section: 0)
            collectionView.scrollToItem(at: indexPa, at: .centeredHorizontally, animated: true)
        } else {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            
            let viewCity = storyBoard.instantiateViewController(withIdentifier: "ViewCity") as! ViewCity

            self.present(viewCity, animated:true, completion:nil)
        }
    }
    
    

    
    // MARK: -
    // MARK: - Action methods
    @IBAction func nextButton(_ sender: UIButton) {
        configureNextButton()
    }
    
    
    // MARK: -
    // MARK: - Notifications
    func addNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(PlayerVC.finishVideo), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
    }
    
    func removeNotification() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
    }
    
}


// MARK: - UICollectionViewDataSource
extension PlayerVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return textArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StartCell", for: indexPath) as! StartCell
        cell.configureCell(withText: textArray[indexPath.row])
        return cell
    }
}

extension PlayerVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageControl.currentPage = indexPath.row
        nextButton.setTitle(textButtons[indexPath.row], for: .normal)
    }
}

extension PlayerVC: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        pageControl.currentPage = index
        nextButton.setTitle(textButtons[index], for: .normal)
    }
}

extension PlayerVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 300)
    }
}

