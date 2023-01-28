//
//  GiphyScreenView.swift
//  Giphy
//
//  Created by Alexander Khitev on 1/28/23.
//

import SwiftUI

struct GiphyScreenView: View {
    @StateObject var viewModel: GiphyScreenViewModel

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct GiphyScreenView_Previews: PreviewProvider {
    static var previews: some View {
        GiphyScreenView(viewModel: .init(coordinator: nil))
    }
}
