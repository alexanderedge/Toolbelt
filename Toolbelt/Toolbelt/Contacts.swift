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
public func NSLocalizedStringFromName(_ givenName : String?, familyName : String?) -> String {
    
    if #available(iOS 9.0, *) {
        let contact = CNMutableContact()
        if let name = givenName {
            contact.givenName = name
        }
        if let name = familyName {
            contact.familyName = name
        }
        return CNContactFormatter.string(from: contact, style: .fullName)!
    } else {
        let record = ABPersonCreate().takeRetainedValue()
        if let name = givenName {
            ABRecordSetValue(record, kABPersonFirstNameProperty, name as CFTypeRef!, nil)
        }
        if let name = familyName {
            ABRecordSetValue(record, kABPersonLastNameProperty, name as CFTypeRef!, nil)
        }
        return ABRecordCopyCompositeName(record).takeRetainedValue() as String
    }
    
}

public struct Contacts {
    
    public enum AuthorisationStatus {
        case authorised, denied, restricted
    }
    
    public static func requestAccess(_ completion : ((AuthorisationStatus) -> Void)?) {
        
        if #available(iOS 9, *) {
            switch CNContactStore.authorizationStatus(for: .contacts) {
            case .notDetermined:
                CNContactStore().requestAccess(for: .contacts) { success, error in
                    DispatchQueue.main.async {
                        if success {
                            completion?(.authorised)
                        } else {
                            completion?(.denied)
                        }
                    }
                }
                break
            case .authorized:
                DispatchQueue.main.async { completion?(.authorised) }
                break
            case .denied:
                DispatchQueue.main.async { completion?(.denied) }
                break
            case .restricted:
                DispatchQueue.main.async { completion?(.restricted) }
                break
            }
        } else {
            switch ABAddressBookGetAuthorizationStatus() {
            case .notDetermined:
                ABAddressBookRequestAccessWithCompletion(ABAddressBookCreateWithOptions(nil, nil).takeRetainedValue()) { granted, error in
                    DispatchQueue.main.async {
                        if granted {
                            completion?(.authorised)
                        } else {
                            completion?(.denied)
                        }
                    }
                }
                break
            case .authorized:
                DispatchQueue.main.async { completion?(.authorised) }
                break
            case .denied:
                DispatchQueue.main.async { completion?(.denied) }
                break
            case .restricted:
                DispatchQueue.main.async { completion?(.restricted) }
                break
            }
            
        }
    }
}

