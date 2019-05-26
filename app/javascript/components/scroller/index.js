// navbar change on scroll down

export default () => {
  const navbarMainLink = document.querySelector('.navbar-main-link');
  const navbarCreateCocktailLink = document.querySelector('.navbar-create-cocktail-link');
  let fadedFlag = false;
  window.addEventListener('scroll', () => {
    if (window.scrollY >= 500 && fadedFlag === false) {
      navbarMainLink.classList.add('fadeout');
      navbarCreateCocktailLink.classList.add('fadeout');
      setTimeout(() => {
        navbarMainLink.style.visibility = 'hidden';
      }, 1000);
      setTimeout(() => {
        navbarCreateCocktailLink.style.visibility = 'hidden';
      }, 1000);
      fadedFlag = true;
    }
    if (window.scrollY < 500 && fadedFlag === true) {
      navbarMainLink.style.removeProperty('visibility');
      navbarCreateCocktailLink.style.removeProperty('visibility');
      navbarMainLink.classList.remove('fadeout');
      navbarCreateCocktailLink.classList.remove('fadeout');
      fadedFlag = false;
    }
  });
};
