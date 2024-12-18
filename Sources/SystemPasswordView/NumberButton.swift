//
//  NumberButton.swift
//  MoneySnap
//
//  Created by Jyuuroku Wu on 2024/12/18.
//

import SwiftUI

public struct NumberButton: View {
    let number: String
    let action: () -> Void

    public init(number: String, action: @escaping () -> Void) {
        self.number = number
        self.action = action
    }
    
    public var body: some View {
        Button(action: action) {
            Text(number)
                .font(.title)
                .foregroundColor(.primary)
        }
        .frame(width: 80, height: 80)
    }
}