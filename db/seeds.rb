Category.create!([
  {name: "Strings"},
  {name: "Brass"},
  {name: "Percussion"},
  {name: "Woodwind"},
  {name: "Keyboard"}
])
Instrument.create!([
  {name: "Acoustic Guitar", category_id: 1},
  {name: "Electric Guitar", category_id: 1},
  {name: "Trumpet", category_id: 2},
  {name: "Trombone", category_id: 2},
  {name: "Drum Set", category_id: 3},
  {name: "Snare Drum", category_id: 3},
  {name: "Saxophone", category_id: 4},
  {name: "Clarinet", category_id: 4},
  {name: "Piano", category_id: 5},
  {name: "Synthesizer", category_id: 5},
  {name: "Bass Guitar", category_id: 1},
  {name: "Violin", category_id: 1},
  {name: "Cymbal", category_id: 3},
  {name: "Flute", category_id: 4},
  {name: "Electronic Piano", category_id: 5}
])
Message.create!([
  {text: "Hey! Nice guitar! Any way you could swing $1100?", sender_id: 3, receiver_id: 1, post_id: 1, is_read: false}
])
Post.create!([
  {title: "2016 Gibson Les Paul", description: "Brand new 2016 Gibson Les Paul, perfect condition, only played once.", image_url: "http://c1.zzounds.com/media/fit,2018by3200/quality,85/1_Full_Straight_Front_NA-3f473a865ced7cff5e4ed55afdbee196.jpg", price: 1300, user_id: 1, instrument_id: 2},
  {title: "'80 Fender Precision Bass", description: "I've got an old Fender Precision Bass. I'm looking to get rid of it for a different vintage bass. $2500 obo.", image_url: "http://www.riverband.demon.nl/PBS0.jpg", price: 2500, user_id: 2, instrument_id: 11},
  {title: "Pearl Drum Set", description: "I need to sell this drum set. $1430 obo. I'm also looking to trade parts.", image_url: "http://s3.amazonaws.com/images.static.steveweissmusic.com/products/images/uploads/1130882_23204_popup.jpg", price: 1430, user_id: 2, instrument_id: 5},
  {title: "Yamaha PSR-S670", description: "Anyone looking for a great keyboard? I've got this PSR sitting around that I need to get rid of. ", image_url: "http://www.musik-produktiv.com/pic-010079893_01xxl/yamaha-psr-s670_01xxl.jpg", price: 750, user_id: 2, instrument_id: 15},
  {title: "Gibson ES-335 Semi Acoustic", description: "I've got this great ES-335 I'm looking to sell or trade, message me for details.", image_url: "http://www.es-335.org/wp-content/uploads/2010/08/red-150D.jpg", price: 1500, user_id: 3, instrument_id: 2},
  {title: "KORG Synth", description: "Wanna buy my awesome KORG synth? Message me for details. $2300 obo.", image_url: "https://www.korg.de/fileadmin/_korg/_produkte/synthesizer/kr_ms20mini/01_MS-20-mini_front_with-Patch.jpg", price: 2300, user_id: 3, instrument_id: 10},
  {title: "Roland GAIA SH-01", description: "Message me for details, looking to trade or sell.", image_url: "https://static.roland.com/assets/images/products/gallery/sh-01_angle_gal.jpg", price: 1200, user_id: 3, instrument_id: 10}
])
User.create!([
  {username: "jon_s", email: "jon.snow@gmail.com", image_url: "", password_digest: "$2a$10$Z2on3oo4hnUne8OxcC4xTOw69UqpcHqntkiDpunIuzOIGquM1FHVG"},
  {username: "t_stark", email: "tony.stark@gmail.com", image_url: "", password_digest: "$2a$10$SwRjMN9RcvcPNPRiBG1X1O6UHoYpLg5HsMD76zk7VjV.AZvTk24Z2"},
  {username: "django", email: "django@gmail.com", image_url: "", password_digest: "$2a$10$jX/cnJrkordDMBK8p/cxf.cwxiNSV3/GekQ.GZ06WoYt6Za1WthgK"}
])
