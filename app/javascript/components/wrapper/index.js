// wrap dose submit button (cocktail show page) into a div so it can be centered
const wrapper = (el, wrapperElement) => {
  el.parentNode.insertBefore(wrapperElement, el);
  wrapperElement.appendChild(el);
  return wrapperElement;
};

export default () => {
  const submitButton = document.querySelector('.simple_form.new_dose .btn');
  const wrappingDiv = document.createElement('div');
  const div = wrapper(submitButton, wrappingDiv);
  div.classList.add('row', 'justify-content-around');
};
