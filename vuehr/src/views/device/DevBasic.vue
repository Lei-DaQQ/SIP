<template>
  <div>
    <div>
      <el-button icon="el-icon-plus" size="small" type="primary" @click="showAddMap">添加</el-button>
      <el-button size="small" type="primary" @click="searchDev('in')">进站区</el-button>
      <el-button size="small" type="primary" @click="searchDev('filter')">过滤区</el-button>
      <el-button size="small" type="primary" @click="searchDev('measure')">计量区</el-button>
      <el-button size="small" type="primary" @click="searchDev('adjust')">调压区</el-button>
      <el-button size="small" type="primary" @click="searchDev('out')">出站区</el-button>
    </div>
    <div class="deviceMain">
      <el-table :data="maps" border @selection-change="handleSelectionChange" size="small" stripe style="width: 70%">
<!--        <el-table-column type="selection" width="55"></el-table-column>-->
        <el-table-column type="index" label="#" width="55"></el-table-column>
        <el-table-column prop="id" label="编号" width="155"></el-table-column>
        <el-table-column prop="workID" label="工艺区域" width="180"></el-table-column>
        <el-table-column prop="name" width="300" label="名称"></el-table-column>
        <el-table-column prop="store" width="150" label="库存管理"></el-table-column>
        <el-table-column label="操作">
          <template slot-scope="scope">
            <el-button size="mini" type="danger" @click="handleDelete(scope.$index, scope.row)" icon="el-icon-delete"></el-button>
          </template>
        </el-table-column>
      </el-table>
    </div>

    <el-dialog title="增加设备" :visible.sync="dialogVisible_add" width="40%">
      <el-form :model="AddDevice" :label-width="formLabelWidth">
        <el-form-item label="编号">
          <el-input class="addDeviceInput" size="small" v-model="AddDevice.id" prefix-icon="el-icon-edit" placeholder="请输入设备编号"></el-input>
        </el-form-item>
        <el-form-item label="工艺区域">
          <el-radio-group v-model="AddDevice.workID" size="small">
            <el-radio label="进站区">进站区</el-radio>
            <el-radio label="过滤区">过滤区</el-radio>
            <el-radio label="计量区">计量区</el-radio>
            <el-radio label="调压区">调压区</el-radio>
            <el-radio label="出站区">出站区</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="名称">
          <el-input class="addDeviceInput" size="small" v-model="AddDevice.name" prefix-icon="el-icon-edit" placeholder="请输入设备名称"></el-input>
        </el-form-item>
        <el-form-item label="库存">
          <el-input class="addDeviceInput" size="small" v-model="AddDevice.store" prefix-icon="el-icon-edit" placeholder="请输入设备库存"></el-input>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button size="small" @click="dialogVisible_add = false">取 消</el-button>
        <el-button size="small" type="primary" @click="addMap">确 定</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>

export default {
  name: "DevBasic",
  data() {
    return {
      m: {
        id: '',
        workID: '',
        name: '',
        store: ''
      },
      dialogVisible_show: false,
      dialogVisible_add: false,
      loading: false,
      AddDevice: {
        id: '',
        workID: '',
        name: '',
        store: ''
      },
      multipleSelection: [],
      maps: [],
      formLabelWidth: '100px'
    }
  },
  mounted() {
    this.initDevices();
  },
  methods: {
    deleteMany() {
      this.$confirm('此操作将永久删除 【 ' + this.multipleSelection.length + '】条记录, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        let ids = '?';
        this.multipleSelection.forEach(item => {
          ids += 'ids=' + item.id + '&';
        })
        this.deleteRequest("/device/data/" + ids).then(resp => {
          if (resp) {
            this.initDevices();
          }
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消删除'
        });
      });
    },
    handleSelectionChange(val) {
      this.multipleSelection = val;
    },
    showAddMap() {
      this.AddDevice.name = '';
      this.AddDevice.url = '';
      this.dialogVisible_add = true;
    },
    addMap () {
      this.postRequest("/device/data/", this.AddDevice).then(resp => {
        if (resp) {
          this.initDevices();
          this.dialogVisible_add=false;
        }
      })
    },
    showLookView(index, data) {
      Object.assign(this.m, data);
      this.dialogVisible_show = true;
    },
    handleDelete(index, data) {
      this.$confirm('此操作将永久删除【' + data.name + '】,' + '是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.deleteRequest("/device/data/" + data.id).then(resp => {
          if (resp) {
            this.initDevices();
          }
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消删除'
        });
      });
    },
    initDevices(type) {
      this.loading = true;
      let url = '/device/data/';
      // if (type && type == 'in') {
      //   url += '?workID=' + '进站区';
      //   console.log("in");
      // }
      this.getRequest(url).then(resp => {
        this.loading = false;
        if (resp) {
          this.maps = resp;
        }
      })
    },
    searchDev(type) {
      this.loading = true;
      let url = '/device/data/';
      if (type && type == 'in') {
        url += '进站区/';
      } else if (type && type == 'filter') {
        url += '过滤区/';
      } else if (type && type == 'measure') {
        url += '计量区/';
      } else if (type && type == 'adjust') {
        url += '调压区/';
      } else {
        url += '出站区/';
      }
      console.log(url);
      this.getRequest(url).then(resp => {
        this.loading = false;
        if (resp) {
          this.maps=resp.obj;
        }
      });
    }

  }
}
</script>

<style>
.addDeviceInput {
  width: 200px;
  margin-left: 8px;
}
.deviceMain {
  margin-top: 10px;
}

</style>
