import 'bootstrap';
import $ from 'jquery';
import 'select2';
import Typed from 'typed.js';
import wrapper from '../components/wrapper';
import 'select2/dist/css/select2.css';

console.log('webpacker working');

// wrap dose submit button (cocktail show page) into a div so it can be centered
const submitButton = document.querySelector('.simple_form.new_dose .btn');
// but do so only on the page where it appears
if (submitButton) {
  const wrappingDiv = document.createElement('div');
  const div = wrapper(submitButton, wrappingDiv);
  div.classList.add('row', 'justify-content-around');

  // add the back button there as well
  const backButton = document.querySelector('.cocktails-show-description .cocktails-show-back-link');
  div.appendChild(backButton);

  // initialise select2 controls
  $('#dose_ingredient_id').select2({
    placeholder: 'Choose ingredient',
  });
  $('#dose_measure').select2({
    placeholder: 'Choose measure',
  });
  $('#dose_variety').select2({
    placeholder: 'Choose variety (optional)',
    allowClear: true,
  });

  // disable fixed top navbar (until we work out scrolling issues)
  const navbar = document.querySelector('#navbar');
  navbar.classList.remove('fixed-top');
}

// banner scrolling text on the cocktail index page
if (document.querySelector('.banner-typed')) {
  new Typed('.banner-typed', {
    strings: ["Phew! You've made it!",
      'Glad to see you here!',
      'Check out the Best selection of cocktails!',
      'Take a seat, relax!',
      'We have all day to try all these cocktails out',
      'When was the last time you had a cocktail?',
      'I bet it was too long',
      "It's ok, I won't judge you",
      "Let's figure out what we are going to drink next?",
      'I am thirsty, are you thirsty?',
      "Let's have a martini, shall we?",
    ],
    typeSpeed: 50,
    showCursor: false,
  });
}
