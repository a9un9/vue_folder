<template>
  <div class="explorer">
    <div class="left-panel">
      <FolderTree
        :folders="foldersArray"
        @select="handleSelect"
        :selectedId="selectedId"
      />
    </div>

    <div class="right-panel">
      <SubFolderList :folders="subFolders" :parent="selectedFolder" />
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from "vue";
import type { Folder } from "@/types";
import FolderTree from "../components/FolderTree.vue";
import SubFolderList from "../components/SubFolderList.vue";
import { getAllFolders } from "../services/api";

const folders = ref<Folder[]>([]);
const selectedId = ref<number | null>(null);

const foldersArray = computed(() => folders.value);

const selectedFolder = computed(() =>
  folders.value.find((f) => f.id === selectedId.value) ?? null
);

const subFolders = computed(() => {
  if (selectedId.value === null) return [];
  return folders.value.filter((f) => f.parent_id === selectedId.value);
});

onMounted(async () => {
  try {
    folders.value = await getAllFolders();
    
    selectedId.value = null;
    console.log("folders loaded:", folders.value);
  } catch (err) {
    console.error("Failed to load folders:", err);
  }
});

function handleSelect(folderId: number | null) {
    
  selectedId.value = folderId;
}
</script>

<style scoped>


.explorer {
  display: flex;
  height: 100%;
  width: 100%;
  font-family: system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial;
}

/* left */
.left-panel {
  width: 320px;
  min-width: 240px;
  border-right: 1px solid #e6e6e6;
  padding: 12px;
  background: #fafafa;
  overflow-y: auto;
}

/* right */
.right-panel {
  flex: 1;
  padding: 24px;
  overflow-y: auto;
}
</style>
