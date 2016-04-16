//
//  String.swift
//  Weather
//
//  Created by Daniel Devesa Derksen-Staats on 22/02/2016.
//  Copyright © 2016 Desfici. All rights reserved.
//

import Foundation

extension String {

    mutating func appendPathComponent(var pathComponent: String) {
        let stringEndIndex = self.endIndex.advancedBy(-1)
        let pathComponentStartIndex = pathComponent.startIndex
        let separatorCharacter: Character = "/"
        
        self.removeCharacterIfExistsAtIndex(stringEndIndex, character: separatorCharacter)
        
        pathComponent.removeCharacterIfExistsAtIndex(pathComponentStartIndex,
                                                     character: separatorCharacter)
        
        self.append(separatorCharacter)
        self = self + pathComponent
    }
    
    private mutating func removeCharacterIfExistsAtIndex(stringIndex: Index, character: Character) {
        if self[stringIndex] == character {
            self.removeAtIndex(stringIndex)
        }
    }
}
