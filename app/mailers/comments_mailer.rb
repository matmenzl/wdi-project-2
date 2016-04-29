class CommentsMailer < ApplicationMailer
  default from: "no-reply@meetyourstreet.com"

  def post_email(user, commentable)
    @user = user
    @post = commentable
    mail(to: "#{user.first_name} #{user.last_name} <#{user.email}>", subject: "new comment received on #{commentable.title}")
  end
end
