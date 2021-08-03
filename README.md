# Swym

# Install Elixir
- https://elixir-lang.org/install.html

# Steps
- git clone 
# Solution
- I have approached the solutio using RuleEngine.
Rules are created Dynamically from Dashboard based on Attributes, Conditions and Actions. 
[For simplicity I didn't create any dashboard capability but the idea is to have json as in Swym.Rules but in a persistant DB.]
- Each Attribute is a property that can be inferred from input map.
- Condition is to verfiy if we meet the expectation to trigger Actions.
- Actions are the function responsible to perform the required task.

The solution is designed to be scalable and extensible.
Note: I didn't use any DB.
