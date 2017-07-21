//
//  LPRecommendGoodCell.swift
//  swift519
//
//  Created by 李鹏 on 2017/7/19.
//  Copyright © 2017年 李鹏. All rights reserved.
//

import UIKit

class LPRecommendGoodCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet var collectView: UICollectionView!
    var collectItems : [HomeRecommends] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let layer = UICollectionViewFlowLayout.init()
        collectView.collectionViewLayout = layer
        collectView .register(UINib.init(nibName: "LPHomeRecommedCollectCell", bundle: nil), forCellWithReuseIdentifier: "LPHomeRecommedCollectCell")
        collectView.delegate = self
        collectView.dataSource = self
    }
    
    func configData(items: [HomeRecommends]?) {
        if let itemArray = items {
            collectItems = itemArray
        }
        
        collectView.reloadData()
        
    }
    class func cellHeight(items: [HomeRecommends]?) -> CGFloat {
        if let itemArray = items {
            let num = itemArray.count
            var row = num/2
            if num%2 > 0 {
                row = row + 1
            }
            return (kScreenWidth/2+65)*CGFloat(row) + 37
        }else {
            return 350
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectItems.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LPHomeRecommedCollectCell", for: indexPath) as! LPHomeRecommedCollectCell
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return LPHomeRecommedCollectCell.cellSize()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(5, 0, 5, 0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
