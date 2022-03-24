const App = Vue.createApp({
  data() {
    return {
      visible: false,

      search: '',
      players: [],
      currentPlayer: false,
    };
  },
  computed: {
    filteredPlayers() {
      if (this.search === '') return this.players;

      return this.players.filter((player) => {
        if (!isNaN(parseInt(this.search))) return player.id == parseInt(this.search);
        else return player.name.toLowerCase().includes(this.search.toLowerCase());
      });
    },
  },
  methods: {
    close() {
      fetch(`https://${GetParentResourceName()}/close`);
    },
    update() {
      fetch(`https://${GetParentResourceName()}/update`);
    },
    off() {
      fetch(`https://${GetParentResourceName()}/spectateoff`);
    },
    spectate(player) {
      fetch(`https://${GetParentResourceName()}/spectate`, {
        method: 'POST',
        body: JSON.stringify({
          player,
        }),
      });
    },
  },
  mounted() {
    window.addEventListener('message', ({ data }) => {
      if (data.visible !== undefined) this.visible = data.visible;
      if (data.players !== undefined) this.players = data.players;
      if (data.playerInfo !== undefined) this.currentPlayer = data.playerInfo;
    });
  },
}).mount('#app');

const playerInfoElement = document.querySelector('#playerinfo #data');
window.addEventListener('message', ({ data }) => {
  if (data.playerInfo !== undefined) {
    if (!data.playerInfo) {
      playerInfoElement.style.display = 'none';
      return;
    }
    playerInfoElement.style.display = 'block';
    playerInfoElement.innerHTML = data.playerInfo.join('<br>');
  }
});
