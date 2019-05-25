const wrapper = (el, wrapperElement) => {
  el.parentNode.insertBefore(wrapperElement, el);
  wrapperElement.appendChild(el);
  return wrapperElement;
};

export default wrapper;
