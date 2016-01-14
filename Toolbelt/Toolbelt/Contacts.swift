//
//  Contacts.swift
//  Toolbelt
//
//  Created by Alexander G Edge on 07/08/2015.
//  Copyright © 2015 Alexander Edge. All rights reserved.
//

import Contacts // iOS 9
import AddressBook // iOS 8

@available(iOS 2.0, *)
public func NSLocalizedStringFromName(givenName : String?, familyName : String?) -> String {
    
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
    
}

public struct Contacts {
    
    public enum AuthorisationStatus {
        case Authorised, Denied, Restricted
    }
    
    public static func requestAccess(completion : (AuthorisationStatus -> Void)?) {
        
        if #available(iOS 9, *) {
            switch CNContactStore.authorizationStatusForEntityType(.Contacts) {
            case .NotDetermined:
                CNContactStore().requestAccessForEntityType(.Contacts) { success, error in
                    Queue.Main.execute {
                        if success {
                            completion?(.Authorised)
                        } else {
                            completion?(.Denied)
                        }
                    }
                }
                break
            case .Authorized:
                Queue.Main.execute { completion?(.Authorised) }
                break
            case .Denied:
                Queue.Main.execute { completion?(.Denied) }
                break
            case .Restricted:
                Queue.Main.execute { completion?(.Restricted) }
                break
            }
        } else {
            switch ABAddressBookGetAuthorizationStatus() {
            case .NotDetermined:
                ABAddressBookRequestAccessWithCompletion(ABAddressBookCreateWithOptions(nil, nil).takeRetainedValue()) { granted, error in
                    Queue.Main.execute {
                        if granted {
                            completion?(.Authorised)
                        } else {
                            completion?(.Denied)
                        }
                    }
                }
                break
            case .Authorized:
                Queue.Main.execute { completion?(.Authorised) }
                break
            case .Denied:
                Queue.Main.execute { completion?(.Denied) }
                break
            case .Restricted:
                Queue.Main.execute { completion?(.Restricted) }
                break
            }
            
        }
    }
}

