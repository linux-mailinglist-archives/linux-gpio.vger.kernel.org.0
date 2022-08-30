Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99B225A6646
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Aug 2022 16:27:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbiH3O1x convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Tue, 30 Aug 2022 10:27:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbiH3O1w (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Aug 2022 10:27:52 -0400
Received: from de-smtp-delivery-113.mimecast.com (de-smtp-delivery-113.mimecast.com [194.104.109.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 477685EDCE
        for <linux-gpio@vger.kernel.org>; Tue, 30 Aug 2022 07:27:49 -0700 (PDT)
Received: from CHE01-ZR0-obe.outbound.protection.outlook.com
 (mail-zr0che01lp2106.outbound.protection.outlook.com [104.47.22.106]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-39-lR1OrBw5MrSsIUyLOpY9DQ-2; Tue, 30 Aug 2022 16:27:45 +0200
X-MC-Unique: lR1OrBw5MrSsIUyLOpY9DQ-2
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:2e::8) by
 GVAP278MB0327.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:3d::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15; Tue, 30 Aug 2022 14:27:43 +0000
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::1057:15ae:2a7a:de8e]) by ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::1057:15ae:2a7a:de8e%6]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 14:27:43 +0000
From:   Francesco Dolcini <francesco.dolcini@toradex.com>
To:     Peng Fan <peng.fan@nxp.com>, linux-gpio@vger.kernel.org
CC:     Francesco Dolcini <francesco.dolcini@toradex.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2] pinctrl: imx8m: kconfig: Depends on SOC_IMX8M
Date:   Tue, 30 Aug 2022 16:27:27 +0200
Message-ID: <20220830142727.313080-1-francesco.dolcini@toradex.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: MR1P264CA0164.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:55::15) To ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:2e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38060505-e30e-471e-623e-08da8a93cd00
X-MS-TrafficTypeDiagnostic: GVAP278MB0327:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: rmNartOBMhp9lymv9bZfrD8iL48rebtKgnfcDChvYB2Hu/TpGMrZMwQsm+QFi4/kPV4wUl+4HGb6jZPxTlbWXLp9AdoQWMaTI805msO+GC2C1DUFaq9+3DAkEFFVAYoynz/0DkZHGDImyOSaLr5qQ9ZR4Ry0YvnJdpj5i+0eMUJVexQn2hGLfcXeEwYHez91QiohFt7PHBP6LMj5xOktrREEf6cg+C/thHkqOc78Z/Ka/8DJQcOO0zBdiJZwsQdLl7tWmBjIw8O8shMeLJ7evbtfvo78z37yhVtCHRR4e0mIrzCYMarFP+hFIIKrQ+vBd4QX6Lb+7yZwMfboSoHe4w/KXotALh8G1Szvhz7yg4eRMvOgl+A9rh7Rooxv7fcaTmJtYBq6fsfK6zumzVZhNbOSPLYeax/L9V9/32khqPUezFNPnuF22Rm+bgLdf/OUwigAbiX4EQdBS8az8gjymYtppAPVglJH6qYnqEvnUAh7BQ9yPsa6lpi+K/UrtnTGTv09qgKq1Im+kBfH0z+q+nyu2f8GftNLms67NVQirABwROMA6KENjxkjSsNXQoedPl7XXuKRkpFaJTqolxBXGJctE9BOBwQBSSMWadbz7wXX1kSvbi0i8CjwLiIuEkRfmYMwPU8SdN0yGmXlWdqYiVqJ9A8NGzKYnDlF3jBmqRYNFnFYnxqJj4K2wrUxYSlgVYJ7/FdGb1hHXdh4lPQgY+s6o7iOOvtb/mjvI3H8X5xRQuLdS0qiSi7tG5AskHip0QrKIeJOjkWmto5bZk2IQfZIm8xfNp3sB428kxd+aXg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(376002)(39840400004)(136003)(366004)(6666004)(66946007)(52116002)(2906002)(8676002)(6486002)(6506007)(8936002)(41300700001)(4326008)(44832011)(66556008)(5660300002)(2616005)(86362001)(186003)(83380400001)(478600001)(1076003)(6512007)(66476007)(26005)(38100700002)(38350700002)(316002)(54906003)(36756003)(32563001);DIR:OUT;SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o57ypNMjVlBcPoxNks6J6a1Y39goV51mhupww8HsJma3CAjbc/juReB6RYRL?=
 =?us-ascii?Q?0A+rBOXyXvaHmYxdAsgL2kR4gx5NL8eGZRWuPXuZPky+KBY/v3q2VdwdiuRx?=
 =?us-ascii?Q?zkyvtfAbh8vnMgzF0rv0sBgLWVKfQidcCHaHCIyCLyrqpY3gAnTt81n2pXjF?=
 =?us-ascii?Q?fAx5FxjyndYiR0Anxsrt267M+0bjwkBNUum9NULx9Nze43mEPv3wFQUkZ6xr?=
 =?us-ascii?Q?eErtfvJaDknB4nuOmR5A4c6uL8+Q2iL0UO0O26U4r9QVbx7j/5nsAYsKru32?=
 =?us-ascii?Q?ui0ifuAz1X2I26X+e1Q2QxNM5oXcIVJ9sGN2L+XmU0Q6Imii1oVHEKMAen5C?=
 =?us-ascii?Q?C5/kRsvgQ3JukPzbjm9fMBkc/DLMyEZt5svJo8bxQvR+o8B6MMgCR10l5dvO?=
 =?us-ascii?Q?HGfBTH/BzgCk/0/mwiDP2wUXVB2g27/xpWPR49O9t4+BFPEo3F1setHhRLCS?=
 =?us-ascii?Q?OYXw9hIpRAXXOgVaMiWiQzgXxqFP7AT0YrI6jHAf5XPCCxtmBtJmxo/KL2q1?=
 =?us-ascii?Q?xuD1CLRygq2eebdr8MITCrtUgnYrPSBzRE/IVEa9tKzmaRv9gSBQhGxF8sBl?=
 =?us-ascii?Q?x56weVlj035g0pES4MTBjBwHZ7CAcjAJfuv1EbefTS89niVqq6d/kQ6H1s4Y?=
 =?us-ascii?Q?YjZVlk95bghaPaYtq/NxB1JtMj7kjSXamLwAoEh0MYRsFaJ6H6pqUteQDl0N?=
 =?us-ascii?Q?L+x2irHfqGeynjtcMkaGbfPg0LQzxjYYmRSTobOpiHe6l7BfH2DZ2lIv+8g6?=
 =?us-ascii?Q?BSvvPbBWNH32XLgKECKjcjpHpK53WVwRjj4BV+FC+WKL68gK/uWdoZxDI5rL?=
 =?us-ascii?Q?/h3CxMIG7mzg8ghM4ENCYqzWFXpFVTWlaa6wxDjtRar+g0jmeYhxx1/QNQ6r?=
 =?us-ascii?Q?8omemuj+HAmtOQlVp2JDIHSQRPFJnyYn4RIEtRHxclxiVA0l/oSFChVgRd4B?=
 =?us-ascii?Q?06syw7evuIszPj8mpTN2PnN5Tlf7fes9HMqGmNvfjJPbO04EF2tP/kJAWXIR?=
 =?us-ascii?Q?N6FttRd58sLHcpl3g7LIyc+mU3r0f+L2LEepL92QrqlbCRmTf1mQ79MZZnkE?=
 =?us-ascii?Q?DZ3XD3zFZ6Q/uszaVcon85saeX5tV8ISZsWAbEffNY9JifjNHMZLuVBkr+EO?=
 =?us-ascii?Q?7ibJoLfUHcMNg/R7JJo2b8xvOHT80bWzG+O/+21Mp7Dy3Ksdajw1yznaxvAF?=
 =?us-ascii?Q?7N+niTLxE/E7r2Z8p466VmS38SejkBjrT4BVZWFg7OLofNhtCH4GPlQM13bG?=
 =?us-ascii?Q?oIXb1HNQJwkM4j3RrjBE3xn4SVPgYR/tslIzUpgGmbF4x7bRqqEb6OTIsHpT?=
 =?us-ascii?Q?Zbb9enpCxs30RHd6wtuwFqhdq056KsRd6PfBXvqgeWcghK88Zpc15E5AXLaA?=
 =?us-ascii?Q?UYBn/I30RUPmzgEz4KOfFa/H48pzOYuN3mNN4tIKqMQPExkjCf+wiFmb3Wfw?=
 =?us-ascii?Q?kePUUGk0089tO1JQuNkmsdm3MqESzyc6mhKAqDqb1gCa0rjb2rBKUIEnNU5V?=
 =?us-ascii?Q?OIMVuCdtez6Wx3bjRjaa4xOviaulf8LRcZ2+pK6brLON1RTzsRAvorHfe3mI?=
 =?us-ascii?Q?aaxoLLCDGbtT50Z50MOeBB221SCgdKBkx//ISH39ut98I2k74Npm3fb8OkCh?=
 =?us-ascii?Q?5w=3D=3D?=
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38060505-e30e-471e-623e-08da8a93cd00
X-MS-Exchange-CrossTenant-AuthSource: ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2022 14:27:43.1151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TDPCl/q/cB6RcaO2GWNHbMc5oMqIox8raZf+40lMn9J81gFaPcRuVLF+sFq33kyae6+WODhl74Prthi9FQnNT/x0T1+hKQrNkFIyWJJhXXQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVAP278MB0327
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: toradex.com
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset=WINDOWS-1252
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Change PINCTRL_IMX8M* dependency from just ARCH_MXC to SOC_IMX8M,
likewise is done for other PINCTRL_IMX* kconfig. This avoid polluting
the config when SOC_IMX8M is not enabled.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---

 drivers/pinctrl/freescale/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
