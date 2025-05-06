<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>CSS-Only Floating Labels</title>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet" />
  <style type="text/scss">
    // Variables
    $black: #303030;
    $grey: #909090;
    $off-white: #EDEEE9;
    $code: #D8DBCE;
    $sans-serif: 'Inter', sans-serif;

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      text-decoration: none;
    }

    html {
      position: relative;
      overflow-x: hidden;
      scroll-behavior: smooth;
      background-color: $off-white;

      body {
        background-color: $off-white;
        color: $black;
        font-family: $sans-serif;
        min-height: 100vh;
        width: 100%;
        padding: 2.5vh 10vw;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: flex-start;

        h1 {
          font-size: clamp(1rem, 6vw, 10rem);
          margin: 15vh 0 2rem;
        }

        a {
          text-decoration: underline;
          color: $black;
        }

        code {
          font-size: 1rem;
          padding: 0 0.5rem;
          background-color: $code;
        }

        .explanation {
          width: 100%;
          margin-bottom: 15vh;

          p {
            font-size: 1rem;
            max-width: 75ch;
            margin: 2rem 0;
          }

          ul {
            display: flex;
            flex-direction: column;

            &:last-child {
              margin-bottom: 2rem;
            }

            li {
              list-style: none;
              position: relative;
              margin: 0.5rem 0;

              &::before {
                content: '👉';
                position: absolute;
                top: -0.25rem;
                left: -2rem;
              }
            }
          }
        }

        .container {
          width: 100%;
          max-width: 768px;
          display: flex;
          flex-direction: column;
          justify-content: center;
          align-items: center;
          padding: 2rem 2rem 1.5rem;
          background-color: $code;

          @media (min-width: 768px) {
            flex-direction: row;
            align-items: center;
          }

          .cta-form {
            margin-bottom: 2rem;
            text-align: center;

            @media (min-width: 768px) {
              margin-bottom: 0;
              margin-right: 2rem;
              text-align: left;
            }

            h2 {
              font-size: 1.5rem;
              max-width: 25ch;
              margin: 0 auto;
              text-align: center;

              @media (min-width: 768px) {
                text-align: left;
                margin: 0;
              }
            }

            p {
              margin-top: 1rem;
              font-size: 1rem;
              max-width: 24ch;
            }
          }
        }
      }
    }

    .form {
      align-self: center;
    }

    .form__input {
      width: clamp(120px, 50vw, 420px);
      height: 2.5rem;
      padding: 0 1.25rem;
      border: 1px solid $black;
      border-radius: 2px;
      margin: 0.625rem auto;
      transition: all 250ms;

      @media (min-width: 768px) {
        width: clamp(120px, 35vw, 420px);
      }

      &:focus {
        outline: none;
        border-top-color: rgba(0, 0, 0, 0.1);
      }

      &:focus + .form__label,
      &:not(:placeholder-shown) + .form__label {
        transform: translateY(-4.5rem) scale(1);
        color: $black;
      }

      &::placeholder {
        display: none;
        color: transparent;
        user-select: none;
      }

      &:not(:placeholder-shown) {
        border-top-color: rgba(0, 0, 0, 0.5);
      }
    }

    .form__label {
      font-size: 1rem;
      color: $grey;
      display: block;
      transform: translate(1.25rem, -2.5rem);
      transform-origin: 0 0;
      transition: all 500ms;
      pointer-events: none;
      user-select: none;
    }
  </style>
</head>
<body>
  <h1>Fill the Form</h1>
  <div class="container">
    <div class="cta-form">
      <h2>Fill out the form!</h2> 
      <p>Check out the comments for line by line explanations. Form-related code starts on line 145.</p>
    </div>
    <form action="" class="form">
      <input type="text" placeholder="Name" class="form__input" id="name" />
      <label for="name" class="form__label">Name</label>

      <input type="email" placeholder="Email" class="form__input" id="email" />
      <label for="email" class="form__label">Email</label>

      <input type="text" placeholder="Subject" class="form__input" id="subject" />
      <label for="subject" class="form__label">Subject</label>
    </form>
  </div>

  <div class="explanation">
    <p>Before we get started, it's important to understand how <strong>labels</strong>, <strong>placeholders</strong>, and <strong>input fields</strong> work and how they are used from a UX perspective:</p>
    <ul>
      <li>✅ Input fields have outlines when focused.</li>
      <li>✅ Placeholders show what kind of info is needed.</li>
      <li>✅ Created using the <code>placeholder=""</code> attribute.</li>
      <li>✅ Placeholders disappear when the user types — this affects <code>:placeholder-shown</code>.</li>
      <li>✅ Labels don’t disappear and help users always know what’s required.</li>
      <li>✅ Labels are UX best practice for input fields, text areas, checkboxes, etc.</li>
    </ul>
    <p>We’ll be using these pseudo-selectors to create a floating label effect without JavaScript:</p>
    <ul>
      <li><code>:focus</code> — Element has received input focus.</li>
      <li><code>:not()</code> — Excludes elements from selection.</li>
      <li><code>::placeholder</code> — Targets the placeholder text of inputs.</li>
      <li><code>:placeholder-shown</code> — Input is currently showing placeholder text.</li>
    </ul>
    <p>✅ This is the <strong>only way</strong> to achieve this effect using <strong>pure CSS</strong>.</p>
    <p>A non-SCSS version is available <a href="https://codepen.io/kvncnls/pen/eYzbJJL" target="_blank">here</a>.</p>
  </div>
</body>
</html>


