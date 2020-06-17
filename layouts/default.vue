<template>
  <div class="box">
    <el-container>
      <el-header height="10vh">
        <div class="container">
          <div class="container-box">
             <div class="header-logo" >
            <img src="https://v2.jinrishici.com/one.svg" alt  @click="gohome"  />

          </div>
          <div class="sitenav">
            <el-menu
              :default-active="activeIndex"
              class="el-menu-demo"
              mode="horizontal"
              @select="handleSelect"
              background-color="#f6f1e7"
              text-color="#000"
              :router="true"
            >
              <!-- <el-submenu index="1">
                <template slot="title">盗墓笔记全集</template>
                <el-menu-item index="2-1">盗墓笔记1：七星鲁王</el-menu-item>
                <el-menu-item index="2-2">选项2</el-menu-item>
                <el-menu-item index="2-3">选项3</el-menu-item>
              </el-submenu> -->
              <!-- <el-menu-item   v-for="(item,index)  in menuData" :key="index" :index="item.itempath+'/'+item.id">{{item.title}}</el-menu-item> -->
              <!-- <el-menu-item index="4">藏海花</el-menu-item> -->
            </el-menu>
          </div>
          </div>
         
        </div>
      </el-header>
      <el-main>
        <div class="container">
          <nuxt/>
        </div>
      </el-main>
      <el-footer height="10vh">@版权所有</el-footer>
    </el-container>
  </div>
</template>
<script>
export default {
  data() {
    return {
      activeIndex: "1",
      activeIndex2: "1",
      menuData: [
        {
          title:'沙海',
          elitem: "",
          itempath: "/main",
          id:'1'
        },
        {
          title:'藏海花',
          elitem: "",
          itempath: "/",
           id:'2'
        },
      ]
    };
  },
  methods: {
    handleSelect(key, keyPath) {
      console.log(key, keyPath);
    },
    gohome(){
      this.$router.push('/')
    }
  }
};
</script>
<style  lang='scss'  scoped>
.box {
  background: #f6f1e7;
  min-width: 100%;
  min-height: 100vh;
}

.header-logo {
  float: left;
  overflow: hidden;
  margin: 20px 70px 0 0;
  height: 40px;
  font-size: 1px;
  line-height: 40px;
  color: #fff;
}
.container {
  max-width: 1200px;
  text-align: left;
  position: relative;
  background: #f6f1e7;
  margin: 0 auto;
  padding-left: 15px;
  padding-right: 15px;
  .container-box{
    margin: 0 auto;
   height: 10vh;
  }
}
.header-logo img {
  max-height: 40px;
  margin-bottom: 100px;
}
.sitenav {
  float: left;
  font-size: 18px !important;
  line-height: 40px;
}
.el-menu--horizontal > .el-menu-item.is-active {
  border-bottom: 2px solid #f6f1e7;
}
.el-menu.el-menu--horizontal {
  border: none;
}
.el-header,
.el-footer {
  color: #333;
  text-align: center;
  line-height: 60px;
  height: 10vh;
}

.el-main {
  color: #333;
  min-height: 80vh;
}

body > .el-container {
  margin-bottom: 40px;
}

.el-container:nth-child(5) .el-aside,
.el-container:nth-child(6) .el-aside {
  line-height: 260px;
}

.el-container:nth-child(7) .el-aside {
  line-height: 320px;
}
</style>
