//
//  Wizard+CoreDataProperties.swift
//  hufffffff
//
//  Created by wahyujus on 17/10/20.
//
//

import Foundation
import CoreData


extension Wizard {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Wizard> {
        return NSFetchRequest<Wizard>(entityName: "Wizard")
    }

    @NSManaged public var name: String?
    @NSManaged public var date: Date?
    @NSManaged public var candy: NSSet?
    
    public var wrappedName: String {
        name ?? "Unknown Wizard"
    }
    
    public var wrappedDate: Date {
        date ?? Date()
    }
    
    public var candyArray: [Candy] {
        let set = candy as? Set<Candy> ?? []
        
        return set.sorted {
            $0.wrappedCandyName < $1.wrappedCandyName
        }
    }

}

// MARK: Generated accessors for candy
extension Wizard {

    @objc(addCandyObject:)
    @NSManaged public func addToCandy(_ value: Candy)

    @objc(removeCandyObject:)
    @NSManaged public func removeFromCandy(_ value: Candy)

    @objc(addCandy:)
    @NSManaged public func addToCandy(_ values: NSSet)

    @objc(removeCandy:)
    @NSManaged public func removeFromCandy(_ values: NSSet)

}

extension Wizard : Identifiable {

}
