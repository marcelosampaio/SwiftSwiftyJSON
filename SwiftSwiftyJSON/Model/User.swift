//
//  User.swift
//
//  Created by Marcelo Sampaio on 12/14/16
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class User: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private let kUserInternalIdentifierKey: String = "id"
  private let kUserNameKey: String = "name"
  private let kUserEmailKey: String = "email"

  // MARK: Properties
  public var internalIdentifier: String?
  public var name: String?
  public var email: String?

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
    internalIdentifier = json[kUserInternalIdentifierKey].string
    name = json[kUserNameKey].string
    email = json[kUserEmailKey].string
  }

  /**
   Generates description of the object in the form of a NSDictionary.
   - returns: A Key value pair containing all valid values in the object.
  */
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = internalIdentifier { dictionary[kUserInternalIdentifierKey] = value }
    if let value = name { dictionary[kUserNameKey] = value }
    if let value = email { dictionary[kUserEmailKey] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.internalIdentifier = aDecoder.decodeObject(forKey: kUserInternalIdentifierKey) as? String
    self.name = aDecoder.decodeObject(forKey: kUserNameKey) as? String
    self.email = aDecoder.decodeObject(forKey: kUserEmailKey) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(internalIdentifier, forKey: kUserInternalIdentifierKey)
    aCoder.encode(name, forKey: kUserNameKey)
    aCoder.encode(email, forKey: kUserEmailKey)
  }

}
