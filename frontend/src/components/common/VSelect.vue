<script setup>
import { ref} from 'vue'
defineProps({ selectOptions: Array })
const emit = defineEmits(["onKeySelect"])
const key = ref('all')
const onSelect = () => { 
    console.log('vselect................... key:', key.value)
    emit('onKeySelect', key.value)
}
</script>
<template>
    <select class="form-select" v-model="key"  @change="onSelect">
        <option v-for="(k, index) in selectOptions" :key="index" :value="k.value">
            {{k.text}}
        </option>
    </select>
</template>
<style scoped>

</style>