//
//  Candy+CoreDataProperties.swift
//  hufffffff
//
//  Created by wahyujus on 17/10/20.
//
//

import Foundation
import CoreData


extension Candy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Candy> {
        return NSFetchRequest<Candy>(entityName: "Candy")
    }

    @NSManaged public var candyName: String?
    @NSManaged public var origin: Wizard?
    
    public var wrappedCandyName: String{
        candyName ?? "Unknown Candy"
    }

}

extension Candy : Identifiable {

}
