/*
SQLyog Professional v12.08 (32 bit)
MySQL - 5.5.49 : Database - jtap
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`jtap` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `jtap`;

/*Table structure for table `course` */

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '课程表',
  `name` varchar(20) DEFAULT NULL COMMENT '课时名称',
  `unit` int(11) DEFAULT NULL COMMENT '章节编号',
  `termId` int(11) DEFAULT NULL COMMENT '学期id，关联term',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `course` */

insert  into `course`(`id`,`name`,`unit`,`termId`) values (1,'java入门与Helloworld',1,1),(2,'java基本变量详解',2,1),(3,'java语言基础',3,1),(4,'流程控制',4,1),(5,'字符串',5,1),(6,'第六章 数组',6,1);

/*Table structure for table `course_question` */

DROP TABLE IF EXISTS `course_question`;

CREATE TABLE `course_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '课时-问题关联表',
  `courseId` int(11) DEFAULT NULL,
  `questionId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `course_question` */

insert  into `course_question`(`id`,`courseId`,`questionId`) values (3,2,6),(4,2,10),(5,6,12),(7,4,16),(12,6,11),(20,1,1),(21,1,3);

/*Table structure for table `course_source` */

DROP TABLE IF EXISTS `course_source`;

CREATE TABLE `course_source` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courseId` int(11) DEFAULT NULL,
  `sourceId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

/*Data for the table `course_source` */

insert  into `course_source`(`id`,`courseId`,`sourceId`) values (4,2,4),(7,2,7),(9,3,9),(10,4,10),(11,6,11),(12,6,12),(24,2,24),(29,1,29),(30,1,30),(31,1,31),(32,1,32);

/*Table structure for table `discussion` */

DROP TABLE IF EXISTS `discussion`;

CREATE TABLE `discussion` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '讨论表',
  `topic` varchar(50) DEFAULT NULL COMMENT '主题名称',
  `topic_id` int(30) DEFAULT NULL COMMENT '讨论帖子id,关联自身表，若是0代表是主题',
  `reply_id` int(11) DEFAULT NULL COMMENT '被回复者Id,关联user',
  `publish_id` int(11) DEFAULT NULL COMMENT '发布者用户Id，关联user表',
  `time` datetime DEFAULT NULL COMMENT '创建帖子时间',
  `content` varchar(20000) DEFAULT NULL COMMENT '内容',
  `teacher_join` int(11) DEFAULT NULL COMMENT '老师是否参与讨论，1代表参与',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

/*Data for the table `discussion` */

