//
//  ContentView.swift
//  Barcode-Scanner
//
//  Created by Shomil Singh on 22/01/24.
//

import SwiftUI

struct BarcodeScannerView: View {
    var body: some View {
        NavigationStack{
            VStack{
                Rectangle()
                    .frame(height: 270)
                HStack{
                    Image(systemName: "camera.viewfinder")
                        .resizable()
                        .frame(width: 50 , height: 50)
                        .scaledToFill()
                        .symbolRenderingMode(.multicolor)
                        .foregroundStyle(Color.red)
                    Text("Scanned Barcode :")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding()
                }
                .padding()
                .padding()
                
                Text("Not yet scanned")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(Color.red)
            }
            .navigationTitle("Barcode Scanner")
            
        }
    }
}

#Preview {
    BarcodeScannerView()
}
