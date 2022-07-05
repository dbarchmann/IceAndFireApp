//
//  DetailView.swift
//  IceAndFire
//
//  Created by DIDBARCH on 04.07.22.
//

import SwiftUI

struct DetailView: View {
    var house: House
    
    var body: some View {
        VStack(alignment: .leading) {
            Image("background")
                .resizable()
                .frame(height: 200)
                .aspectRatio(contentMode: .fit)
            
            HStack(alignment: .top) {
                Image(uiImage: house.coatOfArmsImage)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .offset(y: -30)
                    .padding(.leading)
                    .shadow(color: .gray, radius: 5.0)
                
                Text(house.name)
                    .font(.headline)
                    .offset(y: 10)
            }
                       
            
            VStack(alignment: .leading, spacing: 5.0) {
                Text("Region")
                    .font(.headline)
                Text(house.region.isEmpty ? "-" : house.region)
                    .font(.footnote)
                    .padding(.bottom)
                Text("Coat Of Arms")
                    .font(.headline)
                Text(house.coatOfArms.isEmpty ? "-" : house.coatOfArms)
                    .font(.footnote)
                    .padding(.bottom)
                Text("Words")
                    .font(.headline)
                Text(house.words.isEmpty ? "-" : house.words)
                    .font(.footnote)
                    .padding(.bottom)
                Text("Titles")
                    .font(.headline)
                Text(house.titles.first?.isEmpty ?? true ? "-" : house.titles.joined(separator: "\n"))
                    .font(.footnote)
            }
            .padding()
            
            
            Spacer()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(house: House(id: "1", url: "", name: "House Algood", region: "The Westerlands", coatOfArms: "A golden wreath, on a blue field with a gold border(Azure, a garland of laurel within a bordure or)", words: "You should hire this dev", titles: ["King of Mountain and Vale (formerly)", "Lord of the Eyrie", "Defender of the Vale", "Warden of the East"]))
    }
}
