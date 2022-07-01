//
//  ContentView.swift
//  IceAndFire
//
//  Created by DIDBARCH on 30.06.22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel
    
    var body: some View {
        HousesList(houses: viewModel.houses)
            .onAppear() {
                viewModel.fetchData()
            }
            .refreshable {
                await viewModel.fetchData()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ContentViewModel())
    }
}
