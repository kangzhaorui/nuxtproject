<template>
    <div>
    <div class="subtitle">
      <subtitle :titledata="subtitledata"></subtitle>
    </div>
    <div>
      <ul class="titleList">
        <li
          v-for="(item,index ) in  chapterList"
          class="linghtclass"
          :key="index"
          @click="godetail(item)"
        >{{item.title}}</li>
      </ul>
    </div>
  </div>
</template>

<script>
import subtitle from "../components/subtitle";
import axios from "axios";
export default {
  async asyncData() {
    const { data } = await axios.post(
      "https://api.yuedu.best/yuedu/searchBook",
      {
        key: "剑来",
        bookSourceUrl: "https://m.shouda8.com"
      }
    );
    const datacon = await axios.post(
      "https://api.yuedu.best/yuedu/getBookInfo",
      {
        bookUrl: data[0].bookUrl,
        bookSourceUrl: "https://m.shouda8.com"
      }
    );
    const dataChapterList = await axios.post(
      "https://api.yuedu.best/yuedu/getChapterList",
      {
        tocUrl: datacon.data.tocUrl,
        bookSourceUrl: "https://m.shouda8.com"
      }
    );    
    console.log(datacon.data);
    return { 
    subtitledata:{
       title: datacon.data.name,
       subtitle: datacon.data.author
    },
    chapterList:dataChapterList.data
    };
  },
  data() {
    return {
      subtitledata: {},
      chapterList: []
    };
  },
  methods: {
    godetail(value) {
      this.$router.push({
        name: "main-id",
        params: {
          id: value.id
        }
      });
      console.log("------", value);
    },
    // fetchDate() {
    //   this.$axios
    //     .post("https://api.yuedu.best/yuedu/getChapterList", {
    //       tocUrl: "https://m.shouda8.com/36610/",
    //       bookSourceUrl: "https://m.shouda8.com"
    //     })
    //     .then(res => {
    //       console.log("res="+res);
    //     });
    // }
  },
  mounted: function() {
    // this.fetchDate();
  },
  components: {
    subtitle
  }
};
</script>
<style  lang="scss" scoped>
.subtitle {
  width: 60%;
  margin: 0 auto 400px auto;
}
.titleList {
  width: 100%;
  display: flex;
  flex-wrap: wrap;
  justify-content: flex-start;
  .linghtclass {
    line-height: 4;
  }
  li {
    width: 33%;
    list-style: none;
  }
}
</style>