insert  into `discussion`(`id`,`topic`,`topic_id`,`reply_id`,`publish_id`,`time`,`content`,`teacher_join`) values (1,'第一册发帖测试',0,NULL,2,'2019-01-30 20:30:23','<span style=\"font-weight: bold;\">第一册发帖测试内容1</span>',0),(2,'01号学生第二次',0,NULL,2,'2019-01-30 20:32:20','id:2,201401号学生第二次发帖测试，成功！',0),(3,'测试学生2提问',0,NULL,3,'2019-01-30 20:54:02','<span style=\"background-color: rgb(255, 0, 0);\">测试学生2提问一下测试萨迪克</span>',0),(4,'测试学生2 第二次提问',0,NULL,3,'2019-01-30 20:54:50','<ol><li>                                            </li></ol><table class=\"table table-bordered\"><tbody><tr><td>231 <br></td><td>123</td><td>123</td></tr></tbody></table><ol><li>ask解放了asd lkgj刷卡积分是否双方的三大发三大发<br></li></ol>',0),(5,'学生2',0,NULL,3,'2019-01-30 20:55:04','学生2 ： 上岛咖啡离开NSF了哪里呢拉萨你的阿德1',0),(6,'学生3测试',0,NULL,4,'2019-01-30 20:55:37','阿瑟东阿瑟东阿瑟东阿瑟东阿瑟东阿瑟东阿瑟东阿瑟东 <br>',0),(7,'测试学生3提问',0,NULL,4,'2019-01-30 20:56:25','<p>                                            撒旦撒旦阿瑟东阿瑟东啊实</p>撒旦阿瑟东阿瑟东啊实<br><p><br></p>',0),(8,'测试学生3第三次发布主题',0,NULL,4,'2019-01-30 20:56:43','23 阿德阿瑟东阿瑟东的发挥你 <br>',0),(9,'测试学生4',0,NULL,5,'2019-01-30 20:57:16','测试学生4',0),(10,'测试学生4提问',0,NULL,5,'2019-01-30 20:57:21','测试学生4测试学生4测试学生4',0),(11,'测试学生4测试学生4提问',0,NULL,5,'2019-01-30 20:57:30','测试学生4测试学生4提问测试学生4测试学生4提问测试学生4测试学生4提问',0),(12,'关于thymeleaf读取字符串自动转移的问题',0,NULL,3,'2019-01-30 22:11:42','未转义的文字<br><br>我们主页的最简单版本现在似乎已经准备就绪，但有一些我们没有想过的......如果我们有这样的消息怎么办？<br><br>home.welcome=Welcome to our &lt;b&gt;fantastic&lt;/b&gt; grocery store!<br><br><br><br>如果我们像以前一样执行此模板，我们将获得：<br><br>&nbsp;<br><br>&lt;p&gt;Welcome to our &amp;lt;b&amp;gt;fantastic&amp;lt;/b&amp;gt; grocery store!&lt;/p&gt;<br><br>这不完全符合我们的预期，因为我们的&lt;b&gt;标签已被转义，因此它将在浏览器中显示。<br><br>这是th：text属性的默认行为。如果我们希望Thymeleaf尊重我们的XHTML标签而不是逃避它们，我们将不得不使用不同的属性:( th:utext对于“非转义文本”）：<br><br>&nbsp;&nbsp;&nbsp; &lt;p th:utext=\"#{home.welcome}\"&gt;Welcome to our grocery store!&lt;/p&gt;<br>&nbsp;&nbsp;&nbsp; This will output our message just like we wanted it:<br>&nbsp;&nbsp;&nbsp; &lt;p&gt;Welcome to our &lt;b&gt;fantastic&lt;/b&gt; grocery store!&lt;/p&gt;<br><br>更多内容，请关注博主的github：<br><br>----------------------------------------------------------<br><br>如果解决了您的问题，请有烦，github多点star。 算是对本人的感谢，鼓励作者继续帮助大家：<br><br>更多多技术关注，请follow本人的gith， 多给一些star<br><br>https://github.com/kkman2008/<br>--------------------- <br>作者：kingmax54212008 <br>来源：CSDN <br>原文：https://blog.csdn.net/kingmax54212008/article/details/81459596 <br>版权声明：本文为博主原创文章，转载请附上博文链接！',0),(13,'【微服务架构】SpringCloud组件和概念介绍(一)',0,NULL,3,'2019-01-30 22:47:36','微服务英文名称Microservice，Microservice架构模式就是将整个Web应用组织为一系列小的Web服务。这些小的Web服务可以独立地编译及部署，并通过各自暴露的API接口相互通讯。它们彼此相互协作，作为一个整体为用户提供功能，却可以独立地进行扩。\r\n<p>&nbsp;</p>\r\n<p>&nbsp; 微服务架构需要的功能或使用场景</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; 1：我们把整个系统根据业务拆分成几个子系统。</p>\r\n<p><span class=\"Apple-tab-span\"> &nbsp;2：每个子系统可以部署多个应用，多个应用之间使用负载均衡。</span></p>\r\n<p><span class=\"Apple-tab-span\"> &nbsp;3：需要一个服务注册中心，所有的服务都在注册中心注册，负载均衡也是通过在注册中心注册的服务来使用一定策略来实现。</span></p>\r\n<p><span class=\"Apple-tab-span\"> &nbsp;4：所有的客户端都通过同一个网关地址访问后台的服务，通过路由配置，网关来判断一个URL请求由哪个服务处理。请求转发到服务上的时候也使用负载均衡。</span></p>\r\n<p><span class=\"Apple-tab-span\"> &nbsp;5：服务之间有时候也需要相互访问。例如有一个用户模块，其他服务在处理一些业务的时候，要获取用户服务的用户数据。</span></p>\r\n<p><span class=\"Apple-tab-span\"> &nbsp;6：需要一个断路器，及时处理服务调用时的超时和错误，防止由于其中一个服务的问题而导致整体系统的瘫痪。</span></p>\r\n<p><span class=\"Apple-tab-span\"> &nbsp;7：还需要一个监控功能，监控每个服务调用花费的时间等。</span></p>\r\n<p>&nbsp;&nbsp;</p>\r\n<p>&nbsp; 目前主流的微服务框架：Dubbo、 SpringCloud、thrift、Hessian等，目前国内的中小企业用的大多数都是Dubbo，SpringCloud估计很少，也许有些开发同学都没听说过。</p>',0),(14,NULL,1,2,3,'2019-01-30 23:08:31','2号测试学生回复！',0),(15,NULL,11,5,3,'2019-01-30 23:21:30','写的不错！',0),(16,NULL,12,3,2,'2019-01-30 23:22:05','帖子写的不错！！很有感悟！',0),(17,NULL,13,3,2,'2019-01-30 23:23:12','<p><span style=\"background-color: rgb(255, 0, 0);\"><span style=\"font-weight: bold;\">在补充几点：</span></span></p><p><span style=\"background-color: rgb(255, 0, 0);\"><span style=\"font-weight: bold;\"><br></span></span></p><p><br><span style=\"background-color: rgb(255, 0, 0);\"><span style=\"font-weight: bold;\"><span style=\"background-color: rgb(255, 255, 255);\">springCloud是基于SpringBoot的一整套实现微服务的框架。他提供了微服务开发所需的配置管理、服务发现、断路器、智能路由、微代理、控制总线、全局锁、决策竞选、分布式会话和集群状态管理等组件。最重要的是，</span>\r\n</span></span></p><p>&nbsp; 跟spring boot框架一起使用的话，会让你开发微服务架构的云服务非常好的方便。</p>\r\n<p>&nbsp;&nbsp;</p>\r\n<p>&nbsp; SpringBoot旨在简化创建产品级的 Spring 应用和服务，简化了配置文件，使用嵌入式web服务器，含有诸多开箱即用微服务功能</p>',0),(18,NULL,13,3,2,'2019-01-30 23:23:29','spring cloud子项目包括：\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;Spring Cloud Config：配置管理开发工具包，可以让你把配置放到远程服务器，目前支持本地存储、Git以及Subversion。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;Spring Cloud Bus：事件、消息总线，用于在集群（例如，配置变化事件）中传播状态变化，可与Spring Cloud Config联合实现热部署。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;Spring Cloud Netflix：针对多种Netflix组件提供的开发工具包，其中包括Eureka、Hystrix、Zuul、Archaius等。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;Netflix Eureka：云端负载均衡，一个基于 REST 的服务，用于定位服务，以实现云端的负载均衡和中间层服务器的故障转移。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;Netflix Hystrix：容错管理工具，旨在通过控制服务和第三方库的节点,从而对延迟和故障提供更强大的容错能力。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp; Netflix Zuul：边缘服务工具，是提供动态路由，监控，弹性，安全等的边缘服务。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;Netflix Archaius：配置管理API，包含一系列配置管理API，提供动态类型化属性、线程安全配置操作、轮询框架、回调机制等功能。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;Spring Cloud for Cloud Foundry：通过Oauth2协议绑定服务到CloudFoundry，CloudFoundry是VMware推出的开源PaaS云平台。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;Spring Cloud Sleuth：日志收集工具包，封装了Dapper,Zipkin和HTrace操作。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp; Spring Cloud Data Flow：大数据操作工具，通过命令行方式操作数据流。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;Spring Cloud Security：安全工具包，为你的应用程序添加安全控制，主要是指OAuth2。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;Spring Cloud Consul：封装了Consul操作，consul是一个服务发现与配置工具，与Docker容器可以无缝集成。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;Spring Cloud Zookeeper：操作Zookeeper的工具包，用于使用zookeeper方式的服务注册和发现。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp; Spring Cloud Stream：数据流操作开发包，封装了与Redis,Rabbit、Kafka等发送接收消息。</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp; Spring Cloud CLI：基于 Spring Boot CLI，可以让你以命令行方式快速建立云组件。</p>',0),(19,'SpringBoot了解',0,NULL,9,'2019-01-30 23:34:24','<span style=\"font-weight: bold;\"> <span style=\"background-color: rgb(255, 0, 0);\">Spring Boot让我们的Spring应用变的更轻量化。比如：你可以仅仅依靠一个Java类来运行一个Spring引用。你也可以打包你的应用为jar并通过使用java -jar来运行你的Spring Web应用。</span></span><span style=\"background-color: rgb(255, 0, 0);\">\r\n</span><p><span style=\"background-color: rgb(255, 0, 0);\"><span style=\"font-weight: bold;\"><span class=\"Apple-tab-span\"> 由于SpringCloud依赖SpringBoot，所以在学习SpringCloud框架之前需要了解下SpringBoot。</span></span></span></p><span style=\"background-color: rgb(255, 0, 0);\">\r\n</span><p><span style=\"background-color: rgb(255, 0, 0);\"><span style=\"font-weight: bold;\"><span class=\"Apple-tab-span\"> SpringBoot的主要优点：</span></span></span></p>\r\n<p><span style=\"font-weight: bold;\"><span class=\"Apple-tab-span\"> &nbsp;&nbsp;1:为所有Spring开发者更快的入门</span></span></p>\r\n<p><span style=\"font-weight: bold;\"><span class=\"Apple-tab-span\"> &nbsp;&nbsp;2:开箱即用，提供各种默认配置来简化项目配置</span></span></p>\r\n<p><span style=\"font-weight: bold;\"><span class=\"Apple-tab-span\"> &nbsp;&nbsp;3:内嵌式容器简化Web项目</span></span></p>\r\n<p><span style=\"font-weight: bold;\"><span class=\"Apple-tab-span\"> &nbsp;&nbsp;4:没有冗余代码生成和XML配置的要求</span></span></p>\r\n<p><span style=\"font-weight: bold;\"><span class=\"Apple-tab-span\"> &nbsp;&nbsp;</span></span></p>\r\n<p><span style=\"font-weight: bold;\"><span class=\"Apple-tab-span\"> 通过一个helloWorld了解下 地址：<a title=\"http://start.spring.io/\" href=\"http://start.spring.io/\" target=\"_blank\">http://start.spring.io/</a></span></span></p>\r\n<p><span style=\"font-weight: bold;\">&nbsp;</span></p>\r\n<p><span style=\"font-weight: bold;\">&nbsp; &nbsp; &nbsp; &nbsp;本文主要介绍了相关概念的东西实际操作和应用在后面的文中慢慢介绍</span></p>',0),(20,NULL,11,5,9,'2019-01-30 23:34:38','很好！',0),(21,'bootstrap组件',0,NULL,2,'2019-01-31 16:10:56','<div class=\"bs-callout bs-callout-info\" id=\"callout-pagination-label\">\r\n    <h4>Labelling the pagination component</h4>\r\n    <p>The pagination component should be wrapped in a <code>&lt;nav&gt;</code>\r\n element to identify it as a navigation section to screen readers and \r\nother assistive technologies. In addition, as a page is likely to have \r\nmore than one such navigation section already (such as the primary \r\nnavigation in the header, or a sidebar navigation), it is advisable to \r\nprovide a descriptive <code>aria-label</code> for the <code>&lt;nav&gt;</code>\r\n which reflects its purpose. For example, if the pagination component is\r\n used to navigate between a set of search results, an appropriate label \r\ncould be <code>aria-label=\"Search results pages\"</code>.</p>\r\n  </div>',0),(22,NULL,1,2,1,'2019-01-31 16:41:48','<p>我们建议将 active 或 disabled 状态的链接（即 <code>&lt;a&gt;</code> 标签）替换为 <code>&lt;span&gt;</code> 标签，或者在向前/向后的箭头处省略<code>&lt;a&gt;</code> 标签，这样就可以让其保持需要的样式而不能被点击。</p>\r\n<div class=\"zero-clipboard\"><span class=\"btn-clipboard\">Copy</span></div><figure class=\"highlight\"><pre><code class=\"language-html\" data-lang=\"html\"><span class=\"nt\">&lt;nav</span> <span class=\"na\">aria-label=</span><span class=\"s\">\"...\"</span><span class=\"nt\">&gt;</span>\r\n  <span class=\"nt\">&lt;ul</span> <span class=\"na\">class=</span><span class=\"s\">\"pagination\"</span><span class=\"nt\">&gt;</span>\r\n    <span class=\"nt\">&lt;li</span> <span class=\"na\">class=</span><span class=\"s\">\"disabled\"</span><span class=\"nt\">&gt;</span>\r\n      <span class=\"nt\">&lt;span&gt;</span>\r\n        <span class=\"nt\">&lt;span</span> <span class=\"na\">aria-hidden=</span><span class=\"s\">\"true\"</span><span class=\"nt\">&gt;</span><span class=\"ni\">&amp;laquo;</span><span class=\"nt\">&lt;/span&gt;</span>\r\n      <span class=\"nt\">&lt;/span&gt;</span>\r\n    <span class=\"nt\">&lt;/li&gt;</span>\r\n    <span class=\"nt\">&lt;li</span> <span class=\"na\">class=</span><span class=\"s\">\"active\"</span><span class=\"nt\">&gt;</span>\r\n      <span class=\"nt\">&lt;span&gt;</span>1 <span class=\"nt\">&lt;span</span> <span class=\"na\">class=</span><span class=\"s\">\"sr-only\"</span><span class=\"nt\">&gt;</span>(current)<span class=\"nt\">&lt;/span&gt;&lt;/span&gt;</span>\r\n    <span class=\"nt\">&lt;/li&gt;</span>\r\n    ...\r\n  <span class=\"nt\">&lt;/ul&gt;</span>\r\n<span class=\"nt\">&lt;/nav&gt;</span></code></pre></figure>\r\n<h3 id=\"尺寸\">尺寸</h3>\r\n  <p>想要更小或更大的分页？<code>.pagination-lg</code> 或 <code>.pagination-sm</code> 类提供了额外可供选择的尺寸。</p>\r\n  <div class=\"bs-example\" data-example-id=\"pagination-sizing\">\r\n    <nav aria-label=\"...\">\r\n      <ul class=\"pagination pagination-lg\"><li><a href=\"https://v3.bootcss.com/components/#\" aria-label=\"Previous\"><span aria-hidden=\"true\">«</span></a></li><li><a href=\"https://v3.bootcss.com/components/#\">1</a></li><li><a href=\"https://v3.bootcss.com/components/#\">2</a></li><li><a href=\"https://v3.bootcss.com/components/#\">3</a></li><li><a href=\"https://v3.bootcss.com/components/#\">4</a></li><li><a href=\"https://v3.bootcss.com/components/#\">5</a></li><li><a href=\"https://v3.bootcss.com/components/#\" aria-label=\"Next\"><span aria-hidden=\"true\">»</span></a></li></ul>\r\n    </nav>\r\n    <nav aria-label=\"...\">\r\n      <ul class=\"pagination\"><li><a href=\"https://v3.bootcss.com/components/#\" aria-label=\"Previous\"><span aria-hidden=\"true\">«</span></a></li><li><a href=\"https://v3.bootcss.com/components/#\">1</a></li><li><a href=\"https://v3.bootcss.com/components/#\">2</a></li><li><a href=\"https://v3.bootcss.com/components/#\">3</a></li><li><a href=\"https://v3.bootcss.com/components/#\">4</a></li><li><a href=\"https://v3.bootcss.com/components/#\">5</a></li><li><a href=\"https://v3.bootcss.com/components/#\" aria-label=\"Next\"><span aria-hidden=\"true\">»</span></a></li></ul>\r\n    </nav>\r\n    <nav aria-label=\"...\">\r\n      <ul class=\"pagination pagination-sm\"><li><a href=\"https://v3.bootcss.com/components/#\" aria-label=\"Previous\"><span aria-hidden=\"true\">«</span></a></li><li><a href=\"https://v3.bootcss.com/components/#\">1</a></li><li><a href=\"https://v3.bootcss.com/components/#\">2</a></li><li><a href=\"https://v3.bootcss.com/components/#\">3</a></li><li><a href=\"https://v3.bootcss.com/components/#\">4</a></li><li><a href=\"https://v3.bootcss.com/components/#\">5</a></li><li><a href=\"https://v3.bootcss.com/components/#\" aria-label=\"Next\"><span aria-hidden=\"true\">»</span></a></li></ul>\r\n    </nav>\r\n  </div>\r\n<div class=\"zero-clipboard\"><span class=\"btn-clipboard\">Copy</span></div><figure class=\"highlight\"><pre><code class=\"language-html\" data-lang=\"html\"><span class=\"nt\">&lt;nav</span> <span class=\"na\">aria-label=</span><span class=\"s\">\"...\"</span><span class=\"nt\">&gt;&lt;ul</span> <span class=\"na\">class=</span><span class=\"s\">\"pagination pagination-lg\"</span><span class=\"nt\">&gt;</span>...<span class=\"nt\">&lt;/ul&gt;&lt;/nav&gt;</span>\r\n<span class=\"nt\">&lt;nav</span> <span class=\"na\">aria-label=</span><span class=\"s\">\"...\"</span><span class=\"nt\">&gt;&lt;ul</span> <span class=\"na\">class=</span><span class=\"s\">\"pagination\"</span><span class=\"nt\">&gt;</span>...<span class=\"nt\">&lt;/ul&gt;&lt;/nav&gt;</span>\r\n<span class=\"nt\">&lt;nav</span> <span class=\"na\">aria-label=</span><span class=\"s\">\"...\"</span><span class=\"nt\">&gt;&lt;ul</span> <span class=\"na\">class=</span><span class=\"s\">\"pagination pagination-sm\"</span><span class=\"nt\">&gt;</span>...<span class=\"nt\">&lt;/ul&gt;&lt;/nav&gt;</span></code></pre></figure>',0),(23,NULL,2,2,1,'2019-01-31 16:43:40','<div class=\"u-learn-moduletitle f-cb\"><h2 class=\"f-fl j-moduleName\">测验与作业</h2><p class=\"u-helplink f-fc9 f-fr\"><a class=\"f-fcgreen\" href=\"https://www.icourse163.org/help/help.htm#/hf?t=3\" target=\"_blank\">查看帮助</a></p></div><div class=\"m-chapterQuizHwItem\"><h3 class=\"j-titleName qhTit f-thide\">第7章 面向对象程序设计之一（1）</h3><div class=\"u-quizHwListItem f-pr last\"><div class=\"titleBox j-titleBox f-cb\" id=\"auto-id-1548764628601\"><h4 class=\"j-name name f-fl f-thide\">单元测验7-1</h4><div class=\"j-submitTime score f-fl\">截止时间：2018年04月30日 00:00</div><a class=\"j-quizBtn u-btn u-btn-default f-fr\" id=\"auto-id-1548764628600\">前往测验</a></div></div></div><div class=\"m-chapterQuizHwItem\"><h3 class=\"j-titleName qhTit f-thide\">第7章 面向对象程序设计之一（2）</h3><div class=\"u-quizHwListItem f-pr\"><div class=\"titleBox j-titleBox f-cb\" id=\"auto-id-1548764628610\"><h4 class=\"j-name name f-fl f-thide\">单元测验7-2</h4><div class=\"j-submitTime score f-fl\">截止时间：2018年04月30日 00:00</div><a class=\"j-quizBtn u-btn u-btn-default f-fr\" id=\"auto-id-1548764628609\">前往测验</a></div></div><div class=\"u-quizHwListItem f-pr last\"><div class=\"titleBox j-titleBox f-cb\" id=\"auto-id-1548764628617\"><h4 class=\"j-name name f-fl f-thide\">单元作业7-2</h4><div class=\"j-submitTime score f-fl\">截止时间：2018年04月30日 00:00</div><a class=\"j-quizBtn u-btn u-btn-default f-fr\" id=\"auto-id-1548764628616\">前往作业</a></div></div></div><div class=\"m-chapterQuizHwItem\"><h3 class=\"j-titleName qhTit f-thide\">第7章 面向对象程序设计之一（3）</h3><div class=\"u-quizHwListItem f-pr\"><div class=\"titleBox j-titleBox f-cb\" id=\"auto-id-1548764628626\"><h4 class=\"j-name name f-fl f-thide\">单元测验7-3</h4><div class=\"j-submitTime score f-fl\">截止时间：2018年04月30日 00:00</div><a class=\"j-quizBtn u-btn u-btn-default f-fr\" id=\"auto-id-1548764628625\">前往测验</a></div></div><div class=\"u-quizHwListItem f-pr last\"><div class=\"titleBox j-titleBox f-cb\" id=\"auto-id-1548764628633\"><h4 class=\"j-name name f-fl f-thide\">单元作业7-3</h4><div class=\"j-submitTime score f-fl\">截止时间：2018年04月30日 00:00</div><a class=\"j-quizBtn u-btn u-btn-default f-fr\" id=\"auto-id-1548764628632\">前往作业</a></div></div></div><div class=\"m-chapterQuizHwItem\"><h3 class=\"j-titleName qhTit f-thide\">第8章 面向对象程序设计之二（1）</h3><div class=\"u-quizHwListItem f-pr\"><div class=\"titleBox j-titleBox f-cb\" id=\"auto-id-1548764628642\"><h4 class=\"j-name name f-fl f-thide\">单元测验8-1</h4><div class=\"j-submitTime score f-fl\">截止时间：2018年04月30日 00:00</div><a class=\"j-quizBtn u-btn u-btn-default f-fr\" id=\"auto-id-1548764628641\">前往测验</a></div></div><div class=\"u-quizHwListItem f-pr last\"><div class=\"titleBox j-titleBox f-cb\" id=\"auto-id-1548764628649\"><h4 class=\"j-name name f-fl f-thide\">单元作业8-1</h4><div class=\"j-submitTime score f-fl\">截止时间：2018年04月30日 00:00</div><a class=\"j-quizBtn u-btn u-btn-default f-fr\" id=\"auto-id-1548764628648\">前往作业</a></div></div></div><div class=\"m-chapterQuizHwItem\"><h3 class=\"j-titleName qhTit f-thide\">第8章 面向对象程序设计之二（2）</h3><div class=\"u-quizHwListItem f-pr last\"><div class=\"titleBox j-titleBox f-cb\" id=\"auto-id-1548764628658\"><h4 class=\"j-name name f-fl f-thide\">单元测验8-2</h4><div class=\"j-submitTime score f-fl\">截止时间：2018年05月07日 00:00</div><a class=\"j-quizBtn u-btn u-btn-default f-fr\" id=\"auto-id-1548764628657\">前往测验</a></div></div></div><div class=\"m-chapterQuizHwItem\"><h3 class=\"j-titleName qhTit f-thide\">第9章 流类库与文件读写</h3><div class=\"u-quizHwListItem f-pr last\"><div class=\"titleBox j-titleBox f-cb\" id=\"auto-id-1548764628667\"><h4 class=\"j-name name f-fl f-thide\">单元测验9</h4><div class=\"j-submitTime score f-fl\">截止时间：2018年05月14日 00:00</div><a class=\"j-quizBtn u-btn u-btn-default f-fr\" id=\"auto-id-1548764628666\">前往测验</a></div></div></div><h3 class=\"j-titleName qhTit f-thide\">第10章 C++标准库（1）</h3><div class=\"titleBox j-titleBox f-cb\" id=\"auto-id-1548764628676\"><h4 class=\"j-name name f-fl f-thide\">单元测验10-1</h4><div class=\"j-submitTime score f-fl\">截止时间：2018年05月21日 00:00</div><a class=\"j-quizBtn u-btn u-btn-default f-fr\" id=\"auto-id-1548764628675\">前往测验</a></div>',0),(24,NULL,2,2,2,'2019-01-31 20:06:38','asd&nbsp;',0),(25,NULL,3,3,1,'2019-04-23 10:28:47','此题 立即推',0),(26,NULL,6,4,1,'2019-04-27 21:22:36','很好',0),(27,NULL,9,5,3,'2019-04-27 21:29:35','',0),(28,NULL,9,5,3,'2019-04-27 21:29:40','是是是',0),(29,NULL,12,3,3,'2019-04-27 21:29:59','所示',0),(30,NULL,21,2,1,'2019-04-28 08:32:28','<font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">H很好</font></font>',0),(31,'作业可以迟些提交么？',0,NULL,11,'2019-04-28 10:03:45','老师好。。。。',0),(32,NULL,31,11,1,'2019-04-28 10:04:18','最晚截止日期为。。。。',0),(33,'希望老师或同学能告诉我这段代码错在了哪里？',0,NULL,2,'2019-05-11 11:05:00','<p><span style=\"color: rgb(75, 75, 75); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px;\">String&nbsp;s&nbsp;=&nbsp;</span><span class=\"string\" style=\"color: rgb(75, 75, 75); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px;\">\"\";&nbsp;</span></p><p><span class=\"string\" style=\"color: rgb(75, 75, 75); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px;\">for&nbsp;(Person&nbsp;p&nbsp;:&nbsp;persons)&nbsp;{</span></p><p><span class=\"string\" style=\"color: rgb(75, 75, 75); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px;\">s&nbsp;+=&nbsp;<span class=\"string\">\",&nbsp;\"&nbsp;+&nbsp;p.getName();&nbsp;</span></span></p><p><span class=\"string\" style=\"color: rgb(75, 75, 75); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px;\"><span class=\"string\">}</span></span></p><p><span style=\"font-size: 12px; color: rgb(75, 75, 75); font-family: Verdana, Arial, Helvetica, sans-serif;\">s&nbsp;=&nbsp;s.substring(</span><span class=\"number\" style=\"font-size: 12px; color: rgb(75, 75, 75); font-family: Verdana, Arial, Helvetica, sans-serif;\">2);&nbsp;<span class=\"comment\">//remove&nbsp;first&nbsp;comma&nbsp;</span></span></p><p><span class=\"string\" style=\"color: rgb(75, 75, 75); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px;\"><span class=\"string\"></span><br></span>                                            </p>',0);

