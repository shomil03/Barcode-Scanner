//
//  ScannerView.swift
//  Barcode-Scanner
//
//  Created by Shomil Singh on 22/01/24.
//

import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    
    @Binding var ScannedCode : String
    @Binding var showingAlert : Bool
    @Binding var ErrorMessage : String
    
    func makeUIViewController(context: Context) -> ScannerVC {
        ScannerVC(scannerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(scannerView: self)
    }
    
    final class Coordinator: NSObject, ScannerVCDelegate{
        
        private let scannerView : ScannerView
        init(scannerView: ScannerView ) {
            self.scannerView = scannerView
        }
        
        func didFind(barcode: String) {
            scannerView.ScannedCode = barcode
            print(barcode)
        }
        
        func didSurface(error: CameraError) {
            scannerView.showingAlert = true
            scannerView.ErrorMessage = error.rawValue
            print(error.rawValue)
        }
        
        
    }
}

#Preview {
    ScannerView(ScannedCode: .constant("1234") , showingAlert: .constant(false) , ErrorMessage: .constant("NO error"))
}
