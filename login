<?php
require_once 'config.php';

if (isset($_SESSION['user_id'])) { header('Location: index.php'); exit; }

$error = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = trim($_POST['email']);
    $pass  = md5($_POST['password']);

    $stmt = $pdo->prepare("SELECT * FROM users WHERE email = ? AND password = ?");
    $stmt->execute([$email, $pass]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($user) {
        $_SESSION['user_id']   = $user['id'];
        $_SESSION['user_name'] = $user['name'];
        $redirect = isset($_GET['redirect']) ? $_GET['redirect'] : 'index.php';
        header('Location: ' . $redirect);
        exit;
    } else {
        $error = "Invalid email or password.";
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login - PawHome</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<nav class="navbar">
    <div class="nav-brand">🐾 PawHome</div>
    <div class="nav-links">
        <a href="index.php">Home</a>
        <a href="pets.php">Pets</a>
        <a href="login.php" class="active">Login</a>
        <a href="register.php">Register</a>
    </div>
</nav>

<div class="form-container">
    <h2>Login</h2>

    <?php if ($error): ?>
        <div class="alert alert-error"><?= $error ?></div>
    <?php endif; ?>

    <form method="POST">
        <div class="form-group">
            <label>Email</label>
            <input type="email" name="email" required value="<?= htmlspecialchars($_POST['email'] ?? '') ?>">
        </div>
        <div class="form-group">
            <label>Password</label>
            <input type="password" name="password" required>
        </div>
        <button type="submit" class="btn" style="width:100%;">Login</button>
    </form>

    <div class="form-footer">
        Don't have an account? <a href="register.php">Register here</a>
    </div>
</div>

<footer class="footer">
    <p>🐾 PawHome Pet Adoption &copy; <?= date('Y') ?></p>
</footer>

</body>
</html>
