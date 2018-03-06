window.onload = () => {
  // users#show scripts go here
  var FORM_NEW_BOAT = document.getElementsByClassName('main__users__boats__form')[0];
  var BTN_SHOW_FORM_NEW_BOAT = document.getElementsByClassName('main__users__boats__btn_add')[0];
  var BOATS_ITEM = document.getElementsByClassName('main__users__boats__item');
  var BTN_DELETE = document.getElementsByClassName('main__users__boats__item_delete');
  var CONFIRM_BTNS = document.getElementsByClassName('main__users__boats__item_delete_end');
  var CANCEL_BTNS = document.getElementsByClassName('main__users__boats__item_cancel');
  

  if (!! BTN_SHOW_FORM_NEW_BOAT) {
    BTN_SHOW_FORM_NEW_BOAT.onclick = () => {
      FORM_NEW_BOAT.style.display = (FORM_NEW_BOAT.style.display == 'inline-block')
        ? FORM_NEW_BOAT.style.display = 'none' 
        : FORM_NEW_BOAT.style.display = 'inline-block';
      
    }
  };
  
  // for each boat list item
  [].forEach.call(BOATS_ITEM, (ea_item) => {
    // add a mouse movement event
    ea_item.onmouseenter = (this_event) => {
      // grab boat id # from attribute field
      let boatid = this_event.currentTarget.getAttribute('data-boatid');
      
      // grab the div with boat options in focus
      let BOATS_DELETE_START_THIS = document.querySelectorAll('.main__users__boats__item_delete_start[data-boatid="' + boatid + '"]')[0];

      // grab all the other divs with boat options focus or not
      let BOATS_DELETE_START_ALL = document.querySelectorAll('.main__users__boats__item_delete_start');
      
      // remove option visibility everywhere
      [].forEach.call(BOATS_DELETE_START_ALL, (clean_each_item) => {
        clean_each_item.style.display = 'none';
      });

      [].forEach.call(CONFIRM_BTNS, (clean_each_item) => {
        clean_each_item.style.display = 'none';
      });

      // and make the mouse overed options the only ones visible
      BOATS_DELETE_START_THIS.style.display = 'block';
    }
  });

  // for each delete button display confirm or cancel
  [].forEach.call(BTN_DELETE, (ea_btn_delete) => {
    ea_btn_delete.onclick = (this_event) => {
      // grab boat id # from event
      let boatid = this_event.currentTarget.getAttribute('data-boatid');

      // hide current button
      this_event.currentTarget.parentElement.style.display = 'none';
      
      // make the confirm buttons visible
      let BOATS_DELETE_SHOW_CONFIRM = document.querySelectorAll('.main__users__boats__item_delete_end[data-boatid="' + boatid + '"]')[0];
      BOATS_DELETE_SHOW_CONFIRM.style.display = 'block';
    }
  });

  // for each cancel button, hide confirms 
  [].forEach.call(CANCEL_BTNS, (ea_btn_cancel) => {
    ea_btn_cancel.onclick = (this_event) => {
      // grab boat id # from event
      let boatid = this_event.currentTarget.getAttribute('data-boatid');

      // hide current button
      this_event.currentTarget.parentElement.style.display = 'none';

    }
  });

}


