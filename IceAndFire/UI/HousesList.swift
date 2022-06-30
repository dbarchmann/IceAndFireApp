//
//  HousesList.swift
//  IceAndFire
//
//  Created by DIDBARCH on 30.06.22.
//

import SwiftUI

struct HousesList: View {
    let viewModel: ContentViewModel
    
    var body: some View {
        List(viewModel.houses) { house in
            HouseRow(house: house)
                .padding([.bottom, .top])
        }
    }
}

struct HousesList_Previews: PreviewProvider {
    static var previews: some View {
        HousesList(viewModel: ContentViewModel())
    }
}
