//
//  AddCardView.swift
//  ECard
//
//  Created by Busayo Ajide on 1/21/24.
//

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
    @State private var name = "Photo name"
    
    
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
                            
                        }
                        
                        inputImage?
                            .resizable()
                            .scaledToFit()
                    }
                    
                    Section{
                        TextField("Name", text: $name)
                        
                    }
                    .disabled(hasImage == false)
                }            }
            .padding()
            .toolbar{
                ToolbarItem(placement: .confirmationAction){
                    Button("Save"){
                        
                        let card = Card(photo: selectedImage!, name: name)
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

//#Preview {
////    AddCardView()
//}
