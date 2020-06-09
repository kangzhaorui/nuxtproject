<template>
  <div class="subbox">
      <h3>{{titledata.title}}</h3>
          <p>{{titledata.subtitle}}</p>
  </div>
</template>

<script>
export default {
    props:{
        titledata:{
            type:Object,
            default:{
                title:'标题',
                subtitle:'副标题'
            }
        }
    }

}
</script>

<style>
.subbox{
    text-align: center;
}
</style>