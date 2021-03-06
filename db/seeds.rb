#coding:utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
#
#
#

#encoding: utf-8
require 'csv'

2.upto(6) do |dong|
  b = 1
  CSV.foreach("#{dong}.csv") do |row|
    a = 1
    puts "#{b} 행"
    if b==1
      b+=1
      "끝끝끝"
    else
      p = Post.new
      row.each do |x|
        puts "#{a} 열"
        puts x
        case a
        when 1
          p.category = x
          p.save
        when 2
          if !x.nil?
            p = Post.last
            p.detail_category =x
            p.save
          end
        when 3
          if !x.nil?
            p = Post.last
            p.location = x
            p.save
          end
        when 4
          p = Post.last
          p.name = x
          p.save
        when 5
          if !x.nil?
            p = Post.last
            p.address = x
            p.save
          end
        when 6
          if !x.nil?
            p = Post.last
            p.phone = x
            p.save
          end
        when 7
          if !x.nil?
            p = Post.last
            m = p.menus.new
            m.menu = x
            puts "오오오오"
            m.save
          end
        when 8
          if !x.nil?
            puts "통과되긴했는데"
            puts m
            m = Menu.last
            m.price = x
            m.save
          end
        when 9
          if !x.nil?
            p = Post.last
            m = p.menus.new
            m.menu = x
            m.save
          end
        when 10
          if !x.nil?
            m = Menu.last
            m.price = x
            m.save
          end
        when 11
          if !x.nil?
            p = Post.last
            m = p.menus.new
            m.menu = x
            m.save
          end
        when 12
          if !x.nil?
            m = Menu.last
            m.price = x
            m.save
          end
        when 13
          if !x.nil?
            p = Post.last
            p.feature = x
            p.save
          end
        when 14
          if !x.nil?
            p = Post.last
            p.img_url = "/img/#{x}"
            m = p.menus.first
            if !m.nil?
              m.img_url = "/img/#{x}"
              m.save
            end
            p.save
          end
        when 15
          if !x.nil?
            p = Post.last
            p.lat = x
            p.save
          end
        when 16
          if !x.nil?
            p = Post.last
            p.lng = x
            p.save
          end
        end
        a+=1
      end
      b+=1
    end
  end
end



aa = ["순이네 쌀 찐빵, 만두", "달콤한 닭강정", "삼색호떡", "원주통닭", "옛날손칼국수"]
b = %w[만두 닭강정 호떡 치킨 칼국수]
c = [1,1,1,1,1]
d = %w[041-531-4578 - - 041-546-0001 041-546-0111]
e = ["고기만두", "닭강정(대)", "호떡", "후라이드", "치킨", "옛날 칼국수"]
f = [3000, 12000, 2000, 14000, 6000]
add = ["충남 아산시 온양1동 89-9",
"충남 아산시 온양1동",
"충남 아산시 온양1동",
"충청남도 아산시 온천동 220-18",
"충남 아산시 권곡동 443-125"]
fea = ["온양온천시장 내에 위치하여 특유의 따뜻한 정이 느껴진다. 주인이 직접 빚기 때문에 신선하고 정성들인 요리라는 느낌을 받을 수 있다. 이 집의 대표적인 메뉴인 '고기만두'는 특히 고소하고 식감이 좋아 많은 사람들로 사랑을 받고 있다.",
"달콤한 닭강정은 서로 다른 세가지 특별한 맛을 만들어 내는 것이 특징이다. 주문하면 즉석에서 만들어 주기 때문에 따뜻하고 바삭한 맛을 즐길 수 있을 뿐만 아니라, 시식이 가능해 그 자리에서 맛을 선택할 수 있다. 또한 떡, 감자 등 푸짐한 양을 자랑하고 있다.",
"삼색호떡은 가게의 이름 그대로 세가지 맛과 색을 가진 호떡을 맛볼 수 있는 것이 가장 큰 특징이다. 세가지 색의 호떡은 오미자, 시금치, 단호박으로 이루어져 있는데, 이 형형색색의 호떡은 단순히 색깔뿐만 아니라 맛과 향도 그 원재료의 풍미를 고스란히 담고 있다. 이 뿐만 아니라 신선한 재료를 사용하고, 사용하는 기름도 카놀라유만을 고집하는 등 고객의 건강에도 많은 신경을 쓰고 있다.",
"원주통닭은 유명 대형 치킨프랜차이즈들을 제치고 온양에서 꾸준한 인기를 끌고 있는 치킨 전문점이다. 이 집은 오전 8시에 시작해 늦은 저녁까지 영업을 하고 있기 때문에, 많은 손님들이 원하는 시간 대에 방문할 수 있도록 배려하고 있다. 그리고 특유의 조리방식을 고집해 유난히 고소하고 바삭한 식감을 자랑하는 것이 특징이다. 전통방식의 치킨 뿐만 아니라 최근에는 불닭치킨 등 트렌디한 요리도 선보이고 있다.",
"옛날 칼국수의 대표메뉴인 옛날 칼국수는 조미료를 넣지 않고 바지락을 듬뿍넣어 끓인 칼칼한 맛이 일품이다. 이 뿐만 아니라 홍합, 꼴뚜기, 바지락 등 해물을 듬뿍넣어 만든 해물칼국수 역시 일품이다. 이 집은 또한 김치전이 인기메뉴인데, 두껍지도 얇지도 않은 적절한 두께에 바삭하고 고소하게 구워낸 맛이 칼국수와의 궁합이 좋다. 또한 김치와 깍두기를 직접 담가 손님 상에 제공하여 그 맛을 배가 하고 있다."]
0.upto(4) do |x|
   p = Post.new
   p.name = aa[x]
   p.category = 1
   p.detail_category = b[x]
   p.location = c[x]
   p.address = add[x]
   p.phone = d[x]
   p.feature = fea[x]
   p.delete_flag = false
   p.img_url= "/img/seum/#{x + 1}.jpg"
   p.dummy2 = "seum"
   p.save

   a = [2,2,2,1,3]
   1.upto(a[x]) do |m|
     menu = p.menus.new
     menu.menu = [["고기만두", "찐빵"],["닭강정(대)","닭강정(중)"],["호떡","튀김"],["후라이드 치킨"],["옛날 칼국수","해물칼국수","김치전"]][x][m-1]
     menu.price = [[3000,3000],[12000,8000],[2000,2000],[14000],[6000,7000]][x][m-1]
     if m == 1
       menu.img_url= "/img/seum/#{x + 1}.jpg"
     elsif m == 2
       menu.img_url= "/img/seum/#{x + 1}1.jpg"
     end
     menu.save
   end
end


