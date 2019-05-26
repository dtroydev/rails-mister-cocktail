import 'bootstrap';
import setupTyped from '../components/typed';
import setupScroller from '../components/scroller';
import setupWrapper from '../components/wrapper';
import setupSelect2 from '../components/select2';

// cocktail index page
if (document.querySelector('.cocktails-index')) {
  setupTyped();
  setupScroller();
}

// cocktail details page
if (document.querySelector('.cocktails-show')) {
  setupWrapper();
  setupSelect2();

  // disable fixed top navbar
  const navbar = document.querySelector('#navbar');
  navbar.classList.remove('fixed-top');
}

// ingredients index page
if (document.querySelector('.ingredients-index')) {
  // disable fixed top navbar
  const navbar = document.querySelector('#navbar');
  navbar.classList.remove('fixed-top');
}
