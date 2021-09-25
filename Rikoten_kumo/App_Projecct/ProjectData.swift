//
//  ProjectData.swift
//  Rikoten_kumo
//
//  Created by 雲下晃 on 2021/08/26.
//

import Foundation

var projectArray:[ProjectData] = makeData()

struct ProjectData: Identifiable{
    var id: Int
    var imageName: String
    var projectTitle: String
    var projectSubTitle: String
    var groupName: String
    var text1: String
    var text2: String
    var tags: [String]
    var url_web: String
    var url_twitter: String
    var url_facebook: String
    var url_instagram: String
}

func makeData() -> [ProjectData] {
    var dataArray: [ProjectData] = []
    dataArray.append(ProjectData(id: 1, imageName: "info_twitterit_logo", projectTitle: "理工学部生による合氣道演武", projectSubTitle: "2020心身統一合氣道演武", groupName: "早稲田大学心身統一合氣道会",
                                 text1: "日々の合氣道の稽古の成果のひとつである合氣道の体技の演武の動画となります。当動画は黒帯の上級生によって行われており、互いの心と身体、氣が通じ合った演武となっております。\nまた演武で実施される体技は昇級、昇段審査の項目で構成されております。そのため当サークルに入り稽古を重ねれば、かならず動画の体技を修練していくことになります。\n合氣道に少しでも興味のある方、理工学部生で運動系、武道系のサークルに興味のある方は是非ご覧ください。",
                                 text2: "当サークルは理工学術院公認の合氣道サークルとなります。理工学部生が中心のインカレサークルです。\n普段は西早稲田キャンパスに隣接している新宿コズミックセンター、スポーツセンターで活動しているため忙しい理工学部生でも無理なく参加できます。\n合氣道に興味がありましたらぜひ一度見学してください。",
                                 tags: ["一般団体", "サクール", "インカレ", "スポーツ", "パフォーマンス"],
                                 url_web: "http://waikido.web.fc2.com/",url_twitter: "https://twitter.com/wasedaaikidokai", url_facebook: "", url_instagram: "https://instagram.com/waseda_aikidokai"))
    dataArray.append(ProjectData(id: 2, imageName: "", projectTitle: "", projectSubTitle: "", groupName: "",
                                 text1: "",
                                 text2: "",
                                 tags: [""],
                                 url_web: "",url_twitter: "", url_facebook: "", url_instagram: ""))
    
    return dataArray
}
