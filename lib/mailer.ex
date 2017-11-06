defmodule BeerChecker.Mailer do
  use Bamboo.Mailer, otp_app: :beer_checker
end


defmodule BeerChecker.Email do
  import Bamboo.Email

  def send(subject, body) do
    new_email()
    |> to("jonaszmaciej@gmail.com")
    |> from("jajonaszbeers@gmail.com")
    |> subject(subject)
    |> text_body(body)
    |> BeerChecker.Mailer.deliver_now
  end

end