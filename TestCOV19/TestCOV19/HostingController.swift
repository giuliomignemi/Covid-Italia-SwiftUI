//
//  HostingController.swift
//  TestCOV19
//
//  Created by Giulio Mignemi on 24/04/2020.
//  Copyright © 2020 Giulio Mignemi. All rights reserved.
//

import SwiftUI

final class HostingController<T: View>: UIHostingController<T> {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }
}
