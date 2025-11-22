<%@ page contentType="text/html;charset=UTF-8" language="java" %>  
<!DOCTYPE html>
<html>
<head>
    <title>Your Profile</title>
    <style>
        body {
            font-family: "Poppins", sans-serif;
            margin: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
            position: relative;
            background: linear-gradient(135deg, #ff9f80, #ffe066, #6a4c93, #ff6f91, #ffb347, #c44569);
            background-size: 1200% 1200%;
            animation: gradientMove 20s ease infinite;
        }

        @keyframes gradientMove {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        /* Background spots */
        .background-spot {
            position: absolute;
            border-radius: 50%;
            opacity: 0.3;
            z-index: 0;
            mix-blend-mode: screen;
        }
        .spot1 { width: 400px; height: 400px; background: radial-gradient(circle, #ff6f91, #ff9671); top: -80px; left: -100px; }
        .spot2 { width: 350px; height: 350px; background: radial-gradient(circle, #6a4c93, #c44569); bottom: -100px; right: -120px; }
        .spot3 { width: 250px; height: 250px; background: radial-gradient(circle, #ffe066, #ffb347); top: 100px; right: -80px; }
        .spot4 { width: 180px; height: 180px; background: radial-gradient(circle, #ff9f80, #ffd480); bottom: 150px; left: -60px; }

        /* Particle overlay */
        .particles {
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            z-index: 1;
            pointer-events: none;
            background-image:
                radial-gradient(circle, rgba(255,255,255,0.15) 2%, transparent 2%),
                radial-gradient(circle, rgba(255,255,255,0.15) 2%, transparent 2%);
            background-size: 40px 40px, 60px 60px;
            animation: moveParticles 30s linear infinite;
        }

        @keyframes moveParticles {
            0% { background-position: 0 0, 0 0; }
            100% { background-position: 800px 800px, 600px 600px; }
        }

        /* Snow container */
        /* Snow container */
.snow {
    position: absolute;
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    pointer-events: none;
    z-index: 100; /* ABOVE all other backgrounds, but below profile box if needed */
    overflow: hidden;
}

/* Snowflake style */
.snowflake {
    position: absolute;
    top: -10px;
    background: white;
    border-radius: 50%;
    opacity: 0.9;
    filter: blur(2px);
    animation-name: fall;
    animation-timing-function: linear;
    animation-iteration-count: infinite;
}

/* Falling animation */
@keyframes fall {
    0% { transform: translateY(0px) translateX(0px); opacity: 1; }
    50% { transform: translateY(50vh) translateX(20px); opacity: 0.8; }
    100% { transform: translateY(100vh) translateX(-20px); opacity: 0.6; }
}


        /* Profile box */
        .profile {
            background: rgba(245, 211, 206, 0.3); /* almost solid, 95% opacity */
            padding: 30px;
            width: 520px;
            max-height: 90vh;
            overflow-y: auto;
            border-radius: 25px;
            box-shadow: 0 20px 50px rgba(0,0,0,0.3);
            position: relative;
            z-index: 5;
            border: 4px solid;
            border-image-slice: 1;
            border-image-source: linear-gradient(45deg, #ff9f80, #ffe066, #6a4c93, #ff6f91);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .profile:hover {
            transform: translateY(-5px);
            box-shadow: 0 25px 60px rgba(0,0,0,0.4);
        }

        h2 {
            text-align: center;
            color: #381a04;
            margin-bottom: 30px;
            font-size: 28px;
            letter-spacing: 1px;
        }

        .info-box {
            background: #6fe3f7;
            padding: 14px 18px;
            border-radius: 12px;
            border-left: 5px solid #d0874a;
            margin-bottom: 14px;
            transition: transform 0.3s, box-shadow 0.3s, background 0.3s;
            cursor: pointer;
            position: relative;
        }

        .info-box:hover {
            transform: scale(1.03);
            box-shadow: 0 15px 35px rgba(208, 135, 74, 0.4), 0 0 20px rgba(255,255,255,0.15) inset;
            background: linear-gradient(135deg, #97f7d9, #6fe3f7);
        }

        .info-box strong {
            color:  #f5f9fa;
            display: block;
            margin-bottom: 6px;
            font-size: 16px;
        }

        textarea.editable {
            width: 100%;
            border-radius: 8px;
            border: 1px solid #d8c1a0;
            padding: 6px;
            font-size: 15px;
            background: #fffaf0;
            resize: none;
            overflow: hidden;
            height: auto;
            transition: background 0.3s, border 0.3s, box-shadow 0.3s;
            box-shadow: inset 0 2px 5px rgba(0,0,0,0.05);
        }

        textarea.editable:hover {
            border: 2px solid #d0874a;
            box-shadow: 0 4px 15px rgba(208,135,74,0.5);
            background: #fff3e6;
        }

        textarea.editable:focus {
            background: white;
            border: 1px solid #ffb347;
        }

        .back-btn {
            display: block;
            text-align: center;
            background: #d0874a;
            color: white;
            font-weight: bold;
            text-decoration: none;
            padding: 14px;
            border-radius: 12px;
            margin-top: 20px;
            position: sticky;
            bottom: 0;
            z-index: 10;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
            transition: background 0.3s, transform 0.3s, box-shadow 0.3s;
        }

        .back-btn:hover { 
            background: #b46b2a; 
            transform: translateY(-3px); 
            box-shadow: 0 8px 20px rgba(0,0,0,0.25);
        }

        .toggle-btn {
            position: absolute;
            right: 12px;
            top: 12px;
            background: #d0874a;
            border: none;
            border-radius: 50%;
            width: 24px;
            height: 24px;
            color: white;
            font-weight: bold;
            cursor: pointer;
            outline: none;
            transition: background 0.3s;
        }

        .toggle-btn:hover {
            background: #b46b2a;
        }
    </style>
</head>
<body>

    <!-- Background spots -->
    <div class="background-spot spot1"></div>
    <div class="background-spot spot2"></div>
    <div class="background-spot spot3"></div>
    <div class="background-spot spot4"></div>

    <!-- Particle overlay -->
    <div class="particles"></div>

    <!-- Snow container -->
    <div class="snow" id="snow"></div>

    <div class="profile">
        <h2>Updated Personal Profile</h2>

        <div class="info-box">
            <strong>Name</strong>
            <textarea class="editable" readonly><%= request.getAttribute("name") %></textarea>
            <button class="toggle-btn">✎</button>
        </div>

        <div class="info-box">
            <strong>Student ID</strong>
            <textarea class="editable" readonly><%= request.getAttribute("studentId") %></textarea>
            <button class="toggle-btn">✎</button>
        </div>

        <div class="info-box">
            <strong>Program</strong>
            <textarea class="editable" readonly><%= request.getAttribute("program") %></textarea>
            <button class="toggle-btn">✎</button>
        </div>

        <div class="info-box">
            <strong>Email</strong>
            <textarea class="editable" readonly><%= request.getAttribute("email") %></textarea>
            <button class="toggle-btn">✎</button>
        </div>

        <div class="info-box">
            <strong>Hobbies</strong>
            <textarea class="editable" readonly><%= request.getAttribute("hobbies") %></textarea>
            <button class="toggle-btn">✎</button>
        </div>

        <div class="info-box">
            <strong>About Me</strong>
            <textarea class="editable" readonly><%= request.getAttribute("selfIntro") %></textarea>
            <button class="toggle-btn">✎</button>
        </div>

        <a href="index.html" class="back-btn">← Back to Form</a>
    </div>

    <script>
        // Toggle editable mode
        document.querySelectorAll('.toggle-btn').forEach(btn => {
            btn.addEventListener('click', function() {
                const box = btn.parentElement;
                const textarea = box.querySelector('textarea');
                textarea.readOnly = !textarea.readOnly;
                textarea.focus();
                btn.textContent = textarea.readOnly ? '✎' : '✔';
                textarea.style.height = 'auto';
                textarea.style.height = textarea.scrollHeight + 'px';
            });
        });

        // Auto-expand textareas initially
        document.querySelectorAll('.editable').forEach(t => {
            t.style.height = t.scrollHeight + 'px';
        });

        
    </script>

</body>
</html>
