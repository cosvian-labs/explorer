<script lang="ts" setup>
import { Icon } from '@iconify/vue';
import { ref } from 'vue';
import { useRouter } from 'vue-router';

const router = useRouter();

const cosvianNetworks = ref([
  {
    name: 'cosvian',
    title: 'Cosvian Mainnet',
    description: 'Production network for Cosvian Protocol',
    chainId: 'cosvian-1',
    color: '#812cd6',
    icon: '🚀',
  },
  {
    name: 'cosvian-testnet',
    title: 'Cosvian Testnet',
    description: 'Testing network for development',
    chainId: 'cosvian-testnet-1',
    color: '#666cff',
    icon: '🧪',
  },
]);

const navigateToChain = (networkName: string) => {
  router.push(`/${networkName}`);
};
</script>

<template>
  <div
    class="min-h-screen bg-gradient-to-br from-blue-50 to-purple-50 dark:from-gray-900 dark:to-gray-800"
  >
    <div class="container mx-auto px-4 py-16">
      <!-- Header -->
      <div class="text-center mb-16">
        <div class="flex justify-center mb-6">
          <div
            class="w-20 h-20 rounded-full bg-gradient-to-r from-purple-600 to-blue-600 flex items-center justify-center"
          >
            <Icon icon="mdi:cube-outline" class="text-4xl text-white" />
          </div>
        </div>

        <h1 class="text-5xl font-bold text-gray-900 dark:text-white mb-4">
          {{ $t('pages.title') }}
        </h1>

        <p
          class="text-xl text-gray-600 dark:text-gray-300 mb-8 max-w-3xl mx-auto"
        >
          {{ $t('pages.slogan') }}
        </p>
      </div>

      <!-- Networks -->
      <div class="max-w-4xl mx-auto">
        <h2
          class="text-3xl font-bold text-center text-gray-900 dark:text-white mb-12"
        >
          Choose Your Network
        </h2>

        <div class="grid md:grid-cols-2 gap-8">
          <div
            v-for="network in cosvianNetworks"
            :key="network.name"
            class="group cursor-pointer"
            @click="navigateToChain(network.name)"
          >
            <div
              class="bg-white dark:bg-gray-800 rounded-2xl shadow-lg hover:shadow-2xl transition-all duration-300 p-8 border border-gray-200 dark:border-gray-700 group-hover:border-purple-500 group-hover:scale-105"
            >
              <div class="flex items-center mb-6">
                <div
                  class="w-16 h-16 rounded-full flex items-center justify-center text-3xl mr-4"
                  :style="{
                    backgroundColor: network.color + '20',
                    color: network.color,
                  }"
                >
                  {{ network.icon }}
                </div>
                <div>
                  <h3 class="text-2xl font-bold text-gray-900 dark:text-white">
                    {{ network.title }}
                  </h3>
                  <p class="text-gray-500 dark:text-gray-400">
                    {{ network.chainId }}
                  </p>
                </div>
              </div>

              <p class="text-gray-600 dark:text-gray-300 mb-6">
                {{ network.description }}
              </p>

              <button
                class="w-full py-3 px-6 rounded-lg font-medium text-white transition-all duration-200"
                :style="{ backgroundColor: network.color }"
              >
                Explore {{ network.title }}
                <Icon icon="mdi:arrow-right" class="inline ml-2" />
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.logo path {
  fill: #171d30;
}
</style>