/*Table structure for table `homework` */

DROP TABLE IF EXISTS `homework`;

CREATE TABLE `homework` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `demo` varchar(100) DEFAULT NULL,
  `term_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `homework` */

insert  into `homework`(`id`,`teacher_id`,`name`,`start_time`,`end_time`,`demo`,`term_id`) values (5,1,'java的第一个程序练习','2019-05-07 18:00:00','2019-05-09 18:00:00','',1),(6,1,'java的单链表实现','2019-05-07 18:00:00','2019-05-09 18:00:00','',1),(7,1,'第三次作业','2019-05-01 00:00:00','2019-05-20 23:59:59','作业详情见第三章作业文件',1);

/*Table structure for table `homework_student` */

DROP TABLE IF EXISTS `homework_student`;

CREATE TABLE `homework_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `homework_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `path` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `homework_student` */

insert  into `homework_student`(`id`,`homework_id`,`student_id`,`status`,`path`) values (1,5,2,1,'604115ee-8933-45f3-b3a9-46af0b497c43.pdf'),(2,7,2,1,'a5fc05eb-a6f4-460d-bc16-79a642c1d9fe.pdf');

/*Table structure for table `message` */

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_id` varchar(36) DEFAULT NULL,
  `content` varchar(5000) DEFAULT NULL,
  `publish_id` int(11) DEFAULT NULL,
  `receive_id` int(11) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `is_look` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

