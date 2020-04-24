//
//  DoneButtonField.swift
//  DoneFieldLab
//
//  Created by Danilo Campos on 4/24/20.
//  Copyright © 2020 Danilo Campos. All rights reserved.
//

import UIKit
import SwiftUI
import Combine

struct DoneButtonFieldView: View, UIViewRepresentable {
    
    @Binding var text: String
    let keyboardType: UIKeyboardType
    
    func makeUIView(context: Context) -> DoneButtonField {

        let field = DoneButtonField()
        field.keyboardType = keyboardType
        field.textBinding = $text
        field.configure()
        field.borderStyle = .roundedRect
        
        return field
        
    }

    func updateUIView(_ uiView: DoneButtonField, context: Context) {
    }
}

class DoneButtonField: UITextField, UITextFieldDelegate, ObservableObject {
    
    var toolbar: UIToolbar?
        
    var textBinding: Binding<String>? {
        didSet {
            text = textBinding?.wrappedValue
        }
    }
    
    var subscription: AnyCancellable?
    
    func configure() {
        if toolbar == nil {
            toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: (self.window?.bounds.width ?? 300.0), height: 44.0))
            let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleDone))
            toolbar?.items = [doneButton]
            self.inputAccessoryView = toolbar
        }
        
        self.delegate = self
     
        subscription = NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: self)
            .sink { _ in
                self.textBinding?.wrappedValue = self.text ?? ""
        }
    }

    @objc func handleDone() {
        self.resignFirstResponder()
    }
    
}
