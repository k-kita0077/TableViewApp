//
//  CollectionViewController.swift
//  TableViewApp
//
//  Created by kita kensuke on 2020/06/09.
//  Copyright © 2020 kita kensuke. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController, CellContent {

    override func viewDidLoad() {
        super.viewDidLoad()
        // UICollectionViewを生成
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height), collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = UIColor.white
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.register(CollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        self.view.addSubview(collectionView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension CollectionViewController: UICollectionViewDelegate {
    // セル選択時の処理
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //print("CollectionRow: \(indexPath.row)")
        //print("CollectionSectionNum:\(indexPath.section)")
        
        switch indexPath.section {
        case 1:
            let vc = DetailViewController()
            vc.tappedRow = indexPath.row
            navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = DetailViewController()
            vc.tappedRow = indexPath.row
            navigationController?.pushViewController(vc, animated: true)
        default:
            let vc = DetailViewController()
            vc.tappedRow = indexPath.row
            navigationController?.pushViewController(vc, animated: true)
        }

    }
}

extension CollectionViewController: UICollectionViewDataSource {
    // セルの数を返す
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return self.cellInfo().count
        } else if section == 1 {
            return self.secondCellInfo().count
        } else {
            return self.thirdCellInfo().count
        }
    }
    
    // ヘッダーの数
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.sectionInfo().count
    }
    
    // セルの設定
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell",for: indexPath as IndexPath) as! CollectionViewCell
        
        if indexPath.section == 0 {
            let cellImage = UIImage(named: self.cellInfo()[indexPath.row][0])!
            let cellText = self.cellInfo()[indexPath.row][1]
            cell.setUpContents(image: cellImage,textName: cellText)
        } else if indexPath.section == 1 {
            let cellImage = UIImage(named: self.secondCellInfo()[indexPath.row][0])!
            let cellText = self.secondCellInfo()[indexPath.row][1]
            cell.setUpContents(image: cellImage,textName: cellText)
        } else {
            let cellImage = UIImage(named: self.thirdCellInfo()[indexPath.row][0])!
            let cellText = self.thirdCellInfo()[indexPath.row][1]
            cell.setUpContents(image: cellImage,textName: cellText)
        }
        return cell
    }
    
    // ヘッダーの設定
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let collectionViewHeader = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header", for: indexPath) as! CollectionReusableView
        let headerText = self.sectionInfo()[indexPath.section]
        collectionViewHeader.setUpContents(titleText: headerText)
        return collectionViewHeader
    }
}

extension CollectionViewController:  UICollectionViewDelegateFlowLayout {
    // セルの大きさ
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    // セルの余白
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    // ヘッダーのサイズ
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.view.frame.size.width, height:50)
    }
}

