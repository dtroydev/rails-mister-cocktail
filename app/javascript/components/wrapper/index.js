// wrap dose submit button (cocktail show page) into a div so it can be centered

const wrap = (selector) => {
  const element = document.querySelector(selector);
  const wrappingDiv = document.createElement('div');
  element.parentNode.insertBefore(wrappingDiv, element);
  wrappingDiv.appendChild(element);
  wrappingDiv.classList.add('row', 'justify-content-around');
};

export default () => {
  wrap('.cocktails-show-submit-dose');
  wrap('.cocktails-show-submit-review');
};
