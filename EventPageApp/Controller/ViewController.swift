//
//  ViewController.swift
//  EventPageApp
//
//  Created by hong on 2021/12/16.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    var eventData: EventModel!

    private var collectionView: UICollectionView!
    
    var eventManger = EventManger()
    
    let imageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.frame.size.width, height: view.frame.size.width/2-2+100)
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.frame = view.bounds
        
        collectionView.register(EventCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        
        view.backgroundColor = .white
        
        // Do any additional setup after loading the view.
        eventManger.delegate = self
        eventManger.getEventData(shoppingMal: "알라딘")
        
        
    }


}

//MARK : - EventManagerDelegate
extension ViewController: EventManagerDelegate {
 
    func didUpdateEventData(_ eventManger: EventManger, event: EventModel) {
        print("업데이트 완료 ")
        DispatchQueue.main.async {
            self.imageView.kf.setImage(with: URL(string: event.imageURL[0]))
            self.eventData = event
            
            self.view.addSubview(self.collectionView)
            
        }
    }
    
    func didFailUpdateEventData(error: Error) {
        print(error)
    }
    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return eventData.imageURL.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! EventCollectionViewCell
        
        cell.EventImage.kf.setImage(with: URL(string: eventData.imageURL[indexPath.row]))
        return cell
    }
    
    
}

