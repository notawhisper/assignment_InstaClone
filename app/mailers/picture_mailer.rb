class PictureMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.picture_mailer.picture_mail.subject
  #
  def picture_mail(picture)
    @picture = picture

    mail to: @picture.user.email, subject: "投稿確認メール"
  end
end
