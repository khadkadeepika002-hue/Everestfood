-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Dec 03, 2025 at 10:57 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `everestfood`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `booking_date` date NOT NULL,
  `booking_time` time NOT NULL,
  `guests` int(11) NOT NULL,
  `message` text DEFAULT NULL,
  `recipe_id` int(11) DEFAULT NULL,
  `status` enum('pending','confirmed','cancelled') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `name`, `email`, `phone`, `booking_date`, `booking_time`, `guests`, `message`, `recipe_id`, `status`, `created_at`) VALUES
(1, 'Sandhya Shrestha', 'sandhya@gmail.com', '', '2025-11-16', '14:30:00', 3, '', 10, 'pending', '2025-11-15 22:25:45'),
(2, 'Deepika Khadka', 'deepska29@gmail.com', '', '2025-11-16', '16:00:00', 2, '', NULL, 'pending', '2025-11-15 22:51:15'),
(3, 'yogesh basnet', 'yogesh.bsnt0328@gmail.com', '', '2025-11-17', '15:40:00', 2, '', 1, 'pending', '2025-11-16 21:36:27'),
(4, 'Srijana Tamang', 'srijana@gmail.com', '', '2025-11-17', '11:50:00', 3, '', NULL, 'pending', '2025-11-17 08:51:56'),
(5, 'Deepika Khadka', 'khadkadeepika002@gmail.com', '', '2025-11-17', '11:35:00', 1, '', NULL, 'pending', '2025-11-17 10:35:20'),
(6, '1233222', '122334@gmail.com', '', '2025-11-19', '13:44:00', 1, '', NULL, 'pending', '2025-11-17 10:44:19'),
(7, 'trishana darlami', 'tirsanadarlami@gmail.com', '44232526', '2025-11-20', '20:04:00', 1, '', 10, 'pending', '2025-11-19 16:04:41'),
(8, 'Deepika Khadka', 'khadkadeepika002@gmail.com', '71520727', '2025-11-27', '15:50:00', 2, '', NULL, 'pending', '2025-11-26 10:46:48'),
(9, 'Deepika Khadka', 'khadkadeepika002@gmail.com', '71520727', '2025-11-29', '20:05:00', 2, '', 22, 'pending', '2025-11-28 13:01:36'),
(10, 'Deepika Khadka', 'khadkadeepika002@gmail.com', '71520727', '2025-12-10', '14:20:00', 3, '', 2, 'pending', '2025-12-03 09:15:07'),
(11, 'Deepika Khadka', 'khadkadeepika002@gmail.com', '71520727', '2025-12-10', '15:25:00', 2, '', 4, 'pending', '2025-12-03 09:19:22');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Breakfast'),
(2, 'Lunch'),
(3, 'Dinner'),
(4, 'Dessert'),
(5, 'Vegetarian');

-- --------------------------------------------------------

--
-- Table structure for table `recipes`
--

CREATE TABLE `recipes` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `short_description` varchar(255) DEFAULT NULL,
  `ingredients` text NOT NULL,
  `steps` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `recipes`
--

