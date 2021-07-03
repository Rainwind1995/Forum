/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : forum

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 03/07/2021 17:30:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `context` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `topic_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `action` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_read` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_time` timestamp(0) NULL DEFAULT NULL,
  `reply_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES (4, '啊是大', '0', 37, 16, '1', 1, 8, '2019-10-16 21:11:03', 78);
INSERT INTO `message` VALUES (5, '再试一下', '0', 37, 16, '1', 1, 8, '2019-10-16 21:12:53', 79);
INSERT INTO `message` VALUES (6, '你说你是马呢', '0', 36, 16, '1', 0, 8, '2019-10-16 21:14:16', 81);
INSERT INTO `message` VALUES (7, '113165', '0', 36, 16, '1', 0, 8, '2019-10-16 21:17:56', 82);
INSERT INTO `message` VALUES (8, '哈哈哈哈哈', '0', 36, 16, '1', 1, 10, '2019-10-16 21:18:22', 83);
INSERT INTO `message` VALUES (9, '阿三大苏打', '0', 36, 16, '1', 1, 10, '2019-10-16 21:18:25', 84);
INSERT INTO `message` VALUES (10, '请问请问去', '0', 36, 16, '1', 1, 10, '2019-10-16 21:18:28', 85);
INSERT INTO `message` VALUES (11, '恶趣味去为去', '0', 36, 16, '1', 1, 10, '2019-10-16 21:18:31', 86);
INSERT INTO `message` VALUES (12, 'test', '0', 28, 16, '1', 1, 10, '2019-10-16 21:19:00', 87);
INSERT INTO `message` VALUES (13, '阿三大苏打', '0', 37, 16, '1', 1, 10, '2019-10-16 21:19:32', 88);
INSERT INTO `message` VALUES (14, '啊是大山东奥是的', '0', 29, 16, '1', 1, 10, '2019-10-16 21:20:00', 89);
INSERT INTO `message` VALUES (15, 'test1', '0', 37, 16, '1', 1, 10, '2019-10-16 21:24:40', 90);
INSERT INTO `message` VALUES (16, '撒大苏打', '0', 37, 16, '1', 1, 10, '2019-10-16 21:24:54', 91);
INSERT INTO `message` VALUES (17, '啊是大啊是大', '0', 29, 10, '1', 1, 10, '2019-10-16 21:26:03', 92);
INSERT INTO `message` VALUES (18, '啊是大啊是大', '0', 9, 10, '1', 0, 4, '2019-10-16 21:26:22', 93);
INSERT INTO `message` VALUES (19, '啊是大', '0', 9, 10, '1', 0, 4, '2019-10-16 21:46:38', 94);
INSERT INTO `message` VALUES (20, '啊是大', '0', 37, 10, '1', 1, 8, '2019-10-17 15:36:07', 95);
INSERT INTO `message` VALUES (21, '略略了', '0', 38, 10, '1', 1, 16, '2019-10-17 15:51:39', 96);
INSERT INTO `message` VALUES (22, 'hahahah', '0', 37, 16, '1', 1, 8, '2019-10-17 17:05:54', 97);
INSERT INTO `message` VALUES (23, 'leetcode我认为不错', '0', 41, 16, '1', 0, 17, '2019-10-17 17:44:38', 98);
INSERT INTO `message` VALUES (24, '还有名额吗', '0', 40, 16, '1', 1, 17, '2019-10-17 17:44:56', 99);
INSERT INTO `message` VALUES (25, '南锣鼓巷？这个地方怎么样', '0', 43, 16, '1', 1, 16, '2019-10-17 17:45:12', 100);
INSERT INTO `message` VALUES (26, '我也喜欢，虽然我们都是一个人', '0', 47, 10, '1', 0, 8, '2019-10-17 17:49:27', 101);
INSERT INTO `message` VALUES (27, '很多区别', '0', 39, 10, '1', 1, 17, '2019-10-17 18:13:29', 102);
INSERT INTO `message` VALUES (28, '测试回复', '0', 29, 10, '1', 1, 8, '2019-10-17 18:21:17', 103);
INSERT INTO `message` VALUES (29, '是有点疯狂', '0', 36, 10, '1', 1, 8, '2019-10-17 18:33:12', 104);

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '回复id',
  `topic_id` int(11) NOT NULL COMMENT '主题id',
  `reply_user_id` int(11) NOT NULL COMMENT '用户id',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '回复内容',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `device` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 113 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reply
-- ----------------------------
INSERT INTO `reply` VALUES (102, 39, 10, '很多区别', '2019-10-17 18:13:29', '2019-10-17 18:13:29', NULL);
INSERT INTO `reply` VALUES (100, 43, 8, '南锣鼓巷？这个地方怎么样', '2019-10-17 17:45:12', '2021-07-02 10:27:39', NULL);
INSERT INTO `reply` VALUES (101, 47, 10, '我也喜欢，虽然我们都是一个人', '2019-10-17 17:49:27', '2019-10-17 17:49:27', NULL);
INSERT INTO `reply` VALUES (29, 20, 10, '阿三大苏打', '2019-10-09 15:16:09', '2019-10-09 15:16:09', NULL);
INSERT INTO `reply` VALUES (78, 37, 8, '啊是大', '2019-10-16 21:11:03', '2021-07-02 10:27:42', NULL);
INSERT INTO `reply` VALUES (32, 22, 10, '试一试', '2019-10-09 15:27:46', '2019-10-09 15:27:46', NULL);
INSERT INTO `reply` VALUES (33, 22, 10, '啊实打实', '2019-10-09 15:30:18', '2019-10-09 15:30:18', NULL);
INSERT INTO `reply` VALUES (35, 22, 10, '好的', '2019-10-09 20:01:56', '2019-10-09 20:01:56', NULL);
INSERT INTO `reply` VALUES (44, 23, 10, '哈哈哈，啥想法', '2019-10-11 21:17:55', '2019-10-11 21:17:55', NULL);
INSERT INTO `reply` VALUES (46, 23, 10, '啊是大', '2019-10-11 21:33:33', '2019-10-11 21:33:33', NULL);
INSERT INTO `reply` VALUES (79, 37, 8, '再试一下', '2019-10-16 21:12:53', '2021-07-02 10:27:44', NULL);
INSERT INTO `reply` VALUES (108, 37, 8, '好好呀', '2021-07-02 16:36:38', '2021-07-02 16:36:38', NULL);
INSERT INTO `reply` VALUES (71, 37, 8, '种太阳！！', '2019-10-16 16:20:47', '2021-07-02 10:27:46', NULL);
INSERT INTO `reply` VALUES (72, 37, 8, '疯狂种太阳', '2019-10-16 16:21:59', '2021-07-02 10:27:47', NULL);
INSERT INTO `reply` VALUES (73, 37, 8, '疯狂种太阳', '2019-10-16 16:23:15', '2021-07-02 10:27:48', NULL);
INSERT INTO `reply` VALUES (74, 35, 8, '阿三大苏打', '2019-10-16 17:19:46', '2021-07-02 10:27:50', NULL);
INSERT INTO `reply` VALUES (75, 33, 8, '阿三大苏打', '2019-10-16 17:25:59', '2021-07-02 10:27:54', NULL);
INSERT INTO `reply` VALUES (76, 37, 8, '你把 岸得', '2019-10-16 21:02:19', '2021-07-02 10:27:52', NULL);
INSERT INTO `reply` VALUES (77, 37, 8, '啊是大', '2019-10-16 21:04:09', '2021-07-02 10:29:18', NULL);
INSERT INTO `reply` VALUES (51, 23, 10, '你可真牛逼的', '2019-10-12 13:10:35', '2019-10-12 13:10:35', NULL);
INSERT INTO `reply` VALUES (82, 36, 8, '113165', '2019-10-16 21:17:56', '2021-07-02 10:29:16', NULL);
INSERT INTO `reply` VALUES (83, 36, 8, '哈哈哈哈哈', '2019-10-16 21:18:22', '2021-07-02 10:27:55', NULL);
INSERT INTO `reply` VALUES (84, 36, 8, '阿三大苏打', '2019-10-16 21:18:25', '2021-07-02 10:27:57', NULL);
INSERT INTO `reply` VALUES (85, 36, 8, '请问请问去', '2019-10-16 21:18:28', '2021-07-02 10:28:00', NULL);
INSERT INTO `reply` VALUES (104, 36, 10, '是有点疯狂', '2019-10-17 18:33:12', '2019-10-17 18:33:12', NULL);
INSERT INTO `reply` VALUES (88, 37, 8, '阿三大苏打', '2019-10-16 21:19:32', '2021-07-02 10:29:20', NULL);
INSERT INTO `reply` VALUES (89, 29, 8, '啊是大山东奥是的', '2019-10-16 21:20:00', '2021-07-02 10:29:23', NULL);
INSERT INTO `reply` VALUES (90, 37, 8, 'test1', '2019-10-16 21:24:40', '2021-07-02 10:29:26', NULL);
INSERT INTO `reply` VALUES (91, 37, 8, '撒大苏打', '2019-10-16 21:24:54', '2021-07-02 10:29:28', NULL);
INSERT INTO `reply` VALUES (103, 29, 10, '测试回复', '2019-10-17 18:21:17', '2019-10-17 18:21:17', NULL);
INSERT INTO `reply` VALUES (99, 40, 8, '还有名额吗', '2019-10-17 17:44:56', '2021-07-02 10:29:30', NULL);
INSERT INTO `reply` VALUES (98, 41, 8, 'leetcode我认为不错', '2019-10-17 17:44:38', '2021-07-02 10:29:31', NULL);
INSERT INTO `reply` VALUES (95, 37, 10, '啊是大', '2019-10-17 15:36:07', '2019-10-17 15:36:07', NULL);
INSERT INTO `reply` VALUES (96, 38, 10, '略略了', '2019-10-17 15:51:39', '2019-10-17 15:51:39', NULL);
INSERT INTO `reply` VALUES (97, 37, 8, 'hahahah', '2019-10-17 17:05:54', '2021-07-02 10:29:36', NULL);
INSERT INTO `reply` VALUES (107, 49, 7, '你推荐的很好 不错不错', '2021-07-02 10:26:17', '2021-07-02 10:26:17', NULL);
INSERT INTO `reply` VALUES (106, 48, 8, '非淡泊无以明志', '2021-07-02 10:06:51', '2021-07-02 10:06:51', NULL);
INSERT INTO `reply` VALUES (109, 49, 8, '很好听', '2021-07-03 15:32:27', '2021-07-03 15:32:27', NULL);
INSERT INTO `reply` VALUES (110, 48, 8, '加油', '2021-07-03 15:32:36', '2021-07-03 15:32:36', NULL);
INSERT INTO `reply` VALUES (111, 50, 7, '拥护中国共产党  热爱党  是我们每一个公民的责任  奥里给', '2021-07-03 15:56:12', '2021-07-03 15:56:12', NULL);
INSERT INTO `reply` VALUES (112, 50, 9, '说的没错  给你点个赞', '2021-07-03 15:58:19', '2021-07-03 15:58:19', NULL);

