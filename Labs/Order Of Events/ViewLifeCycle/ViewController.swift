//
//  ViewController.swift
//  ViewLifeCycle
//
//  Created by Student on 22/07/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Called once when the view controller's view is loaded into memory.
        // Ideal for initial setup, loading data, UI configuration that doesn't change.
        print("View Did Load")
        
        // Example use case:
        // Initialize your UI elements, load static data, set delegates here.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Called right before the view appears on screen.
        // Use to make last-minute updates or refresh data every time view appears.
        print("View Will Appear")
        
        // Example use case:
        // Update UI based on changes that might have happened while view was off-screen.
        // e.g., refresh user profile info or reload table data.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Called right after the view appeared on screen.
        // Great place to start animations, tracking, or data fetching that should happen after view is visible.
        print("View Did Appear")
        
        // Example use case:
        // Start an animation or a video playback.
        // Start analytics tracking that counts screen views.
        // Begin fetching data from the network if you want to delay it until view is visible.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Called just before the view disappears.
        // Use to save state, cancel network requests, or stop tasks tied to this view.
        print("View Will Disappear")
        
        // Example use case:
        // Save form data or user input.
        // Cancel ongoing animations or network calls.
        // Dismiss keyboard or stop timers.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        // Called after the view has disappeared from screen.
        // Use to release resources related to the view that you no longer need.
        print("View Did Disappear")
        
        // Example use case:
        // Clean up memory-heavy objects, stop location updates, or remove observers.
    }
}

