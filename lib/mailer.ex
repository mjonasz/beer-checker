defmodule BeerChecker.Mailer do
  use Bamboo.Mailer, otp_app: :beer_checker
end


defmodule BeerChecker.Email do
  import Bamboo.Email

  def welcome_email do
    new_email()
    |> to("jonaszmaciej@gmail.com")
    |> from("jajonaszbeers@gmail.com")
    |> subject("Welcome!!!")
    |> html_body("<strong>Welcome</strong>")
    |> text_body("welcome")
    |> BeerChecker.Mailer.deliver_now
  end
end