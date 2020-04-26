<template>
  <layout>
    <v-container class="chat-page">
      <v-row justify="center">
        <v-col>
          <center>
            <div v-if="room" class="display-1">Room: {{ room.name }}</div>
          </center>
        </v-col>
      </v-row>
      <v-row v-for="message in messages" :key="message.id" justify="center">
        <v-col
          :class="user.uid == message.author ? 'my-message' : 'other-message'"
          cols="12"
          md="8"
          xl="5"
        >
          <v-avatar v-if="user.uid != message.author">
            <img :src="message.authorIcon" />
          </v-avatar>
          <v-card
            class="message-card"
            :color="user.uid == message.author ? '#AED581' : 'white'"
          >
            <v-card-title v-text="message.text"></v-card-title>
          </v-card>
          <v-avatar v-if="user.uid == message.author">
            <img :src="message.authorIcon" />
          </v-avatar>
        </v-col>
      </v-row>
      <v-app-bar app bottom fixed height="80">
        <v-container style="padding: 0; margine: 0;">
          <v-row justify="center" align="center">
            <v-col cols="11" md="7" xl="4">
              <v-text-field
                v-model="text"
                solo
                hide-details
                placeholder="message"
                @keyup.enter="onPost"
              ></v-text-field>
            </v-col>
            <v-col cols="1">
              <v-btn fab elevation="3" color="primary" @click="onPost">
                <v-icon>mdi-send</v-icon>
              </v-btn>
            </v-col>
          </v-row>
        </v-container>
      </v-app-bar>
    </v-container>
  </layout>
</template>

<script>
import Layout from '../../atmos/Layout'
import consumer from '../../../channels/consumer'
import axios from 'axios'
import moment from 'moment'

export default {
  components: {
    Layout,
  },
  props: ['roomId'],
  data() {
    return {
      user: null,
      room: null,
      messages: [],
      text: null,
    }
  },
  created() {
    axios.get('/api/v1/users/me').then((res) => {
      this.user = res.data
    })
    axios.get(`/api/v1/rooms/${this.roomId}`).then((res) => {
      this.room = res.data
    })
    consumer.subscriptions.create(
      { channel: 'ChatChannel', room_id: this.roomId },
      {
        received: (data) => {
          this.messages.push({
            text: data.text,
            author: data.user.uid,
            authorIcon: data.user.image,
          })
        }
      }
    )
  },
  methods: {
    async onPost() {
      if (this.text) {
        await axios.post(`/api/v1/rooms/${this.roomId}/messages`, {
          text: this.text,
        })
        this.text = null
      }
    },
    format(timestamp) {
      return moment(timestamp.seconds * 1000).format('YYYY/MM/DD HH:mm:ss')
    },
  },
}
</script>

<style lang="scss">
.chat-page {
  .my-message {
    display: flex;
    align-items: center;
    .message-card {
      margin-left: auto;
    }
  }
  .other-message {
    display: flex;
    align-items: center;
  }
  .message-card {
    margin-left: 10px;
    margin-right: 10px;
  }
}
</style>
