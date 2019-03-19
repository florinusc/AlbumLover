//
//  String+Extension.swift
//  AlbumLover
//
//  Created by Florin Uscatu on 19/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

extension String {
    func fromSecondsToDuration() -> String {
        guard let intValue = Int(self) else { return "00:00" }
        let minutes = intValue / 60
        let remainder = intValue % 60
        var remainderString = String(remainder)
        if remainderString.count == 1 {
            remainderString = "0" + remainderString
        }
        return "\(minutes):\(remainderString)"
    }
}
