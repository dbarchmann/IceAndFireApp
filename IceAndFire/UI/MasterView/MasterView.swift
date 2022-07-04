//
//  MasterView.swift
//  IceAndFire
//
//  Created by DIDBARCH on 30.06.22.
//

import SwiftUI

struct MasterView: View {
    @ObservedObject var viewModel: MasterViewModel
    
    @State var isShowingActivityIndicator = false
    
    var body: some View {
        NavigationView {
            HousesList(houses: viewModel.houses)
                .delayedActivityIndicator(isActive: $isShowingActivityIndicator)
                .onAppear() {
                    self.isShowingActivityIndicator = true
                    viewModel.fetchData()
                }
                .onChange(of: viewModel.houses, perform: { _ in
                    self.isShowingActivityIndicator = false
                })
                .navigationTitle("Houses of Westeros")
        }
        .navigationViewStyle(.stack)
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView(viewModel: MasterViewModel(houses: [House(id: "1", url: "", name: "House Algood", region: "The Westerlands", coatOfArms: "", words: "", titles: []), House(id: "2", url: "", name: "House Allyrion of Godsgrace", region: "Dorne", coatOfArms: "", words: "", titles: [])]))
    }
}


extension MasterViewModel {
    convenience init(houses: [House]) {
        self.init()
        self.houses = houses
    }
}
