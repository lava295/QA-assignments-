from flask import Flask, render_template_string

app = Flask(__name__)

TEMPLATE = """
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>WiseCow</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #f9f9f9, #e0f7fa);
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
        }
        .card {
            padding: 2rem;
            border-radius: 1rem;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
            text-align: center;
        }
        .title {
            font-size: 2.5rem;
            font-weight: bold;
            color: #00796b;
        }
        .subtitle {
            font-size: 1.2rem;
            color: #555;
        }
    </style>
</head>
<body>
    <div class="card">
        <div class="title">🐮 WiseCow</div>
        <div class="subtitle">Smart. Simple. Strong.</div>
         <div class="subtitle">Happy to join in Accuknox as QA QA Trainee</div>
        <hr>
        <p class="text-muted">Welcome to the world of wisdom!</p>
    </div>
</body>
</html>
"""

@app.route("/")
def home():
    return render_template_string(TEMPLATE)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080, debug=True)
