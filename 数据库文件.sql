/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50562
Source Host           : localhost:3306
Source Database       : online_library

Target Server Type    : MYSQL
Target Server Version : 50562
File Encoding         : 65001

Date: 2020-06-10 22:35:04
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `admins`
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `realname` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin` (`admin`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO admins VALUES ('1', '181164000', '123456', '努力奋斗', '18037470495', '1177701069@qq.com', '焦作市');
INSERT INTO admins VALUES ('2', '181164001', '123456', 'deku', '13721310417', '1876549040', '洛阳市');

-- ----------------------------
-- Table structure for `books`
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `intro` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `category` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO books VALUES ('1', '红楼梦', '曹雪芹', '《红楼梦》是一部百科全书式的长篇小说。以宝黛爱情悲剧为主线，以四大家族的荣辱兴衰为背景，描绘出18世纪中国封建社会的方方面面，以及封建专制下新兴资本主义民主思想的萌动。结构宏大、情节委婉、细节精致，人物形象栩栩如生，声口毕现，堪称中国古代小说中的经 典。', '8', 'literature');
INSERT INTO books VALUES ('2', '百年孤独', '马尔克斯', '《百年孤独》是魔幻现实主义文学的代表作，描写了布恩迪亚家族七代人的传奇故事，以及加勒比海沿岸小镇马孔多的百年兴衰，反映了拉丁美洲一个世纪以来风云变幻的历史。', '8', 'literature');
INSERT INTO books VALUES ('3', '飘', '米切尔', '小说中的故事发生在1861年美国南北战争前夕。生活在南方的少女郝思嘉从小深受南方文化传统的熏陶，可在她的血液里却流淌着野性的叛逆因素。随着战火的蔓廷和生活环境的恶化，郝思嘉的叛逆个性越来越丰满，越鲜明，在一系列的的挫折中她改造了自我，改变了个人甚至整个家族的命运，成为时代时势造就的新女性的形象。', '9', 'literature');
INSERT INTO books VALUES ('4', '骆驼祥子', '老舍', '《骆驼祥子》是老舍用同情的笔触描绘的一幕悲剧：二十年代的北京，一个勤劳、壮实的底层社会小人物怀着发家、奋斗的美好梦想，却最终为黑暗的暴风雨所吞噬。', '8', 'literature');
INSERT INTO books VALUES ('5', '三国演义', '罗贯中', '《三国演义》又名《三国志演义》、《三国志通俗演义》，是我国小说史上最著名最杰出的长篇章回体历史小说。 ', '10', 'iterature');
INSERT INTO books VALUES ('6', '安徒生童话故事集', '安徒生', '“为了争取未来的一代”，安徒生决定给孩子写童话，出版了《讲给孩子们听的故事》。此后数年，每年圣诞节都出版一本这样的童话集。其后又不断发表新作，直到1872年因患癌症才逐渐搁笔。近40年间，共计写了童话168篇。', '10', 'literature');
INSERT INTO books VALUES ('7', '月亮和六便士', '毛姆', '一个英国证券交易所的经纪人，本已有牢靠的职业和地位、美满的家庭，但却迷恋上绘画，像“被魔鬼附了体”，突然弃家出走，到巴黎去追求绘画的理想。', '10', 'literature');
INSERT INTO books VALUES ('8', '基督山伯爵', '大仲马', '小说以法国波旁王朝和七月王朝两大时期为背景，描写了一个报恩复仇的故事。', '10', 'literature');
INSERT INTO books VALUES ('9', '老人与海', '海明威', '本书讲述了一个渔夫连续80多天没补到鱼，但最终成功捕获并归来。', '10', 'iterature');
INSERT INTO books VALUES ('10', '简爱', '勃朗特', '《简爱》是英国女作家夏洛蒂·勃朗特的代表作品。女主人公简爱是一个追赶求平等与自主的知识女性形象，小说以其感人的对于一位“灰姑娘式”人物奋斗史的刻划取胜，《简爱》也是女性文学的代表作品。', '9', 'literature');
INSERT INTO books VALUES ('11', '如何高效率学习', '斯科特', '1年完成麻省理工4年33门课程的整体性学习法', '6', 'science');
INSERT INTO books VALUES ('12', '科技之巅', '麻省理工科技', '50大全球突破性技术深度刨析', '10', 'science');
INSERT INTO books VALUES ('13', '万万没想到', '万维钢', '用理工思维理解世界', '10', 'science');
INSERT INTO books VALUES ('14', '科技之巅2', '麻省理工科技', '2017年10大全球突破性技术深度剖析', '10', 'science');
INSERT INTO books VALUES ('15', '高难度沟通', '杰伊', '麻省理工高人气沟通课', '10', 'science');
INSERT INTO books VALUES ('16', '设计方法与策略', '代尔夫特理工大学', '代尔夫特设计指南', '10', 'science');
INSERT INTO books VALUES ('17', '学术英语', '蔡基刚', '理工', '10', 'science');
INSERT INTO books VALUES ('18', '理工大风流往事', '华夏出版社', '理工大的风流往事', '10', 'science');
INSERT INTO books VALUES ('19', '未来版图', '麻省理工科技', '全球聪明公司的科技创新趋势和商业化路径', '10', 'science');
INSERT INTO books VALUES ('20', '公共策略工具', '彼得斯', '对公共管理工具的评价', '10', 'science');
INSERT INTO books VALUES ('21', '明朝那些事儿', '当年明月', '描写了大明王朝的创始及灭亡，讲述了许多豪杰英雄', '9', 'history');
INSERT INTO books VALUES ('22', '康熙大帝', '二月河', '康熙大帝一朝的盛世太平', '9', 'history');
INSERT INTO books VALUES ('23', '雍正皇帝', '二月河', '从雍正即位以来风风雨雨的艰难险阻，雍正帝良苦用心，鞠躬尽瘁', '10', 'history');
INSERT INTO books VALUES ('24', '史记', '司马迁', '史家之绝唱，无韵之离骚', '10', 'history');
INSERT INTO books VALUES ('25', '资治通鉴', '司马光', '见微知著，编年体通史巨著', '10', 'history');
INSERT INTO books VALUES ('26', '小王子', '圣埃克苏佩里', '小王子是一个超凡脱俗的仙童，他住在一颗只比他大一丁点儿的小行星上。', '10', 'philo');
INSERT INTO books VALUES ('27', '被讨厌的勇气', '岸见一郎', '“自我启发之父”阿德勒的哲学课', '10', 'philo');
INSERT INTO books VALUES ('28', '人生的智慧', '叔本华', '他于1850年写了《附录和补遗》一书，《人生的智慧》是该书中的一部分。', '10', 'philo');
INSERT INTO books VALUES ('29', '苏菲的世界', '乔斯坦', '这本书以小说的形式，通过一名哲学导师向一个叫苏菲的女孩传授哲学知识的经过，揭示了西方哲学发展的历程。', '10', 'philo');
INSERT INTO books VALUES ('30', '根各国人都聊得来', '刘易斯', '三个月外语流利术', '8', 'foreign');
INSERT INTO books VALUES ('31', '365天英语口语大全', '耿小辉', '昂秀外语', '9', 'foreign');
INSERT INTO books VALUES ('32', '政治学', '亚里士多德', '《政治学》是作者亚里士多德的“关于政体研究的专著”，具有多方面的学术价值，对于了解当时希腊社会的状况，了解古希腊人的政治、法律、伦理、教育思想', '10', 'political');
INSERT INTO books VALUES ('33', '毛泽东选集', '毛泽东', '《毛泽东选集》(第1卷)包括了毛泽东同志在中国革命各个时期中的重要著作。', '10', 'political');
INSERT INTO books VALUES ('34', '邓小平时代', '傅高义', '邓小平深刻影响了中国历史和世界历史的走向，也改变了每一当代中国人的命运。', '10', 'political');
INSERT INTO books VALUES ('35', 'C语言程序设计', '谭浩强', '最经典的C语言教材', '10', 'program');
INSERT INTO books VALUES ('36', 'Java程序设计', '李兴华', '自1995年Java诞生以来，迅速风靡全球', '10', 'program');
INSERT INTO books VALUES ('37', 'python编程', '马瑟斯', '从入门到实践', '10', 'program');
INSERT INTO books VALUES ('38', '剑指Offer', '何海涛', '名企业面试官精讲编程题', '10', 'program');
INSERT INTO books VALUES ('39', '游戏之旅', '云风', '我的编程感悟', '10', 'program');
INSERT INTO books VALUES ('40', '平凡的世界', '路遥', '暂未介绍', '19', 'literature');
INSERT INTO books VALUES ('45', '活着', '余华', '暂未介绍', '20', 'literature');

-- ----------------------------
-- Table structure for `borrows`
-- ----------------------------
DROP TABLE IF EXISTS `borrows`;
CREATE TABLE `borrows` (
  `s_id` int(11) NOT NULL,
  `b_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`s_id`,`b_id`,`amount`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of borrows
