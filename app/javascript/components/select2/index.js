import $ from 'jquery';
import 'select2';
import 'select2/dist/css/select2.css';

// initialise select2 controls
export default () => {
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
};
