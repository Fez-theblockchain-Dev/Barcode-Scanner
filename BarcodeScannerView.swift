////
////  BarcodeScannerView.swift
////  Barcode Scanner
////
////  Created by Ramez on 10/23/23.
////
//
//import SwiftUI
//
//struct alertItem {
//    let id = UUID()
//    let title: String
//    let message: String
//    let dismissButton: Alert.Button
//}
//
//struct AlertContext {
//    static let invalidDeviceInput = alertItem (title: "Invalid device input",
//                                               message: "Something wrong with camera. Unable to capture user input",
//                                               dismissButton: .default(Text("OK")))
//    static let invalidScannedType = alertItem(title: "Invalid scan type",
//                                              message: "Value scanned isn't valid",
//                                              dismissButton: .default(Text("OK")))
//    
//}
//
//struct BarcodeScannerView: View {
//    
//    @State private var scannedCode = ""
//    @State private var alertItem: alertItem?
//    
//    var body: some View {
//        NavigationView {
//            VStack {
//                Text("Detail View")
//                    .navigationBarBackButtonHidden(true)
//                    .navigationTitle("Detail Title")
//                
//                //                dummy camera view effect
//                Rectangle()
//                    .frame(maxWidth: .infinity, maxHeight: 300)
//                
//                Label("Scan Barcode:", systemImage: "barcode.viewfinder")
//                
//                    .padding()
//                
//                Text("Not Yet Scanned")
//                    .bold()
//                    .font(.largeTitle)
//                    .foregroundColor(.red)
//                    .padding()
//                
//              
//            }
//            .navigationTitle("Barcode Scanner")
//            .alert(item: $alertItem) { alertItem in
//                Alert(title: Text(alertItem.title),
//                      message: Text(alertItem.message),
//                      dismissButton: Text(alertItem.dismissButton))
//            }
//                
//                
//            }
//            )}
//        
//        struct BarcodeScannerView_Previews: PreviewProvider {
//            static var previews: some View {
//                BarcodeScannerView()
//            }
//        }
//    }


import SwiftUI

struct BarcodeScannerView: View {
    
    @StateObject var viewModel = BarcodeScannerViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                ScannerView(scannedCode: $viewModel.scannedCode,
                            alertItem: $viewModel.alertItem)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                
                Spacer().frame(height: 60)
                
                Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
                    .font(.title)
                
                Text(viewModel.statusText)
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(viewModel.statusTextColor)
                    .padding()
            }
            .navigationTitle("Barcode Scanner")
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: Text(alertItem.title),
                      message: Text(alertItem.message),
                      dismissButton: alertItem.dismissButton)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BarcodeScannerView()
    }
}

