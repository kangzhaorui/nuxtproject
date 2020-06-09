<template>
<div>
  <div class="subtitle">
<subtitle  :titledata="subtitledata"></subtitle>
  </div>
  <div>
    <ul class="titleList">
      <li   v-for="(item,index ) in  titleList"   :class="index>2?'linghtclass':'' "  :key="index" 
         @click="godetail(item)" >{{item.title}}</li>
     
    </ul>
  </div>
</div>
</template>

<script>
import subtitle  from  '../../components/subtitle';
export default {
  data(){
    return {
      subtitledata:{},
      titleList:[{
        title:'第一章1111',
        id:'1'
      },{
        title:'第二章2222',
        id:'2'
      },{
        title:'第三章333',
        id:'3'
      },{
        title:'第四章444',
        id:'4'
      },{
        title:'第四章444',
        id:'4'
      },{
        title:'第四章444',
        id:'4'
      },
      ]
    }
  },
  methods:{
    godetail(value){
     this.$router.push({
       name:'details',
       query:{
         id:value.id
       }
     })
    }
  },
  components:{
        subtitle
  },
  created(){
    if(this.$route.params.id){
       this.subtitledata={
         title:'传值title',
         subtitle:'传值subtitle'
       }
    }
    console.log('id---',this.$route.params.id)
  }
}
</script>

<style  lang="scss" scoped>
.subtitle {
  width: 60%;
  margin: 0 auto 400px auto;
}
.titleList{
  width: 100%;
  display: flex;
  flex-wrap: wrap;
  justify-content: flex-start;
  .linghtclass{
    line-height: 4;
  }
  li{
    width: 33%;
    list-style: none;
  }
}
</style>