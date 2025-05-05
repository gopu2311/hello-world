<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>CSS-Only Floating Labels</title>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet" />
  <style>
    :root {
      --black: #303030;
      --grey: #909090;
      --off-white: #EDEEE9;
      --code: #D8DBCE;
      --sans-serif: 'Inter', sans-serif;
    }

    *,
    *::before,
    *::after {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      text-decoration: none;
    }

    html {
      position: relative;
      overflow-x: hidden;
      scroll-behavior: smooth;
      background-color: var(--off-white);
    }

    body {
      background-color: var(--off-white);
      color: var(--black);
      font-family: var(--sans-serif);
      min-height: 100vh;
      width: 100%;
      padding: 2.5vh 10vw;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: flex-start;
    }

    h1 {
      font-size: clamp(1rem, 6vw, 10rem);
      margin: 15vh 0 2rem;
    }

    a {
      text-decoration: underline;
      color: var(--black);
    }

    code {
      font-size: 1rem;
      padding: 0 0.5rem;
      background-color: var(--code);
    }

    .explanation {
      width: 100%;
      margin-bottom: 15vh;
    }

    .explanation p {
      font-size: 1rem;
      max-width: 75ch;
      margin: 2rem 0;
    }

    .explanation ul {
      display: flex;
      flex-direction: column;
    }

    .explanation li {
      list-style: none;
      position: relative;
      margin: 0.5rem 0;
    }

    .explanation li::before {
      content: '👉';
      position: absolute;
      top: -0.25rem;
      left: -2rem;
    }

    .explanation ul:last-child {
      margin-bottom: 2rem;
    }

    .container {
      width: 100%;
      max-width: 768px;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      padding: 2rem 2rem 1.5rem;
      background-color: var(--code);
    }

    @media (min-width: 768px) {
      .container {
        flex-direction: row;
        align-items: center;
      }
    }

    .cta-form {
      margin-bottom: 2rem;
      text-align: center;
    }

    @media (min-width: 768px) {
      .cta-form {
        margin-bottom: 0;
        margin-right: 2rem;
        text-align: left;
      }
    }

    .cta-form h2 {
      font-size: 1.5rem;
      width: 100%;
      max-width: 25ch;
      margin: 0 auto;
      text-align: center;
    }

    @media (min-width: 768px) {
      .cta-form h2 {
        text-align: left;
        margin: 0;
      }
    }

    .cta-form p {
      margin-top: 1rem;
      font-size: 1rem;
      width: 100%;
      max-width: 24ch;
    }

    .form {
      align-self: center;
    }

    .form__input {
      width: clamp(120px, 50vw, 420px);
      height: 2.5rem;
      padding: 0 1.25rem;
      border: 1px solid var(--black);
      border-radius: 2px;
      margin: 0.625rem auto;
      transition: all 250ms;
    }

    @media (min-width: 768px) {
      .form__input {
        width: clamp(120px, 35vw, 420px);
      }
    }

    .form__input:focus {
      outline: none;
      border-top-color: rgba(0, 0, 0, 0.1);
    }

    .form__input:focus + .form__label,
    .form__input:not(:placeholder-shown) + .form__label {
      transform: translateY(-4.50rem) scale(1);
      color: var(--black);
    }

    .form__input::placeholder {
      display: none;
      color: transparent;
      user-select: none;
    }

    .form__input:not(:placeholder-shown) {
      border-top-color: rgba(0, 0, 0, 0.5);
    }

    .form__label {
      font-size: 1rem;
      color: var(--grey);
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
  <h1>CSS-Only Floating Labels</h1>
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
    <p>
      Before we get started, we have to understand how labels, placeholders, and input fields work and how they are used from a UX perspective.
    </p>
    <ul>
      <li>Input fields, by default, have outlines when they are in focus.*</li>
      <li>Placeholders are used to show users what information is needed in their respective fields.</li>
      <li>Placeholders are created using the <code>placeholder=""</code> attribute.</li>
      <li>Placeholders, by default, disappear when text fills the input field. This affects the <code>:placeholder-shown</code> pseudo-selector.*</li>
      <li>Labels are used for the same reason as placeholders, but don't disappear when text is in the input field. This is great because it allows users to always see what information is required.</li>
      <li>UX best practices tell us that labels should accompany items in forms (input fields, text areas, checkboxes, etc.).</li>
    </ul>
    <p>We'll be using several pseudo-selectors to create this effect.<br>This is the ONLY way to achieve this effect without any JavaScript.</p>
    <ul>
      <li><code><a href="https://developer.mozilla.org/en-US/docs/Web/CSS/:focus">:focus</a></code> — Represents an element (such as a form input) that has received focus.</li>
      <li><code><a href="https://developer.mozilla.org/en-US/docs/Web/CSS/:not">:not()</a></code> — Prevents the items passed into the argument from being selected.</li>
      <li><code><a href="https://developer.mozilla.org/en-US/docs/Web/CSS/::placeholder">::placeholder</a></code> — Represents the placeholder text of <code>input</code> and <code>textarea</code> elements.</li>
      <li><code><a href="https://developer.mozilla.org/en-US/docs/Web/CSS/:placeholder-shown">:placeholder-shown</a></code> — Represents any <code>input</code> or <code>textarea</code> element that is currently displaying placeholder text.</li>
    </ul>
    <p>A non-SCSS version can be found <a href="https://codepen.io/kvncnls/pen/eYzbJJL" target="_blank">here</a> for those that don't use SCSS. Note that this older CodePen has a ROOT font-size of 10px, so any 'rem' values are based on 10px.</p>
  </div>
</body>
</html>

