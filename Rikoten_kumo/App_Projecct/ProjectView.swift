//
//  ProjectView.swift
//  Rikoten_kumo
//
//  Created by 雲下晃 on 2021/08/26.
//

import SwiftUI

//横線構造
struct ExDivider: View {
    
    enum Orientation {
        case horizontal
        case vertical
    }
    
    let orientation: Orientation
    let thickness: CGFloat
    let color: Color

    var body: some View {
        Rectangle()
            .foregroundColor(color)
            .frame(
                width: orientation == .horizontal ? .none : thickness,
                height: orientation == .vertical ? .none : thickness)
    }
}

//見出し構造
struct HeadLine: View {
    let title: String
    let imageName: String
    
    var body: some View {
        VStack {
            HStack{
                Image(systemName: imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.leading, 10.0)
                    .frame(width: 35, height: 35)
                    .padding(-5)
                    .foregroundColor(.black)
                Text(title)
                    .font(.system(size: 23))
                    .foregroundColor(.black)
                    .padding(.leading, 3)
                    
                Spacer()
            }
        
        ExDivider(orientation: .horizontal, thickness: 1, color: .black)
            .padding(.vertical, -5)
            .padding(.horizontal, 4)
        }
    }
}

//説明系の構造
struct TextCell: View {
    let title: String
    let text: String
    let imageName: String
    
    let w: CGFloat = UIScreen.main.bounds.width - 20
    
    var body: some View{
        VStack{
            HeadLine(title: title, imageName: imageName)
            
            Text(text)
                .font(.system(size: 16))
                .foregroundColor(.black)
                .multilineTextAlignment(.leading)
                .padding(.top, -5)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}

//リンク構造
struct LinkCell: View {
    let link: String
    let image: String
    let image_gray: String
    
    var body: some View {
        if let url = URL(string: link), UIApplication.shared.canOpenURL(url){
            Link(destination: URL(string: link)!, label: {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 65, height: 65)
                    .clipShape(Circle())
                    .shadow(radius: 5, x: 0, y: 5)
                    .padding(.horizontal, 7.0)
                }
            )} else {
                Image(image_gray)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 65, height: 65)
                    .clipShape(Circle())
                    .shadow(radius: 5, x: 0, y: 5)
                    .padding(.horizontal, 7.0)
            }
    }
}


struct ProjectView: View {
    let projectdata: ProjectData
    let tagList: [String]
    
    init(projectdata: ProjectData) {
        self.projectdata = projectdata
        self.tagList = self.projectdata.tags
    }
    
    let viewWidth = UIScreen.main.bounds.width

    let w: CGFloat = UIScreen.main.bounds.width - 20
    
    @State var rotate: Double = 0
    
    
    var body: some View {
        VStack{
            Image(systemName: "house")
            
                .rotation3DEffect(
                    .degrees(self.rotate),
                    axis: (x: 0.0, y: 1.0, z: 0.0),
                    anchor: .center,
                    anchorZ: 0,
                    perspective: 0
                )
                .animation(Animation.linear(duration: 7).repeatForever(autoreverses: false).delay(3))
                .onAppear(){
                    withAnimation() {
                        rotate = 360
                    }
                }
        }
            
        
        
    }
    
//Tag構造
    private func generateTags() -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        
        return ZStack(alignment: .topLeading) {
          ForEach(tagList, id: \.self) { tag in
            item(for: tag)
              .padding([.horizontal, .vertical], 5)
              .alignmentGuide(.leading, computeValue: { d in
                if abs(width - d.width) > viewWidth * 0.95 {
                  width = 0
                  height -= d.height
                }
                let result = width
                if tag == tagList.last {
                  width = 0
                } else {
                  width -= d.width
                }
                return result
              })
              .alignmentGuide(.top, computeValue: { _ in
                let result = height
                if tag == tagList.last {
                  height = 0
                }
                return result
              })
          }
        }
      }
      
      func item(for text: String) -> some View {
        NavigationLink(destination: TagView()) {
            HStack{
                Text("#" + text)
                    .font(.system(size: 14))
                    .foregroundColor(Color(red: 10/255, green: 207/255, blue: 236/255))
                    .multilineTextAlignment(.center)
                    .shadow(radius: 0)
                    .padding(1)
                    .padding(.horizontal, 3)
            }
            .padding(7)
            .background(Color(.white))
            .cornerRadius(20)
            .shadow(radius: 4, x: 0, y: 2)
            .padding([.top, .leading, .trailing], 3)
        }
      }
}

struct ProjectView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectView(projectdata: projectArray[0])
            .preferredColorScheme(.dark)
    }
}
