NOT_ALLERGIC = ["brussels sprouts","spinach","eggs","milk","tofu","seitan","bell peppers","quinoa","kale","chocolate","beer","wine","whiskey"]

def parse(input)
	input = input.split(' ', 3)
	quantity = input [0]
	unit = input [1]
	name = input [2]
	Ingredient.new(quantity, unit, name)
end

class Ingredient
	def initialize (quantity, unit, name)
		@quantity = quantity
		@unit = unit
		@name = name
	end

	def summary
		"#{@quantity} #{@unit} #{@name}}. Is this ok to eat? #{allergy_checker}"
	end

	def allergy_checker
		NOT_ALLERGIC.include?(@name.downcase)
	end

end

class Recipe
	def initialize (name, instructions, ingredients)
		@name = name
		@instructions = instructions
		@ingredients = ingredients
	end

	def name
		@name
	end

	def instructions
		@instructions
	end

	def ingredients
		ingredients = @ingredients.inject("") do | string, item |
    	string << "\n- #{item.summary}"
		end
	end

	def this_chefs_killin_it?
		result = "Your client won't die!"
		@ingredients.each do |ingredient|
			result = "DANGER ZONE" if !ingredient.allergy_checker
		end
		result
	end


	def summary
<<WHYISTHISSOLONG
Name: #{name}

Is this recipe safe? Chef says: #{this_chefs_killin_it?}

Ingredients: #{ingredients}

Instructions: #{instructions}
WHYISTHISSOLONG
	end
end


name = "Roasted Brussels Sprouts"

ingredients = [
    Ingredient.new(1.5, "lb(s)", "Brussels sprouts"),
    Ingredient.new(3.0, "tbspn(s)", "Good olive oil"),
    Ingredient.new(0.75, "tspn(s)", "Kosher salt"),
    Ingredient.new(0.5, "tspn(s)", "Freshly ground black pepper")
]

instructions = [
    "Preheat oven to 400 degrees F.",
    "Cut off the brown ends of the Brussels sprouts.",
    "Pull off any yellow outer leaves.",
    "Mix them in a bowl with the olive oil, salt and pepper.",
    "Pour them on a sheet pan and roast for 35 to 40 minutes.",
    "They should be until crisp on the outside and tender on the inside.",
    "Shake the pan from time to time to brown the sprouts evenly.",
    "Sprinkle with more kosher salt ( I like these salty like French fries).",
    "Serve and enjoy!"
    ]

recipe = Recipe.new(name, instructions, ingredients)
puts recipe.summary
