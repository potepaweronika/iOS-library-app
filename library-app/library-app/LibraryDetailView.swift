//
//  LibraryDetailView.swift
//  library-app
//
//  Created by user on 08/06/2023.
//

import SwiftUI
import MapKit
import CoreLocation

struct LibraryDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var library: Library
    @State private var isClicked = false
//    @State private var annotationCoordinate: CLLocationCoordinate2D?
    
    var body: some View {
        VStack {
            Image(systemName: "photo")
                .resizable()
                .frame(width: 100, height: 100)
            
            Text(library.name!)
                .font(.title)
            
            Text(library.address!)
                .font(.subheadline)
            
            Map(coordinateRegion: .constant(region))
                .frame(height: 200)
            
            Spacer()
            
            Button(action: {
                isClicked = true
            }) {
                Text("Choose this Library")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
            
            Spacer()
        }
        .contentShape(Rectangle())
        .padding()
        .navigationTitle("Library Details")
        .navigationBarBackButtonHidden(true)
        .gesture(
            DragGesture()
                .onEnded{ gesture in
                    if gesture.translation.width > 100 {
                        presentationMode.wrappedValue.dismiss()
                    }
                })
        .onAppear(){
            isClicked = false
//            annotationCoordinate = library.locationCoordinate
        }
        NavigationLink(destination: LibraryBooksView(library: library), isActive: $isClicked, label: {EmptyView()})
    }
    
    private var region: MKCoordinateRegion {
        let coordinate = library.locationCoordinate
        let span = MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
        
//        if let annotationCoordinate = annotationCoordinate {
//            let annotation = MKPointAnnotation()
//            annotation.coordinate = annotationCoordinate
//            annotation.title = library.name
//            annotation.subtitle = library.address
//        }
        
        return MKCoordinateRegion(center: coordinate, span: span)
    }
}
