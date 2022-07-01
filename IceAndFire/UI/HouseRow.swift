//
//  HouseRow.swift
//  IceAndFire
//
//  Created by DIDBARCH on 30.06.22.
//

import SwiftUI

struct HouseRow: View {
    let house: House
    
    var body: some View {
        HStack {
            Image(uiImage: house.coatOfArmsImage)
                .resizable()
                .frame(width: 50, height: 50)
            VStack(alignment: .leading) {
                Text(house.name)
                    .font(.headline)
                Text(house.region)
                    .font(.footnote)
            }
        }
    }
}

struct HouseRow_Previews: PreviewProvider {
    static var previews: some View {
        HouseRow(house: House(id: "1", url: "", name: "House Algood", region: "The Westerlands"))
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