INSERT INTO `recipes` (`id`, `title`, `short_description`, `ingredients`, `steps`, `created_at`, `image`) VALUES
(1, 'Momo', 'Juicy chicken dumplings with Nepali spices.', 'flour, minced chicken, onion, garlic, ginger, green chili, coriander leaves, soy sauce, sesame oil, salt, black pepper, turmeric, momo masala, water', '-Combine minced chicken with onion, ginger, garlic, chili, spices, soy sauce and sesame oil.\r\n-Prepare a smooth dough with flour and water; rest 20 minutes.\r\n-Roll thin momo wrappers, fill with chicken mixture.\r\n-Fold into pleats and shape dumplings.\r\n-Steam 10–12 minutes until glossy and cooked.\r\n-Serve hot with roasted tomato–sesame achar', '2025-11-15 20:54:13', 'uploads/momo.jpg'),
(2, 'Dal Bhat Set', 'Traditional Nepali lentil soup served with aromatic rice, ghee, and seasonal sides.', 'rice, lentils, potato, spinach, tomato, onion, garlic, ginger, green chili, cumin seeds, turmeric, chili powder, mustard oil, ghee, salt, water', '-Cook rice and keep warm.\r\n-Boil lentils with turmeric and salt; add garlic-cumin tempering.\r\n-Fry potato with onion, garlic, chili and spices to make a simple curry.\r\n-Sauté spinach with garlic and salt.\r\n-Mash boiled tomatoes with chili and salt for achar.\r\n-Serve rice with dal, curry, saag, and achar; top rice with ghee.', '2025-11-15 21:02:07', 'uploads/thakali.jpg'),
(3, 'Chowmein', 'Wok-tossed noodles with crisp vegetables and classic Nepali spices.', 'noodles, cabbage, carrot, capsicum, onion, garlic, ginger, green chili, soy sauce, chili sauce, vinegar, black pepper, oil, salt', '-Cook noodles until just done; drain and coat lightly with oil.\r\n- Heat oil on high flame and sauté garlic, ginger, and green chili.\r\n- Add onion, cabbage, carrot, and capsicum. Toss until slightly crisp.\r\n-Mix in soy sauce, chili sauce, vinegar, salt, and pepper.\r\n- Add noodles and toss on high heat until evenly coated.\r\n-Plate hot with extra chili sauce.', '2025-11-15 21:04:28', 'uploads/chowmein.jpg'),
(4, 'Biryani', 'Layered aromatic basmati rice with marinated vegetables, saffron, and whole spices.', 'basmati rice, potato, carrot, beans, peas, onion, yogurt, biryani masala, saffron milk, bay leaf, cinnamon, cloves, cardamom, mint leaves, ghee, salt', '- Half-cook basmati rice with bay leaf, cloves, cinnamon, and cardamom.\r\n-Sauté onion in ghee, add vegetables, yogurt, biryani masala, and salt. Cook until partially done.\r\n- In a heavy pot, layer rice and vegetable mixture alternately.\r\n-:Drizzle saffron milk and sprinkle mint leaves.\r\n- Seal the pot and cook on low flame for 15–20 minutes.\r\n-Fluff gently and serve with raita.', '2025-11-15 21:07:51', 'uploads/biryani.jpg'),
(5, 'Aalo paratha', 'Indian stuffed flatbread filled with seasoned mashed potatoes.', 'flour, potato, green chili, coriander leaves, cumin powder, chili powder, garam masala, salt, ghee, water', '- Make soft dough using flour, salt and water; rest 15 minutes.\r\n- Mash boiled potatoes and mix with chili, coriander and spices.\r\n- Stuff dough balls with potato filling and seal edges.\r\n- Roll gently into flat parathas.\r\n- Cook on a hot pan with ghee until golden on both sides.', '2025-11-15 21:10:28', 'uploads/aalo_paratha.jpg'),
(6, 'Butter Chicken', 'Creamy tomato-based chicken curry cooked with butter and mild Indian spices.', 'chicken, yogurt, ginger-garlic paste, tomato puree, butter, cream, chili powder, turmeric, garam masala, salt, oil', '- Marinate chicken with yogurt, ginger-garlic paste, chili powder, turmeric, and salt.\r\n- Cook or grill the marinated chicken until lightly browned.\r\n- Heat butter in a pan and add tomato puree; cook until the sauce thickens.\r\n- Add chili powder, garam masala, and a little salt; simmer for a few minutes.\r\n- Add cream and the cooked chicken pieces to the sauce.\r\n- Cook on low heat until chicken is tender and flavors combine.', '2025-11-15 21:11:41', 'uploads/butterchicken.jpg'),
(7, 'Gulab Jamun', 'Soft fried milk balls soaked in fragrant sugar syrup.', 'milk powder, flour, ghee, baking soda, milk, sugar, cardamom, rose essence, water', '- Mix milk powder, flour, baking soda, ghee, and milk to make a soft dough.\r\n- Shape the dough into small smooth balls.\r\n- Fry the balls on low heat until golden brown.\r\n- Prepare sugar syrup by boiling sugar, water, and cardamom.\r\n- Add rose essence and warm the syrup gently.\r\n- Soak the fried jamuns in warm syrup until soft and juicy.', '2025-11-15 21:14:18', 'uploads/gulab_jamun.jpg'),
(8, 'Samosa', 'Crispy pastry pockets filled with spicy potato mixture.', 'flour, potato, peas, onion, ginger, green chili, cumin seeds, coriander powder, garam masala, chili powder, oil, salt, water', '- Prepare dough by mixing flour, salt, oil, and water; rest 20 minutes.\r\n- Boil and mash potatoes; mix with peas, spices, chili, ginger, and salt.\r\n- Roll dough into oval shapes and cut in half.\r\n- Shape each half into a cone and fill with potato mixture.\r\n- Seal the edges with water.\r\n- Fry on medium heat until crisp and golden.', '2025-11-15 21:15:11', 'uploads/samosa.jpg'),
(9, 'Thukpa', 'Warm Nepali noodle soup cooked with vegetables, herbs, and broth.', 'noodles, onion, tomato, garlic, ginger, carrot, cabbage, green chili, soy sauce, vegetable stock, oil, salt, pepper', '- Heat oil and sauté garlic, ginger, onion, and green chili.\r\n- Add tomato and cook until soft.\r\n- Mix in chopped vegetables and stir-fry for a minute.\r\n- Pour vegetable stock and bring to a boil.\r\n- Add noodles and cook until soft.\r\n- Season with soy sauce, salt, and pepper before serving.', '2025-11-15 21:16:49', 'uploads/thukpa.jpg'),
(10, 'Yomari', 'Newari steamed rice-dough dumpling filled with sweet chaku or khuwa.', 'rice flour, chaku, sesame seeds, ghee, water', '- Heat water and gradually mix into rice flour to form a soft dough.\r\n- Knead until smooth and cover with a damp cloth.\r\n- Melt chaku with sesame seeds to make the filling.\r\n- Shape dough into a cone and fill with warm chaku mixture.\r\n- Seal the top and shape into yomari.\r\n- Steam for 10–12 minutes until firm and cooked.', '2025-11-15 21:17:33', 'uploads/yomari.jpg'),
(11, 'Sel Roti', 'Traditional Nepali ring-shaped fried bread made from rice batter.', 'rice flour, banana, sugar, ghee, milk, cardamom powder, water', '- Mash banana and mix with rice flour, sugar, ghee, and cardamom.\r\n- Add milk or water to make a thick, smooth batter.\r\n- Heat oil/ghee in a deep pan.\r\n- Pour the batter in a circular ring shape into hot oil.\r\n- Fry until golden and crisp on both sides.\r\n- Drain and serve warm.', '2025-11-15 21:18:39', 'uploads/selroti.jpg'),
(12, 'Aalo Curry', 'A simple, comforting Indian potato curry made with basic spices and served with roti or rice', 'Boiled potatoes, chopped onion, chopped tomato, cumin seeds, turmeric powder, red chili powder, coriander powder, salt, oil, water, and fresh coriander.', '-Heat oil in a pan and add cumin seeds.\r\n-Add chopped onions and sauté until golden.\r\n-Add tomatoes and cook until soft.\r\n-Add turmeric, chili powder, coriander powder, and salt.\r\n-Add boiled potatoes and mix well.\r\n-Add water to make gravy and simmer.\r\n-Garnish with coriander and serve.', '2025-11-23 20:16:35', 'uploads/aalo_curry.jpg'),
(13, 'Masala Chai', 'A flavorful Indian tea brewed with spices, ginger, and milk.', 'Water, milk, tea leaves, crushed cardamom, crushed ginger, and sugar.', 'Boil water with ginger and cardamom.\r\n\r\nAdd tea leaves and let it boil for a minute.\r\n\r\nAdd milk and sugar and bring to a boil.\r\n\r\nSimmer for stronger flavor.\r\n\r\nStrain into cups and serve hot.', '2025-11-23 20:18:29', 'uploads/masala chai.jpg'),
(14, 'Malpua', 'Soft, sweet Nepali pancakes made with flour, milk, and sugar.', 'Flour, milk, sugar, fennel seeds, ghee or oil, and water.', 'Mix flour, milk, water, sugar, and fennel seeds to make a smooth batter.\r\n\r\nHeat ghee or oil in a pan.\r\n\r\nPour a small ladle of batter and let it spread naturally.\r\n\r\nCook until golden on both sides.\r\n\r\nServe warm as a sweet breakfast.', '2025-11-23 20:19:47', 'uploads/malpua.jpg'),
(15, 'Jeera Rice', 'A simple cumin-flavored rice often paired with curry or dal.', 'Basmati rice, cumin seeds, bay leaf (optional), salt, oil or ghee, and water.', 'Rinse basmati rice and soak for 15 minutes.\r\n\r\nHeat ghee or oil in a pot and add cumin seeds.\r\n\r\nAdd bay leaf if using.\r\n\r\nAdd drained rice and sauté for a minute.\r\n\r\nAdd water and salt.\r\n\r\nCook on low heat until rice is fluffy.\r\n\r\nServe warm.', '2025-11-23 20:20:53', 'uploads/jeera rice.jpg'),
(16, 'Chicken Curry', 'A basic, flavorful Indian chicken curry made with onions, tomatoes, and spices.', 'Chicken pieces, chopped onion, chopped tomato, garlic, ginger, turmeric, chili powder, coriander powder, salt, garam masala, oil, water, and coriander leaves', 'Heat oil and sauté onions until golden.\r\n\r\nAdd ginger and garlic and cook.\r\n\r\nAdd tomatoes and soften.\r\n\r\nAdd spices and mix well.\r\n\r\nAdd chicken pieces and coat with masala.\r\n\r\nAdd water and simmer until chicken is cooked.\r\n\r\nAdd garam masala and coriander.\r\n\r\nServe hot.', '2025-11-23 20:21:33', 'uploads/chickencurry.jpg'),
(17, 'Sukuti Sadeko', 'A spicy Nepali dry buffalo or goat meat mix, eaten with rice or as a side.', 'Dried meat pieces (sukuti), onion, tomato, green chilies, lemon juice, mustard oil, salt, chili flakes, and coriander.', 'Slightly warm the sukuti to soften.\r\n\r\nShred into small pieces.\r\n\r\nAdd chopped onion and tomato.\r\n\r\nAdd chili flakes and salt.\r\n\r\nPour mustard oil and mix well.\r\n\r\nAdd lemon juice and coriander.\r\n\r\nServe as a side dish.', '2025-11-23 20:25:18', 'uploads/sukuti.jpg'),
(18, 'Paneer Butter Masala', 'A creamy, mildly spiced North Indian paneer curry perfect with naan or rice.', 'Paneer cubes, butter, onion, tomato puree, ginger, garlic, cream, cashew paste, garam masala, chili powder, turmeric, salt, sugar, kasuri methi, and oil.', 'Heat butter in a pan and add ginger–garlic paste.\r\n\r\nAdd onion and sauté until soft.\r\n\r\nAdd tomato puree and cook until oil separates.\r\n\r\nAdd turmeric, chili powder, garam masala, salt, and sugar.\r\n\r\nAdd cashew paste and mix well.\r\n\r\nAdd paneer cubes and cook gently.\r\n\r\nAdd cream and crushed kasuri methi.\r\n\r\nSimmer and serve.', '2025-11-23 20:26:27', 'uploads/butter panner.jpg'),
(19, 'Kheer', 'A creamy Indian–Nepali rice pudding simmered with milk and flavored with cardamom.', 'Rice, milk, sugar, cardamom, ghee, nuts, raisins, and saffron (optional).', 'Heat ghee and lightly fry rice.\r\n\r\nAdd milk and bring to a boil.\r\n\r\nSimmer until rice softens and mixture thickens.\r\n\r\nAdd sugar and mix well.\r\n\r\nAdd cardamom and nuts.\r\n\r\nCook for a few more minutes.\r\n\r\nServe warm or chilled.', '2025-11-23 20:27:05', 'uploads/kheer.jpg'),
(20, 'Rajma Masala', 'A comforting Punjabi-style red kidney bean curry.', 'Soaked rajma, chopped onions, tomato puree, garlic, ginger, chili powder, turmeric, garam masala, cumin, salt, oil, and coriander leaves.', 'Cook soaked rajma until soft.\r\n\r\nHeat oil and sauté onions until golden.\r\n\r\nAdd ginger-garlic paste and cook.\r\n\r\nAdd tomato puree and spices.\r\n\r\nAdd cooked rajma and simmer until thick.\r\n\r\nGarnish with coriander and serve.', '2025-11-23 20:28:56', 'uploads/rajma.jpg'),
(21, 'Matar Panner', 'A classic Indian curry with peas and paneer in a tomato-onion gravy.', 'Paneer cubes, green peas, chopped onions, tomatoes, ginger, garlic, turmeric, chili powder, cumin seeds, salt, garam masala, and oil.', 'Fry cumin in hot oil.\r\n\r\nAdd onions and sauté until brown.\r\n\r\nAdd ginger-garlic paste and tomato and cook.\r\n\r\nAdd spices and stir.\r\n\r\nAdd peas and cook slightly.\r\n\r\nAdd paneer and some water and simmer.\r\n\r\nServe with roti or rice.', '2025-11-23 20:29:35', 'uploads/matar paneer.jpg'),
(22, 'Halwa', 'A quick Indian semolina sweet cooked with ghee and sugar.', 'Semolina (sooji), ghee, sugar, water, cardamom, cashews, raisins, and almonds.', 'Heat ghee and roast semolina until fragrant.\r\n\r\nAdd water and stir continuously.\r\n\r\nAdd sugar and cardamom.\r\n\r\nCook until thick.\r\n\r\nAdd nuts on top and serve warm.', '2025-11-23 20:32:10', 'uploads/halwa.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `recipe_category`
--

CREATE TABLE `recipe_category` (
  `recipe_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `recipe_category`
--

INSERT INTO `recipe_category` (`recipe_id`, `category_id`) VALUES
(1, 2),
(2, 2),
(2, 3),
(3, 2),
(3, 5),
(4, 2),
(4, 3),
(5, 1),
(5, 2),
(6, 2),
(6, 3),
(7, 4),
(7, 5),
(8, 5),
(9, 2),
(9, 3),
(10, 4),
(10, 5),
(11, 1),
(11, 4),
(12, 5),
(13, 1),
(14, 1),
(14, 4),
(15, 2),
(15, 3),
(16, 2),
(16, 3),
(17, 3),
(18, 2),
(19, 4),
(20, 5),
(21, 5),
(22, 4),
(22, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_booking_recipe` (`recipe_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recipe_category`
--
ALTER TABLE `recipe_category`
  ADD PRIMARY KEY (`recipe_id`,`category_id`),
  ADD KEY `fk_rc_category` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `fk_booking_recipe` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `recipe_category`
--
ALTER TABLE `recipe_category`
  ADD CONSTRAINT `fk_rc_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_rc_recipe` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
