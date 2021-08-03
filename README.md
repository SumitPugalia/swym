# Swym

# Install Elixir
- https://elixir-lang.org/install.html

# Steps
- git clone https://github.com/SumitPugalia/swym.git

- iex -S mix phx.server [to start the console]

- Create input:
 - tweet1 = %Swym.Tweet{
              hashtag: nil,
              location: "UCS",
              msg: "Hi Aumit, this is me",
              user_name: "AumitPacks"
            }
 - tweet2 = %Swym.Tweet{
              hashtag: nil,
              location: "US",
              msg: "Hi Sumit, this is me",
              user_name: "SumitPacks"
            }
 - tweet3 = %Swym.Tweet{
              hashtag: nil,
              location: "U",
              msg: "Hi, this is you",
              user_name: "PK"
            }

- Create Stream calls:

[tweet1, tweet2, tweet3] |> Stream.cycle() |> Enum.take(10) |> Enum.each(fn v -> Swym.Tweet.receive(v) end)

This will fire 10 tweets tweet1, tweet2, tweet3, tweet1 and so on...

- Will see some output based on rules and actions.

# Solution
- I have approached the solutio using RuleEngine.
Rules are created Dynamically from Dashboard based on Attributes, Conditions and Actions. 
[For simplicity I didn't create any dashboard capability but the idea is to have json as in Swym.Rules but in a persistant DB.]
- Each Attribute is a property that can be inferred from input map.
- Condition is to verfiy if we meet the expectation to trigger Actions.
- Actions are the function responsible to perform the required task.

The solution is designed to be scalable and extensible.
Note: I didn't use any DB, I didn't call any 3rd parties simply am printing on console.


# Futuristic Solution

- We can enhance this rule engine to control the parallelism by applying worker/consumer pools.
- Complex Rules can be made and parsing logic can be written.
- Use DB for persistance.
- Create Endpoint to support dynamic rules.s 
