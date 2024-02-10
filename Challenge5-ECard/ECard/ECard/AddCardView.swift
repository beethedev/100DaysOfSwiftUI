//
//  AddCardView.swift
//  ECard
//
//  Created by Busayo Ajide on 1/21/24.
//
import MapKit
import SwiftData
import SwiftUI
import PhotosUI
import UIKit


struct AddCardView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    @State private var pickerItem : PhotosPickerItem?
    @State private var inputImage : Image?
    @State private var selectedImage : Data?
    @State private var hasImage = false
    @State private var name = "Enter name"
    

    @State var userLocation : CLLocationCoordinate2D
    
    let locationFetcher = LocationFetcher()
    
    var body: some View {
        NavigationStack{
            VStack{
                Form{
                    Section{
                        PhotosPicker(selection: $pickerItem, matching: .images){
                            Label("Select a picture", systemImage: "photo")
                        }
                        .onChange(of: pickerItem) {
                            Task {
                                selectedImage = try await pickerItem?.loadTransferable(type: Data.self)
                                
                                hasImage.toggle()
                                print(hasImage)
                                
                                inputImage = Image(uiImage: UIImage(data: selectedImage!)!)
                                
                            }
                            Task {
                                locationFetcher.start()
                            }
                            
                        }
                        
                        inputImage?
                            .resizable()
                            .scaledToFit()
                    }
                    
                    Section{
                        TextField("Name", text: $name)
                    }
                    .disabled(hasImage == false)
                }
            }
            .padding()
            .toolbar{
                ToolbarItem(placement: .confirmationAction){
                    Button("Save"){
                        if let location = locationFetcher.lastKnownLocation {
                            userLocation = location
                        } else {
//                            use location for Apple in Cupertino
                            userLocation = CLLocationCoordinate2D(latitude: 37.3346, longitude: 122.0090)
                        }

                        
                        let card = Card(photo: selectedImage!, name: name, lat: userLocation.latitude , long: userLocation.longitude)

                        modelContext.insert(card)
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction){
                    Button("Cancel"){
                        dismiss()
                    }
                }
            }
        }

    }
}

#Preview {
    AddCardView(userLocation: CLLocationCoordinate2D())
}
