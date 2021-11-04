//
//  ContentView.swift
//  Challenge14-RandomTrivia
//
//  Created by Shepherd on 11/2/21.
//

import SwiftUI

struct ContentView: View {
    
    // Define our model
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        // MARK: Random Fact
        VStack {
            // Display the first fact
            Text(model.fact)
                .padding()
            
            Button("Get a new fact!") {
                model.fetchRandomFact()
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
