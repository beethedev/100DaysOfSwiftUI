//
//  EditContactView.swift
//  HotProspects
//
//  Created by Busayo Ajide on 3/1/24.
//

import SwiftUI
import SwiftData

struct EditContactView: View {
    @Environment(\.modelContext) var modelContext
    @Bindable var prospect: Prospect
    
    var body: some View {
        NavigationStack{
            Form{
                TextField("Name", text: $prospect.name)
                TextField("Email", text: $prospect.emailAddress)
            }
            .navigationTitle("Edit Contact")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

//#Preview {
//    EditContactView()
//}
