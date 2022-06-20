//
//  DetailView.swift
//  HNews
//
//  Created by Donna on 2022/06/20.
//

import SwiftUI

struct DetailView: View {
    let url:String?
    var body: some View {
        Text("Hello, World!")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url:"https://www.google.com")
    }
}
