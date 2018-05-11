require './family_friday'

describe 'family friday' do
  let(:list) { create_list(6) }

  def create_list(n)
    Array.new(n) { |i| i }
  end

  it 'a team member is only in one group' do
    expect((family_friday(list).flatten & list).size).to eq(list.size)
    expect(family_friday(list).flatten.size).to eq(list.size)
  end

  context 'when there are 6 team members' do
    it 'creates 2 groups' do
      expect(family_friday(list).size).to eq(2)
    end
  end

  context 'when there are 7 team members' do
    let(:list) { create_list(7) }

    it 'creates 2 groups' do
      expect(family_friday(list).size).to eq(2)
    end
  end

  # different team sizes
  # validate team sizes as is
  # 3 - 20

  (3..20).each do |list_size|
    context "when list_size is #{list_size}" do
      it "has all groups greater than 3 and less than 5" do
        list = create_list(list_size)
        groups = family_friday(list)
        expect(groups).to_not be_empty

        expected_result = groups.all? { |group| group.size >= 3 && group.size <= 5 }
        expect(expected_result).to eq(true)
      end
    end
  end
end