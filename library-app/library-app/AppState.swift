//
//  AppState.swift
//  library-app
//
//  Created by user on 10/06/2023.
//

import Foundation

final class AppState: ObservableObject {
    @Published var rootViewId = UUID()
}
