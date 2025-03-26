//
//  LoadingView.swift
//  Weather App
//
//  Created by Jeevan Ramakichenin on 20/03/2025.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
                               
    }
}

#Preview {
    LoadingView()
}
