<template>
  <div>
    <div class="subtitle">
      <subtitle :titledata="subtitledata"></subtitle>
    </div>
    <div>
      <ul class="titleList">
        <li
          v-for="(item,index ) in  chapterList"
          :class="index>2?'linghtclass':'' "
          :key="index"
          @click="godetail(item)"
        >{{item.title}}</li>
      </ul>
    </div>
  </div>
</template>

<script>
import subtitle from "../../components/subtitle";
export default {
  data() {
    return {
      subtitledata: {},
      chapterList: []
    };
  },
  methods: {
    godetail(value) {
      this.$router.push({
        name: "details",
        query: {
          id: value.id
        }
      });
    },
    search() {
      this.$axios
        .post("https://api.yuedu.best/yuedu/searchBook", {
          key: "剑来",
          bookSourceUrl: "https://m.shouda8.com"
        })
        .then(res => {
          let searchResult = res.data[0];
          this.getBookInfo(searchResult.bookUrl);
        });
    },
    getBookInfo(bookUrl) {
      this.$axios
        .post("https://api.yuedu.best/yuedu/getBookInfo", {
          bookUrl: bookUrl,
          bookSourceUrl: "https://m.shouda8.com"
        })
        .then(res => {
          let chapter = res.data;

          this.subtitledata = {
            title: chapter.name,
            subtitle: chapter.author
          };
          this.getChapter(chapter.tocUrl);
        });
    },
    getChapter(tocUrl) {
      this.$axios
        .post("https://api.yuedu.best/yuedu/getChapterList", {
          tocUrl: tocUrl,
          bookSourceUrl: "https://m.shouda8.com"
        })
        .then(res => {
          this.chapterList = res.data;
          console.log(this.chapterList);
        });
    }
  },
  components: {
    subtitle
  },
  created() {
    if (this.$route.params.id) {
      // this.subtitledata = {
      //   title: "",
      //   subtitle: ""
      // };
    }
    console.log("id---", this.$route.params.id);
  },
  mounted() {
    this.search();
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