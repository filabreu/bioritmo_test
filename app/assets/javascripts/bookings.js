function Booking(params) {
  this.id = params.id;
  this.date_range = { booked_since: params.since, booked_until: params.until };
};

Booking.prototype = {
  constructor: Booking,
  find: function() {
    $.ajax({
      context: this,
      url: "/bookings",
      data: this.date_range,
      success: this.events.onfind,
      error: this.events.onerror
    });
  },
  create: function() {
    $.ajax({
      context: this,
      url: "/bookings",
      data: { booking: this.date_range },
      method: "POST",
      success: this.events.oncreate,
      error: this.events.onerror
    })
  },
  destroy: function() {
    $.ajax({
      context: this,
      url: "/bookings/" + this.id,
      method: "DELETE",
      success: this.events.ondestroy,
      error: this.events.onerror
    });
  },
  render: function(item) {
    var elem = $('.booking[data-since="'+item.booked_since+'"][data-until="'+item.booked_until+'"]');
    $(elem).html('<a href="#" class="btn btn-primary">'+item.username+'</a>');
    $(elem).data('id', item.id);
    $(elem).attr('data-id', item.id);
    $(elem).off('click');
    $(elem).on('click', destroyBooking);
  },
  events: {
    onfind: function(data) {
      for(i = 0; i < data.length; i++) {
        this.render(data[i]);
      }
    },
    oncreate: function(data) {
      this.render(data);
    },
    ondestroy: function(data) {
      var elem = $('.booking[data-id="'+this.id+'"]');
      elem.html('<a href="#" class="btn btn-default">disponível</a>');
      elem.off('click');
      elem.on('click', createBooking);
    },
    onerror: function(request, data, status) {
      alert('Não foi possível realizar esta ação.')
    }
  }
}

function createBooking(event) {
  event.preventDefault();
  var elem = $(event.currentTarget);
  var booking = new Booking(elem.data());
  booking.create();
}

function destroyBooking() {
  event.preventDefault();
  var elem = $(event.currentTarget);
  var booking = new Booking(elem.data());
  booking.destroy();
}

$(function() {
  var first_timeslot = $('.booking:first').data('since');
  var last_timeslot = $('.booking:last').data('until');
  var bookings = new Booking(first_timeslot, last_timeslot);
  bookings.find();

  $(".booking").on('click', createBooking);
})
