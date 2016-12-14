//
//  Reference.swift
//
//  Created by Marcelo Sampaio on 12/14/16
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class Reference: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kReferenceTypeKey: String = "type"
  private let kReferenceCategoryIdKey: String = "categoryId"
  private let kReferenceYearKey: String = "year"

  // MARK: Properties
  public var type: String?
  public var categoryId: String?
  public var year: String?

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
    type = json[kReferenceTypeKey].string
    categoryId = json[kReferenceCategoryIdKey].string
    year = json[kReferenceYearKey].string
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = type { dictionary[kReferenceTypeKey] = value }
    if let value = categoryId { dictionary[kReferenceCategoryIdKey] = value }
    if let value = year { dictionary[kReferenceYearKey] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.type = aDecoder.decodeObject(forKey: kReferenceTypeKey) as? String
    self.categoryId = aDecoder.decodeObject(forKey: kReferenceCategoryIdKey) as? String
    self.year = aDecoder.decodeObject(forKey: kReferenceYearKey) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(type, forKey: kReferenceTypeKey)
    aCoder.encode(categoryId, forKey: kReferenceCategoryIdKey)
    aCoder.encode(year, forKey: kReferenceYearKey)
  }

}
