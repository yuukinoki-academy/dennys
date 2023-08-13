Map<int, Map<String, dynamic>> generateTaskData(List<List<dynamic>> tree, Map<int, String> tasks) {
  final taskData = <int, Map<String, dynamic>>{};

  Map<String, dynamic> generateTaskRecursive(int taskId) {
    final childrenIds = tree.where((item) => item[0] == taskId).expand((item) => item[1]).toList();

    taskData[taskId] = {
      "title": tasks[taskId],
      "children": childrenIds,
      "status": "do",
      "description": "説明"
    };

    for (var childId in childrenIds) {
      generateTaskRecursive(childId);
    }

    return taskData[taskId]!;

  }

  final parentIds = tree.map((item) => item[0]).toSet();
  final childIds = tree.expand((item) => item[1]).toSet();
  final rootIds = parentIds.difference(childIds);

  for (var rootId in rootIds) {
    generateTaskRecursive(rootId);
  }

  return taskData;
}

void main() {
  var sampleTree = [
    [1, [2, 3, 4]],
    [2, [5, 6]],
    [3, [7, 8]],
    [4, [9, 10]]
  ];

  var sampleTasks = {
    1: "ゲームを作る",
    2: "デザイン",
    3: "プログラム",
    4: "テスト",
    5: "ロゴ作成",
    6: "UI設計",
    7: "フロントエンド",
    8: "バックエンド",
    9: "バグチェック",
    10: "最終テスト"
  };

  var generatedData = generateTaskData(sampleTree, sampleTasks);
  print(generatedData);
}
