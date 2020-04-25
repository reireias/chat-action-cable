<template>
  <div>
    <h1>Home with Vue</h1>
    <v-btn>hoge</v-btn>
    <p>{{ hoge }}</p>
  </div>
</template>

<script>
export default {
  props: ['hoge']
}
</script>
