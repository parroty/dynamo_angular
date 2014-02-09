Dynamo.under_test(DynamoAngular.Dynamo)
Dynamo.Loader.enable
ExUnit.start

defmodule DynamoAngular.TestCase do
  use ExUnit.CaseTemplate

  # Enable code reloading on test cases
  setup do
    Dynamo.Loader.enable
    :ok
  end
end
