//
//  ViewController.swift
//  TableViewApp
//
//  Created by kita kensuke on 2020/06/07.
//  Copyright © 2020 kita kensuke. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CellContent {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
        configureTableViewCell()
    }
    
    func configureTableViewCell() {
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        let cellID = "CellID"
        
        tableView.register(nib, forCellReuseIdentifier: cellID)
    }
    
    //セクションの数　配列の数で決定
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sectionInfo().count
    }
    
    //セクションのタイトル
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sectionInfo()[section]
    }
    
    //セクション毎のセルの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return self.cellInfo().count
        } else if section == 1 {
            return self.secondCellInfo().count
        } else {
            return self.thirdCellInfo().count
        }
    }
    
    //セルの中身
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath) as! TableViewCell

        if indexPath.section == 0 {
            cell.iconView.image = UIImage(named: self.cellInfo()[indexPath.row][0])
            cell.titleLabel.text = self.cellInfo()[indexPath.row][1]
        } else if indexPath.section == 1 {
            cell.iconView.image = UIImage(named: self.secondCellInfo()[indexPath.row][0])
            cell.titleLabel.text = self.secondCellInfo()[indexPath.row][1]
        } else {
            cell.iconView.image = UIImage(named: self.thirdCellInfo()[indexPath.row][0])
            cell.titleLabel.text = self.thirdCellInfo()[indexPath.row][1]
        }
        return cell
        
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print("TableRow: \(indexPath.row)")
        //print("TableSectionNum:\(indexPath.section)")
        switch indexPath.section {
        case 1:
            if indexPath.row == 7 {
                let vc = DetailViewController()
                vc.tappedRow = indexPath.row
                navigationController?.pushViewController(vc, animated: true)
            } else {
                let vc = DetailViewController()
                vc.tappedRow = indexPath.row
                navigationController?.pushViewController(vc, animated: true)
            }
            
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