-- ----------------------------
INSERT INTO borrows VALUES ('4', '3', '1');
INSERT INTO borrows VALUES ('4', '11', '4');
INSERT INTO borrows VALUES ('4', '21', '1');
INSERT INTO borrows VALUES ('4', '22', '1');
INSERT INTO borrows VALUES ('4', '30', '2');
INSERT INTO borrows VALUES ('13', '1', '1');
INSERT INTO borrows VALUES ('13', '2', '1');
INSERT INTO borrows VALUES ('13', '4', '1');
INSERT INTO borrows VALUES ('13', '10', '1');
INSERT INTO borrows VALUES ('13', '40', '1');
INSERT INTO borrows VALUES ('14', '1', '1');
INSERT INTO borrows VALUES ('14', '2', '1');
INSERT INTO borrows VALUES ('14', '4', '1');
INSERT INTO borrows VALUES ('14', '31', '1');

-- ----------------------------
-- Table structure for `students`
-- ----------------------------
DROP TABLE IF EXISTS `students`;
CREATE TABLE `students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `realname` varchar(255) NOT NULL,
  `grade` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user` (`user`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of students
-- ----------------------------
INSERT INTO students VALUES ('4', '181164276', 'gaowei', '高立卫', '2018', '18031234895', '1607701069@qq.com', '河南省焦作市', '9');
INSERT INTO students VALUES ('12', '987654321', 'gaowei', '高立卫', '2020', '18031234895', '1607701069@qq.com', '中国', '0');
INSERT INTO students VALUES ('13', '181164304', 'cz5258001', '陈东阳', '2020', '18337391181', '2510582806@qq.com', '中国', '5');
INSERT INTO students VALUES ('14', '181164269', 'Jylmmnds6', '孟维昊', '2018', '18939380626', 'cordisdie1083@163.com', '中国', '4');
INSERT INTO students VALUES ('15', '181164278', 'gaowei', '高哥', '2018', '18039170895', '1607701069@qq.com', '中国', '0');
INSERT INTO students VALUES ('16', '181164279', 'gaowei', '高哥', '2019', '18039170895', '1607701069@qq.com', '中国', '0');
