<template>
  <div>
    <div>
      <h3>{{title}}</h3>
    </div>
    <div class="details">
      <p class="textp" v-for="p in text" :key="p">{{p}}</p>
    </div>
    <div class="chapter-control dib-wrap" data-l1="3">
      <a id="j_chapterPrev" class="disabled" href="#" @click="previousChapter()">上一章</a>
      <span>|</span>
      <a href="#" data-eid="qd_R108" @click="back()">目录</a>
      <span>|</span>
      <a id="j_chapterNext" href="#" data-eid="qd_R109" @click="nextChapter()">下一章</a>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import VueMeta from "vue-meta";
import { mapState } from "vuex";
export default {
  head() {
    return {
      title: this.title + "-" + process.env.bookname,
      meta: [
        {
          hid: "description",
          name: "description",
          content: "My custom description"
        }
      ]
    };
  },
  watchQuery: ["tocUrl"],
  async asyncData({ store, query }) {
    console.log(query);
    console.log(process.env.bookSourceUrl);
    if (store.state.alldate != null) {
      console.log("alldate=" + store.state.alldate.chapterList.length);
    } else {
      const { data } = await axios.post(
        process.env.api + "/yuedu/searchBook",
        {
          key: process.env.bookname,
          bookSourceUrl: process.env.bookSourceUrl
        }
      );
      const datacon = await axios.post(
        process.env.api + "/yuedu/getBookInfo",
        {
          bookUrl: data[0].bookUrl,
          bookSourceUrl: process.env.bookSourceUrl
        }
      );
      const dataChapterList = await axios.post(
        process.env.api + "/yuedu/getChapterList",
        {
          tocUrl: datacon.data.tocUrl,
          bookSourceUrl: process.env.bookSourceUrl
        }
      );
      const alldate = {
        subtitledata: {
          title: datacon.data.name,
          subtitle: datacon.data.author
        },
        intro: datacon.data.intro,
        chapterList: dataChapterList.data
      };
      store.commit("setAlldate", alldate);
    }
    const content = await axios.post(
      process.env.api + "/yuedu/getContent",
      {
        bookChapterUrl: query.tocUrl,
        bookSourceUrl: process.env.bookSourceUrl
      }
    );
    return {
      title: query.title,
      text: content.data.text.split("\n")
    };
  },
  data() {
    return {
      index: null
    };
  },
  methods: {
    previousChapter() {
      const tocUrl = this.$route.query.tocUrl;
      const index = this.$store.state.alldate.chapterList.findIndex(value => {
        return value.url === tocUrl;
      });
      if (index < 0) return;
      this.$router.push({
        name: "details",
        query: {
          title: this.$store.state.alldate.chapterList[index - 1].title,
          tocUrl: this.$store.state.alldate.chapterList[index - 1].url
        }
      });
    },
    nextChapter() {
      const tocUrl = this.$route.query.tocUrl;
      const index = this.$store.state.alldate.chapterList.findIndex(value => {
        return value.url === tocUrl;
      });
      if (index > this.$store.state.alldate.chapterList.length) return;
      this.$router.push({
        name: "details",
        query: {
          title: this.$store.state.alldate.chapterList[index + 1].title,
          tocUrl: this.$store.state.alldate.chapterList[index + 1].url
        }
      });
    },
    back() {
       this.$router.push({
        name: "/"
      });
    }
  }

  // created() {
  //   console.log(this.$route.query);
  // }
};
</script>

<style  lang="scss"  >
.posfixed {
  position: fixed;
  left: 75%;
  li {
    list-style: none;
  }
}
.details {
  margin-top: 20px;
}
.textp {
  margin: 5px;
  font-size: 18px;
  line-height: 1.8;
}
.dib-wrap {
  color: #262626;
  -webkit-font-smoothing: antialiased;
  user-select: none;
  font-family: "Microsoft YaHei", PingFangSC-Regular, HelveticaNeue-Light,
    "Helvetica Neue Light", sans-serif;
  margin-top: 30px;
  padding: 0;
  height: 70px;
  margin-bottom: 24px;
  text-align: center;
  border: 1px solid #d8d8d8;
  font-size: 0;
}

.dib-wrap a,
.dib-wrap span {
  display: inline-block;
  vertical-align: middle;
  letter-spacing: normal;
  word-spacing: normal;
}

.chapter-control {
  height: 70px;
  margin-bottom: 24px;
  text-align: center;
  border: 1px solid #d8d8d8;
}
.chapter-control a {
  font: 18px/70px PingFangSC-Regular, HelveticaNeue-Light,
    "Helvetica Neue Light", "Microsoft YaHei", sans-serif;
  width: 33.2%;
}

.chapter-control a:hover {
  color: #1a1a1a;
  background: #ede9e1;
  background: rgba(0, 0, 0, 0.03);
}

a {
  text-decoration: none;
  color: #262626;
  outline: 0;
}
</style>