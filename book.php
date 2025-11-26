<?php
session_start();
require_once __DIR__ . '/config/db.php';
require_once __DIR__ . '/config/mail_config.php';

// Include PHPMailer classes
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require __DIR__ . '/phpmailer/src/Exception.php';
require __DIR__ . '/phpmailer/src/PHPMailer.php';
require __DIR__ . '/phpmailer/src/SMTP.php';

$recipeId = isset($_GET['recipe_id']) ? (int)$_GET['recipe_id'] : 0;
$selectedRecipe = null;

if ($recipeId > 0) {
    $stmt = $pdo->prepare("SELECT id, title FROM recipes WHERE id = ?");
    $stmt->execute([$recipeId]);
    $selectedRecipe = $stmt->fetch();
}

$errors = [];

$name   = trim($_POST['name'] ?? '');
$email  = trim($_POST['email'] ?? '');
$phone  = trim($_POST['phone'] ?? '');
$people = (int)($_POST['people'] ?? 0);
$date   = $_POST['date'] ?? '';

if ($name === '') {
    $errors[] = "Name is required.";
}

if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    $errors[] = "Please enter a valid email address.";
}

if (!preg_match('/^[0-9]{7,15}$/', $phone)) {
    $errors[] = "Phone number must be 7–15 digits.";
}

if ($people <= 0) {
    $errors[] = "Number of people must be at least 1.";
}

if (empty($date) || strtotime($date) < strtotime('today')) {
    $errors[] = "Please choose a date in the future.";
}

if (empty($errors)) {
    
} else {
    


    if (empty($errors)) {
    
        $stmt = $pdo->prepare(
            "INSERT INTO bookings
               (name, email, phone, booking_date, booking_time, guests, message, recipe_id)
             VALUES (?, ?, ?, ?, ?, ?, ?, ?)"
        );
        $stmt->execute([
            $name, $email, $phone, $date, $time, $guests, $msg,
            $recipeIdPost
        ]);

     
        try {
            $mail = new PHPMailer(true);
            
            $mail->isSMTP();
            $mail->Host       = SMTP_HOST;
            $mail->SMTPAuth   = true;
            $mail->Username   = SMTP_USER;
            $mail->Password   = SMTP_PASS;
            $mail->SMTPSecure = SMTP_SECURE;
            $mail->Port       = SMTP_PORT;

       
            $mail->setFrom(SMTP_USER, 'EverestFood Booking');
            $mail->addAddress(RESTAURANT_EMAIL, RESTAURANT_NAME);

            if (!empty($email)) {
                $mail->addReplyTo($email, $name);
            }

           
            $recipeTitle = 'No specific recipe selected';
            if (!empty($recipeIdPost)) {
                $rs = $pdo->prepare("SELECT title FROM recipes WHERE id = ?");
                $rs->execute([$recipeIdPost]);
                $row = $rs->fetch();
                if ($row) {
                    $recipeTitle = $row['title'];
                }
            }

           
            $mail->isHTML(true);
            $mail->Subject = 'New Table Booking - EverestFood';

            $body  = "<h3>New table booking received</h3>";
            $body .= "<p><strong>Name:</strong> " . htmlspecialchars($name) . "</p>";
            $body .= "<p><strong>Email:</strong> " . htmlspecialchars($email) . "</p>";
            $body .= "<p><strong>Phone:</strong> " . htmlspecialchars($phone) . "</p>";
            $body .= "<p><strong>Date:</strong> " . htmlspecialchars($date) . "</p>";
            $body .= "<p><strong>Time:</strong> " . htmlspecialchars($time) . "</p>";
            $body .= "<p><strong>Guests:</strong> " . (int)$guests . "</p>";
            $body .= "<p><strong>Requested recipe:</strong> " . htmlspecialchars($recipeTitle) . "</p>";
            $body .= "<p><strong>Message:</strong><br>" . nl2br(htmlspecialchars($msg)) . "</p>";

            $mail->Body = $body;

            $mail->send();
          
        } catch (Exception $e) {
            
        }

      
        header("Location: booking_success.php");
        exit;
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Book a Table | everestfood</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>

<header>
  <div class="brand">everestfood</div>
  <nav>
    <a href="index.php">Home</a>
    <a href="book.php">Book a Table</a>
    <a href="admin/login.php">Admin</a>
  </nav>
</header>

<div class="container">
  <h1>Book a Table</h1>
  <p>Fill in the form to reserve a table at everestfood.</p>

  <?php if (!empty($errors)): ?>
    <div class="alert error">
      <?php foreach ($errors as $e): ?>
        <div><?= htmlspecialchars($e) ?></div>
      <?php endforeach; ?>
    </div>
  <?php endif; ?>

  <form method="post">
    <?php if ($selectedRecipe): ?>
      <p><strong>Booking for recipe:</strong> <?= htmlspecialchars($selectedRecipe['title']) ?></p>
      <input type="hidden" name="recipe_id" value="<?= (int)$selectedRecipe['id'] ?>">
    <?php else: ?>
      <label>Optional: choose a recipe</label>
      <select name="recipe_id">
        <option value="">-- No specific recipe --</option>
        <?php
        $rs = $pdo->query("SELECT id, title FROM recipes ORDER BY title");
        foreach ($rs as $r) {
            echo '<option value="'.(int)$r['id'].'">'.htmlspecialchars($r['title']).'</option>';
        }
        ?>
      </select>
    <?php endif; ?>

    <label>Name</label>
    <input type="text" name="name" required>

    <label>Email</label>
    <input type="email" name="email" required>

    <label>Number</label>
    <input type="Phone" name="phone" required>

    <label>Date</label>
    <input type="date" name="booking_date" required>

    <label>Time</label>
    <input type="time" name="booking_time" required>

    <label>Number of guests</label>
    <input type="number" name="guests" min="1" required>

    <label>Message (optional)</label>
    <textarea name="message" rows="4"></textarea>

    <button type="submit" class="btn primary" style="margin-top:16px;">Submit Booking</button>
  </form>
</div>

<footer>
  © 2025 everestfood
</footer>

</body>
</html>
