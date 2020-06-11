//
//  DetailViewController.swift
//  TableViewApp
//
//  Created by kita kensuke on 2020/06/09.
//  Copyright © 2020 kita kensuke. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var tappedSection: Int?
    var tappedRow: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let tappedSection = tappedSection else {return}
        guard let tappedRow = tappedRow else {return}
        
        print("Section:\(tappedSection)")
        print("Row:\(tappedRow)")
        
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
