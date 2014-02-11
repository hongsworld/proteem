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

d_c=["양식" , "PC방", "노래방", "등등"]

1.upto(4) do |y|
  1.upto(10) do |x|
   p = Post.new
   p.name = "#{x}번째 아이템 of #{y}"
   p.category = y
   p.detail_category = d_c.shuffle.first
   p.location = rand(1..6)
   p.address = "충청남도 아산시 권곡동 536-28"
   p.phone = "041-544-8161"
   p.feature = "일반 고등학교 과학동아리 팀이 ‘세계과학프로젝트올림피아드(I-SWEEEP)’에서 환경분야에서 은메달을 차지해 화제다. 주인공은 바로 온양한올고등학교 Hi-wise 과학프로젝트팀. 
   
   5일부터 10일까지 미국 휴스턴에서 개최된 이번 대회에서 좋은 성적을 거둔 이 팀이 화제가 되고 있는 이유는"
   p.delete_flag = false
   p.img_url= "/img/#{rand(1..7)}.jpg"
   p.save


   a = rand(1..2)
   1.upto(a) do |m|
     menu = p.menus.new
     menu.menu = ["양장피","불닭볶음면+삼각김밥", "너구리","피자", "치킨"].shuffle.first
     menu.price = [1000, 5000, 10000, 15000, 20000].shuffle.first
     menu.img_url= "/img/#{rand(1..7)}.jpg"
     menu.save
   end
   1.upto(a) do |m|
     menu = p.menus.new
     menu.menu = ["양장피","불닭볶음면+삼각김밥", "너구리","피자", "치킨"].shuffle.first
     menu.price = [1000, 5000, 10000, 15000, 20000].shuffle.first
     menu.save
   end
 end
end

p = Post.all
p.each do |x|
  randomizing = rand(0..3)
    0.upto(randomizing) do |u|
    r = x.replies.new
    r.name = "홍길동"
    r.content = "쓸만하네요"
    r.delete_flag = false
    r.save
  end
end

