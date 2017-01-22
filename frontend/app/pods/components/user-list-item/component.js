import Ember from 'ember';

export default Ember.Component.extend({
  ajax: Ember.inject.service(),

  userPath: Ember.computed(function() {
    return window.Routes.user_path(this.get('model.id'));
  }),

  gravatarLink: Ember.computed(function() {
    return `https://secure.gravatar.com/avatar/${this.get('model.gravatar_id')}?s=50`;
  }),
});

