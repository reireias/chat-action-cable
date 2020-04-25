import Vue from 'vue/dist/vue.esm'
import Vuetify from 'vuetify'
import 'vuetify/dist/vuetify.min.css'
import Show from '../../components/pages/home/Show'

Vue.use(Vuetify)
const vuetify = new Vuetify()

document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    vuetify,
    el: '#vue-root',
    components: {
      App: Show
    }
  })
})
