require_relative "../../lib/multiplication_table"

describe MultiplicationTable do
  it "renders a multiplication table with provided data" do
    data = [
      [1, 2, 3],
      [2, 4, 6],
      [3, 6, 9]]
    expected_output = "  2 3 \n2 4 6 \n3 6 9 \n"
    expect(MultiplicationTable.draw(data)).to eq expected_output
  end
end