index d96b1130efd3..365fcff8e470 100644
--- a/drivers/pinctrl/freescale/Kconfig
+++ b/drivers/pinctrl/freescale/Kconfig
@@ -119,28 +119,28 @@ config PINCTRL_IMX7ULP
 
 config PINCTRL_IMX8MM
 	tristate "IMX8MM pinctrl driver"
-	depends on ARCH_MXC
+	depends on SOC_IMX8M
 	select PINCTRL_IMX
 	help
 	  Say Y here to enable the imx8mm pinctrl driver
 
 config PINCTRL_IMX8MN
 	tristate "IMX8MN pinctrl driver"
-	depends on ARCH_MXC
+	depends on SOC_IMX8M
 	select PINCTRL_IMX
 	help
 	  Say Y here to enable the imx8mn pinctrl driver
 
 config PINCTRL_IMX8MP
 	tristate "IMX8MP pinctrl driver"
-	depends on ARCH_MXC
+	depends on SOC_IMX8M
 	select PINCTRL_IMX
 	help
 	  Say Y here to enable the imx8mp pinctrl driver
 
 config PINCTRL_IMX8MQ
 	tristate "IMX8MQ pinctrl driver"
-	depends on ARCH_MXC
+	depends on SOC_IMX8M
 	select PINCTRL_IMX
 	help
 	  Say Y here to enable the imx8mq pinctrl driver
-- 
2.25.1

