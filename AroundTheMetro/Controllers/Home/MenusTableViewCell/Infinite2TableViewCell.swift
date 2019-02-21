//
//  Infinite2TableViewCell.swift
//  Login-ATM
//
//  Created by Siamak Eshghi on 2017-12-26.
//  Copyright © 2017 SiamakEshghi. All rights reserved.
//

import UIKit


//MArk: - Menus

var menu_images: [UIImage] = [
    UIImage(named: "metro-back")!,
    UIImage(named: "ar-back")!,
    UIImage(named: "resto-back")!,
    UIImage(named: "boutiques")!,
    UIImage(named: "bh")!,
    UIImage(named: "attractions-back")!]
var menu_icons: [UIImage] = [
    UIImage(named: "metro_icon")!,
    UIImage(named: "ar_icon")!,
    UIImage(named: "resto-icon")!,
    UIImage(named: "boutique-icon")!,
    UIImage(named: "beauty-icon")!,
    UIImage(named: "attractions-icon")!]



//Menus Cell in tableView
final class Infinite2TableViewCell: UITableViewCell {
    
    static let identifier = "Infinite2TableViewCell"
    override func awakeFromNib() {
        print("awake from nib")
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    deinit {
        
    }
    var delegate: MenusProtocol?
    
    @IBOutlet weak var collectionFlowLayout: UICollectionViewFlowLayout!{
        didSet {
            collectionFlowLayout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 16)/2, height: 140)
        }
    }
    @IBOutlet weak var collectionView: InfiniteCollectionView! {
        didSet {
            collectionView.infiniteDataSource = self
            collectionView.infiniteDelegate = self
            collectionView.register(ImageCollectionViewCell.nib, forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        }
    }
    
}



// MARK: - InfiniteCollectionViewDataSource, InfiniteCollectionViewDelegate
extension Infinite2TableViewCell: InfiniteCollectionViewDataSource, InfiniteCollectionViewDelegate {
    func number(ofItems collectionView: UICollectionView) -> Int {
        return menu_images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, dequeueForItemAt dequeueIndexPath: IndexPath, cellForItemAt usableIndexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: dequeueIndexPath) as! ImageCollectionViewCell
        
        cell.imageView.image = menu_images[usableIndexPath.row]
        
        let strTextFromLocalization = fetchLanguageLoalization(index: usableIndexPath.row)
        
        cell.titleLabel.text = strTextFromLocalization
//        cell.titleLabel.text = NSLocalizedString(Constants.menu_titles[usableIndexPath.row], comment:Constants.menu_titles[usableIndexPath.row])
        cell.iconView.image = menu_icons[usableIndexPath.row]
        
        cell.configure(indexPath: usableIndexPath)
        
        return cell
    }
    
    
    
    func fetchLanguageLoalization(index: Int) -> String {
        
//        UserDefaults.standard.setSelectedLanguage(languageSelected: "zh-Hant")
        
        let key = Constants.menu_titles[index]
        
        return key.localizedToLanguage(languageSymbol: UserDefaults.standard.fetchSelectedLanguage())
    }
    
    func infiniteCollectionView(_ collectionView: UICollectionView, didSelectItemAt usableIndexPath: IndexPath) {
        print("didSelectItemAt: \(usableIndexPath.item)")
        switch usableIndexPath.row {
        case 0:
        delegate?.didMetroPlanClicked()
            break
        case 1:
       delegate?.didARListClicked()
            break
        case 2:
       delegate?.didRestaurantsClicked()
            break
        case 3:
       delegate?.didBoutiqueClicked()
            break
        case 4:
       delegate?.didBeautyHealthClicked()
            break
        case 5:
       delegate?.didAttractionsClicked()
            break

        default:
            break
        }
    }
}

protocol MenusProtocol {
    func didMetroPlanClicked()
    func didARListClicked()
    func didRestaurantsClicked()
    func didBoutiqueClicked()
    func didBeautyHealthClicked()
    func didAttractionsClicked()
}

