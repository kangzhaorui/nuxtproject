<template>
  <div>
    <div class="subtitle">
      <subtitle :titledata="titledata"></subtitle>
    </div>
    <div
      v-for="(item,index) in  bookslist "
      @click="godetail(item)"
      :class="index>0?'booksbox':'bookslist' "
      :key="index"
    >
      <div>
        <div class="bookstitle">
          <p>{{item.title}}</p>
        </div>
        <div>{{item.content}}</div>
      </div>
    </div>
  </div>
</template>

<script>
import subtitle from "../components/subtitle";
export default {
  data() {
    return {
      titledata: {
        title: "盗墓笔记全集",
        subtitle: "南派三叔经典巨作，最好看的盗墓小说！"
      },
      bookslist: [
        {
          title: "书名1",
          id: "1",
          content: `越有故事的人越沉静简单，越肤浅单薄的人越浮躁不安。真正的强者，不是没有眼泪的人，而是含着眼泪依然奔跑的人。一、人啊，长了颗红楼梦的心，
           却生活在水浒的世界，想交些三国里的桃园兄弟，却总遇到些西游记里的妖魔鬼怪`
        },
        {
          title: "书名2",
          id: "2",
          content: `每个人的路都不一样，但是有一件事情是不能缺的，就是“努力”。
           只有什么都不做的人，才会认为大部分事情都很简单，这叫“站着说话不腰疼”的逻辑`
        }
      ]
    };
  },
  methods: {
    godetail(value) {
      this.$router.push({
        name:'main-id',
        params:{
          id:value.id
        }
      })
      console.log("------", value);
    }
  },
  components: {
    subtitle
  }
};
</script>
<style  scoped>
.subtitle {
  width: 60%;
  margin: 0 auto 400px auto;
}
.bookstitle {
  text-align: center;
  font-weight: 800;
}
.bookslist {
  line-height: 2;
  border: solid 1px black;
  padding: 20px;
}
.booksbox {
  line-height: 2;
  margin-top: 40px;
  border: solid 1px black;
  padding: 20px;
}
</style>