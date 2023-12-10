<template>
    <nav class="nav">
        <label for="periodSelector">Выберите период: </label>
        <select id="periodSelector" name="period">
            <option value="day">День</option>
            <option value="week">Неделя</option>
            <option value="month">Месяц</option>
            <option value="year">Год</option>
            <option value="custom">Выбрать</option>
        </select>

        <div v-if="periodSelector === 'custom'">
            <input type="date" v-model="customStartDate" />
            <input type="date" v-model="customEndDate" />
        </div>

    </nav>
</template>

<style scoped>
.nav {
    font-size: 150%;
    font-weight: bold;
    color: white;
    top: 0;
    left: 0;
    right: 0;
    height: 100px;
    padding: 0 2rem;
    display: flex;
    align-items: center;
    background-image: url('/header_image3.jpg');
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
}
select {
    font-size: 16px;
    padding: 10px;
    margin: 20px;
    border: 2px solid #dbb134;
    border-radius: 5px;
    background-color: #fff;
    color: #333;
}

#customPeriod {
    display: none;
    margin-top: 10px;
}

#customPeriod label {
    font-size: 16px;
    font-weight: bold;
    margin-right: 10px;
    color: #333;
}

#customPeriod input {
    font-size: 16px;
    padding: 10px;
    border: 2px solid #dbb134;
    border-radius: 5px;
    background-color: #fff;
    color: #333;
}
</style>