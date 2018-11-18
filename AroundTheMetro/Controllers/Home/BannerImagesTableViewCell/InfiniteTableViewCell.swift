//
//  InfiniteTableViewCell.swift
//  Login-ATM
//
//  Created by Siamak Eshghi on 2017-12-26.
//  Copyright © 2017 SiamakEshghi. All rights reserved.
//

import UIKit


//Baner cell in TableView
final class InfiniteTableViewCell: UITableViewCell {
    static let identifier = "InfiniteTableViewCell"
   required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    deinit {
        
    }
    
    var delegate: BannerImagesProtocol?
    
    @IBOutlet weak var collectionView: InfiniteCollectionView! {
        didSet {
            collectionView.infiniteDataSource = self
            collectionView.infiniteDelegate = self
            collectionView.register(ImageCollectionViewCell.nib, forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        }
    }
    @IBOutlet weak var layout: UICollectionViewFlowLayout! {
        didSet {
            layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 240)
        }
    }
    
    @IBOutlet weak var pageControl: UIPageControl! {
        didSet {
            pageControl.numberOfPages = bannerimages.count
        }
    }
    
}

// MARK: - InfiniteCollectionViewDataSource, InfiniteCollectionViewDelegate
extension InfiniteTableViewCell: InfiniteCollectionViewDataSource, InfiniteCollectionViewDelegate {
    func number(ofItems collectionView: UICollectionView) -> Int {
        return bannerimages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, dequeueForItemAt dequeueIndexPath: IndexPath, cellForItemAt usableIndexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: dequeueIndexPath) as! ImageCollectionViewCell
        
        let bannerimage = bannerimages[usableIndexPath.row]
        var img_link = bannerimage["imagename"] as! String
        img_link = Constants.BANNER_IMAGE_URL + img_link
        cell.imageView.kf.setImage(with:URL(string: img_link)!)
        
        cell.imageView.tag = usableIndexPath.row
        cell.configure(indexPath: usableIndexPath)
        return cell
    }
    
    
    func infiniteCollectionView(_ collectionView: UICollectionView, didSelectItemAt usableIndexPath: IndexPath) {
        delegate?.didClickBanner(index: usableIndexPath.row)
     }
    
    func scrollView(_ scrollView: UIScrollView, pageIndex: Int) {
        pageControl.currentPage = pageIndex
    }
}

protocol BannerImagesProtocol {
    func didClickBanner(index: Int)
}

