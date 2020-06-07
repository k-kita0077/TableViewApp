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
    
    //func thirdCellInfo() -> [[String]]
    
    //func fourthCellInfo() -> [[String]]
    
    func sectionInfo() -> [String]
}

extension CellContent {
    func cellInfo() -> [[String]] {
        let cell:[[String]] = [
            ["02","タイトル1"],
            ["02","タイトル2"],
            ["02","タイトル3"],
        ]
        return cell
    }
    
    func secondCellInfo() -> [[String]] {
        let cell:[[String]] = [
            ["02","タイトル4"],
            ["02","タイトル5"],
            ["02","タイトル6"],
        ]
        return cell
    }
    
    func sectionInfo() -> [String] {
        let section: [String] = ["SpriteKit","ARKit"]
        return section
    }
}
