//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by mrw on 2024/9/18.
//

import SwiftUI

struct CapsuleText: View{
    var text:String
    
    var body: some View{
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundStyle(.white)
            .background(.blue)
            .clipShape(.capsule)
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content.font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.blue)
            .clipShape(.rect(cornerRadius: 10))
    }
}

struct Watermark: ViewModifier {
    var text:String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundStyle(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
    
    func watermarkedA(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

struct ContentView: View {
    var body: some View{
        VStack(spacing: 10){
            CapsuleText(text:"First")
            CapsuleText(text:"Second")
                .titleStyle()
            Text("Modifier")
                .modifier(Title())
                
            Color.blue
                .frame(width: 300, height: 200)
                .watermarkedA(with: "Hacking with swift")
        }
    }
}

#Preview {
    ContentView()
}
