import Vue from 'vue/dist/vue.esm'
import Vuetify from 'vuetify'
import 'vuetify/dist/vuetify.min.css'
import '@mdi/font/css/materialdesignicons.css'
import Show from '../../components/pages/login/Show'

Vue.use(Vuetify)
const vuetify = new Vuetify({
  icons: {
    iconfont: 'mdi'
  }
})

document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    vuetify,
    el: '#vue-root',
    components: {
      App: Show
    }
  })
})
