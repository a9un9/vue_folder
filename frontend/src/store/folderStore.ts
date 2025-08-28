import { defineStore } from "pinia";
import { ref } from "vue";

export const useFolderStore = defineStore("folder", () => {
    const selectedFolder = ref<number | null>(null);
    return { selectedFolder };
});
