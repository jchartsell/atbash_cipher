defmodule AtbashTest do
  use ExUnit.Case

  test "Covers numbers, spaces, punctuation, and line breaks" do
    atbashed = AtbashCipher.Atbash.cipher "Power level 9000!\n9000!?!"
    assert atbashed == "Kldvi ovevo 9000!\n9000!?!"
  end

  test "handles invalid input" do
    atbashed = AtbashCipher.Atbash.cipher 1
    assert atbashed == :ok

    atbasehd = AtbashCipher.Atbash.cipher 'a'
    assert atbashed == :ok
  end
end
