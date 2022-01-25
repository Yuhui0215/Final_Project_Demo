//
//  DrinkList.swift
//  Project
//
//  Created by Len on 2022/1/19.
//

import SwiftUI

struct Row: View {
    let data: StoreItem
    var body: some View {
        VStack {
            Text(data.strDrink)
            //Text(data.strGlass)
            
        }
    }
}

/*struct Row_Previews: PreviewProvider {
    static var previews: some View {
        Row()
    }
}*/
