User.create!([
  {email: "guillaume.crochemore@gmail.com", password: "testtest", encrypted_password: "$2a$10$g0/tksEul4JTI/x910QyxOIZdV0pbf3tZpQtYDWpi3F2YIse8Nnae", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 3, current_sign_in_at: "2016-05-13 14:31:11", last_sign_in_at: "2016-05-12 15:49:08", current_sign_in_ip: "192.168.1.54", last_sign_in_ip: "127.0.0.1"}
])
Account.create!([
  {name: "La banque postale", owner_id: 1, bank_id: nil, activated: nil}
])
