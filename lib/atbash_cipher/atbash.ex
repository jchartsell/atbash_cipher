defmodule AtbashCipher.Atbash do
  @atbash_key   %{
    a: "z", b: "y", c: "x", d: "w", e: "v", f: "u", g: "t", h: "s", i: "r",
    j: "q", k: "p", l: "o", m: "n", n: "m", o: "l", p: "k", q: "j", r: "i",
    s: "h", t: "g", u: "f", v: "e", w: "d", x: "c", y: "b", z: "a"
  }


  def cipher(string) when is_bitstring(string) do
    cipher(String.split(string, ""), [])
  end

  def cipher(string) do
    IO.puts "[ #{string} ] is not valid input.\nEnsure you are using double quotes \"\""
  end

  defp cipher([""], new_string) do
    List.to_string(new_string)
  end

  defp cipher([h|t], new_string) do
    character = h |> process_char
    cipher(t, new_string ++ [character])
  end

  defp process_char(character) when is_bitstring(character) do
    character
      |> check_key
      |> check_case
  end

  defp process_char(character) do
    IO.puts "\[ #{character} \] is not an english alphabet character of type String\n OR \nIt's not wrapped in double quotes \"\""
  end

  defp check_key(character) do
    {has_key(character), character}
  end

  defp check_case({:true, character}) do
    case character |> String.downcase == character do
      true ->
        #IO.puts "\[ #{character} \] is already lower-case"
        character = Map.fetch! @atbash_key, String.to_atom(character)
        character
      false ->
        #IO.puts "\[ #{character} \] is not already lower-case"
        character = Map.fetch! @atbash_key, convert(character)
        character = String.upcase(character)
        character
    end
  end

  defp check_case({:false, character}) do
    IO.puts "\[ #{character} \] punctuation or non-english character, skipping"
    character
  end

  defp has_key(character) do
    Map.has_key?(@atbash_key, convert(character))
  end

  defp convert(character) do
    character
      |> String.downcase
      |> String.to_atom
  end
end
