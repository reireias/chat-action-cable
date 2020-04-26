<template>
  <layout :top="false" :logout="false">
    <v-container class="chat-page">
      <v-row justify="center">
        <v-col>
          <center>
            <slot></slot>
          </center>
        </v-col>
      </v-row>
    </v-container>
  </layout>
</template>

<script>
import Layout from '../../atmos/Layout'

export default {
  components: {
    Layout,
  },
}
</script>
