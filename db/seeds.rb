building = Building.create(
  code: "1234",
  name: "MVD Golf",
  address: "Ibiray 2324",
  contact_email: "damian.arrillaga@gmail.com"
)

building_user = BuildingUser.create(
  name: "Damián Arrillaga",
  apartment: "105",
  role_description: "inquilino",
  building_creator: true,
  building: building
)

2.times do |number|
  post = Post.create(
    text: "Asamblea #{number}",
    building: building,
    building_user: building_user
  )

  2.times do |comment_number|
    Comment.create(
        text: "no puedo ir #{comment_number}",
        building: building,
        building_user: building_user,
        post: post
    )
  end
end

