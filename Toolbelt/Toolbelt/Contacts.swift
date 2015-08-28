//
//  Contacts.swift
//  Toolbelt
//
//  Created by Alexander G Edge on 07/08/2015.
//  Copyright © 2015 Alexander Edge. All rights reserved.
//

import Contacts // iOS 9
import AddressBook // iOS 8

@available(iOS 2.0, OSX 10.11, *)
public func NSLocalizedStringFromName(givenName : String?, familyName : String?) -> String {
    
    #if os(iOS)
        if #available(iOS 9.0, *) {
            let contact = CNMutableContact()
            if let name = givenName {
                contact.givenName = name
            }
            if let name = familyName {
                contact.familyName = name
            }
            return CNContactFormatter.stringFromContact(contact, style: .FullName)!
        } else {
            let record = ABPersonCreate().takeRetainedValue()
            if let name = givenName {
                ABRecordSetValue(record, kABPersonFirstNameProperty, name, nil)
            }
            if let name = familyName {
                ABRecordSetValue(record, kABPersonLastNameProperty, name, nil)
            }
            return ABRecordCopyCompositeName(record).takeRetainedValue() as String
        }
    #else
        let contact = CNMutableContact()
        if let name = givenName {
            contact.givenName = name
        }
        if let name = familyName {
            contact.familyName = name
        }
        return CNContactFormatter.stringFromContact(contact, style: .FullName)!
    #endif
    
    
}