/*Data for the table `message` */

insert  into `message`(`id`,`message_id`,`content`,`publish_id`,`receive_id`,`time`,`is_look`) values (43,'8085ae902f3340e6a640e320d638143e','第一次实验截止日期为——',1,2,'2019-04-28 10:01:47',0),(44,'8085ae902f3340e6a640e320d638143e','第一次实验截止日期为——',1,3,'2019-04-28 10:01:47',0),(45,'8085ae902f3340e6a640e320d638143e','第一次实验截止日期为——',1,4,'2019-04-28 10:01:47',0),(46,'8085ae902f3340e6a640e320d638143e','第一次实验截止日期为——',1,5,'2019-04-28 10:01:47',0),(47,'8085ae902f3340e6a640e320d638143e','第一次实验截止日期为——',1,7,'2019-04-28 10:01:47',0),(48,'8085ae902f3340e6a640e320d638143e','第一次实验截止日期为——',1,9,'2019-04-28 10:01:47',0),(49,'8085ae902f3340e6a640e320d638143e','第一次实验截止日期为——',1,11,'2019-04-28 10:01:47',1);

/*Table structure for table `question` */

DROP TABLE IF EXISTS `question`;

CREATE TABLE `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '题目表',
  `description` text COMMENT '题目描述',
  `type` int(6) DEFAULT NULL COMMENT '题目类型：选择题：1，判断题：2，填空题3',
  `answer` varchar(100) DEFAULT NULL COMMENT '答案',
  `detail` text COMMENT '答案详解',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `question` */

insert  into `question`(`id`,`description`,`type`,`answer`,`detail`) values (1,'关于sleep()和wait()，以下描述错误的一项是（ ）\r\n\r\nA. sleep是线程类（Thread）的方法，wait是Object类的方法；\r\n\r\nB. sleep不释放对象锁，wait放弃对象锁；\r\n\r\nC. sleep暂停线程、但监控状态仍然保持，结束后会自动恢复；\r\n\r\nD. wait后进入等待锁定池，只有针对此对象发出notify方法后获得对象锁进入运行状态。',1,'D','sleep是线程类（Thread）的方法，导致此线程暂停执行指定时间，给执行机会给其他线程，但是监控状态依然保持，到时后会自动恢复。调用sleep不会释放对象锁。\r\n\r\nwait是Object类的方法，对此对象调用wait方法导致本线程放弃对象锁，进入等待此对象的等待锁定池，只有针对此对象发出notify方法（或notifyAll）后本线程才进入对象锁定池准备获得对象锁进入运行状态。\r\n'),(2,'方法resume()负责恢复哪些线程的执行（ ）\r\n A通过调用stop()方法而停止的线程。\r\n\r\nB通过调用sleep()方法而停止的线程。\r\n\r\nC通过调用wait()方法而停止的线程。\r\n\r\nD通过调用suspend()方法而停止的线程。',1,'D','Suspend可以挂起一个线程，就是把这个线程暂停了，它占着资源，但不运行，用Resume是恢复挂起的线程，  让这个线程继续执行下去。'),(3,'有关线程的哪些叙述是对的（ ）\r\n A一旦一个线程被创建，它就立即开始运行。\r\n\r\nB使用start()方法可以使一个线程成为可运行的，但是它不一定立即开始运行。\r\n\r\nC当一个线程因为抢先机制而停止运行，它被放在可运行队列的前面。\r\n\r\nD一个线程可能因为不同的原因停止并进入就绪状态。',1,'BCD',' 在抢占式线程模型中，操作系统可以在任何时候打断线程。通常会在它运行了一段时间（就是所谓的一个\r\n\r\n时间片）后才打断它。这样的结果自然是没有线程能够不公平地长时间霸占处理器。'),(4,'下面的哪些声明是合法的？（ ）\r\n\r\nA.long 1 = 499\r\n\r\nB.int i = 4L\r\n\r\nC.float f =1.1\r\n\r\nD.double d = 34.4',1,'AD','B.4L应该是long类型的写法，  C.1.1是double类型 ，float f=1.1f是正确写法'),(5,'选择Java语言中的基本数据类型（多选）\r\n\r\nA.byte\r\n\r\nB.Integer\r\n\r\nC.String\r\n\r\nD.char\r\n\r\nE.long',1,'ADE','基本数据类型总共有8个：byte，short，int，long，char，boolean，float，double'),(6,'从下列选项中选择正确的Java表达式\r\n\r\nA.int k=new String(“aa”)\r\n\r\nB.String str=String(“bb”)\r\n\r\nC.char c=74;\r\n\r\nD.long j=8888;',1,'BCD',''),(7,'Java I/O程序设计中，下列描述正确的是\r\n\r\nA. OutputStream用于写操作\r\n\r\nB. InputStream用于写操作\r\n\r\nC. I/O库不支持对文件可读可写API',1,'A','B.InputStream用于读操作  C．I/O支持对文件的读写'),(8,'下述代码的执行结果是\r\n\r\nclass Super { public int getLength() {return 4;}\r\n\r\n}\r\n\r\npublic class Sub extends Super { public long getLength() {return 5;}\r\n\r\npublic static void main (String[]args) {\r\n\r\nSuper sooper = new Super (); Super sub = new Sub(); System.out.printIn(sooper.getLength()+ “，” + sub.getLength() };\r\n\r\n}\r\n\r\n} A. 4， 4 B. 4， 5 C. 5， 4 D. 5， 5 E. 代码不能被编译',1,'E','方法重写返回值类型与父类的一致'),(9,'关于Java语言，下列描述正确的是（多选）\r\n\r\nA. switch 不能够作用在String类型上\r\n\r\nB. List， Set， Map都继承自Collection接口\r\n\r\nC. Java语言支持goto语句\r\n\r\nD. GC是垃圾收集器，程序员不用担心内存管理',1,'AD','B. Map没有继承Collection接口  C．java不支持goto语句'),(10,'下列描述中，哪些符合Java语言的特征\r\n\r\nA. 支持跨平台(Windows，Linux，Unix等)\r\n\r\nB. GC(自动垃圾回收)，提高了代码安全性\r\n\r\nC. 支持类C的指针运算操作\r\n\r\nD. 不支持与其它语言书写的程序进行通讯',1,'AB',''),(11,'关于异常(Exception)，下列描述正确的是\r\n\r\nA. 异常的基类为Exception，所有异常都必须直接或者间接继承它\r\n\r\nB. 异常可以用try{ . . .}catch(Exception e){ . . .}来捕获并进行处理\r\n\r\nC. 如果某异常继承RuntimeException，则该异常可以不被声明\r\n\r\nD. 异常可以随便处理，而不是抛给外层的程序进行处理',1,'ABC',''),(12,'关于线程设计，下列描述正确的是\r\n\r\nA. 线程对象必须实现Runnable接口\r\n\r\nB. 启动一个线程直接调用线程对象的run()方法\r\n\r\nC. Java提供对多线程同步提供语言级的支持\r\n\r\nD. 一个线程可以包含多个进程',1,'C',''),(13,'TCP通信建立在连接的基础上，TCP连接的建立要使用几次握手的过程。\r\n\r\nA.2\r\n\r\nB.3\r\n\r\nC.4\r\n\r\nD.5',1,'B',''),(14,'Java网络程序设计中，下列正确的描述是\r\n\r\nA. Java网络编程API建立在Socket基础之上\r\n\r\nB. Java网络接口只支持TCP以及其上层协议\r\n\r\nC. Java网络接口只支持UDP以及其上层协议\r\n\r\nD. Java网络接口支持IP以上的所有高层协议',1,'AD',''),(15,'序列图描述对象是如何交互的并且将重点放在消息序列上。\r\nA、正确 B、不正确',2,'B','序列图主要用于按照交互发生的一系列顺序，显示对象之间的这些交互'),(16,'下列哪些是J2EE的体系。\r\n A、JSP\r\n\r\nB、JAVA\r\n\r\nC、Servlet\r\n\r\nD、WebService',1,'ACD',''),(17,'下列概念中不属于面向对象这种编程范畴的是（）？\r\n\r\n         A.对象消息\r\n\r\n         B.继承多态\r\n\r\n         C.类封装\r\n\r\n         D.过程调用',1,'D',''),(18,'构造方法重载后，在构造方法中可以使用this语句进行构造方法之间的调用，在重载的两个构造方法中可以使用this语句相互调用。',2,'（F）','');

/*Table structure for table `source` */

DROP TABLE IF EXISTS `source`;

CREATE TABLE `source` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '资源文件表',
  `name` varchar(100) DEFAULT NULL COMMENT '资源文件名称',
  `path` varchar(200) DEFAULT NULL COMMENT '路径',
  `type` varchar(6) DEFAULT NULL COMMENT '资源类型：课件1，实验作业2，视频3，辅助材料4',
  `content` varchar(200) DEFAULT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

/*Data for the table `source` */

insert  into `source`(`id`,`name`,`path`,`type`,`content`) values (1,'王宣寓.任务书.doc','21079b73-90d1-450c-8b3b-d67e937de225.doc','4','测试添加'),(2,'java第一张ppt.pptx','5b034e97-8fe1-478e-ab57-45e0dff576a8.pptx','1',''),(3,'bjfu.jpg','1a5643a2-948e-4fe1-a92f-4107f9d208f4.jpg','4','一张图片'),(4,'第二单元.pptx','ec72cef7-c704-4ff9-bb63-50da56556264.pptx','1',''),(5,'女朋友2.mp4','9abc9257-fd16-4859-9ce8-5b6b2ae27b27.mp4','3','测试视频'),(6,'女朋友放学.mp4','10e2fe7c-759e-466c-9d47-2e706f26cc12.mp4','3','测试'),(7,'消息通知.png','eb782115-0a1a-4bd1-89d5-1ef3f161d03b.png','4',''),(8,'消息通知.png','0bd116d9-e4f2-433f-b765-eddc2409f861.png','1',''),(9,'01.尚硅谷_SpringCloud_前提概述.avi','3290c2bb-91e6-4266-bc50-db4d0d53f768.avi','3',''),(10,'ckin.mp4','55ab0edf-6ca5-4028-b9b8-6ad73cf165b6.mp4','3',''),(11,'ckin.mp4','4fb013a2-8ccf-4003-979c-a149d6f9c6f1.mp4','3','在线视频'),(12,'王宣寓.任务书.doc','c5597cb9-4893-4bb3-a8e5-20d08ea7cef2.doc','4','辅助材料'),(13,'预备党员转正PPT.ppt','ec423303-7dc0-4e60-acf6-3783f8966e59.ppt','1','课件1'),(14,'10-华东理工大学民主评议党员登记表（“述责答辩”材料）.docx','435431c3-39f1-4666-91e1-2c31876e8e2c.docx','2','作业通知'),(15,'上海化学工业区创新特色奖评审表.doc','d3a740df-5d7e-4d47-8ef1-ad6c36e500f0.doc','1','课件001'),(16,'HF Android4.pdf','40c68007-a2c5-4430-b573-c7b6e0c311c1.pdf','1','第一章课件'),(17,'实验一.doc','61f14ab0-e57c-45bd-be54-dd2b2efdd436.doc','2','实验一'),(18,'Android OpenGL.pdf','95d06c2d-d5a0-45a7-b9bb-6794ce026cca.pdf','1',''),(19,'test3.qsv','5604f5a2-2372-4998-a62c-8c281519007f.qsv','3',''),(20,'Android1_FisrtApp_sunyu.pdf','ac5cecb8-14a8-40d4-a4e9-29a2f647bea4.pdf','4',''),(21,'视频下载 --国语高清.qsv','d5455e18-6a32-46a2-bf00-2987958773e6.qsv','3',''),(22,'test2.qsv','be6e1738-7e86-4db1-9bfd-d74d4b5cb10a.qsv','3',''),(23,'test.mp4','c03a01c8-eab0-4535-a5a4-b23d0aae7d8e.mp4','3',''),(24,'test2.mp4','a72a9c3d-2648-4ec3-a94f-57f086eb9895.mp4','3',''),(25,'HF Android4.pdf','0507d8bd-d2c1-43f2-87e1-0978058672ff.pdf','1',''),(26,'实验一.doc','6786eda7-5970-4084-89b0-9da47679e48c.doc','2',''),(27,'test.mp4','b0035ba3-4e32-4687-b85b-0df8f10fdd92.mp4','3',''),(28,'Android2_MVC_sunyu.pdf','85879ebc-5ece-4c3c-a1df-4fba38562a60.pdf','4',''),(29,'HF Android4.pdf','fd419dc5-a9b2-4ef8-a506-32a8b3633483.pdf','1','课件1'),(30,'实验一.doc','a7439fd4-a0e9-495b-a9d3-0916db8e09ad.doc','2',''),(31,'test2.mp4','37571f9c-dcf6-422f-8333-68aeb2286ae0.mp4','3',''),(32,'Android2_MVC_sunyu.pdf','fef84da5-618c-4d34-816c-a8f55a8b7cf6.pdf','4',''),(33,'HF Android5.pdf','07814296-78d7-42a1-92f6-4596ec7c6bfe.pdf','2','asd');

/*Table structure for table `term` */

DROP TABLE IF EXISTS `term`;

CREATE TABLE `term` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '学期表',
  `name` varchar(20) DEFAULT NULL COMMENT '学期名称',
  `beginTime` date DEFAULT NULL COMMENT '开始时间',
  `endTime` date DEFAULT NULL COMMENT '结束时间',
  `isDelete` int(6) DEFAULT '0' COMMENT '是否删除，1代表已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `term` */

insert  into `term`(`id`,`name`,`beginTime`,`endTime`,`isDelete`) values (1,'2019年上半学期','2019-02-19','2019-06-29',0),(2,'2019年下半学期','2019-09-10','2020-01-19',0),(3,'测试学期编辑','1996-01-01','1997-01-01',0);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(10) DEFAULT NULL COMMENT '学号',
  `password` varchar(10) DEFAULT NULL COMMENT '密码',
  `name` varchar(10) DEFAULT NULL COMMENT '姓名',
  `gender` varchar(6) DEFAULT NULL COMMENT '性别',
  `college` varchar(10) DEFAULT NULL COMMENT '所属学院',
  `role` int(6) DEFAULT NULL COMMENT '角色，1代表教师，2代表学生',
  `idDelete` int(6) DEFAULT '0' COMMENT '是否删除用户，1代表删除',
  `major` varchar(10) DEFAULT NULL COMMENT '专业班级',
  `image` varchar(200) DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`name`,`gender`,`college`,`role`,`idDelete`,`major`,`image`) values (1,'admin','123456','韩慧','女','信息学院',1,0,'计算机软件教研室','5580b561-fcac-406f-bf91-86f147ab8936.jpg'),(2,'151002112','123456','王宣寓','男','信息学院',2,0,'计算机科学与技术14','b93be516-c68c-4c3d-b260-b1d7df842013.jpg'),(3,'151002113','123456','学生2','男','信息学院',2,0,'计算机科学与技术14','b64b0ff0-4225-4066-898b-9869bb643b24.jpg'),(4,'201503','123456','学生3','男','信息学院',2,0,'计算机科学与技术14','cc3890a6-c8ab-4c53-9d0b-44e688e4aeb5.png'),(5,'201504','123456','学生4','女','信息学院',2,0,'计算机科学与技术14',NULL),(6,'201505','123456','学生5','女','信息学院',2,0,'计算机科学与技术14',NULL),(7,'201506','123456','学生6','男','信息学院',2,0,'计算机',NULL),(9,'201408','123456','学生8','男','信息学院',2,0,'计算机科学与技术',NULL),(11,'151002409','12345678','李同学','男','信息学院',2,0,'计算机15-2班','33a1515e-7cbe-4d43-b35e-495ab733f483.jpg');

/*Table structure for table `user_term` */

DROP TABLE IF EXISTS `user_term`;

CREATE TABLE `user_term` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '学生-教师-学期 中间表',
  `studentId` int(11) DEFAULT NULL COMMENT '学生id，关联user表',
  `teacherId` int(11) DEFAULT NULL COMMENT '教师Id，关联user表',
  `termId` int(11) DEFAULT NULL COMMENT '学期id，关联term表',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `user_term` */

insert  into `user_term`(`id`,`studentId`,`teacherId`,`termId`) values (1,1,1,1),(2,2,1,1),(3,3,1,1),(4,4,1,1),(5,5,1,1),(6,6,1,2),(7,7,1,1),(9,9,1,1),(11,11,1,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
