defmodule DNA do
  def encode_nucleotide(code_point) do
    case code_point do
      ?\s -> 0b0000
      ?A -> 0b0001
      ?C -> 0b0010
      ?G -> 0b0100
      ?T -> 0b1000
    end
  end

  def decode_nucleotide(encoded_code) do
    case encoded_code do
      0b0000 -> ?\s
      0b0001 -> ?A
      0b0010 -> ?C
      0b0100 -> ?G
      0b1000 -> ?T
    end
  end

  def encode(dna), do: encode_process(dna, <<0::size(0)>>)

  defp encode_process([], acc_bitstring), do: acc_bitstring

  defp encode_process([nc | tail] , acc_bitstring) do
   encode_process(tail, <<acc_bitstring::bitstring, encode_nucleotide(nc):: 4>>)
  end

  def decode(dna), do: decode_process(dna, '')

  defp decode_process(<<0::0>>, acc_bitstring), do: acc_bitstring
  defp decode_process(<<nc::4, tail::bitstring>>, acc_bitstring) do
    decode_process(tail, acc_bitstring ++ [decode_nucleotide(nc)])
  end

end
