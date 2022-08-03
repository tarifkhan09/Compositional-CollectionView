//
//  ViewController.swift
//  CompositionalCollectionView
//
//  Created by MD Tarif khan on 31/7/22.
//

import UIKit

class ViewController: UIViewController {

    
//    let images = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25"]

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.collectionViewLayout = createLayout()
    }

    
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        
        let item1 = CompositionalLayout.createItem(width: .fractionalWidth(1), height: .fractionalHeight(1), spacing: 2)
        let verticalGroup = CompositionalLayout.createGroup(alignment: .vertical, width: .fractionalWidth(0.5), height: .fractionalHeight(1), item: item1, count: 2)
        
        let item2 = CompositionalLayout.createItem(width: .fractionalWidth(1), height: .fractionalHeight(1), spacing: 2)
        let verticalGroup2 = CompositionalLayout.createGroup(alignment: .vertical, width: .fractionalWidth(0.5), height: .fractionalHeight(1), item: item2, count: 2)
        
        let horizontalGroup = CompositionalLayout.createGroup(alignment: .horizontal, width: .fractionalWidth(0.5), height: .fractionalHeight(1), items: [verticalGroup, verticalGroup2])
        
        //uper group
        let mainItem = CompositionalLayout.createItem(width: .fractionalWidth(0.5), height: .fractionalHeight(1), spacing: 2)
        let mainGroup = CompositionalLayout.createGroup(alignment: .horizontal, width: .fractionalWidth(1), height: .fractionalHeight(0.26), items: [mainItem, horizontalGroup])
        
        
        //full group
        
        let item = CompositionalLayout.createItem(width: .fractionalWidth(0.25), height: .fractionalHeight(1), spacing: 3)
        let underGroup = CompositionalLayout.createGroup(alignment: .horizontal, width: .fractionalWidth(1), height: .fractionalHeight(0.13), item: item, count: 4)
        let underGroup2 = CompositionalLayout.createGroup(alignment: .horizontal, width: .fractionalWidth(1), height: .fractionalHeight(0.13), item: item, count: 4)
        let underGroup3 = CompositionalLayout.createGroup(alignment: .horizontal, width: .fractionalWidth(1), height: .fractionalHeight(0.13), item: item, count: 4)
        let underGroup4 = CompositionalLayout.createGroup(alignment: .horizontal, width: .fractionalWidth(1), height: .fractionalHeight(0.13), item: item, count: 4)
        let underGroup5 = CompositionalLayout.createGroup(alignment: .horizontal, width: .fractionalWidth(1), height: .fractionalHeight(0.13), item: item, count: 4)
        let underGroup6 = CompositionalLayout.createGroup(alignment: .horizontal, width: .fractionalWidth(1), height: .fractionalHeight(0.13), item: item, count: 4)
        let underGroup7 = CompositionalLayout.createGroup(alignment: .horizontal, width: .fractionalWidth(1), height: .fractionalHeight(0.13), item: item, count: 4)
        let underGroup8 = CompositionalLayout.createGroup(alignment: .horizontal, width: .fractionalWidth(1), height: .fractionalHeight(0.13), item: item, count: 4)
        let underGroup9 = CompositionalLayout.createGroup(alignment: .horizontal, width: .fractionalWidth(1), height: .fractionalHeight(0.13), item: item, count: 4)
        let underGroup10 = CompositionalLayout.createGroup(alignment: .horizontal, width: .fractionalWidth(1), height: .fractionalHeight(0.13), item: item, count: 4)
        let underGroup11 = CompositionalLayout.createGroup(alignment: .horizontal, width: .fractionalWidth(1), height: .fractionalHeight(0.13), item: item, count: 4)

        
        let fullGroup = CompositionalLayout.createGroup(alignment: .vertical, width: .fractionalWidth(1), height: .fractionalHeight(0.9), items: [mainGroup, underGroup,underGroup2,underGroup3,underGroup4,underGroup5,underGroup6,underGroup7,underGroup8,underGroup9,underGroup10,underGroup11])
        
        
        let section = NSCollectionLayoutSection(group: fullGroup)
        
        // return
        return UICollectionViewCompositionalLayout(section: section)
    }
    

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 25
        
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
//        cell.imgView.image = UIImage(named: images[indexPath.row])
        return cell
        
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Clicked")
    }
}



class CollectionViewCell: UICollectionViewCell{
    @IBOutlet weak var imgView: UIImageView!
    
    func setup(image: UIImage){
        imgView.image = image
    }
    
}
