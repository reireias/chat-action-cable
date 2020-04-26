<template>
  <v-app>
    <v-app-bar app fixed max-height="64">
      <v-toolbar-title
        >Example Chat Application with ActionCable</v-toolbar-title
      >
      <v-spacer></v-spacer>
      <v-btn v-if="top" class="toolbar-button" outlined href="/">top</v-btn>
      <v-btn v-if="logout" class="toolbar-button" outlined href="/auth/logout">logout</v-btn>
    </v-app-bar>
    <v-content>
      <v-container>
        <slot />
      </v-container>
    </v-content>
  </v-app>
</template>

<script>
export default {
  props: {
    top: {
      type: Boolean,
      default: true,
    },
    logout: {
      type: Boolean,
      default: true,
    },
  },
}
</script>

<style lang="scss">
.toolbar-button {
  margin-left: 10px;
  margin-right: 10px;
}
</style>
