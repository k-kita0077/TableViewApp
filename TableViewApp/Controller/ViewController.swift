//
//  ViewController.swift
//  TableViewApp
//
//  Created by kita kensuke on 2020/06/07.
//  Copyright © 2020 kita kensuke. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath) as! TableViewCell
        
        cell.iconView.image = UIImage(named: "02")
        cell.titleLabel.text = "タイトル"
        return cell
        
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("クリックした行は\(indexPath)")
//        let vc = BokenViewController()
//
//        navigationController?.pushViewController(vc, animated: true)
//    }

}

