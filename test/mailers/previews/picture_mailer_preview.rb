# Preview all emails at http://localhost:3000/rails/mailers/picture_mailer
class PictureMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/picture_mailer/picture_mail
  def picture_mail
    PictureMailer.picture_mail
  end

end
