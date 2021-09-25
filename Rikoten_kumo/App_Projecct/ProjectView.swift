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
        NavigationView{
            ScrollView(.vertical, showsIndicators: true){
                ZStack{
                    Color(red: 252/255, green: 248/255, blue: 232/255)
                        .edgesIgnoringSafeArea(.all)
                    VStack {
                        Spacer()
                            .frame(height: 5)
    //企画イメージ
                        VStack {
                            Image(projectdata.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: viewWidth * 0.9, height: viewWidth * 0.55)
                                .fixedSize(horizontal: true, vertical: false)
                                .cornerRadius(20)
                            Spacer(minLength: 5)
                            HStack {
                                Spacer(minLength: 7)
                                Rectangle()
                                    .frame(width: 5, height: 70)
                                    .foregroundColor(.black)
                                VStack{
                                    HStack{
                                        Text(projectdata.projectTitle)
                                            .font(.system(size: 23))
                                            .fontWeight(.heavy)
                                            .foregroundColor(.black)
                                            .bold()
                                            .padding(.top, 15)
                                            .padding(.leading, 10)
                                        Spacer()
                                    }
                                    HStack{
                                        Text(projectdata.projectSubTitle)
                                            .font(.system(size: 15))
                                            .foregroundColor(.black)
                                            .bold()
                                            .padding(.top, 5)
                                            .padding(.bottom, 15)
                                            .padding(.leading, 10)
                                        Spacer()
                                    }
                                }
                                Spacer()
                            }
                            HStack{
                                Spacer()
                                Text(projectdata.groupName)
                                    .font(.system(size: 13))
                                    .foregroundColor(.black)
                                    .padding(.trailing, 10)
                            }
                        }
                        .frame(width: w)
                                        
                        Spacer(minLength: 25)
    //Tag一覧
                        if projectdata.tags != [""] {
                            generateTags()
                        }
                                        
                        Spacer(minLength: 35)
    //企画ページリンク
                        VStack {
                           HeadLine(title: "企画ページリンク", imageName: "link")
                            
                            Spacer(minLength: 7)
                            
                            HStack (spacing: 20) {
                                Image("link_virtual_rikoten")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .shadow(radius: 3, x: 0, y: 5)
                                Link(destination: URL(string: "https://pre.rikoten.com")!) {
                                    Image("link_rikoten_web")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .shadow(radius: 3, x: 0, y: 5)
                                }
                            }
                            .padding(.horizontal, 15)
                        }
                        .frame(width: w)
                        
                        Spacer(minLength: 50)
                        
    //説明系
                        VStack{
            //企画説明
                            TextCell(title: "企画説明", text: projectdata.text1, imageName: "books.vertical")
                            
                            Spacer(minLength: 50)
            //団体説明
                            TextCell(title: "団体説明", text: projectdata.text2, imageName: "person.2")
                            
                            Spacer(minLength: 50)
                        }
                        .frame(width: w)
            //リンク一覧
                        VStack{
                            HeadLine(title: "SNS", imageName: "globe")
                            
                            Spacer(minLength:10)
                            
                            HStack{
                                LinkCell(link: projectdata.url_web, image: "web", image_gray: "web.gray")
                                LinkCell(link: projectdata.url_twitter, image: "twitter", image_gray: "twitter.gray")
                                LinkCell(link: projectdata.url_facebook, image: "facebook", image_gray: "facebook.gray")
                                LinkCell(link: projectdata.url_instagram, image: "instagram", image_gray: "instagram.gray")
                            }
                            
                            Spacer()
                                .frame(height: 10)
                            
                        }
                        .frame(width: w)
                        
                        VStack {
                            HStack{
                                Spacer()
                                    .frame(width: 2000)
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
                                Spacer()
                                    .frame(width: 2000)
                            }
                            
                            
                            Spacer()
                                .frame(height: 5)
                        }
                        
                        
                    }
                }
            }
            .navigationBarHidden(true)
        }
        .navigationTitle(Text(verbatim: projectdata.projectTitle))
        .background(Color(red: 238, green: 205, blue: 91))
        .navigationBarTitleDisplayMode(.inline)
        .navigationViewStyle(StackNavigationViewStyle())
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
