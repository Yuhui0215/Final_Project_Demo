//
//  ContentView.swift
//  Project
//
//  Created by Len on 2022/1/18.
//

import SwiftUI

struct ContentView: View {
    @State private var items = [StoreItem]()
    
    var body: some View {
        VStack {
            List {
                ForEach(items, id: \.idDrink) { item in
                    Row(data: item)
                }
            }
        }
        .onAppear() {
            fetch()
        }
    }
    
    
    
    func fetch() {
        let address = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=b&api_key=1"
        if let url = URL(string: address) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        decoder.dateDecodingStrategy = .iso8601
                        let dataCocktail = try decoder.decode(DataCocktail.self, from: data)
                            items = dataCocktail.drinks
                            //print(items)
                        } catch {
                            print(error)
                        }
                    }
                else {
                    print(error)
                }
            }.resume()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
