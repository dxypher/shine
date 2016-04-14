RSpec::Matchers.define :violate_check_contraint do |contraint_name|
  supports_block_expectations

  match do |code_to_test|
    begin
      code_to_test.()
      false
    rescue ActiveRecord::StatementInvalid => ex
      ex.message =~ /#{contraint_name}/
    end
  end
end
