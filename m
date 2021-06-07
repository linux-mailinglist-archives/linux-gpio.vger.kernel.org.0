Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BED139D498
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jun 2021 08:00:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbhFGGCb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Jun 2021 02:02:31 -0400
Received: from mail-eopbgr00047.outbound.protection.outlook.com ([40.107.0.47]:32932
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229436AbhFGGC3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 7 Jun 2021 02:02:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HpvaswnFwR4Udx8HB0b36MLCvKJCzG+4eDbV4AijJM3Djrk9iL8fHMHdPYqb8c6b0FnzmxWSv3W/dLVqJLUQL2lafs0tgYDHwXppHSuhLII1SSTN+NhDlXo/QopdjFxaVGtHpnT45J86Xu0wHoIE/NLhoYN4ukZERHXdjDCtGZqVzwhzfvt5iyLskPnMW+UAuF9C5enblB+Vw1rhPbM+GMuqgsBDXklQ1MiUj8+U/urCcgWJFxBVsi7FfFCT57iQcn0Bh698JCgC2kQR1BIUuRpfYDyagpC26+sJ3b8vTJGJRuBx5NMiK+pxlGAt6x9BuCJl+j0ajsZPKhtruUhCmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTDhlEaTboop4eohaabjTScy7+nBHw34tTT88gOioVk=;
 b=S3WA4KYNQQJpSfcBgsQPX9TqAj+/7Sq2ITvjS4C91QyEyibuCFpvI4DfDgavp+tdaHuRVPNEvLn5UA4GtZorTQl5jjYTxXQv2u1LtwZMXpF7iJcatV3e2Ucl5xCaA0oSUA98l5pbbicu8HP2sDgnQsYljKaUICPqeggagqx8HITj/og7l2oDQY7Bj3ZrcAvqMxCVoSp7vULxeidC12YAAnzewZLbCHbyIno7Q9/OtH41cCtG/LwPFTYEGPfVaDO+s2MhxurA7+UXtHWt82fwZ5r1r5gBAsR4ejzbM3Y8wIB5H7lk1N6HMNFR168/TYOkjWJijnsXhrdXhY0Zy4LGfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTDhlEaTboop4eohaabjTScy7+nBHw34tTT88gOioVk=;
 b=Xm6dcYCUiQMCFHr1enxqfWlqyluZ8VXyrP+NJInevqMC/fWmCm5poDl31WZjqF7TZufDxZG4Xa0S/TRQB1FgqaCqQjX1jJD2/Swz0cYFGQExBP/jS4tTGVBxLB3v5BFnA95ikmvC+EHk396hFSH13x6bBg1Vk9Rf+g+5Own7/C4=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
Received: from DBBPR04MB7930.eurprd04.prod.outlook.com (2603:10a6:10:1ea::12)
 by DB7PR04MB4940.eurprd04.prod.outlook.com (2603:10a6:10:22::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Mon, 7 Jun
 2021 06:00:36 +0000
Received: from DBBPR04MB7930.eurprd04.prod.outlook.com
 ([fe80::3921:acd6:3201:b209]) by DBBPR04MB7930.eurprd04.prod.outlook.com
 ([fe80::3921:acd6:3201:b209%4]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 06:00:36 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     linus.walleij@linaro.org, shawnguo@kernel.org,
        aisheng.dong@nxp.com, stefan@agner.ch, robh+dt@kernel.org
Cc:     linux-imx@nxp.com, festevam@gmail.com, kernel@pengutronix.de,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] pinctrl: imx8ulp: Add pinctrl driver support
Date:   Mon,  7 Jun 2021 14:10:41 +0800
Message-Id: <20210607061041.2654568-2-ping.bai@nxp.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210607061041.2654568-1-ping.bai@nxp.com>
References: <20210607061041.2654568-1-ping.bai@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: SG2PR0401CA0010.apcprd04.prod.outlook.com
 (2603:1096:3:1::20) To DBBPR04MB7930.eurprd04.prod.outlook.com
 (2603:10a6:10:1ea::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.71) by SG2PR0401CA0010.apcprd04.prod.outlook.com (2603:1096:3:1::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22 via Frontend Transport; Mon, 7 Jun 2021 06:00:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 245813d0-42a3-47d3-dcdf-08d9297991ed
X-MS-TrafficTypeDiagnostic: DB7PR04MB4940:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4940542FCD512B60DD2052EF87389@DB7PR04MB4940.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:773;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1qL5UCXyfOQARvImNtW52nyn5ibga/zXVuA9/VO5mPuGkcdJMuMiDHP3jXF/gCXqnloY1VcOgyVAqpQiZiQuVHXCNnDTwKMX73p4lPRZ8TaptCaE8keMoPdl+W6BG0BHO/cSWKGq5UsBO8+mnwUplggzVnzz8w3XyxiMtxO+YYC5Zi3sSRx6CjK1+PWtBlkRjwmw0VG3IhoCWgTwuV1TYmWiv4X/qmClLy1/jKPRKUXuuT6J+lWQYp8wdh+Hx/mMmVZ2HFsWaOQiwjM/xorD9lr7Aq5pfXmoq3PgAD78tGGx7bTBJMbbY3lQ4PxKMNjT8ZsDMW9fcsvTBYBAPQqRkudGav70VsUtw0yqQMjIvirJvKSWeTTFJ8Dgp31NLx7TH7bxP0+YT8fE6xgx2e3LF3qVcMjtiundI+1W/Cay79ydmqxzktqczrawZEh22cUxe3bLg/IuAS35sSxofOpkIrNEx1kiFZClZ9XWrN6rCMEYUe6wziw+Fc2aEuNu18l0lLgMQAleKnLQRQKrBJhJaGQO7NIUYEweGhHE/3A/VLxZMWODClCBB/d6Ca7SZr0SIWfnepm9njU1nGHFdtuyRG2NsnOU/5TQyNHahd6mnJndcYMOxYkPDwpg075wguagcge9uCbEbIKPMOBKQQdIUkplW9EXRf9pxGaB/jvGMjVjRsvTtaRhsdpAZya4WrDUmtd2ylQv7fHn96jVXmlUTbGL1blPhkOQa2OqmMWSw1Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7930.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(39860400002)(376002)(396003)(136003)(52116002)(66556008)(66946007)(1076003)(66476007)(6506007)(16526019)(26005)(186003)(956004)(2616005)(5660300002)(8676002)(6512007)(38350700002)(6486002)(38100700002)(36756003)(8936002)(2906002)(316002)(4326008)(86362001)(478600001)(6666004)(69590400013)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?AQLPBZHP8vX2Q+ovanhg3fcZU9xKYWTl7zCJBSaeuQUOiUT9UYou07UWFgRo?=
 =?us-ascii?Q?3slrKdxTJHkIZz5hV2/wqa1xevCxBfBQZOLedkjQI/G9UKGpO316QQefusRa?=
 =?us-ascii?Q?Ert5gbXQugdBerT81HTIzVm+RGhoGRQKUDZkoNZ2YcPNrFlHV6xO1K0UXzCx?=
 =?us-ascii?Q?5a8ookm6+xXLR7HnISvXpzgudYGodcufnOEy0JFih9oZmX8g2muQFrwbG0cW?=
 =?us-ascii?Q?oWtlcJUh35F4gxKtwDqY+JjyGtF6qnquWgVnB6ioUOPb2ly9ua06JI3zThvq?=
 =?us-ascii?Q?WZVpAjopLbaCCrRyv8O4sKel5ZYftUNBwfBoizSkKzguK3s0sOlOKqjTinTm?=
 =?us-ascii?Q?LcEslTuCM6qhekJZziZyy+DFQOj/+p3XuTKe52RocpiydazJntB+JnakZf8V?=
 =?us-ascii?Q?hiwuO8o5b3uWT58jGuhqYp7CSOsw70vmL0M+lLL97HtJBqlUG3yI1n6oOyMt?=
 =?us-ascii?Q?roTtkIMBAvTCa6aPCZuYbusTzW8fyHah2BwoE5pAcQ2L97pBy1jBs+EA0o2B?=
 =?us-ascii?Q?liYRX0mBXtzQsvDOUjfdgICbLnILRHguw/6q12ZHbsndSQhvD/bIcg38sMGa?=
 =?us-ascii?Q?7nmKP77RSKPOmah5h/vLBAlhtJD6x8xP4CBMCFDbhXaUU+cSC/5acdk3sWfd?=
 =?us-ascii?Q?HEuDhXBrLVLUPajqjKIH0gtYQ3wCp+EqHlHzHS0shnYYkS3dU8Ou0mdLmd1v?=
 =?us-ascii?Q?S+eWcCWYdp8BQt6UwBlFQ7mETiFjtnLXH/oxBO1UNa+ylxs9A7+yN6xn6mu/?=
 =?us-ascii?Q?jatr1wCmNvOxwv4cH8CF0pbw9C+ngjycx9+2ETwLWBYz2KBd8mDoJnW6F4pf?=
 =?us-ascii?Q?VLlrIZhDieZCPu6zxxfDpNY2MOJL9AelCQ4jyYcgZHD9pYu/PJXrODxc0qcL?=
 =?us-ascii?Q?sHBgOjcgIN5yRQkttdib69rPFTn6YzKK83dcbmDDyX2MSVT2zB4hytSNLLDa?=
 =?us-ascii?Q?EWx8ApWUR3d0EcETFqb1IK/lRHl221CZCBXG7xGw1nZt+gfMKqrH4Fmqf+CB?=
 =?us-ascii?Q?vT9azTWH763pFxYNaz3BmP1Tf5IUlT2SJXCftjBzOxvYSTb2UND0WBCo6ak+?=
 =?us-ascii?Q?EGoMSPNv/BlxJtvtRQ13Az/XOBIyUTo7B/qBOfSqv/F2DOFz8uw3yl1PbVb/?=
 =?us-ascii?Q?RK+bFsh31QFquk3QL93ceBeh6bOkbzkzROxqUhn6mWw3ocoNQSeWrUwdS1qc?=
 =?us-ascii?Q?WzY/S/uuzpJED0kMRnVy3ngNvmu50lWyP4lN0XZXBmf2DINaT35QBY3GQH2X?=
 =?us-ascii?Q?9HOb//gryk3k8cR8rPj++saUti2t7slTA17l0rso4Za+/DMNp423NrwRnStI?=
 =?us-ascii?Q?NFmKjzlpsb4GBx428W1080FN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 245813d0-42a3-47d3-dcdf-08d9297991ed
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7930.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 06:00:36.8967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9esYCqJINlg+WwLtgPQZVfUNBS1vozF1twS3ngMTdlvanUU5dZ1CiY3Hi19B7diW0Xr5imQIOOgKPvbWQKVYag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4940
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

Add i.MX8ULP pinctrl driver support.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
 - v2 changes:
   remove the an useless 'if' condition check
---
 drivers/pinctrl/freescale/Kconfig           |   7 +
 drivers/pinctrl/freescale/Makefile          |   1 +
 drivers/pinctrl/freescale/pinctrl-imx8ulp.c | 274 ++++++++++++++++++++
 3 files changed, 282 insertions(+)
 create mode 100644 drivers/pinctrl/freescale/pinctrl-imx8ulp.c

diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
index f294336430cc..21fa21c6547b 100644
--- a/drivers/pinctrl/freescale/Kconfig
+++ b/drivers/pinctrl/freescale/Kconfig
@@ -166,6 +166,13 @@ config PINCTRL_IMX8DXL
 	help
 	  Say Y here to enable the imx8dxl pinctrl driver
 
+config PINCTRL_IMX8ULP
+	tristate "IMX8ULP pinctrl driver"
+	depends on ARCH_MXC
+	select PINCTRL_IMX
+	help
+	  Say Y here to enable the imx8ulp pinctrl driver
+
 config PINCTRL_VF610
 	bool "Freescale Vybrid VF610 pinctrl driver"
 	depends on SOC_VF610
diff --git a/drivers/pinctrl/freescale/Makefile b/drivers/pinctrl/freescale/Makefile
index e476cb671037..c44930b1b362 100644
--- a/drivers/pinctrl/freescale/Makefile
+++ b/drivers/pinctrl/freescale/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_PINCTRL_IMX8MQ)	+= pinctrl-imx8mq.o
 obj-$(CONFIG_PINCTRL_IMX8QM)	+= pinctrl-imx8qm.o
 obj-$(CONFIG_PINCTRL_IMX8QXP)	+= pinctrl-imx8qxp.o
 obj-$(CONFIG_PINCTRL_IMX8DXL)	+= pinctrl-imx8dxl.o
+obj-$(CONFIG_PINCTRL_IMX8ULP)	+= pinctrl-imx8ulp.o
 obj-$(CONFIG_PINCTRL_VF610)	+= pinctrl-vf610.o
 obj-$(CONFIG_PINCTRL_MXS)	+= pinctrl-mxs.o
 obj-$(CONFIG_PINCTRL_IMX23)	+= pinctrl-imx23.o
diff --git a/drivers/pinctrl/freescale/pinctrl-imx8ulp.c b/drivers/pinctrl/freescale/pinctrl-imx8ulp.c
new file mode 100644
index 000000000000..c5db5dfcfcce
--- /dev/null
+++ b/drivers/pinctrl/freescale/pinctrl-imx8ulp.c
@@ -0,0 +1,274 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2021 NXP
+ */
+
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/pinctrl/pinctrl.h>
+
+#include "pinctrl-imx.h"
+
+enum imx8ulp_pads {
+	IMX8ULP_PAD_PTD0 = 0,
+	IMX8ULP_PAD_PTD1,
+	IMX8ULP_PAD_PTD2,
+	IMX8ULP_PAD_PTD3,
+	IMX8ULP_PAD_PTD4,
+	IMX8ULP_PAD_PTD5,
+	IMX8ULP_PAD_PTD6,
+	IMX8ULP_PAD_PTD7,
+	IMX8ULP_PAD_PTD8,
+	IMX8ULP_PAD_PTD9,
+	IMX8ULP_PAD_PTD10,
+	IMX8ULP_PAD_PTD11,
+	IMX8ULP_PAD_PTD12,
+	IMX8ULP_PAD_PTD13,
+	IMX8ULP_PAD_PTD14,
+	IMX8ULP_PAD_PTD15,
+	IMX8ULP_PAD_PTD16,
+	IMX8ULP_PAD_PTD17,
+	IMX8ULP_PAD_PTD18,
+	IMX8ULP_PAD_PTD19,
+	IMX8ULP_PAD_PTD20,
+	IMX8ULP_PAD_PTD21,
+	IMX8ULP_PAD_PTD22,
+	IMX8ULP_PAD_PTD23,
+	IMX8ULP_PAD_RESERVE0,
+	IMX8ULP_PAD_RESERVE1,
+	IMX8ULP_PAD_RESERVE2,
+	IMX8ULP_PAD_RESERVE3,
+	IMX8ULP_PAD_RESERVE4,
+	IMX8ULP_PAD_RESERVE5,
+	IMX8ULP_PAD_RESERVE6,
+	IMX8ULP_PAD_RESERVE7,
+	IMX8ULP_PAD_PTE0,
+	IMX8ULP_PAD_PTE1,
+	IMX8ULP_PAD_PTE2,
+	IMX8ULP_PAD_PTE3,
+	IMX8ULP_PAD_PTE4,
+	IMX8ULP_PAD_PTE5,
+	IMX8ULP_PAD_PTE6,
+	IMX8ULP_PAD_PTE7,
+	IMX8ULP_PAD_PTE8,
+	IMX8ULP_PAD_PTE9,
+	IMX8ULP_PAD_PTE10,
+	IMX8ULP_PAD_PTE11,
+	IMX8ULP_PAD_PTE12,
+	IMX8ULP_PAD_PTE13,
+	IMX8ULP_PAD_PTE14,
+	IMX8ULP_PAD_PTE15,
+	IMX8ULP_PAD_PTE16,
+	IMX8ULP_PAD_PTE17,
+	IMX8ULP_PAD_PTE18,
+	IMX8ULP_PAD_PTE19,
+	IMX8ULP_PAD_PTE20,
+	IMX8ULP_PAD_PTE21,
+	IMX8ULP_PAD_PTE22,
+	IMX8ULP_PAD_PTE23,
+	IMX8ULP_PAD_RESERVE8,
+	IMX8ULP_PAD_RESERVE9,
+	IMX8ULP_PAD_RESERVE10,
+	IMX8ULP_PAD_RESERVE11,
+	IMX8ULP_PAD_RESERVE12,
+	IMX8ULP_PAD_RESERVE13,
+	IMX8ULP_PAD_RESERVE14,
+	IMX8ULP_PAD_RESERVE15,
+	IMX8ULP_PAD_PTF0,
+	IMX8ULP_PAD_PTF1,
+	IMX8ULP_PAD_PTF2,
+	IMX8ULP_PAD_PTF3,
+	IMX8ULP_PAD_PTF4,
+	IMX8ULP_PAD_PTF5,
+	IMX8ULP_PAD_PTF6,
+	IMX8ULP_PAD_PTF7,
+	IMX8ULP_PAD_PTF8,
+	IMX8ULP_PAD_PTF9,
+	IMX8ULP_PAD_PTF10,
+	IMX8ULP_PAD_PTF11,
+	IMX8ULP_PAD_PTF12,
+	IMX8ULP_PAD_PTF13,
+	IMX8ULP_PAD_PTF14,
+	IMX8ULP_PAD_PTF15,
+	IMX8ULP_PAD_PTF16,
+	IMX8ULP_PAD_PTF17,
+	IMX8ULP_PAD_PTF18,
+	IMX8ULP_PAD_PTF19,
+	IMX8ULP_PAD_PTF20,
+	IMX8ULP_PAD_PTF21,
+	IMX8ULP_PAD_PTF22,
+	IMX8ULP_PAD_PTF23,
+	IMX8ULP_PAD_PTF24,
+	IMX8ULP_PAD_PTF25,
+	IMX8ULP_PAD_PTF26,
+	IMX8ULP_PAD_PTF27,
+	IMX8ULP_PAD_PTF28,
+	IMX8ULP_PAD_PTF29,
+	IMX8ULP_PAD_PTF30,
+	IMX8ULP_PAD_PTF31,
+};
+
+/* Pad names for the pinmux subsystem */
+static const struct pinctrl_pin_desc imx8ulp_pinctrl_pads[] = {
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTD0),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTD1),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTD2),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTD3),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTD4),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTD5),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTD6),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTD7),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTD8),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTD9),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTD10),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTD11),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTD12),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTD13),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTD14),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTD15),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTD16),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTD17),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTD18),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTD19),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTD20),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTD21),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTD22),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTD23),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_RESERVE0),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_RESERVE1),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_RESERVE2),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_RESERVE3),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_RESERVE4),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_RESERVE5),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_RESERVE6),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_RESERVE7),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTE0),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTE1),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTE2),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTE3),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTE4),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTE5),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTE6),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTE7),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTE8),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTE9),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTE10),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTE11),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTE12),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTE13),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTE14),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTE15),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTE16),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTE17),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTE18),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTE19),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTE20),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTE21),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTE22),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTE23),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_RESERVE8),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_RESERVE9),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_RESERVE10),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_RESERVE11),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_RESERVE12),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_RESERVE13),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_RESERVE14),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_RESERVE15),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTF0),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTF1),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTF2),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTF3),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTF4),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTF5),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTF6),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTF7),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTF8),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTF9),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTF10),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTF11),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTF12),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTF13),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTF14),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTF15),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTF16),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTF17),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTF18),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTF19),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTF20),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTF21),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTF22),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTF23),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTF24),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTF25),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTF26),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTF27),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTF28),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTF29),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTF30),
+	IMX_PINCTRL_PIN(IMX8ULP_PAD_PTF31),
+};
+
+#define BM_OBE_ENABLED		BIT(17)
+#define BM_IBE_ENABLED		BIT(16)
+#define BM_MUX_MODE		0xf00
+#define BP_MUX_MODE		8
+
+static int imx8ulp_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
+					  struct pinctrl_gpio_range *range,
+					  unsigned offset, bool input)
+{
+	struct imx_pinctrl *ipctl = pinctrl_dev_get_drvdata(pctldev);
+	const struct imx_pin_reg *pin_reg;
+	u32 reg;
+
+	reg = readl(ipctl->base + pin_reg->mux_reg);
+	if (input)
+		reg = (reg & ~BM_OBE_ENABLED) | BM_IBE_ENABLED;
+	else
+		reg = (reg & ~BM_IBE_ENABLED) | BM_OBE_ENABLED;
+	writel(reg, ipctl->base + pin_reg->mux_reg);
+
+	return 0;
+}
+
+static const struct imx_pinctrl_soc_info imx8ulp_pinctrl_info = {
+	.pins = imx8ulp_pinctrl_pads,
+	.npins = ARRAY_SIZE(imx8ulp_pinctrl_pads),
+	.flags = ZERO_OFFSET_VALID | SHARE_MUX_CONF_REG,
+	.gpio_set_direction = imx8ulp_pmx_gpio_set_direction,
+	.mux_mask = BM_MUX_MODE,
+	.mux_shift = BP_MUX_MODE,
+};
+
+static const struct of_device_id imx8ulp_pinctrl_of_match[] = {
+	{ .compatible = "fsl,imx8ulp-iomuxc1", },
+	{ /* sentinel */ }
+};
+
+static int imx8ulp_pinctrl_probe(struct platform_device *pdev)
+{
+	return imx_pinctrl_probe(pdev, &imx8ulp_pinctrl_info);
+}
+
+static struct platform_driver imx8ulp_pinctrl_driver = {
+	.driver = {
+		.name = "imx8ulp-pinctrl",
+		.of_match_table = imx8ulp_pinctrl_of_match,
+		.suppress_bind_attrs = true,
+	},
+	.probe = imx8ulp_pinctrl_probe,
+};
+
+static int __init imx8ulp_pinctrl_init(void)
+{
+	return platform_driver_register(&imx8ulp_pinctrl_driver);
+}
+arch_initcall(imx8ulp_pinctrl_init);
+
+MODULE_AUTHOR("Jacky Bai <ping.bai@nxp.com>");
+MODULE_DESCRIPTION("NXP i.MX8ULP pinctrl driver");
+MODULE_LICENSE("GPL v2");
-- 
2.26.2

