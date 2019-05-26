import Typed from 'typed.js';

export default () => {
  new Typed('.banner-typed', {
    strings: ["Phew! You've made it!",
      'Glad to see you here!',
      'Take a seat and relax!',
      'Check out the Best selection of cocktails!',
      'We have all day to try all these cocktails out!',
      'When was the last time you had a cocktail?',
      'I bet it was too long ago !',
      "It's ok, we can keep that secret!",
      "Let's figure out what we are going to drink next?",
      'I am thirsty! Are you thirsty?',
      "Let's have a martini, shall we?",
    ],
    typeSpeed: 50,
    showCursor: false,
  });
}
