//
//  CellContent.swift
//  TableViewApp
//
//  Created by kita kensuke on 2020/06/07.
//  Copyright © 2020 kita kensuke. All rights reserved.
//

import Foundation


protocol CellContent: class {
    
    func cellInfo() -> [[String]]
    
    func secondCellInfo() -> [[String]]
    
    func thirdCellInfo() -> [[String]]
    
    //func fourthCellInfo() -> [[String]]
    
    func sectionInfo() -> [String]
}

extension CellContent {
    //セルの内容
    func cellInfo() -> [[String]] {
        let cell:[[String]] = [
            ["sparked","Spark"],
            ["bokeh","Bokeh"],
            ["fire","Fire"],
            ["fireFiles","FireFiles"],
            ["rain","Rain"],
            ["smoke","Smoke"],
            ["snow","Snow"]
        ]
        return cell
    }
    
    func secondCellInfo() -> [[String]] {
        let cell:[[String]] = [
            ["bom","Timer"]
        ]
        return cell
    }
    
    func thirdCellInfo() -> [[String]] {
        let cell:[[String]] = [
            ["food","Quiz"],
        ]
        return cell
    }
    
    //セクションのタイトル
    func sectionInfo() -> [String] {
        let section: [String] = ["SpriteKit","StopWatch","Quiz"]
        return section
    }
}
