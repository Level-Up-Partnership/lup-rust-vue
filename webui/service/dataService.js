import http from "../service/api.factory";

class DataService {
  async test() {
    try {
      return await htt.dataApi.get("/");
    } catch (e) {
      return false;
    }
  }
}

export default new DataService();