-- ----------------------------
-- Table structure for tab
-- ----------------------------
DROP TABLE IF EXISTS `tab`;
CREATE TABLE `tab`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '板块id',
  `tab_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '板块名',
  `tab_name_en` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tab
-- ----------------------------
INSERT INTO `tab` VALUES (1, '技术', 'tech');
INSERT INTO `tab` VALUES (2, '好玩', 'play');
INSERT INTO `tab` VALUES (3, '创意', 'creative');
INSERT INTO `tab` VALUES (4, '工作', 'jobs');
INSERT INTO `tab` VALUES (5, '交易', 'deals');

-- ----------------------------
-- Table structure for topic
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '帖子ID',
  `user_id` int(11) NOT NULL COMMENT '发帖人id',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT NULL COMMENT '最后更新时间',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '内容',
  `click` int(11) NOT NULL DEFAULT 0 COMMENT '点击量',
  `tab_id` tinyint(4) NOT NULL COMMENT '发布板块',
  `isEssence` int(11) UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of topic
-- ----------------------------
INSERT INTO `topic` VALUES (41, 6, '2019-10-17 17:36:19', '2019-10-17 17:44:38', '有程序员专门刷题的网站吗？', '作者：trucy\r\n链接：https://www.zhihu.com/question/36488823/answer/121016624\r\n来源：知乎\r\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。\r\n\r\n谢不邀。从国内外分的话，国内：1. [九度OJ](题库-九度Online Judge，用代码记录你的成长之路!):王道论坛或者考计算机408的同学也许听过，目前已经收录了各高校上机复试真题，还有些名企笔试题，但好久没更新了。考研准备复试的同学可以参考下。2. [牛客OJ](在线编程_C++Java前端经典笔试面试题库) 题目挺全的，包含《剑指Offer》66题，校招真题105题，leecode148题，ACM训练题7418题（变态）,计算机考研复制233题，华为机试108题，还有一些其他js题。但支持语言不多，都支持C++和java，c#、js、python2.7一部分支持。AC不通过会提供使题目错误的输入，但往往格式不规范。总的来说题量很多，系统一般。3. [51NOD](最新动态 - 51Nod) 题目有546题，AC不通过会有对应的输入输出，不过需要分值购买来下载看，分值可以通过刷题得到，里面也有关于贪心算法和动态规划的学习教程，曹鹏博士讲的，只有做完教程分值才能返还，非常好的一个网站。目前支持19种主流语言，支持python2和python3，case设计也非常合理。4. [浙江大学 Online Judge（ZOJ](http://acm.zju.edu.cn). 国内最早也是最有名气的OJ，有很多高手在上面做题。打开速度快。5. [北京大学 Online Judge（POJ)](Welcome To PKU JudgeOnline>)建立较晚，但题目加得很快，现在题数和ZOJ不相上下，特点是举行在线比赛比较多，数据比ZOJ上的要弱，有时候同样的题同样的程序，在ZOJ上WA，在POJ上就能AC。不过感觉pku的题目要难很多。这个题库的一大特点就是 OnlineJudge功能强大，其实pku现在已经是中国最好的ACM网站。6. 补充下，国内有个仿照leecode做的[lintcode](LintCode - 编程面试题在线训练平台),lintcode刚出来的时候我做了几道题比较了一下，有些时候lintcode能过的代码放在leetcode就会有test case挂掉，不过那也是好久以前了，现在应该发展的挺好了，虽然还在发展之中，但感觉lintcode做的UI很不错，不好的地方就是没有像leecode的讨论区，非得到九章算法 - 帮助更多中国人找到好工作，硅谷顶尖IT企业工程师实时在线授课为你传授面试技巧去查答案，当然查询只支持英文哟，比如查丑数要输入\"ugly\"才会查的到，两个网站分开来也是想赚培训班的钱吧。但他只提供答案没有论坛高手的解题讨论并没有卵用，这点我觉得leecode比较好。好的地方除了UI就是lintcode会有leetcode的付费题，同时他的ladder挺好用的，可以练一下每个题型的经典题。推荐先刷完leecode的免费题，再来lintcode上玩。7. [赛马网](赛码网-IT笔试加分利器) 自带没几道题目，而且有一次刷他自带的题目体验很不好，记得有道题目显示其他人“正确提交的答案”其实都是错误的，而自己提交的正确答案却显示不通过，看那些所谓的正确答案甚至是其他题目里的答案，想跟客服反应还找不到渠道，只有qq群。。。他家商业合作做的挺不错，京东、今日头条等那他做笔试平台，大家要是想刷名企的题目倒是可以来这的，但刷其他题目，呵呵。。。8. 谢谢 姆姆姆 提到hihoCoder ，前些天微软以他为平台展开的笔试，和微软有一腿，之前举办过编程之美挑战赛，特点是每周都有针对性的一道难题等着你去AC，有详细讲解，月赛的题目均由来自北京大学等一流高校的ACM队员出题。OJ编辑环境适合Emacs、vim或者最简单的文本编辑，支持主流编程语言：g++,c#,python2,java，讨论区活跃度并不高，发的代码没有自动识别语法高亮的，统一的黑色markdown，前端要努努力了。此外我觉得代码提交不人性化，我用safri、firefox浏览器提交的代码状态不会自动跳转，必须刷新下你才知道是从waiting到ac了还是re了，还有估计底层集群比较小，人一多提交就很慢，刷了半天还是waiting。总的来说没事来这每周刷个题也不错，兴致来了去参加个小比赛乐乐，但长期对着这个界面刷题我是受不了。国外：1. [leetcode ](LeetCode Online Judge) 可以说是最著名的网站了，海量编程题包含数据库和shell试题，支持 C, C++, Java, Python, C#, JavaScript, Ruby, Bash, MySQL.喜欢用python的同学注意可以支持python3了，另外提供导致ac不通过的的输入和输出，易于修改程序。2. [俄罗斯萨拉托夫国立大学(Saratov State University)(SGU)](Saratov State University :: Online Contester) SGU是俄罗斯萨拉托夫国立大学(Saratov StateUniversity)用于培养ACM选手的训练网站。这个网站的建成时期较晚，但随着比赛的举行以及新题目的加入，这个题库的题目也日渐丰富。这个题库的一大特点就是 OnlineJudge功能强大，它不仅使你避开了多数据处理的繁琐操作，还能告诉你程序错在了第几个数据。这一点虽然与ACM的Judge有些出入，但是却方便了调试程序。与UVA相比，这里的题目在时间空间上要求都比较严格，而且更多的考察选手对算法的掌握情况，所以特别推荐冲击NOI的选手也来做一做。以上都可以看到排名，按语言排名或者按时间复杂度排名，whatever，学习结构和算法的话推荐[July CSDN](http://blog.csdn.net/v_july_v/article/details/6543438),包含经典的算法、数据结构和机器学习的文章。', 7, 1, 00000000000);
INSERT INTO `topic` VALUES (39, 6, '2019-10-17 17:34:02', '2019-10-17 18:13:29', 'Java重写、重载、多态的具体区别', 'Java重写、重载、多态的具体区别', 16, 1, 00000000001);
INSERT INTO `topic` VALUES (40, 6, '2019-10-17 17:35:16', '2019-10-17 17:44:56', '【社招】【内推】【阿里天猫海外】后端', '只有社招，只有社招，只有社招\r\n\r\n天猫进出口事业部是阿里巴巴核心电商业务，我们是一支国际化技术团队，致力于进口业务和出口业务的技术突破和创新。从阿里巴巴全球化战略的角度实施“全球买，全球卖”。进口业务为天猫国际，是中国消费升级的第一跨境平台。出口业务是天猫海外，帮助中国品牌通过跨境电商在全球销售，我们致力于连接世界各地的品牌和消费者。\r\n\r\n现在天猫海外很受逍遥子的重视，升级成了一个独立的部门，名额很多，持续招聘，学弟学妹们快来\r\n招聘岗位：JAVA  \r\n我们主要招P7 P8 待遇没说的, P6的同学也可以投  \r\n', 13, 4, 00000000000);
INSERT INTO `topic` VALUES (22, 4, '2019-10-09 15:15:43', '2019-10-09 20:01:56', '快来玩暗黑大天使吧', '《暗黑大天使》是一款以西方魔幻故事为题材的RPG网络游戏。\r\n网址：http://game.37.com/play.php?game_id=577&server_id=222487&ext=p|1|53|-1|115699|0|t=1!cg=4008!c=359!v=U1Ndjjnm-QtTgw-DY64.!b=0!p=1!un=53!l=-1!uid=115699!a=43344!pd=1!g=577!gs=222487!n=2|os=win10!bs=chrome&entergametype=tg', 100, 2, 00000000001);
INSERT INTO `topic` VALUES (20, 1, '2019-07-03 14:49:05', '2019-10-09 15:26:49', '337是全世界最好的实验室', '', 120, 1, 00000000001);
INSERT INTO `topic` VALUES (21, 1, '2019-10-08 19:20:36', '2019-10-09 13:00:03', '测试一下好玩', '', 1, 2, 00000000000);
INSERT INTO `topic` VALUES (23, 1, '2019-10-09 19:43:11', '2019-10-12 13:10:35', '我有几个非常厉害的想法', '666', 163, 3, 00000000001);
INSERT INTO `topic` VALUES (29, 1, '2019-10-12 14:41:43', '2019-10-17 18:21:17', '测试一下好玩', '', 12, 1, 00000000000);
INSERT INTO `topic` VALUES (32, 1, '2019-10-12 14:42:04', '2019-10-12 14:42:04', '疯狂发帖1', '', 0, 1, 00000000000);
INSERT INTO `topic` VALUES (33, 1, '2019-10-12 14:42:11', '2019-10-16 17:25:59', '疯狂发帖1', '', 2, 1, 00000000000);
INSERT INTO `topic` VALUES (34, 1, '2019-10-12 14:42:16', '2019-10-12 14:42:16', '疯狂发帖1', '', 0, 1, 00000000000);
INSERT INTO `topic` VALUES (35, 2, '2019-10-12 14:42:20', '2019-10-16 17:19:46', '疯狂发帖1', '', 8, 1, 00000000000);
INSERT INTO `topic` VALUES (36, 3, '2019-10-12 14:42:24', '2019-10-17 18:33:12', '疯狂发帖1', '', 24, 1, 00000000000);
INSERT INTO `topic` VALUES (37, 2, '2019-10-12 14:42:29', '2021-07-02 16:36:38', '疯狂发帖1', '', 119, 1, 00000000000);
INSERT INTO `topic` VALUES (38, 4, '2019-10-17 15:51:16', '2019-10-17 15:51:39', 'lhf2018试一试', '', 11, 1, 00000000000);
INSERT INTO `topic` VALUES (42, 4, '2019-10-17 17:37:22', '2019-10-17 17:37:22', '木心诗选', '《木心诗选》的诗歌，共七辑（158首），从最早期的《阿里山之夜》，到最为读者所知的《从前慢》，以及最最“天书”的《同袍》四言诗等，各个时期的，均精选于木心生前自订的全部六种诗集——《我纷纷的情欲》《西班牙三棵树》《伪所罗门书》《巴珑》《诗经演》《云雀叫了一整天》。\r\n木心的诗，例外与常态，跳出惯性思维的思维，是空话套话的死敌。诗的品质，嫉俗如仇，不炫耀不喧闹，以“故实”抒情，形成“遐想中低声吟咏的力量”，和现实生活、历史时空、古典文学、西方文化文学都形成互文。', 3, 3, 00000000001);
INSERT INTO `topic` VALUES (43, 4, '2019-10-17 17:38:22', '2019-10-17 17:45:12', '北京好玩的地方', '北京好玩的地方之一：左右间设计+咖啡的院翰若居书馆\r\n\r\n　　著名年轻建筑设计师王晖在古迹圆明园东门外开的这家咖啡馆,，当数北京城最具灵感的地角。光线同时洒在三角形的镜面做成的咖啡桌上、洒在镜面做成的吧台上、洒在组成吧台的数千册混砌的书墙的结构上，又被这些材料反射出去，形成更多的光的通道，晶莹地将空间充满,实实在在地充满。桌椅的影子、人的影子、窗影与树影浅浅地被表现出来，就像一组空间的画和时间糅在一起,却又要让人忘了时间。\r\n\r\n　　地址：海淀区圆明园东门内停车场北二间院\r\n\r\n　　北京好玩的地方之二：文宇奶酪店\r\n\r\n　　“文宇奶酪店”位于北京市东城区南锣鼓巷内，是一家经营奶酪和酸梅汤的小店，小店开业以来，因为物美价廉风味地道而生意越来越红火。虽然酒香不怕巷子深，更何况南锣鼓巷北口在鼓楼东大街上，南口在平安大街上，是京城比较著名的一条胡同。这里的“奶酪”是地道的老北京风味小吃。由于文宇的主人是三元梅园的老师傅，所以味道最厚、最正的就数文宇奶酪店。店里自己熬的“冰镇酸梅汤”酸甜适宜，消暑解渴。\r\n\r\n　　地址：西城区南锣鼓巷49号', 7, 2, 00000000000);
INSERT INTO `topic` VALUES (44, 7, '2019-10-17 17:38:58', '2019-10-17 17:38:58', '出beats solo3 wireless 金色', '出beats solo3 wireless 金色', 2, 5, 00000000000);
INSERT INTO `topic` VALUES (45, 7, '2019-10-17 17:39:41', '2019-10-17 17:39:41', '收一部iphone XR', '成色9成新最好，谢谢！', 2, 5, 00000000000);
INSERT INTO `topic` VALUES (46, 2, '2019-10-17 17:43:47', '2019-10-17 17:43:47', '【比较】offer求建议，腾讯sp vs 字节sp', '腾讯sp vs 字节sp，哪个好，都是做go开发相关', 5, 4, 00000000000);
INSERT INTO `topic` VALUES (47, 3, '2019-10-17 17:46:55', '2019-10-17 17:49:27', '我好喜欢《我和我的祖国》这个电影', '吹爆~~', 26, 2, 00000000000);
INSERT INTO `topic` VALUES (48, 7, '2021-07-01 20:12:07', '2021-07-03 15:32:36', '敏而多思，宁静致远', 'wyf\r\n加油呀  \r\n给我冲  \r\n奥里给', 137, 4, 00000000000);
INSERT INTO `topic` VALUES (49, 7, '2021-07-02 09:34:16', '2021-07-03 15:32:27', '推荐一首很好听的歌曲', '鬼鬼Gmer - 《何必》「你叫嚣着要活的漂亮 苟延残喘痛到绝望 我自作主张只想看清你走得方向」', 65, 3, 00000000000);
INSERT INTO `topic` VALUES (50, 8, '2021-07-03 15:44:17', '2021-07-03 15:58:19', '热烈庆祝中国共产党建党100周年', '2021-7-1 日上午，中共领导以习近平为代表的领导人在天安门广场发表了重要讲话，并强调了中国已经完全脱贫，中国不再是100年前那个中国了，中国人不在受别人的欺凌，中国现在站起来了。', 17, 4, 00000000001);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户唯一ID',
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone_num` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `create_time` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `credit` int(11) NOT NULL COMMENT '积分',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像url',
  `type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '用户类型,0为普通用户,1为管理员',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'likky', 'E10ADC3949BA59ABBE56E057F20F883E', '123456789@126.com', '8615712345678', '2018-02-08 15:06:40', '2018-02-09 07:57:05', 23, '/img/avatar/avatar-default-1.png', 0);
INSERT INTO `user` VALUES (2, 'withstars', 'E10ADC3949BA59ABBE56E057F20F883E', '987654321@qq.com', '8616978945612', '2018-01-31 12:16:54', '2018-02-09 07:57:21', 10, '/img/avatar/avatar-default-2.png', 0);
INSERT INTO `user` VALUES (3, 'yilia', 'E10ADC3949BA59ABBE56E057F20F883E', '147258369@qq.com', '8615963248962', '2018-01-20 06:18:58', '2018-02-09 07:56:29', 0, '/img/avatar/avatar-default-3.png', 0);
INSERT INTO `user` VALUES (4, 'sassy', 'E10ADC3949BA59ABBE56E057F20F883E', '159357846@qq.com', '8612543434343', '2018-02-08 14:17:16', '2018-02-09 07:56:39', 156, '/img/avatar/avatar-default-4.png', 0);
INSERT INTO `user` VALUES (6, 'objectc', 'A45958517604F5CD90D6EE51AD9CFDB6', '963852741@qq.com', '8619345321598', '2018-02-09 04:36:39', '2018-02-09 07:56:46', 7, '/img/avatar/avatar-default-5.png', 0);
INSERT INTO `user` VALUES (7, 'admin', 'E10ADC3949BA59ABBE56E057F20F883E', '1350686887@qq.com', '8615797627635', '2021-06-30 09:22:48', '2021-07-03 17:09:55', 64, '/img/avatar/avatar-default-9.png', 1);
INSERT INTO `user` VALUES (8, '张三', '827CCB0EEA8A706C4C34A16891F84E7B', '920744043@qq.com', '8615797627635', '2021-06-30 09:36:20', '2021-07-03 16:25:19', 76, '/img/avatar/avatar-default-9.png', 0);
INSERT INTO `user` VALUES (9, 'jack', '81DC9BDB52D04DC20036DBD8313ED055', '920744044@qq.com', '8615797627635', '2021-07-03 15:57:41', '2021-07-03 17:09:37', 8, '/img/avatar/1625303377846-9.jpeg', 0);

-- ----------------------------
-- Table structure for visitor
-- ----------------------------
DROP TABLE IF EXISTS `visitor`;
CREATE TABLE `visitor`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `IP` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `visit_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `device` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 269 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of visitor
-- ----------------------------
INSERT INTO `visitor` VALUES (1, '0:0:0:0:0:0:0:1', '2019-10-10 19:06:55', 'CHROME');
INSERT INTO `visitor` VALUES (2, '0:0:0:0:0:0:0:1', '2019-10-10 19:06:55', 'CHROME');
INSERT INTO `visitor` VALUES (3, '0:0:0:0:0:0:0:1', '2019-10-10 19:06:57', 'CHROME');
INSERT INTO `visitor` VALUES (4, '0:0:0:0:0:0:0:1', '2019-10-10 19:06:58', 'CHROME');
INSERT INTO `visitor` VALUES (5, '0:0:0:0:0:0:0:1', '2019-10-10 19:06:59', 'CHROME');
INSERT INTO `visitor` VALUES (6, '0:0:0:0:0:0:0:1', '2019-10-10 19:07:00', 'CHROME');
INSERT INTO `visitor` VALUES (7, '0:0:0:0:0:0:0:1', '2019-10-10 19:07:01', 'CHROME');
INSERT INTO `visitor` VALUES (8, '0:0:0:0:0:0:0:1', '2019-10-10 19:07:02', 'CHROME');
INSERT INTO `visitor` VALUES (9, '0:0:0:0:0:0:0:1', '2019-10-10 20:06:46', 'CHROME');
INSERT INTO `visitor` VALUES (10, '0:0:0:0:0:0:0:1', '2019-10-10 20:06:47', 'CHROME');
INSERT INTO `visitor` VALUES (19, '127.0.0.1', '2021-07-02 08:53:59', 'UNKNOWN');
INSERT INTO `visitor` VALUES (20, '127.0.0.1', '2021-07-02 08:54:00', 'UNKNOWN');
INSERT INTO `visitor` VALUES (21, '0:0:0:0:0:0:0:1', '2021-07-02 08:54:01', 'CHROME9');
INSERT INTO `visitor` VALUES (22, '0:0:0:0:0:0:0:1', '2021-07-02 08:54:40', 'CHROME9');
INSERT INTO `visitor` VALUES (23, '0:0:0:0:0:0:0:1', '2021-07-02 08:54:48', 'CHROME9');
INSERT INTO `visitor` VALUES (24, '0:0:0:0:0:0:0:1', '2021-07-02 08:56:08', 'CHROME9');
INSERT INTO `visitor` VALUES (25, '0:0:0:0:0:0:0:1', '2021-07-02 08:56:20', 'CHROME9');
INSERT INTO `visitor` VALUES (26, '0:0:0:0:0:0:0:1', '2021-07-02 09:01:23', 'CHROME9');
INSERT INTO `visitor` VALUES (27, '0:0:0:0:0:0:0:1', '2021-07-02 09:01:43', 'CHROME9');
INSERT INTO `visitor` VALUES (28, '0:0:0:0:0:0:0:1', '2021-07-02 09:01:51', 'CHROME9');
INSERT INTO `visitor` VALUES (29, '0:0:0:0:0:0:0:1', '2021-07-02 09:15:05', 'CHROME9');
INSERT INTO `visitor` VALUES (30, '0:0:0:0:0:0:0:1', '2021-07-02 09:15:23', 'CHROME9');
INSERT INTO `visitor` VALUES (31, '0:0:0:0:0:0:0:1', '2021-07-02 09:31:54', 'CHROME9');
INSERT INTO `visitor` VALUES (32, '0:0:0:0:0:0:0:1', '2021-07-02 09:32:04', 'CHROME9');
INSERT INTO `visitor` VALUES (33, '0:0:0:0:0:0:0:1', '2021-07-02 09:32:34', 'CHROME9');
INSERT INTO `visitor` VALUES (34, '0:0:0:0:0:0:0:1', '2021-07-02 09:32:55', 'CHROME9');
INSERT INTO `visitor` VALUES (35, '0:0:0:0:0:0:0:1', '2021-07-02 09:33:00', 'CHROME9');
INSERT INTO `visitor` VALUES (36, '0:0:0:0:0:0:0:1', '2021-07-02 09:34:16', 'CHROME9');
INSERT INTO `visitor` VALUES (37, '0:0:0:0:0:0:0:1', '2021-07-02 09:34:39', 'CHROME9');
INSERT INTO `visitor` VALUES (38, '0:0:0:0:0:0:0:1', '2021-07-02 09:41:45', 'CHROME9');
INSERT INTO `visitor` VALUES (39, '0:0:0:0:0:0:0:1', '2021-07-02 09:42:00', 'CHROME9');
INSERT INTO `visitor` VALUES (40, '0:0:0:0:0:0:0:1', '2021-07-02 09:42:10', 'CHROME9');
INSERT INTO `visitor` VALUES (41, '0:0:0:0:0:0:0:1', '2021-07-02 10:05:49', 'CHROME9');
INSERT INTO `visitor` VALUES (42, '0:0:0:0:0:0:0:1', '2021-07-02 10:06:02', 'CHROME9');
INSERT INTO `visitor` VALUES (43, '0:0:0:0:0:0:0:1', '2021-07-02 10:06:28', 'CHROME9');
INSERT INTO `visitor` VALUES (44, '0:0:0:0:0:0:0:1', '2021-07-02 10:06:57', 'CHROME9');
INSERT INTO `visitor` VALUES (45, '0:0:0:0:0:0:0:1', '2021-07-02 10:07:19', 'CHROME9');
INSERT INTO `visitor` VALUES (46, '0:0:0:0:0:0:0:1', '2021-07-02 10:07:28', 'CHROME9');
INSERT INTO `visitor` VALUES (47, '0:0:0:0:0:0:0:1', '2021-07-02 10:07:47', 'CHROME9');
INSERT INTO `visitor` VALUES (48, '0:0:0:0:0:0:0:1', '2021-07-02 10:09:22', 'CHROME9');
INSERT INTO `visitor` VALUES (49, '0:0:0:0:0:0:0:1', '2021-07-02 10:09:34', 'CHROME9');
INSERT INTO `visitor` VALUES (50, '0:0:0:0:0:0:0:1', '2021-07-02 10:09:37', 'CHROME9');
INSERT INTO `visitor` VALUES (51, '0:0:0:0:0:0:0:1', '2021-07-02 10:09:37', 'CHROME9');
INSERT INTO `visitor` VALUES (52, '0:0:0:0:0:0:0:1', '2021-07-02 10:09:48', 'CHROME9');
INSERT INTO `visitor` VALUES (53, '0:0:0:0:0:0:0:1', '2021-07-02 10:09:58', 'CHROME9');
INSERT INTO `visitor` VALUES (54, '0:0:0:0:0:0:0:1', '2021-07-02 10:10:18', 'CHROME9');
INSERT INTO `visitor` VALUES (55, '0:0:0:0:0:0:0:1', '2021-07-02 10:12:38', 'CHROME9');
INSERT INTO `visitor` VALUES (56, '0:0:0:0:0:0:0:1', '2021-07-02 10:12:48', 'CHROME9');
INSERT INTO `visitor` VALUES (57, '0:0:0:0:0:0:0:1', '2021-07-02 10:13:49', 'CHROME9');
INSERT INTO `visitor` VALUES (58, '0:0:0:0:0:0:0:1', '2021-07-02 10:14:11', 'CHROME9');
INSERT INTO `visitor` VALUES (59, '0:0:0:0:0:0:0:1', '2021-07-02 10:15:52', 'CHROME9');
INSERT INTO `visitor` VALUES (60, '0:0:0:0:0:0:0:1', '2021-07-02 10:16:01', 'CHROME9');
INSERT INTO `visitor` VALUES (61, '0:0:0:0:0:0:0:1', '2021-07-02 10:23:06', 'CHROME9');
INSERT INTO `visitor` VALUES (62, '0:0:0:0:0:0:0:1', '2021-07-02 10:23:18', 'CHROME9');
INSERT INTO `visitor` VALUES (63, '0:0:0:0:0:0:0:1', '2021-07-02 10:23:23', 'CHROME9');
INSERT INTO `visitor` VALUES (64, '0:0:0:0:0:0:0:1', '2021-07-02 10:23:32', 'CHROME9');
INSERT INTO `visitor` VALUES (65, '0:0:0:0:0:0:0:1', '2021-07-02 10:23:35', 'CHROME9');
INSERT INTO `visitor` VALUES (66, '0:0:0:0:0:0:0:1', '2021-07-02 10:23:58', 'CHROME9');
INSERT INTO `visitor` VALUES (67, '0:0:0:0:0:0:0:1', '2021-07-02 10:25:01', 'CHROME9');
INSERT INTO `visitor` VALUES (68, '0:0:0:0:0:0:0:1', '2021-07-02 10:25:04', 'CHROME9');
INSERT INTO `visitor` VALUES (69, '0:0:0:0:0:0:0:1', '2021-07-02 10:26:02', 'CHROME9');
INSERT INTO `visitor` VALUES (70, '0:0:0:0:0:0:0:1', '2021-07-02 10:28:04', 'CHROME9');
INSERT INTO `visitor` VALUES (71, '0:0:0:0:0:0:0:1', '2021-07-02 10:28:08', 'CHROME9');
INSERT INTO `visitor` VALUES (72, '0:0:0:0:0:0:0:1', '2021-07-02 10:28:42', 'CHROME9');
INSERT INTO `visitor` VALUES (73, '0:0:0:0:0:0:0:1', '2021-07-02 10:29:43', 'CHROME9');
INSERT INTO `visitor` VALUES (74, '0:0:0:0:0:0:0:1', '2021-07-02 10:29:46', 'CHROME9');
INSERT INTO `visitor` VALUES (75, '0:0:0:0:0:0:0:1', '2021-07-02 10:48:53', 'CHROME9');
INSERT INTO `visitor` VALUES (76, '0:0:0:0:0:0:0:1', '2021-07-02 10:50:40', 'CHROME9');
INSERT INTO `visitor` VALUES (77, '0:0:0:0:0:0:0:1', '2021-07-02 10:53:39', 'CHROME9');
INSERT INTO `visitor` VALUES (78, '0:0:0:0:0:0:0:1', '2021-07-02 10:56:30', 'CHROME9');
INSERT INTO `visitor` VALUES (79, '0:0:0:0:0:0:0:1', '2021-07-02 10:59:20', 'CHROME9');
INSERT INTO `visitor` VALUES (80, '0:0:0:0:0:0:0:1', '2021-07-02 11:00:12', 'CHROME9');
INSERT INTO `visitor` VALUES (81, '0:0:0:0:0:0:0:1', '2021-07-02 11:01:35', 'CHROME9');
INSERT INTO `visitor` VALUES (82, '0:0:0:0:0:0:0:1', '2021-07-02 11:04:56', 'CHROME9');
INSERT INTO `visitor` VALUES (83, '0:0:0:0:0:0:0:1', '2021-07-02 11:13:05', 'CHROME9');
INSERT INTO `visitor` VALUES (84, '0:0:0:0:0:0:0:1', '2021-07-02 11:13:59', 'CHROME9');
INSERT INTO `visitor` VALUES (85, '0:0:0:0:0:0:0:1', '2021-07-02 11:15:41', 'CHROME9');
INSERT INTO `visitor` VALUES (86, '0:0:0:0:0:0:0:1', '2021-07-02 11:16:47', 'CHROME9');
INSERT INTO `visitor` VALUES (87, '0:0:0:0:0:0:0:1', '2021-07-02 11:18:59', 'CHROME9');
INSERT INTO `visitor` VALUES (88, '0:0:0:0:0:0:0:1', '2021-07-02 12:49:36', 'CHROME9');
INSERT INTO `visitor` VALUES (89, '0:0:0:0:0:0:0:1', '2021-07-02 12:50:07', 'CHROME9');
INSERT INTO `visitor` VALUES (90, '0:0:0:0:0:0:0:1', '2021-07-02 12:53:10', 'CHROME9');
INSERT INTO `visitor` VALUES (91, '0:0:0:0:0:0:0:1', '2021-07-02 12:53:41', 'CHROME9');
INSERT INTO `visitor` VALUES (92, '0:0:0:0:0:0:0:1', '2021-07-02 12:56:45', 'CHROME9');
INSERT INTO `visitor` VALUES (93, '0:0:0:0:0:0:0:1', '2021-07-02 13:46:51', 'CHROME9');
INSERT INTO `visitor` VALUES (94, '0:0:0:0:0:0:0:1', '2021-07-02 13:47:02', 'CHROME9');
INSERT INTO `visitor` VALUES (95, '0:0:0:0:0:0:0:1', '2021-07-02 13:47:05', 'CHROME9');
INSERT INTO `visitor` VALUES (96, '0:0:0:0:0:0:0:1', '2021-07-02 13:50:00', 'CHROME9');
INSERT INTO `visitor` VALUES (97, '0:0:0:0:0:0:0:1', '2021-07-02 13:50:02', 'CHROME9');
INSERT INTO `visitor` VALUES (98, '0:0:0:0:0:0:0:1', '2021-07-02 13:52:32', 'CHROME9');
INSERT INTO `visitor` VALUES (99, '0:0:0:0:0:0:0:1', '2021-07-02 13:53:21', 'CHROME9');
INSERT INTO `visitor` VALUES (100, '0:0:0:0:0:0:0:1', '2021-07-02 13:55:00', 'CHROME9');
INSERT INTO `visitor` VALUES (101, '0:0:0:0:0:0:0:1', '2021-07-02 13:55:14', 'CHROME9');
INSERT INTO `visitor` VALUES (102, '0:0:0:0:0:0:0:1', '2021-07-02 13:56:40', 'CHROME9');
INSERT INTO `visitor` VALUES (103, '0:0:0:0:0:0:0:1', '2021-07-02 14:04:33', 'CHROME9');
INSERT INTO `visitor` VALUES (104, '0:0:0:0:0:0:0:1', '2021-07-02 14:06:39', 'CHROME9');
INSERT INTO `visitor` VALUES (105, '0:0:0:0:0:0:0:1', '2021-07-02 14:07:34', 'CHROME9');
INSERT INTO `visitor` VALUES (106, '0:0:0:0:0:0:0:1', '2021-07-02 14:07:40', 'CHROME9');
INSERT INTO `visitor` VALUES (107, '0:0:0:0:0:0:0:1', '2021-07-02 14:10:31', 'CHROME9');
INSERT INTO `visitor` VALUES (108, '0:0:0:0:0:0:0:1', '2021-07-02 14:10:40', 'CHROME9');
INSERT INTO `visitor` VALUES (109, '0:0:0:0:0:0:0:1', '2021-07-02 14:11:39', 'CHROME9');
INSERT INTO `visitor` VALUES (110, '0:0:0:0:0:0:0:1', '2021-07-02 14:11:43', 'CHROME9');
INSERT INTO `visitor` VALUES (111, '0:0:0:0:0:0:0:1', '2021-07-02 14:12:53', 'CHROME9');
INSERT INTO `visitor` VALUES (112, '0:0:0:0:0:0:0:1', '2021-07-02 14:13:07', 'CHROME9');
INSERT INTO `visitor` VALUES (113, '0:0:0:0:0:0:0:1', '2021-07-02 14:14:45', 'CHROME9');
INSERT INTO `visitor` VALUES (114, '0:0:0:0:0:0:0:1', '2021-07-02 14:14:51', 'CHROME9');
INSERT INTO `visitor` VALUES (115, '0:0:0:0:0:0:0:1', '2021-07-02 14:15:03', 'CHROME9');
INSERT INTO `visitor` VALUES (116, '0:0:0:0:0:0:0:1', '2021-07-02 14:15:07', 'CHROME9');
INSERT INTO `visitor` VALUES (117, '0:0:0:0:0:0:0:1', '2021-07-02 14:15:55', 'CHROME9');
INSERT INTO `visitor` VALUES (118, '0:0:0:0:0:0:0:1', '2021-07-02 14:16:31', 'CHROME9');
INSERT INTO `visitor` VALUES (119, '0:0:0:0:0:0:0:1', '2021-07-02 14:18:03', 'CHROME9');
INSERT INTO `visitor` VALUES (120, '0:0:0:0:0:0:0:1', '2021-07-02 14:41:25', 'CHROME9');
INSERT INTO `visitor` VALUES (121, '0:0:0:0:0:0:0:1', '2021-07-02 14:42:31', 'CHROME9');
INSERT INTO `visitor` VALUES (122, '0:0:0:0:0:0:0:1', '2021-07-02 14:42:37', 'CHROME9');
INSERT INTO `visitor` VALUES (123, '0:0:0:0:0:0:0:1', '2021-07-02 14:48:05', 'CHROME9');
INSERT INTO `visitor` VALUES (124, '0:0:0:0:0:0:0:1', '2021-07-02 14:48:46', 'CHROME9');
INSERT INTO `visitor` VALUES (125, '0:0:0:0:0:0:0:1', '2021-07-02 14:49:22', 'CHROME9');
INSERT INTO `visitor` VALUES (126, '0:0:0:0:0:0:0:1', '2021-07-02 14:49:30', 'CHROME9');
INSERT INTO `visitor` VALUES (127, '0:0:0:0:0:0:0:1', '2021-07-02 14:50:09', 'CHROME9');
INSERT INTO `visitor` VALUES (128, '0:0:0:0:0:0:0:1', '2021-07-02 14:50:11', 'CHROME9');
INSERT INTO `visitor` VALUES (129, '0:0:0:0:0:0:0:1', '2021-07-02 14:55:25', 'CHROME9');
INSERT INTO `visitor` VALUES (130, '0:0:0:0:0:0:0:1', '2021-07-02 14:58:29', 'CHROME9');
INSERT INTO `visitor` VALUES (131, '0:0:0:0:0:0:0:1', '2021-07-02 14:59:26', 'CHROME9');
INSERT INTO `visitor` VALUES (132, '0:0:0:0:0:0:0:1', '2021-07-02 15:14:35', 'CHROME9');
INSERT INTO `visitor` VALUES (133, '0:0:0:0:0:0:0:1', '2021-07-02 15:15:33', 'CHROME9');
INSERT INTO `visitor` VALUES (134, '0:0:0:0:0:0:0:1', '2021-07-02 15:15:39', 'CHROME9');
INSERT INTO `visitor` VALUES (135, '0:0:0:0:0:0:0:1', '2021-07-02 15:16:27', 'CHROME9');
INSERT INTO `visitor` VALUES (136, '0:0:0:0:0:0:0:1', '2021-07-02 15:17:10', 'CHROME9');
INSERT INTO `visitor` VALUES (137, '0:0:0:0:0:0:0:1', '2021-07-02 15:26:53', 'CHROME9');
INSERT INTO `visitor` VALUES (138, '0:0:0:0:0:0:0:1', '2021-07-02 15:26:56', 'CHROME9');
INSERT INTO `visitor` VALUES (139, '0:0:0:0:0:0:0:1', '2021-07-02 15:27:20', 'CHROME9');
INSERT INTO `visitor` VALUES (140, '0:0:0:0:0:0:0:1', '2021-07-02 15:27:21', 'CHROME9');
INSERT INTO `visitor` VALUES (141, '0:0:0:0:0:0:0:1', '2021-07-02 15:35:12', 'CHROME9');
INSERT INTO `visitor` VALUES (142, '0:0:0:0:0:0:0:1', '2021-07-02 15:37:14', 'CHROME9');
INSERT INTO `visitor` VALUES (143, '0:0:0:0:0:0:0:1', '2021-07-02 15:37:48', 'CHROME9');
INSERT INTO `visitor` VALUES (144, '0:0:0:0:0:0:0:1', '2021-07-02 15:37:50', 'CHROME9');
INSERT INTO `visitor` VALUES (145, '0:0:0:0:0:0:0:1', '2021-07-02 15:40:13', 'CHROME9');
INSERT INTO `visitor` VALUES (146, '0:0:0:0:0:0:0:1', '2021-07-02 15:40:18', 'CHROME9');
INSERT INTO `visitor` VALUES (147, '0:0:0:0:0:0:0:1', '2021-07-02 15:41:41', 'CHROME9');
INSERT INTO `visitor` VALUES (148, '0:0:0:0:0:0:0:1', '2021-07-02 15:41:52', 'CHROME9');
INSERT INTO `visitor` VALUES (149, '0:0:0:0:0:0:0:1', '2021-07-02 15:42:26', 'CHROME9');
INSERT INTO `visitor` VALUES (150, '0:0:0:0:0:0:0:1', '2021-07-02 15:42:31', 'CHROME9');
INSERT INTO `visitor` VALUES (151, '0:0:0:0:0:0:0:1', '2021-07-02 15:42:32', 'CHROME9');
INSERT INTO `visitor` VALUES (152, '0:0:0:0:0:0:0:1', '2021-07-02 15:43:15', 'CHROME9');
INSERT INTO `visitor` VALUES (153, '0:0:0:0:0:0:0:1', '2021-07-02 15:43:23', 'CHROME9');
INSERT INTO `visitor` VALUES (154, '0:0:0:0:0:0:0:1', '2021-07-02 15:43:42', 'CHROME9');
INSERT INTO `visitor` VALUES (155, '0:0:0:0:0:0:0:1', '2021-07-02 15:43:45', 'CHROME9');
INSERT INTO `visitor` VALUES (156, '0:0:0:0:0:0:0:1', '2021-07-02 15:43:52', 'CHROME9');
INSERT INTO `visitor` VALUES (157, '0:0:0:0:0:0:0:1', '2021-07-02 15:52:05', 'CHROME9');
INSERT INTO `visitor` VALUES (158, '0:0:0:0:0:0:0:1', '2021-07-02 16:07:09', 'CHROME9');
INSERT INTO `visitor` VALUES (159, '0:0:0:0:0:0:0:1', '2021-07-02 16:07:33', 'CHROME9');
INSERT INTO `visitor` VALUES (160, '0:0:0:0:0:0:0:1', '2021-07-02 16:07:34', 'CHROME9');
INSERT INTO `visitor` VALUES (161, '0:0:0:0:0:0:0:1', '2021-07-02 16:07:35', 'CHROME9');
INSERT INTO `visitor` VALUES (162, '0:0:0:0:0:0:0:1', '2021-07-02 16:07:49', 'CHROME9');
INSERT INTO `visitor` VALUES (163, '0:0:0:0:0:0:0:1', '2021-07-02 16:08:05', 'CHROME9');
INSERT INTO `visitor` VALUES (164, '0:0:0:0:0:0:0:1', '2021-07-02 16:08:07', 'CHROME9');
INSERT INTO `visitor` VALUES (165, '0:0:0:0:0:0:0:1', '2021-07-02 16:13:18', 'CHROME9');
INSERT INTO `visitor` VALUES (166, '0:0:0:0:0:0:0:1', '2021-07-02 16:13:39', 'CHROME9');
INSERT INTO `visitor` VALUES (167, '0:0:0:0:0:0:0:1', '2021-07-02 16:13:40', 'CHROME9');
INSERT INTO `visitor` VALUES (168, '0:0:0:0:0:0:0:1', '2021-07-02 16:31:31', 'CHROME9');
INSERT INTO `visitor` VALUES (169, '0:0:0:0:0:0:0:1', '2021-07-02 16:31:35', 'CHROME9');
INSERT INTO `visitor` VALUES (170, '0:0:0:0:0:0:0:1', '2021-07-02 16:31:48', 'CHROME9');
INSERT INTO `visitor` VALUES (171, '0:0:0:0:0:0:0:1', '2021-07-02 16:31:49', 'CHROME9');
INSERT INTO `visitor` VALUES (172, '0:0:0:0:0:0:0:1', '2021-07-02 16:31:57', 'CHROME9');
INSERT INTO `visitor` VALUES (173, '0:0:0:0:0:0:0:1', '2021-07-02 16:35:21', 'CHROME9');
INSERT INTO `visitor` VALUES (174, '0:0:0:0:0:0:0:1', '2021-07-02 16:35:29', 'CHROME9');
INSERT INTO `visitor` VALUES (175, '0:0:0:0:0:0:0:1', '2021-07-02 16:35:34', 'CHROME9');
INSERT INTO `visitor` VALUES (176, '0:0:0:0:0:0:0:1', '2021-07-02 16:36:19', 'CHROME9');
INSERT INTO `visitor` VALUES (177, '0:0:0:0:0:0:0:1', '2021-07-02 16:36:23', 'CHROME9');
INSERT INTO `visitor` VALUES (178, '0:0:0:0:0:0:0:1', '2021-07-02 16:36:25', 'CHROME9');
INSERT INTO `visitor` VALUES (179, '0:0:0:0:0:0:0:1', '2021-07-03 10:37:19', 'CHROME9');
INSERT INTO `visitor` VALUES (180, '0:0:0:0:0:0:0:1', '2021-07-03 10:37:36', 'CHROME9');
INSERT INTO `visitor` VALUES (181, '0:0:0:0:0:0:0:1', '2021-07-03 10:37:59', 'CHROME9');
INSERT INTO `visitor` VALUES (182, '0:0:0:0:0:0:0:1', '2021-07-03 10:38:24', 'CHROME9');
INSERT INTO `visitor` VALUES (183, '0:0:0:0:0:0:0:1', '2021-07-03 10:38:27', 'CHROME9');
INSERT INTO `visitor` VALUES (184, '0:0:0:0:0:0:0:1', '2021-07-03 10:38:32', 'CHROME9');
INSERT INTO `visitor` VALUES (185, '0:0:0:0:0:0:0:1', '2021-07-03 11:00:46', 'CHROME9');
INSERT INTO `visitor` VALUES (186, '0:0:0:0:0:0:0:1', '2021-07-03 11:02:27', 'CHROME9');
INSERT INTO `visitor` VALUES (187, '0:0:0:0:0:0:0:1', '2021-07-03 11:13:40', 'CHROME9');
INSERT INTO `visitor` VALUES (188, '0:0:0:0:0:0:0:1', '2021-07-03 14:19:08', 'CHROME9');
INSERT INTO `visitor` VALUES (189, '0:0:0:0:0:0:0:1', '2021-07-03 14:20:00', 'CHROME9');
INSERT INTO `visitor` VALUES (190, '0:0:0:0:0:0:0:1', '2021-07-03 14:29:46', 'CHROME9');
INSERT INTO `visitor` VALUES (191, '0:0:0:0:0:0:0:1', '2021-07-03 14:38:59', 'CHROME9');
INSERT INTO `visitor` VALUES (192, '0:0:0:0:0:0:0:1', '2021-07-03 14:47:44', 'CHROME9');
INSERT INTO `visitor` VALUES (193, '0:0:0:0:0:0:0:1', '2021-07-03 14:48:19', 'CHROME9');
INSERT INTO `visitor` VALUES (194, '0:0:0:0:0:0:0:1', '2021-07-03 14:49:36', 'CHROME9');
INSERT INTO `visitor` VALUES (195, '0:0:0:0:0:0:0:1', '2021-07-03 14:50:08', 'CHROME9');
INSERT INTO `visitor` VALUES (196, '0:0:0:0:0:0:0:1', '2021-07-03 15:28:07', 'CHROME9');
INSERT INTO `visitor` VALUES (197, '0:0:0:0:0:0:0:1', '2021-07-03 15:28:12', 'CHROME9');
INSERT INTO `visitor` VALUES (198, '0:0:0:0:0:0:0:1', '2021-07-03 15:28:14', 'CHROME9');
INSERT INTO `visitor` VALUES (199, '0:0:0:0:0:0:0:1', '2021-07-03 15:31:09', 'CHROME9');
INSERT INTO `visitor` VALUES (200, '0:0:0:0:0:0:0:1', '2021-07-03 15:31:11', 'CHROME9');
INSERT INTO `visitor` VALUES (201, '0:0:0:0:0:0:0:1', '2021-07-03 15:31:20', 'CHROME9');
INSERT INTO `visitor` VALUES (202, '0:0:0:0:0:0:0:1', '2021-07-03 15:31:28', 'CHROME9');
INSERT INTO `visitor` VALUES (203, '0:0:0:0:0:0:0:1', '2021-07-03 15:31:31', 'CHROME9');
INSERT INTO `visitor` VALUES (204, '0:0:0:0:0:0:0:1', '2021-07-03 15:31:40', 'CHROME9');
INSERT INTO `visitor` VALUES (205, '0:0:0:0:0:0:0:1', '2021-07-03 15:31:44', 'CHROME9');
INSERT INTO `visitor` VALUES (206, '0:0:0:0:0:0:0:1', '2021-07-03 15:31:53', 'CHROME9');
INSERT INTO `visitor` VALUES (207, '0:0:0:0:0:0:0:1', '2021-07-03 15:32:03', 'CHROME9');
INSERT INTO `visitor` VALUES (208, '0:0:0:0:0:0:0:1', '2021-07-03 15:32:09', 'CHROME9');
INSERT INTO `visitor` VALUES (209, '0:0:0:0:0:0:0:1', '2021-07-03 15:32:18', 'CHROME9');
INSERT INTO `visitor` VALUES (210, '0:0:0:0:0:0:0:1', '2021-07-03 15:32:30', 'CHROME9');
INSERT INTO `visitor` VALUES (211, '0:0:0:0:0:0:0:1', '2021-07-03 15:32:39', 'CHROME9');
INSERT INTO `visitor` VALUES (212, '0:0:0:0:0:0:0:1', '2021-07-03 15:32:46', 'CHROME9');
INSERT INTO `visitor` VALUES (213, '0:0:0:0:0:0:0:1', '2021-07-03 15:32:55', 'CHROME9');
INSERT INTO `visitor` VALUES (214, '0:0:0:0:0:0:0:1', '2021-07-03 15:33:04', 'CHROME9');
INSERT INTO `visitor` VALUES (215, '0:0:0:0:0:0:0:1', '2021-07-03 15:33:14', 'CHROME9');
INSERT INTO `visitor` VALUES (216, '0:0:0:0:0:0:0:1', '2021-07-03 15:37:32', 'CHROME9');
INSERT INTO `visitor` VALUES (217, '0:0:0:0:0:0:0:1', '2021-07-03 15:37:42', 'CHROME9');
INSERT INTO `visitor` VALUES (218, '0:0:0:0:0:0:0:1', '2021-07-03 15:39:37', 'CHROME9');
INSERT INTO `visitor` VALUES (219, '0:0:0:0:0:0:0:1', '2021-07-03 15:39:39', 'CHROME9');
INSERT INTO `visitor` VALUES (220, '0:0:0:0:0:0:0:1', '2021-07-03 15:40:04', 'CHROME9');
INSERT INTO `visitor` VALUES (221, '0:0:0:0:0:0:0:1', '2021-07-03 15:44:17', 'CHROME9');
INSERT INTO `visitor` VALUES (222, '0:0:0:0:0:0:0:1', '2021-07-03 15:44:31', 'CHROME9');
INSERT INTO `visitor` VALUES (223, '0:0:0:0:0:0:0:1', '2021-07-03 15:46:54', 'CHROME9');
INSERT INTO `visitor` VALUES (224, '0:0:0:0:0:0:0:1', '2021-07-03 15:46:57', 'CHROME9');
INSERT INTO `visitor` VALUES (225, '0:0:0:0:0:0:0:1', '2021-07-03 15:55:01', 'CHROME9');
INSERT INTO `visitor` VALUES (226, '0:0:0:0:0:0:0:1', '2021-07-03 15:55:05', 'CHROME9');
INSERT INTO `visitor` VALUES (227, '0:0:0:0:0:0:0:1', '2021-07-03 15:55:34', 'CHROME9');
INSERT INTO `visitor` VALUES (228, '0:0:0:0:0:0:0:1', '2021-07-03 15:55:42', 'CHROME9');
INSERT INTO `visitor` VALUES (229, '0:0:0:0:0:0:0:1', '2021-07-03 15:56:15', 'CHROME9');
INSERT INTO `visitor` VALUES (230, '0:0:0:0:0:0:0:1', '2021-07-03 15:56:23', 'CHROME9');
INSERT INTO `visitor` VALUES (231, '0:0:0:0:0:0:0:1', '2021-07-03 15:56:36', 'CHROME9');
INSERT INTO `visitor` VALUES (232, '0:0:0:0:0:0:0:1', '2021-07-03 15:57:17', 'CHROME9');
INSERT INTO `visitor` VALUES (233, '0:0:0:0:0:0:0:1', '2021-07-03 15:57:41', 'CHROME9');
INSERT INTO `visitor` VALUES (234, '0:0:0:0:0:0:0:1', '2021-07-03 15:57:51', 'CHROME9');
INSERT INTO `visitor` VALUES (235, '0:0:0:0:0:0:0:1', '2021-07-03 15:58:02', 'CHROME9');
INSERT INTO `visitor` VALUES (236, '0:0:0:0:0:0:0:1', '2021-07-03 15:58:28', 'CHROME9');
INSERT INTO `visitor` VALUES (237, '0:0:0:0:0:0:0:1', '2021-07-03 15:58:36', 'CHROME9');
INSERT INTO `visitor` VALUES (238, '0:0:0:0:0:0:0:1', '2021-07-03 16:01:54', 'CHROME9');
INSERT INTO `visitor` VALUES (239, '0:0:0:0:0:0:0:1', '2021-07-03 16:23:55', 'CHROME9');
INSERT INTO `visitor` VALUES (240, '0:0:0:0:0:0:0:1', '2021-07-03 16:24:07', 'CHROME9');
INSERT INTO `visitor` VALUES (241, '0:0:0:0:0:0:0:1', '2021-07-03 16:25:19', 'CHROME9');
INSERT INTO `visitor` VALUES (242, '0:0:0:0:0:0:0:1', '2021-07-03 16:25:49', 'CHROME9');
INSERT INTO `visitor` VALUES (243, '0:0:0:0:0:0:0:1', '2021-07-03 16:36:03', 'CHROME9');
INSERT INTO `visitor` VALUES (244, '0:0:0:0:0:0:0:1', '2021-07-03 16:36:14', 'CHROME9');
INSERT INTO `visitor` VALUES (245, '0:0:0:0:0:0:0:1', '2021-07-03 16:36:31', 'CHROME9');
INSERT INTO `visitor` VALUES (246, '0:0:0:0:0:0:0:1', '2021-07-03 16:36:48', 'CHROME9');
INSERT INTO `visitor` VALUES (247, '0:0:0:0:0:0:0:1', '2021-07-03 16:37:47', 'CHROME9');
INSERT INTO `visitor` VALUES (248, '0:0:0:0:0:0:0:1', '2021-07-03 16:41:07', 'CHROME9');
INSERT INTO `visitor` VALUES (249, '0:0:0:0:0:0:0:1', '2021-07-03 16:41:19', 'CHROME9');
INSERT INTO `visitor` VALUES (250, '0:0:0:0:0:0:0:1', '2021-07-03 16:51:08', 'CHROME9');
INSERT INTO `visitor` VALUES (251, '0:0:0:0:0:0:0:1', '2021-07-03 16:51:10', 'CHROME9');
INSERT INTO `visitor` VALUES (252, '0:0:0:0:0:0:0:1', '2021-07-03 16:53:16', 'CHROME9');
INSERT INTO `visitor` VALUES (253, '0:0:0:0:0:0:0:1', '2021-07-03 16:53:21', 'CHROME9');
INSERT INTO `visitor` VALUES (254, '0:0:0:0:0:0:0:1', '2021-07-03 16:54:51', 'CHROME9');
INSERT INTO `visitor` VALUES (255, '0:0:0:0:0:0:0:1', '2021-07-03 16:54:54', 'CHROME9');
INSERT INTO `visitor` VALUES (256, '0:0:0:0:0:0:0:1', '2021-07-03 16:55:26', 'CHROME9');
INSERT INTO `visitor` VALUES (257, '0:0:0:0:0:0:0:1', '2021-07-03 16:55:34', 'CHROME9');
INSERT INTO `visitor` VALUES (258, '0:0:0:0:0:0:0:1', '2021-07-03 16:55:41', 'CHROME9');
INSERT INTO `visitor` VALUES (259, '0:0:0:0:0:0:0:1', '2021-07-03 16:57:43', 'CHROME9');
INSERT INTO `visitor` VALUES (260, '0:0:0:0:0:0:0:1', '2021-07-03 16:57:55', 'CHROME9');
INSERT INTO `visitor` VALUES (261, '0:0:0:0:0:0:0:1', '2021-07-03 17:01:04', 'CHROME9');
INSERT INTO `visitor` VALUES (262, '0:0:0:0:0:0:0:1', '2021-07-03 17:07:01', 'CHROME9');
INSERT INTO `visitor` VALUES (263, '0:0:0:0:0:0:0:1', '2021-07-03 17:09:05', 'CHROME9');
INSERT INTO `visitor` VALUES (264, '0:0:0:0:0:0:0:1', '2021-07-03 17:09:41', 'CHROME9');
INSERT INTO `visitor` VALUES (265, '0:0:0:0:0:0:0:1', '2021-07-03 17:09:47', 'CHROME9');
INSERT INTO `visitor` VALUES (266, '0:0:0:0:0:0:0:1', '2021-07-03 17:09:55', 'CHROME9');
INSERT INTO `visitor` VALUES (267, '0:0:0:0:0:0:0:1', '2021-07-03 17:10:06', 'CHROME9');
INSERT INTO `visitor` VALUES (268, '0:0:0:0:0:0:0:1', '2021-07-03 17:10:14', 'CHROME9');

SET FOREIGN_KEY_CHECKS = 1;
