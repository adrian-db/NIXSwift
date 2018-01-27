//
//  Alert.swift
//  NIXSwift
//
//  Created by Adrian Bigland on 27/01/2018.
//  Copyright © 2018 Adrian Bigland. All rights reserved.
//

import Foundation

struct Nix {

/// Wraps UIAlertController, making it more concise to use in most cases.
///
/// Example of use (in a UIViewController):
///
/// present(Nix.Alert(title: "Warning!", message: "Don't press the button!")
///            .withOK()
///            .andAction("PRESS IT", style: .destructive){_ in print("BOOM!!!")})
///
/// Or even as concise as:
///
/// present(Nix.Alert(message: "Hello, World!").withOK())
///
struct Alert {
    
    /// A function that creates a UIAlertController.
    ///
    typealias Factory = ()->UIAlertController
    
    /// A function that creates a UIAlertController.
    ///
    fileprivate let create: Nix.Alert.Factory
    
    /// Creates an Alert.
    ///
    /// - Parameter create: A function that creates a UIAlertController.
    ///
    private init(_ create: @escaping Nix.Alert.Factory) {
        self.create = create
    }
    
    /// Creates an Alert.
    ///
    /// - Parameters:
    ///     - title: The alert title. Defaults to an empty title.
    ///     - message: The alert body text.
    ///     - preferredStyle: The style of the alert, if the current platform supports it. Defaults to the default style.
    ///
    init(title: String? = nil, message: String, preferredStyle: UIAlertControllerStyle = .alert) {
        
        self.init({return UIAlertController(title: title, message: message, preferredStyle: preferredStyle)})
    }
    
    /// Adds an action to this Alert.
    ///
    /// - Parameters:
    ///     - title: The title of the action. Defaults to an empty title.
    ///     - style: The action style. Defaults to the default style.
    ///     - handler: A closure executed when the action is selected. By default, nothing is executed.
    ///
    /// - Returns: This alert, with the given action added.
    ///
    func withAction(_ title: String?, style: UIAlertActionStyle = .default, handler: ((UIAlertAction)->Void)? = nil)->Alert {
        
        return Alert({
            let controller = self.create()
            controller.addAction(UIAlertAction(title: title, style: style, handler: handler))
            return controller
        })
    }
    
    /// Adds an action to this Alert.
    ///
    /// - Parameters:
    ///     - title: The title of the action. Defaults to an empty title.
    ///     - style: The action style. Defaults to the default style.
    ///     - handler: A closure executed when the action is selected. By default, nothing is executed.
    ///
    /// - Returns: This alert, with the given action added.
    ///
    func andAction(_ title: String?, style: UIAlertActionStyle = .default, handler: ((UIAlertAction)->Void)? = nil)->Alert {
        return withAction(title, style: style, handler: handler)
    }
    
    /// Adds an OK action to this Alert.
    ///
    /// - Parameters:
    ///     - title: The title of the action. Defaults to "OK".
    ///     - handler: A closure executed when the action is selected. By default, nothing is executed.
    ///
    /// - Returns: This alert, with the given action added.
    ///
    func withOK(title: String? = "OK", handler: ((UIAlertAction)->Void)? = nil)->Alert {
        return withAction(title, handler: handler)
    }
  
    /// Adds an OK action to this Alert.
    ///
    /// - Parameters:
    ///     - title: The title of the action. Defaults to "OK".
    ///     - handler: A closure executed when the action is selected. By default, nothing is executed.
    ///
    /// - Returns: This alert, with the given action added.
    ///
    func andOK(title: String? = "OK", handler: ((UIAlertAction)->Void)? = nil)->Alert {
        return withOK(title: title, handler: handler)
    }
    
    /// Adds a Cancel action to this Alert.
    ///
    /// - Parameters:
    ///     - title: The title of the action. Defaults to "Cancel".
    ///     - handler: A closure executed when the action is selected. By default, nothing is executed.
    ///
    /// - Returns: This alert, with the given action added.
    ///
    func withCancel(title: String? = "Cancel", handler: ((UIAlertAction)->Void)? = nil)->Alert {
        return withAction(title, style: .cancel, handler: handler)
    }
    
    /// Adds a Cancel action to this Alert.
    ///
    /// - Parameters:
    ///     - title: The title of the action. Defaults to "Cancel".
    ///     - handler: A closure executed when the action is selected. By default, nothing is executed.
    ///
    /// - Returns: This alert, with the given action added.
    ///
    func andCancel(title: String? = "Cancel", handler: ((UIAlertAction)->Void)? = nil)->Alert {
        return withCancel(title: title, handler: handler)
    }
}
    
}

extension UIViewController {
    
    /// Presents a UIAlertController created by the Alert's create function.
    ///
    /// - Parameters:
    ///     - alert: creates the UIAlertController.
    ///     - animated: determines if the alert controller is animated into view or not.
    ///     - completion: closure executed once the alert controller has been presented.
    ///
    func present(_ alert: Nix.Alert, animated: Bool = true, completion: (()->Void)? = nil) {
        
        present(alert.create(), animated: animated, completion: completion)
    }
}

