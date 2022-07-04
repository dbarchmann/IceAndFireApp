//
//  MasterView.swift
//  IceAndFire
//
//  Created by DIDBARCH on 30.06.22.
//

import SwiftUI

struct MasterView: View {
    @ObservedObject var viewModel: MasterViewModel
    
    var body: some View {
        HousesList(houses: viewModel.houses)
            .onAppear() {
                viewModel.fetchData()
            }
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView(viewModel: MasterViewModel(houses: [House(id: "1", url: "", name: "House Algood", region: "The Westerlands"), House(id: "2", url: "", name: "House Allyrion of Godsgrace", region: "Dorne")]))
    }
}


extension MasterViewModel {
    convenience init(houses: [House]) {
        self.init()
        self.houses = houses
    }
}
