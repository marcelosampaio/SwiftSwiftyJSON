//
//  References.swift
//
//  Created by Marcelo Sampaio on 12/14/16
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class References: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kReferencesReferenceKey: String = "reference"

  // MARK: Properties
  public var reference: Reference?

  // MARK: SwiftyJSON Initalizers
  /**
   Initates the instance based on the object
   - parameter object: The object of either Dictionary or Array kind that was passed.
   - returns: An initalized instance of the class.
  */
  convenience public init(object: Any) {
    self.init(json: JSON(object))
  }

  /**
   Initates the instance based on the JSON that was passed.
   - parameter json: JSON object from SwiftyJSON.
   - returns: An initalized instance of the class.
  */
  public init(json: JSON) {
    reference = Reference(json: json[kReferencesReferenceKey])
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = reference { dictionary[kReferencesReferenceKey] = value.dictionaryRepresentation() }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.reference = aDecoder.decodeObject(forKey: kReferencesReferenceKey) as? Reference
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(reference, forKey: kReferencesReferenceKey)
  }

}
