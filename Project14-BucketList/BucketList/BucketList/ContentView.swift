//
//  ContentView.swift
//  BucketList
//
//  Created by Busayo Ajide on 12/27/23.
//
import MapKit
import SwiftUI
import LocalAuthentication



struct ContentView: View {
    
    let startPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 56, longitude: -3),
            span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
        )
    )
    
    @State private var viewModel = ViewModel()
    @State private var hybridMapstyle = false
    
    
    
    var body: some View {
        if viewModel.isUnlocked {
            ZStack(alignment: .topTrailing){
                MapReader { proxy in
                    Map(initialPosition: startPosition) {
                        ForEach(viewModel.locations) { location in
                            Annotation(location.name, coordinate: location.coordinate) {
                                Image(systemName: "star.circle")
                                    .resizable()
                                    .foregroundStyle(.red)
                                    .frame(width: 44, height: 44)
                                    .background(.white)
                                    .clipShape(.circle)
                                    .onLongPressGesture {
                                        viewModel.selectedPlace = location
                                    }
                            }
                        }
                    }
                    .mapStyle(hybridMapstyle ? .hybrid : .standard)
                    .onTapGesture { position in
                        if let coordinate = proxy.convert(position, from: .local) {
                            viewModel.addLocation(at: coordinate)
                        }
                    }
                    .sheet(item: $viewModel.selectedPlace) { place in
                        EditView(location: place) {
                            viewModel.update(location: $0)
                        }
                    }
                }
                HStack{
                    Button("Hybrid"){
                        hybridMapstyle = true
                    }
                    .padding(10)
                    .background(.black.opacity(0.75))
                    .foregroundStyle(.white)
                    .clipShape(.capsule)
                    .offset(x: 5, y: -5)
                    
                    Spacer()
                    
                    Button("Standard"){
                        hybridMapstyle = false
                    }
                    .padding(10)
                    .background(.blue.opacity(0.75))
                    .foregroundStyle(.white)
                    .clipShape(.capsule)
                    .offset(x: -5, y: -5)
                }
            }
        } else {
            // button here
            Button("Unlock Places", action: viewModel.authenticate)
                .padding()
                .background(.blue)
                .foregroundStyle(.white)
                .clipShape(.capsule)
                .alert("Error", isPresented: $viewModel.showingError){
                    Button("Cancel", role: .cancel) { }
                } message: {
                    Text(viewModel.errorMessage)
                }

        }
    }
    
    
}

#Preview {
    ContentView()
}
