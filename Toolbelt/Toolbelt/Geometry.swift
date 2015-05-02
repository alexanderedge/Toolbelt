//
//  Geometry.swift
//  Toolbelt
//
//  Created by Alexander G Edge on 02/05/2015.
//  Copyright (c) 2015 Alexander Edge. All rights reserved.
//

import Foundation
import CoreGraphics

public func CGRectDiagonal(rect: CGRect) -> CGFloat {
    return sqrt(pow(rect.size.width,2) + pow(rect.size.height,2))
}