<template>
  <div>
    <div class="subtitle">
      <subtitle :titledata="subtitledata"></subtitle>
    </div>
    <p class="intro">{{intro}}</p>
    <div>
      <ul class="chapterList">
        <li
          v-for="(item,index ) in  chapterList"
          class="linghtclass"
          :key="index"
          @click="godetail(item)"
        >
          <p>{{item.title}}</p>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
import subtitle from "../components/subtitle";
import axios from "axios";
import VueMeta from "vue-meta";
export default {
  head() {
    return {
      title: process.env.bookname,
      meta: [
        {
          hid: "description",
          name: "description",
          content: "My custom description"
        }
      ]
    };
  },
  async asyncData({ store }) {
    console.log(process.env.bookname);
    console.log(process.env.bookSourceUrl);

    if (store.state.alldate != null) {
      console.log("alldate=" + store.state.alldate.chapterList.length);
    } else {
      const { data } = await axios.post(
        "https://api.yuedu.best/yuedu/searchBook",
        {
          key: process.env.bookname,
          bookSourceUrl: process.env.bookSourceUrl
        }
      );
      const datacon = await axios.post(
        "https://api.yuedu.best/yuedu/getBookInfo",
        {
          bookUrl: data[0].bookUrl,
          bookSourceUrl: process.env.bookSourceUrl
        }
      );
      const dataChapterList = await axios.post(
        "https://api.yuedu.best/yuedu/getChapterList",
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
      return alldate;
    }
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
        name: "details",
        query: {
          title: value.title,
          tocUrl: value.url
        }
      });
    }
  },
  mounted: function() {},
  components: {
    subtitle
  }
};
</script>
<style  lang="scss" scoped>
.subtitle {
  width: 60%;
  margin: 0 auto 50px auto;
}
.chapterList {
  width: 100%;
  display: flex;
  flex-wrap: wrap;
  justify-content: flex-start;
  .linghtclass {
    line-height: 4;
    text-align: center;
  }
  li {
    width: 33%;
    list-style: none;
  }
  p {
    cursor: pointer;
    display: inline;
  }
}
.intro {
  margin: 20px;
}
</style>