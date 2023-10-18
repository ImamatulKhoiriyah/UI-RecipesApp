class FoodItem {
  final String imageUrl;
  final String name;
  final String time;
  final String rating;
  final String category;
  final List<String> ingredients;
  final List<String> instructions;

  FoodItem({
    required this.imageUrl,
    required this.name,
    required this.time,
    required this.rating,
    required this.category,
    required this.ingredients,
    required this.instructions,
  });
}

class FoodData {
  static List<FoodItem> foods = [
    FoodItem(
      imageUrl:
          "https://i.pinimg.com/564x/40/bc/fa/40bcfaefe3f5c3cf93c7b03aa9add95e.jpg",
      name: "Bibimbap",
      rating: "4.5",
      time: "30 min",
      category: "main course",
      ingredients: [
        '1 cup cooked rice',
        '1/2 cup sliced carrots',
        '1/2 cup sliced cucumber',
        '1/4 cup soy sauce',
        '1 tablespoon sesame oil',
        'Sesame seeds for garnish',
      ],
      instructions: [
        'Mix the cooked rice with soy sauce and sesame oil.',
        'Top the rice with sliced carrots and cucumber.',
        'Garnish with sesame seeds.',
        'Serve and enjoy!'
      ],
    ),
    FoodItem(
        imageUrl:
            "https://i.pinimg.com/564x/b4/eb/89/b4eb895246bed7d85d7d211822674982.jpg",
        name: "Strawbery Honey",
        category: "beverages",
        time: "25 mins",
        rating: "4.4",
        ingredients: [
          '1 cup fresh strawberries, hulled and sliced',
          '1/2 cup honey',
          '1 tablespoon lemon juice (optional, for a bit of tartness)'
        ],
        instructions: [
          'Wash the strawberries thoroughly and remove the stems. Slice them into small pieces.',
          'In a saucepan, combine the sliced strawberries and honey over medium heat.',
          'Allow the mixture to come to a simmer. Stir occasionally to prevent sticking.',
          'If you prefer a smoother consistency, you can use a potato masher or a blender to puree the strawberries.',
          'If you want to add a bit of tartness and brightness to your strawberry honey, stir in the lemon juice. Adjust the amount according to your taste.',
          'Continue to simmer the mixture until it thickens slightly. This may take around 10-15 minutes.',
          'Remove the saucepan from heat and allow the strawberry honey to cool.',
          'Transfer the strawberry honey to a clean, airtight jar. Store it in the refrigerator.',
          'Once cooled, your strawberry honey is ready to be served. Use it as a topping for pancakes, waffles, yogurt, ice cream, or as a spread for toast.'
        ]),
    FoodItem(
        imageUrl:
            "https://i.pinimg.com/564x/ce/53/01/ce5301f702957963f732edc61821f7e9.jpg",
        name: "Curry Fried Rice",
        category: "main course",
        time: "45 mins",
        rating: "4.2",
        ingredients: [
          '2 cups cooked jasmine rice (preferably cooled and day-old)',
          '1 cup mixed vegetables (carrots, peas, corn, and diced bell peppers',
          '1/2 cup diced chicken or tofu (optional)',
          '2 eggs, beaten',
          '3 tablespoons curry powder',
          '2 tablespoons soy sauce',
          '1 tablespoon vegetable oil',
          'Salt and pepper to taste',
          'Green onions, chopped (for garnish)'
        ],
        instructions: [
          'Heat vegetable oil in a large skillet or wok over medium-high heat.',
          'If youre using chicken or tofu, cook it first until its fully cooked and set it aside.',
          'Push the cooked chicken or tofu to the side of the pan, and pour the beaten eggs into the other side. Scramble the eggs until they are fully cooked.',
          'Add the mixed vegetables to the pan and stir-fry for 2-3 minutes until they are slightly tender.',
          'Add the day-old rice to the pan, breaking up any clumps. Stir the rice to combine it with the vegetables and eggs.',
          'Sprinkle the curry powder evenly over the rice and continue to stir-fry, ensuring the curry powder is evenly distributed.',
          'Pour soy sauce over the rice and mix well. Add salt and pepper to taste.',
          'If you cooked chicken or tofu earlier, add it back to the pan and mix it with the rice.',
          'Continue to stir-fry for an additional 2-3 minutes until everything is well combined and heated through.',
          'Garnish with chopped green onions and serve hot!'
        ]),
    FoodItem(
      imageUrl:
          "https://i.pinimg.com/564x/11/2f/77/112f77292e42aff4db60c60152a982ea.jpg",
      name: "Souffle Pancake",
      category: "snacks",
      time: "40 mins",
      rating: "4.6",
      ingredients: [
        '2 large eggs',
        '3 tablespoons milk',
        '1/4 cup all-purpose flour',
        '2 tablespoons granulated sugar',
        '1/2 teaspoon baking powder',
        '1/4 teaspoon vanilla extract',
        'Butter or oil for greasing'
      ],
      instructions: [
        'Separate the egg whites from the yolks into two different bowls.',
        'Use an electric mixer to whip the egg whites until soft peaks form. This may take a few minutes.',
        'In another bowl, whisk together the flour and baking powder.',
        'To the bowl with egg yolks, add milk, sugar, and vanilla extract. Mix until well combined.',
        'Gently fold the dry ingredients into the wet ingredients until just combined. Avoid overmixing.',
        'Carefully fold in the whipped egg whites into the batter. This will give the pancakes a light and fluffy texture.',
        'Heat a non-stick pan or griddle over medium-low heat. Add a small amount of butter or oil to coat the surface.',
        'Spoon or pour the batter onto the pan to form pancakes. Keep the pancakes relatively small, as they will rise during cooking.',
        'Cover the pan with a lid and cook for 2-3 minutes or until the edges start to set.',
        'Gently flip the pancakes using a spatula and cook for an additional 2-3 minutes, or until both sides are golden brown and the pancakes are cooked through.',
        'Stack the pancakes and serve immediately. You can add toppings like syrup, fresh fruits, or whipped cream if desired.'
      ],
    ),
    FoodItem(
        imageUrl:
            "https://i.pinimg.com/564x/93/86/b0/9386b0868831e5327c5e9cd166f0aaf5.jpg",
        name: "Oxtail Soup",
        category: "main dish",
        time: "70 mins",
        rating: "4.3",
        ingredients: [
          '2 pounds oxtails',
          '1 onion, chopped',
          '2 carrots, sliced',
          '2 celery stalks, sliced',
          '3 cloves garlic, minced',
          '1 bay leaf',
          'Salt and pepper to taste',
          '8 cups beef broth',
          '2 tablespoons vegetable oil',
          'Optional: chopped fresh parsley for garnish',
        ],
        instructions: [
          'Heat vegetable oil in a large pot over medium-high heat.',
          'Season oxtails with salt and pepper, then brown them in the pot until all sides are seared. This adds flavor to the soup.',
          'Remove the oxtails and set them aside. In the same pot, sauté onions, carrots, celery, and garlic until they are softened.',
          'Return the oxtails to the pot and add the bay leaf.',
          'Pour in the beef broth, making sure the oxtails are mostly covered. Bring the soup to a boil.',
          'Once boiling, reduce the heat to low, cover the pot, and let it simmer for about 2 to 3 hours or until the oxtails are tender.',
          'Skim off any fat that rises to the top during cooking.',
          'Adjust the seasoning with salt and pepper to taste.',
          'Serve hot, garnished with chopped fresh parsley if desired.'
        ]),
    FoodItem(
        imageUrl:
            "https://i.pinimg.com/564x/1f/fc/95/1ffc950aead4fae6360fcd7c518355de.jpg",
        name: "Gado Gado",
        category: "main course",
        time: "30 mins",
        rating: "4.5",
        ingredients: [
          '4 cups mixed vegetables (cabbage, beansprouts, cucumber, string beans, carrots, and spinach), blanched or steamed',
          '1 block of firm tofu, cut into cubes and fried until golden',
          '1 block of tempeh, cut into cubes and fried until golden',
          '2 hard-boiled eggs, sliced',
          '1 cup bean sprouts (tauge)',
          '1 cup peanuts, roasted and finely ground',
          '2 cloves garlic, minced',
          '1 to 2 red chili peppers, minced (adjust according to your spice preference)',
          '3 tablespoons sweet soy sauce (kecap manis)',
          '1 tablespoon tamarind paste',
          'Salt and sugar to taste',
          'Water to adjust consistency'
        ],
        instructions: [
          'Steam or blanch the mixed vegetables until they are cooked but still crisp. Set aside.',
          'In a blender or food processor, combine the ground peanuts, minced garlic, minced chili peppers, sweet soy sauce, and tamarind paste. Blend until you get a smooth paste.',
          'Add water gradually to achieve the desired consistency.',
          'Season with salt and sugar to taste.'
              'Arrange the blanched or steamed vegetables on a serving plate.',
          'Add the fried tofu, fried tempeh, sliced hard-boiled eggs, and bean sprouts on top.',
          'Drizzle the peanut sauce generously over the vegetables and proteins.',
          'You can also serve additional peanut sauce on the side for those who want extra.',
          'Toss the ingredients together just before eating to ensure an even coating of the delicious peanut sauce.'
        ]),
    FoodItem(
        imageUrl:
            "https://i.pinimg.com/564x/c8/0a/4c/c80a4c5480554d9bd4956e51eb11a099.jpg",
        name: "Panna Cotta",
        category: "Desserts",
        time: "35 mins",
        rating: "4.5",
        ingredients: [
          '2 cups heavy cream',
          '1/2 cup granulated sugar',
          '1 teaspoon vanilla extract',
          '1 packet (about 2 1/4 teaspoons) unflavored gelatin',
          '3 tablespoons cold water'
        ],
        instructions: [
          'Sprinkle the gelatin over the cold water in a small bowl. Let it sit for about 5 minutes until it softens.',
          'In a saucepan, combine the heavy cream and sugar. Heat over medium heat, stirring until the sugar dissolves. Be careful not to boil.',
          'Remove the saucepan from heat. Add the bloomed gelatin to the cream mixture, stirring until the gelatin completely dissolves.',
          'Stir in the vanilla extract.',
          'Pour the mixture into your serving molds or glasses. You can use ramekins, glasses, or any molds of your choice.',
          'Refrigerate for at least 4 hours or until the panna cotta is set.',
          'Once set, you can serve it as is or with your favorite fruit compote, berry sauce, or caramel drizzle.'
        ]
        ),
    FoodItem(
        imageUrl:
            "https://i.pinimg.com/564x/b3/72/99/b37299c474375bdf7c979d11caaa8917.jpg",
        name: "Chicken Garlic",
        category: "side dishes",
        time: "50 mins",
        rating: "4.2",
        ingredients: [
          '500g boneless, skinless chicken breasts, cut into bite-sized pieces',
          '4 cloves garlic, minced',
          '2tablespoons olive oil',
          'Salt and pepper to taste',
          'Fresh parsley, chopped (for garnish)'
        ],
        instructions: [
          'Heat olive oil in a pan over medium heat.',
          'Add minced garlic to the pan and sauté for about 1-2 minutes until it becomes fragrant and lightly golden.',
          'Season the chicken pieces with salt, pepper, and dried oregano.',
          'Add the seasoned chicken to the pan with garlic. Cook until the chicken is browned on all sides and cooked through (about 5-7 minutes).',
          'Garnish with fresh chopped parsley.',
          'Serve the garlic chicken over rice, pasta, or your favorite side dish.'
        ]),
  ];
}
