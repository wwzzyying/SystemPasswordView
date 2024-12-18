//
//  SystemPasswordView.swift
//  MoneySnap
//
//  Created by Jyuuroku Wu on 2024/12/18.
//

import SwiftUI

public struct SystemPasswordView: View {
    @Binding var isPresented: Bool
    @State private var password: String = ""
    @State private var clickFeedback: Bool = false
    @State private var shakeOffset: CGFloat = 0
    @State private var triggerError: Bool = false
    let title: String
    let onComplete: (String) -> Bool
    
    private let maxDigits = 6

    public init(isPresented: Binding<Bool>, title: String, onComplete: @escaping (String) -> Bool) {
        self._isPresented = isPresented
        self.title = title
        self.onComplete = onComplete
    }
    
    public var body: some View {
        VStack(spacing: 24) {
            Spacer()
            
            // title
            Text(title)
                .font(.title2)
            
            // password dot
            HStack(spacing: 20) {
                ForEach(0..<maxDigits, id: \.self) { index in
                    Circle()
                        .fill(index < password.count ? Color.primary : Color.primary.opacity(0.3))
                        .frame(width: 12, height: 12)
                }
            }
            .offset(x: shakeOffset)
            .padding(.top, 12)
            .padding(.bottom, 32)
            
            // number pad
            VStack(spacing: 20) {
                ForEach(0..<3) { row in
                    HStack(spacing: 40) {
                        ForEach(1...3, id: \.self) { column in
                            let number = row * 3 + column
                            NumberButton(number: "\(number)") {
                                addDigit("\(number)")
                                clickFeedback.toggle()
                            }
                        }
                    }
                }
                
                // last row: cancel, 0, delete
                HStack(spacing: 40) {
                    Button("Cancel") {
                        isPresented = false
                    }
                    .frame(width: 80, height: 80)
                    
                    NumberButton(number: "0") {
                        addDigit("0")
                        clickFeedback.toggle()
                    }
                    
                    Button {
                        deleteDigit()
                        clickFeedback.toggle()
                    } label: {
                        Image(systemName: "delete.left")
                            .font(.system(size: 24))
                            .foregroundColor(.primary)
                    }
                    .frame(width: 80, height: 80)
                }
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .sensoryFeedback(.impact(weight: .light), trigger: clickFeedback)
        .sensoryFeedback(.error, trigger: triggerError)
    }
    
    private func addDigit(_ digit: String) {
        guard password.count < maxDigits else { return }
        password += digit
        
        if password.count == maxDigits {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                let isValid = onComplete(password)
                if !isValid {
                    withAnimation(.spring(response: 0.15, dampingFraction: 0.2)) {
                        shakeOffset = 20
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        withAnimation(.spring(response: 0.15, dampingFraction: 0.2)) {
                            shakeOffset = -20
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            withAnimation(.spring(response: 0.15, dampingFraction: 0.2)) {
                                shakeOffset = 0
                            }
                        }
                    }
                    
                    triggerError.toggle()
                    password = ""
                }
            }
        }
    }
    
    private func deleteDigit() {
        guard !password.isEmpty else { return }
        password.removeLast()
    }
}

#Preview {
    SystemPasswordView(isPresented: .constant(true), title: "Please input password", onComplete: { _ in false })
}
