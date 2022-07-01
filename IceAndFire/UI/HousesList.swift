//
//  HousesList.swift
//  IceAndFire
//
//  Created by DIDBARCH on 30.06.22.
//

import SwiftUI

struct HousesList: View {
    let houses: [House]
    
    var body: some View {
        List(houses) { house in
            HouseRow(house: house)
                .padding([.bottom, .top])
        }
    }
}

struct HousesList_Previews: PreviewProvider {
    static var previews: some View {
        HousesList(houses: [House(id: "1", url: "", name: "House Algood", region: "The Westerlands"), House(id: "2", url: "", name: "House Allyrion of Godsgrace", region: "Dorne")])
    }
}
