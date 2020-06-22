<template>
  <div class="subbox">
    <h1>{{titledata.title}}</h1>
    <p class="subtitle">{{titledata.subtitle}}</p>
  </div>
</template>

<script>
export default {
  props: {
    titledata: {
      type: Object,
      default: {
        title: "标题",
        subtitle: "副标题"
      }
    }
  }
};
</script>

<style>
.subbox {
  text-align: center;
}
.subtitle {
    margin-top: 15px;
}
</style>