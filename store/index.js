export const state = () => ({
    alldate: null
})

export const mutations = {
    setAlldate(state, alldate) {
        state.alldate = alldate;
    }
}

// export const actions = {
//     nuxtServerInit({ commit }, { req }) {
//         commit('user', req.session.user)
//     }
// }