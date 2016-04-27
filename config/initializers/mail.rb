ActionMailer::Base.smtp_settings = {
  address: ""
  port: 587,
  enable_starttls_auto: true,
  user_name: "mathias.menzl@gmail.com"
  password: 
  authentification: login
}

ActionMailer::Base.delivery_method = :smtp
