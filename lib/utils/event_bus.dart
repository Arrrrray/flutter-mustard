/// 事件总线 - 发布订阅模式

// 页面A中，监听登录事件
// bus.on('login', (arg) { doSomething });
//
// 登录页B中
// 登录成功后出发登录事件，页面A中订阅者会被调用
// bus.emit('login', userInfo);

// 订阅者回调签名
typedef void EventCallback(arg);

class EventBus {
  //命名构造函数 私有构造函数
  EventBus._internal();

  // 保存单例
  static EventBus _singleton = new EventBus._internal();

  // 工厂构造函数
  factory EventBus() => _singleton;

  // 保存事件订阅者队列，key：事件名（id），value：对应事件的订阅者队列
  var _emap = new Map<Object, List<EventCallback>>();

  /// 添加订阅者
  /// eventName 事件名
  /// f 回调函数
  void addListener(eventName, EventCallback f) {
    // 如果事件名或者回调函数为null直接返回
    if (eventName == null || f == null) {
      return;
    }
    // 如果 _emap[eventName] 为空，则为其初始化一个空列表
    _emap[eventName] ??= new List<EventCallback>();
    _emap[eventName].add(f);
  }

  // addListener 方法的别名
  void on(eventName, EventCallback f) {
    this.addListener(eventName, f);
  }

  // addListener 方法的别名
  void add(eventName, EventCallback f) {
    this.addListener(eventName, f);
  }

  // 移除订阅者
  void removeListener(eventName, [EventCallback f]) {
    // 名为 eventName 的事件列表
    var list = _emap[eventName];
    // 如果事件名为 null 则直接返回
    if (eventName == null) {
      return;
    }
    // 如果回调函数 f 未提供，则移除所有 eventName 的订阅者；否则只移除传入的回调函数。
    if (f == null) {
      _emap[eventName] = null;
    } else {
      list.remove(f);
    }
  }

  // removeListener 方法别名
  void off(eventName, [EventCallback f]) {
    this.removeListener(eventName, f);
  }

  // removeListener 方法别名
  void remove(eventName, [EventCallback f]) {
    this.removeListener(eventName, f);
  }

  // 触发事件，事件触发后该事件的所有订阅者都会被调用
  void emit(eventName, [arg]) {
    var list = _emap[eventName];
    if (list == null) {
      return;
    }
    int len = list.length;
    // 反向遍历，防止订阅者在回调中移除自身带来的下标错位
    for (var i = len; i >= 0; i--) {
      list[i](arg);
    }
  }

  // emit 方法别名
  void dispatch(eventName, [arg]) {
    this.emit(eventName, arg);
  }

  // emit 方法别名
  void publish(eventName, [arg]) {
    this.emit(eventName, arg);
  }
}
