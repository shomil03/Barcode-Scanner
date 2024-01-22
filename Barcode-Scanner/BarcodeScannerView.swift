//
//  ContentView.swift
//  Barcode-Scanner
//
//  Created by Shomil Singh on 22/01/24.
//

import SwiftUI

struct BarcodeScannerView: View {
    @State private var ScannedCode = ""
    @State private var showingAlert = false
    @State private var AlertMessage = ""
    
    var body: some View {
        NavigationStack{
            VStack{
                ScannerView(ScannedCode: $ScannedCode , showingAlert: $showingAlert , ErrorMessage: $AlertMessage)
                    .frame(height: 270)
                HStack{
                    Image(systemName: "camera.viewfinder")
                        .resizable()
                        .frame(width: 50 , height: 50)
                        .scaledToFill()
                        .symbolRenderingMode(.multicolor)
                        .foregroundStyle(ScannedCode.isEmpty ? Color.red : Color.green)
                    Text("Scanned Barcode :")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding()
                }
                .padding()
                .padding()
                
                Text(ScannedCode.isEmpty ? "Not yet Scanned" : ScannedCode)
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(ScannedCode.isEmpty ? Color.red : Color.green)
            }
            .alert(Text("Error"),
                   isPresented: $showingAlert ,
                   actions: {
                Button("Ok", action: {
                    ScannedCode = ""
                })
            } ,
                   message: {
                Text(AlertMessage)
            }
            )
            .navigationTitle("Barcode Scanner")
            .animation(.easeIn, value: ScannedCode)
                        
        }
    }
}

#Preview {
    BarcodeScannerView()
}
