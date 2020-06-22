<template>
  <div>
    <div>
      <h3>{{title}}</h3>
    </div>
    <div class="details">
        <p class="textp" v-for="p in text" :key="p">
        {{p}}
        </p>

    </div>
  </div>
</template>

<script>
import axios from "axios";
import VueMeta from "vue-meta";
export default {
  head () {
    return {
      title: this.title + "-剑来",
      meta: [
        { hid: 'description', name: 'description', content: 'My custom description' }
      ]
    }
  },
  async asyncData({ query }) {
    console.log(query);
    const content = await axios.post(
      "https://api.yuedu.best/yuedu/getContent",
      {
        bookChapterUrl: query.tocUrl,
        bookSourceUrl: "https://m.shouda8.com"
      }
    );

    return {
      title: query.title,
      text: content.data.text.split('\n')
    };
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
}
</style>