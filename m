Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FD4B396D2C
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jun 2021 08:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231140AbhFAGPX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Jun 2021 02:15:23 -0400
Received: from mail-eopbgr60056.outbound.protection.outlook.com ([40.107.6.56]:58595
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229477AbhFAGPX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 1 Jun 2021 02:15:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lBlCronh2gqtmzmMUIKw+DIbGmIqrD6ljY9WGVH522ps8CG7wDAAHBpYJadaJ8hFh0uJXePfUYAHYi5Qk+N9A50EECIZnUq1YmO+NdIRaGtJZWlFIsNGEew5kADLlQKxAFZfYt6HfjX6qap8RoVNJhy4LpS0PqVsd1lRDZGiqzo3qgAGzZXVvUry2grfOt1Jp5Nnj/tUCvNuYmRRBus26BvilYy4iO5/AUBJzeDNPYFPrDEG3kXBngmAtPq48NGeFmfAaJxwpt/+w34p6/1rXU9Gr799YQnqMVbL2th9elUkEq4p5AGqKQK90TGTo/h1JkV5VcKLHjbuCeacWovFpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ElGpiJYk0tndc+3Afq7hTEA1H4TbqAkn8tyX2XWXAw8=;
 b=LZXE8JztcD4xaKrdpruZ5Z84UfavmIUaUSBM4r2ABGlX9JIQE+nRG4DKMoqTdb6WU32ayqBtOiGT3YLi1aZUpgl+/y+4TpztMynWpWv++kQM6XXvmqcMN+PiMachYL8nsdG9y2+WurzzSGPHFf5LSmG1lgfOzvetRIDtGAOD2LDiJcFB8z61br8ZNYgiQ/DUi8j+nYZeopk/D+UZcVxLvWg7r+QCEvOcBm2+c6lNyk26Dg7Ee7ajlEuSgYY+41kgHCLVUt0TK6E9Pr/I4gZaUwGobJZwSiybMN7CUlCyx4Je6mt61xvQNcINhQDpfLUm9ngPlNa/cU2wY6vhZZRGXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ElGpiJYk0tndc+3Afq7hTEA1H4TbqAkn8tyX2XWXAw8=;
 b=UpbuUz8CCl2OCMV0Ksmqx7zvocPcIsNL/IiT3AUO7G7vCcg7gN0YHpyCtquEx5VFmKqsnvHrfjyomeCBuYHPO2A/4ZoLfYkudzvQn1QmzhbQu2DXaRFgjbQ+fmyDXSiWy68MV1L8LabXKlR2cvD+lwElgmwlTM7PCROXJzvorqw=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
Received: from DBBPR04MB7930.eurprd04.prod.outlook.com (2603:10a6:10:1ea::12)
 by DB7PR04MB5241.eurprd04.prod.outlook.com (2603:10a6:10:1d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.31; Tue, 1 Jun
 2021 06:13:40 +0000
Received: from DBBPR04MB7930.eurprd04.prod.outlook.com
 ([fe80::3921:acd6:3201:b209]) by DBBPR04MB7930.eurprd04.prod.outlook.com
 ([fe80::3921:acd6:3201:b209%4]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 06:13:39 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     linus.walleij@linaro.org, shawnguo@kernel.org,
        aisheng.dong@nxp.com, stefan@agner.ch, robh+dt@kernel.org
Cc:     linux-imx@nxp.com, festevam@gmail.com, kernel@pengutronix.de,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 2/2] pinctrl: imx8ulp: Add pinctrl driver support
Date:   Tue,  1 Jun 2021 14:23:38 +0800
Message-Id: <20210601062338.1969040-2-ping.bai@nxp.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210601062338.1969040-1-ping.bai@nxp.com>
References: <20210601062338.1969040-1-ping.bai@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: SG2PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:3:17::15) To DBBPR04MB7930.eurprd04.prod.outlook.com
 (2603:10a6:10:1ea::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.71) by SG2PR02CA0003.apcprd02.prod.outlook.com (2603:1096:3:17::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend Transport; Tue, 1 Jun 2021 06:13:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee6c97cf-bfc0-42e0-9f9b-08d924c4662c
X-MS-TrafficTypeDiagnostic: DB7PR04MB5241:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB524162FBBFE3A8EA685ABAF6873E9@DB7PR04MB5241.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YCZEyfxcK1x7QAozczbElQZbszg04/i0Dm1xvEYr9DoJ67QJuICiWh8euoSQ1OsUKFa9TCEPdFLGlu7F71LiS3kyTqDpuAYROxpmIg7IKrc9s8X/afzSC0D3rycxCL5AxZviO5Nhkj6HPOFcDjwDVzbU31CXpJl1ZCOInVVm3A0wB0AGr9YCxCtK6nyRshCM2CoLa8rH3ccD8QQ0d6nf5zBMyDczSGBDIYUYHuf3kQL63040kAzmM0O+f6tuGxcCFqtPDV4SK9LudwdzTj+Gx+ulwnDFqK5tmsoUKuyHKnYdLeIqnNT+GecIJQFvxxtM6DR67bD9TFa/YiTUppa2o8ZN3v8wKAzzH45oWQR1KuaR2RsdtaAyyH4ccdV1xf/gWrtCdKVMBCrPN0kOKdI0y+Zx+/8lgsN79tS5jeP6TylsvsYu+tlTlsJzZM9IYdXGxIr5hzdlJVslQhOaIW8KWO2IJOpQr6SUAwQ2VQ6jbKn1lDodqqbu1Waj/AvVfoM+xublrxoxuIco4uNjhmUAELxAvNHlZUHYtTKvjHHgMrXVk+evKbVqh7KPTtcS2656RRM4IXA/FaJPelV0u6u2Kf6vwhOj1FuzDWbbTB7/45dsQCtbIfEWNHyZDsH+HpKlKFGO6A07vPwz97LJLGZ224vOWL7AehHXO3Mgkc+iQwXqOk0HUm6hoeudhXKAW36Maxy7YLc/HnaMN5uoP5xKMg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7930.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(366004)(136003)(39860400002)(38100700002)(478600001)(66476007)(52116002)(36756003)(4326008)(38350700002)(6512007)(86362001)(186003)(1076003)(16526019)(8676002)(316002)(26005)(2616005)(6506007)(6486002)(8936002)(2906002)(66946007)(66556008)(956004)(5660300002)(69590400013)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?d0UGTnCVQsYqqhLn8gZ6cePC0JME1ro5FXsvaPL3K80+Hc/JeCdQlN2EFFyV?=
 =?us-ascii?Q?j1C1CinBTmB1XGjQyMegPVR371MYQr6qOLMWeXIzUIvyTRhbPtQHaEvV9OoD?=
 =?us-ascii?Q?1Wwqb+nKkQKcJpJhHv7PU7n1lAUnu+u9d3QjHH7NROD1UZs9FAzX/i6SLccM?=
 =?us-ascii?Q?O1eBPLyRaWa2y+J853g0CWrnSASKVEFbVL7AbZ9A9tLWpQDudwOQc07NsuKh?=
 =?us-ascii?Q?RWqn7cUehPUK8KXs7njM/1FGv4lYPL3ZOYtq063oaPVxBpRfgYneVq81h2M3?=
 =?us-ascii?Q?yZ5uDYisuDLCX5YrqcHqtX/wUwX02H5/arvyA+oVydT1JZfTJN9jLd2DvBsP?=
 =?us-ascii?Q?11HL3hMcMWwK5cld+TogVOy5RRZ+sGek1sEglwbOx1KVc8T6YDJWcnfh2OT2?=
 =?us-ascii?Q?EJQyuEbQIjNxN5GoqrN3wVqeOMG/RRGjO5qXuXEyPkRkwVfAF1MPoqK001a6?=
 =?us-ascii?Q?UJI8bzQudpqTQrJRfSQMg7hoWoS3mFq7scatx3CxDAphdOYjTmTaSoTfP7Ok?=
 =?us-ascii?Q?1stf9WfdJGuZ3C0N7m+TIuC4dnwACepXMjsk4rvqWDQqOjPKcJXuUYEk0+ZQ?=
 =?us-ascii?Q?O5dkakikTxm7KOMemI22sd1PsRWyxtYcYo5Dfv4kGYr7dgi9nHJcHagm9Rp9?=
 =?us-ascii?Q?HziKInVDL0w00WjkbBRvzY+yoT0QIZL1mdSV+Ll5TC1vnT6IxNdwJJ1B2xKD?=
 =?us-ascii?Q?UAfbdRqAGrN2cbwC0zfQWmKQ2ySh+BhsUx+qVefO9OVhZ+RGSp/CEiI7I1EA?=
 =?us-ascii?Q?ZIQriZSXdaJXkzpaYlgBOn5xroOtMXml7sGRQ/tuEO/nRyfJeOAjAcrjZTZN?=
 =?us-ascii?Q?CCSj168c/jELTnyCM89fbpbLu8tFKttU9TITqzCtU14V1hlnIkDhaP8jlEY1?=
 =?us-ascii?Q?Qf2Za2tVpxRmqGkI9oMJmygoLKeP0YlDx7aeeGelJ5SpFyJH0VCyHGY9/FSP?=
 =?us-ascii?Q?PNvuRGZtWHywhPRBVfggkdTj0cSEzlsYaTBDhi2kcuqE0zwTFE4ffThstgkt?=
 =?us-ascii?Q?haIS7LZUmPjyD+xtvCEWT110XGcKy4pvu/KtFRt+SJOugEf3Yl8zYBf4imL+?=
 =?us-ascii?Q?HhMGNi9eFzzi0TpzJB28lsIYjrSxmjASYqgbfH28e6nG9Un5myT3qD/wlyCO?=
 =?us-ascii?Q?ZXXN/pBvlqucEga1/c1cKee9pL1AfFVKd1qvDsUyxn8A2ZbrvFPcWOX8pUFV?=
 =?us-ascii?Q?M4lQ51725iAR1jrt3x9YVH9VivK1Y5tXwfafVD+aOZHkNOq3Dzn9lW/Crn6J?=
 =?us-ascii?Q?1rqcJE+65ERvOSQp2eegB5YqnKWp7W6DalYxHs39R8c1cu6aQ87f2836xFvD?=
 =?us-ascii?Q?6BOTsFkpRWlYkpJEETt3Bl6Q?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee6c97cf-bfc0-42e0-9f9b-08d924c4662c
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7930.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 06:13:39.8794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VSK8ZVLym2VDTl2x5dFQITNZ3hgx6UKUGtFw6fd4QJKXBIOq3MD2rxAbiRzdUfRHpHmMPR4jDRRvQL+7Cnqj3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5241
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

Add i.MX8ULP pinctrl driver support.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
 drivers/pinctrl/freescale/Kconfig           |   7 +
 drivers/pinctrl/freescale/Makefile          |   1 +
 drivers/pinctrl/freescale/pinctrl-imx8ulp.c | 278 ++++++++++++++++++++
 3 files changed, 286 insertions(+)
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
index 000000000000..f8572597a54e
--- /dev/null
+++ b/drivers/pinctrl/freescale/pinctrl-imx8ulp.c
@@ -0,0 +1,278 @@
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
+	pin_reg = &ipctl->pin_regs[offset];
+	if (pin_reg->mux_reg == -1)
+		return -EINVAL;
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

