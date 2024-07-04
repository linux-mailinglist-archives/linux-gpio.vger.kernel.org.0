Return-Path: <linux-gpio+bounces-8034-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EA1926F12
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2024 07:48:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 50B7FB21CF5
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2024 05:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5EB41A08C9;
	Thu,  4 Jul 2024 05:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="f8G4Elgy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10olkn2052.outbound.protection.outlook.com [40.92.42.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09FA1A08BF;
	Thu,  4 Jul 2024 05:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.42.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720072070; cv=fail; b=f2Ye/IrZNVQEUGqpDgLg7nr4VP6Gfy1YAv836Xa6LnRyehIbv6dmYbsg3AWOqkxE9Gayb3w+d6o/ZxQRkPoKugJmHL3B1S9HFOVWCGiLQnL6L4Gq2PV9H/+dgrSrN5F1NVO5xvYLHgBhhu6Dgjfy4CMFvBj+VdJiAPqCpnPSiJI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720072070; c=relaxed/simple;
	bh=XdrW8LBN5KixgErknwSU9EyLUg3yNtj539gDYzX+lGo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Nktv+rgMcDipo19MK5Qu9UdwJWdFRAhnl3EVX64fb4Yh4L3mAxidT8q2AVqZHwZ6qwR6mp50dk2b9nuu6WC2BR/jLw1Fty4Gf5mM9UmI1TSa2ko9IwWcErfZoqHkZ30B95pMK8NYPhzx5Q1JalKqptWvQnMS4rYF+t+1t+Dqy3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=f8G4Elgy; arc=fail smtp.client-ip=40.92.42.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PTOoAvcKRsdN7bPMVUpSomomJQB51ZjLtkkojn11ixGyRm5POWtPUo8sGq1TDixrKm3Ju28nyIhoDFurgtnge9AzJu9O+cyNgLciLWMgIeRu0tLUsGUbkDUE1mmScgGips40un8G4yKJ0F6z7R94EKNbnan7OBr5C5Ilp5amwDVqKVCzO/mCWmA0xjf46ETYHknrUfexpfvNibPnoYDDMAUYNNjhpeI9c+mPttF5LWiEfcOO5rwYO8Gx33Wsi1j2dJfXCk1k64pcSxeLvt99DxFlyCI1dztMFcWhUYcdYCj6Pwn+fnceQVzom/LPxmvn7mOX2tIvAI72gPbr59xO1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OwVGEZwlJGyKK5AH40bTvs1bwHfhLjfENvVTpqpSC78=;
 b=dn20wDLdxqzwMy6DYk/tWVRGgoFyKa5hLSyaBsGP9Ih6d/fdeQDS7v6aWzyBZUX9VVM5eSGofwOqCXuSMaBT7SIwsmnlbLMvp+nIBiV90eVGgauAIq2/DC0m64SYav5jiQH53dcUSixnvfLCLoZTeEmvpTfDiNJquIb2FLfrewwyvpn5uPrNq0QlokX4jkW0Lt2GYAv3d7t9a8/YJ6T65vaths9bymP7bHAQsXiW5HtXoWTEuBYwG9yZIFkAMBMU0PFAPB5Gzv0YjeDWa2sL+el84jGbfdekFZKvZJlHCcnTYaHWCswQVVAbpkbPwTRwaOZJ8qB4Qc50dC4stoCFqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OwVGEZwlJGyKK5AH40bTvs1bwHfhLjfENvVTpqpSC78=;
 b=f8G4Elgyi2FjvoRWWRwTxjm3fDFrzJu9gJgXow4WTFl6p1dw37tRtwEhpoNwyIsBQlaKkc+OarbXuM5cixxsVlzB7101hG9+PS2Je/e4juOLbxFi1AHWECHeCi1gNeRZ2YuJitum87SWQUU22c9699hlDYi7zUpNKCtr0+0LmHpsM4Vg95D+/dKGVoxy2ndQiH04T6NeeUINurYcZWsFWT35XyqmOeed59ZfnvqHjdDjsKqvKPXCKdQGTVdZByJPOjd3x2aSVJiH9Q2hfNjb4rxPa76JPA/yohJ/To3ffAWYhuMqXLz/39ZZ+E2rK3DOW6/xnQyQv10m5SqEV4Rv4Q==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by MW4PR20MB4293.namprd20.prod.outlook.com (2603:10b6:303:184::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33; Thu, 4 Jul
 2024 05:47:46 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%6]) with mapi id 15.20.7741.017; Thu, 4 Jul 2024
 05:47:45 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Drew Fustini <dfustini@baylibre.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 5/7] pinctrl: sophgo: add support for SG2002 SoC
Date: Thu,  4 Jul 2024 13:46:41 +0800
Message-ID:
 <IA1PR20MB4953059D878F45806106A6F8BBDE2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <IA1PR20MB49530F0476B98DBB835B344FBBDE2@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49530F0476B98DBB835B344FBBDE2@IA1PR20MB4953.namprd20.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [VMKHuaLtQu45m7bXVdIMBfFp/Qe5xDIQ49z7Zj8nNUQ=]
X-ClientProxiedBy: SI2PR02CA0042.apcprd02.prod.outlook.com
 (2603:1096:4:196::19) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID:
 <20240704054647.1747392-5-inochiama@outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|MW4PR20MB4293:EE_
X-MS-Office365-Filtering-Correlation-Id: f2dc7520-5713-4b06-37e8-08dc9becd436
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799006|461199028|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	x1SOpM1cte8UMkQPzUlRGNlkVKRPTzkaWXETZ/dSvXGdI3WBbbt5WxH5sal5XpRm9YmNAS3IO/IfY/yLUSpzSO8jZ3ogg6MaxnJWKtNHkFe8tpC/tM4iEqXmcmRZCT6CoAbpAu/7ORzENlBSrs94zFBPWhgUtMC7u+UX2g5XvC3TPUjFSQ4DEoHcoyw+u1EW0EWkDZKiCmDgcWX8zgl9Hcx8fR+a3jQDLxBcXEykEtXPbiEo4yMhVH3XcXOEknOuGeTj+ygUNuPmTpya9Ue8iuCk3EJeltqpuL6ar/IvjFs2d/fqiyAfqlhq62C/cerJgaSFouLbdPn24earRrHqjvasYbiA87G+sy0BpByTcqWUU2JJn7BwQ4UJU7u0LO11QBHufeXRy9SX3sPlJau4SSocwAS2IH3+gtrQ90/J8kI0PO3vt1jtk/WPvFZ9K+blCmz8p/zIwigVy8tISL7wzf2UlEzuGujFlQkQZdbki+FnN4V+PrHwqgU9miVBh+iYxHveYMUEzurEvq4C7HTjTqeLbindlPGx0Gr3LsLZ3Z4S3W4U5oApqKb7CEqxgHL7REZSdwIt+Kczkv44Cf5JV26L7tfxl4A3rqbmyKL2D1JBiKXOPBTedmnYnGTH+7sIOhxFxhdlfaWKZ2BG5VT/0g==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?f72WZ+BR4d4fXgiX2Y6hWH+uRRg6RkuKOaUHG2izoZu7Gal9RC+9kGY9HnyM?=
 =?us-ascii?Q?AP9bhKHnIQR5UXpJguPNAHX0qi9+FhDa5E3VZgo75m4xJRbeU8xEZVqp/uyQ?=
 =?us-ascii?Q?arVxDn5hbFowd7D1pSoZhosx6FrbEzANHleIA9l72jznuf0vZ5nGcI6PntP6?=
 =?us-ascii?Q?1X7Q84ar3QFy9LncoZE2Eeaq8Cm0ZxDXZFcmezSnyyHQ3R7V40auLZLprFuE?=
 =?us-ascii?Q?jN6wt1JEGtgLZK3RS0KRYrBPEV91BWc/Fz0dF0pIBI53RUwd9wxfv4vym7CZ?=
 =?us-ascii?Q?E9h4eUvtB3QwmchrYvz0Ra6JLpCXEaxAkpZAgKhOwLHHFrRS63IcUU8D/qzm?=
 =?us-ascii?Q?azkA6ydQ6HEaWhRYIkMX3n7Hz+aUGhGks6hvLg6kq+GBz43pXm0+O96GQLO3?=
 =?us-ascii?Q?HBZPXbSTQ2RypWl876gprCn0yV0Mns4ILsc3fjct3N6+5FuKRojAyhTY341R?=
 =?us-ascii?Q?Mx699M5Q9RG1C/VEgNkysyJ3w1xjvlDrkvYyd4DuzUNjP60+x9iDg+43ZOdY?=
 =?us-ascii?Q?92mPOmpDaGu59UmXNL/mZNls7Iua3hyraPPw4yShJWaus9nQ2CXN1rPQoB+0?=
 =?us-ascii?Q?ezg7N0bQ3MqwCy0gvcSOIWsjrzKxZIOenyqcP5i9sajyxNU7SlM7XDlG4eeh?=
 =?us-ascii?Q?tm3E5EcCr6+sC0ygcCdve7U5GymwY7DjUd5DI6jpCzqaU9owBndKgr59juPA?=
 =?us-ascii?Q?FVs2HFXvPqISct3lbPBI+/lI2WszgmYgVW7vyqda+tS5NQhkahD4MzzmDUGz?=
 =?us-ascii?Q?pYPytoQdSy5ucT17S4R6SZBUJgxLkAW/PFGlbK+13kmpzjdHnxH+KnDrQbcr?=
 =?us-ascii?Q?zki9luSuMI10/Kx8uq1CCAnXHwgvK6c6ESiTo2jbHW5moXEn/Zqkdanzdiou?=
 =?us-ascii?Q?x9Top0VPmqQ4W9qV1SGy5NfQqoXhtf/LNupf78BjUNEMGylWg38XNvJdUn0V?=
 =?us-ascii?Q?ey+doB2gY32jsxAP8bwVIXzPI4bfueKWv5BtMB8Tj6SaFHdgEGnFisZYfOze?=
 =?us-ascii?Q?kRR5LQmDQFL464NIW3Qk2WHG8u4OAXg2QTMwwVbBhZ/RMrfExAnrerIFjYXu?=
 =?us-ascii?Q?H2gQxQ6TdxDka7FfzZxa79yL203WC+arhsZgOcuHuEuss7aGcV8f4XEcO+KU?=
 =?us-ascii?Q?z71T+HlaKWDZaopTCoW5XeWwDO4hiONE86AnYZJ64nFvx8U2BKYhl/aOC6cu?=
 =?us-ascii?Q?+ngxARyQpMXBg0/ytByTHGh3ON096Ip5F3XDWA7UJ8HRojFtg/WsUHBGLvuS?=
 =?us-ascii?Q?88vJonC3+ozomqcjBddD?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2dc7520-5713-4b06-37e8-08dc9becd436
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 05:47:45.8589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR20MB4293

Add pin definition driver of SG2002.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 drivers/pinctrl/sophgo/Kconfig          |  11 +
 drivers/pinctrl/sophgo/Makefile         |   1 +
 drivers/pinctrl/sophgo/pinctrl-sg2002.c | 373 ++++++++++++++++++++++++
 3 files changed, 385 insertions(+)
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-sg2002.c

diff --git a/drivers/pinctrl/sophgo/Kconfig b/drivers/pinctrl/sophgo/Kconfig
index 000351566fcf..b14792ee46fc 100644
--- a/drivers/pinctrl/sophgo/Kconfig
+++ b/drivers/pinctrl/sophgo/Kconfig
@@ -41,3 +41,14 @@ config PINCTRL_SOPHGO_SG2000
 	  This pin controller allows selecting the mux function for
 	  each pin. This driver can also be built as a module called
 	  pinctrl-sg2000.
+
+config PINCTRL_SOPHGO_SG2002
+	tristate "Sophgo SG2000 SoC Pinctrl driver"
+	depends on ARCH_SOPHGO || COMPILE_TEST
+	depends on OF
+	select PINCTRL_SOPHGO_CV18XX
+	help
+	  Say Y to select the pinctrl driver for SG2002 SoC.
+	  This pin controller allows selecting the mux function for
+	  each pin. This driver can also be built as a module called
+	  pinctrl-sg2002.
diff --git a/drivers/pinctrl/sophgo/Makefile b/drivers/pinctrl/sophgo/Makefile
index 16e923e3f77b..4113a5c9191b 100644
--- a/drivers/pinctrl/sophgo/Makefile
+++ b/drivers/pinctrl/sophgo/Makefile
@@ -4,3 +4,4 @@ obj-$(CONFIG_PINCTRL_SOPHGO_CV18XX)	+= pinctrl-cv18xx.o
 obj-$(CONFIG_PINCTRL_SOPHGO_CV1800B)	+= pinctrl-cv1800b.o
 obj-$(CONFIG_PINCTRL_SOPHGO_CV1812H)	+= pinctrl-cv1812h.o
 obj-$(CONFIG_PINCTRL_SOPHGO_SG2000)	+= pinctrl-sg2000.o
+obj-$(CONFIG_PINCTRL_SOPHGO_SG2002)	+= pinctrl-sg2002.o
diff --git a/drivers/pinctrl/sophgo/pinctrl-sg2002.c b/drivers/pinctrl/sophgo/pinctrl-sg2002.c
new file mode 100644
index 000000000000..78ef3cae557a
--- /dev/null
+++ b/drivers/pinctrl/sophgo/pinctrl-sg2002.c
@@ -0,0 +1,373 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Sophgo SG2002 SoC pinctrl driver.
+ *
+ * Copyright (C) 2024 Inochi Amaoto <inochiama@outlook.com>
+ *
+ * This file is generated from vendor pinout definition.
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+
+#include <dt-bindings/pinctrl/pinctrl-sg2002.h>
+
+#include "pinctrl-cv18xx.h"
+
+static const struct pinctrl_pin_desc sg2002_pins[] = {
+	PINCTRL_PIN(PIN_AUD_AINL_MIC,	"AUD_AINL_MIC"),
+	PINCTRL_PIN(PIN_AUD_AOUTR,	"AUD_AOUTR"),
+	PINCTRL_PIN(PIN_SD0_CLK,	"SD0_CLK"),
+	PINCTRL_PIN(PIN_SD0_CMD,	"SD0_CMD"),
+	PINCTRL_PIN(PIN_SD0_D0,		"SD0_D0"),
+	PINCTRL_PIN(PIN_SD0_D1,		"SD0_D1"),
+	PINCTRL_PIN(PIN_SD0_D2,		"SD0_D2"),
+	PINCTRL_PIN(PIN_SD0_D3,		"SD0_D3"),
+	PINCTRL_PIN(PIN_SD0_CD,		"SD0_CD"),
+	PINCTRL_PIN(PIN_SD0_PWR_EN,	"SD0_PWR_EN"),
+	PINCTRL_PIN(PIN_SPK_EN,		"SPK_EN"),
+	PINCTRL_PIN(PIN_UART0_TX,	"UART0_TX"),
+	PINCTRL_PIN(PIN_UART0_RX,	"UART0_RX"),
+	PINCTRL_PIN(PIN_EMMC_DAT2,	"EMMC_DAT2"),
+	PINCTRL_PIN(PIN_EMMC_CLK,	"EMMC_CLK"),
+	PINCTRL_PIN(PIN_EMMC_DAT0,	"EMMC_DAT0"),
+	PINCTRL_PIN(PIN_EMMC_DAT3,	"EMMC_DAT3"),
+	PINCTRL_PIN(PIN_EMMC_CMD,	"EMMC_CMD"),
+	PINCTRL_PIN(PIN_EMMC_DAT1,	"EMMC_DAT1"),
+	PINCTRL_PIN(PIN_JTAG_CPU_TMS,	"JTAG_CPU_TMS"),
+	PINCTRL_PIN(PIN_JTAG_CPU_TCK,	"JTAG_CPU_TCK"),
+	PINCTRL_PIN(PIN_IIC0_SCL,	"IIC0_SCL"),
+	PINCTRL_PIN(PIN_IIC0_SDA,	"IIC0_SDA"),
+	PINCTRL_PIN(PIN_AUX0,		"AUX0"),
+	PINCTRL_PIN(PIN_GPIO_ZQ,	"GPIO_ZQ"),
+	PINCTRL_PIN(PIN_PWR_VBAT_DET,	"PWR_VBAT_DET"),
+	PINCTRL_PIN(PIN_PWR_RSTN,	"PWR_RSTN"),
+	PINCTRL_PIN(PIN_PWR_SEQ1,	"PWR_SEQ1"),
+	PINCTRL_PIN(PIN_PWR_SEQ2,	"PWR_SEQ2"),
+	PINCTRL_PIN(PIN_PWR_WAKEUP0,	"PWR_WAKEUP0"),
+	PINCTRL_PIN(PIN_PWR_BUTTON1,	"PWR_BUTTON1"),
+	PINCTRL_PIN(PIN_XTAL_XIN,	"XTAL_XIN"),
+	PINCTRL_PIN(PIN_PWR_GPIO0,	"PWR_GPIO0"),
+	PINCTRL_PIN(PIN_PWR_GPIO1,	"PWR_GPIO1"),
+	PINCTRL_PIN(PIN_PWR_GPIO2,	"PWR_GPIO2"),
+	PINCTRL_PIN(PIN_SD1_D3,		"SD1_D3"),
+	PINCTRL_PIN(PIN_SD1_D2,		"SD1_D2"),
+	PINCTRL_PIN(PIN_SD1_D1,		"SD1_D1"),
+	PINCTRL_PIN(PIN_SD1_D0,		"SD1_D0"),
+	PINCTRL_PIN(PIN_SD1_CMD,	"SD1_CMD"),
+	PINCTRL_PIN(PIN_SD1_CLK,	"SD1_CLK"),
+	PINCTRL_PIN(PIN_PWM0_BUCK,	"PWM0_BUCK"),
+	PINCTRL_PIN(PIN_ADC1,		"ADC1"),
+	PINCTRL_PIN(PIN_USB_VBUS_DET,	"USB_VBUS_DET"),
+	PINCTRL_PIN(PIN_ETH_TXP,	"ETH_TXP"),
+	PINCTRL_PIN(PIN_ETH_TXM,	"ETH_TXM"),
+	PINCTRL_PIN(PIN_ETH_RXP,	"ETH_RXP"),
+	PINCTRL_PIN(PIN_ETH_RXM,	"ETH_RXM"),
+	PINCTRL_PIN(PIN_GPIO_RTX,	"GPIO_RTX"),
+	PINCTRL_PIN(PIN_MIPIRX4N,	"MIPIRX4N"),
+	PINCTRL_PIN(PIN_MIPIRX4P,	"MIPIRX4P"),
+	PINCTRL_PIN(PIN_MIPIRX3N,	"MIPIRX3N"),
+	PINCTRL_PIN(PIN_MIPIRX3P,	"MIPIRX3P"),
+	PINCTRL_PIN(PIN_MIPIRX2N,	"MIPIRX2N"),
+	PINCTRL_PIN(PIN_MIPIRX2P,	"MIPIRX2P"),
+	PINCTRL_PIN(PIN_MIPIRX1N,	"MIPIRX1N"),
+	PINCTRL_PIN(PIN_MIPIRX1P,	"MIPIRX1P"),
+	PINCTRL_PIN(PIN_MIPIRX0N,	"MIPIRX0N"),
+	PINCTRL_PIN(PIN_MIPIRX0P,	"MIPIRX0P"),
+	PINCTRL_PIN(PIN_MIPI_TXM2,	"MIPI_TXM2"),
+	PINCTRL_PIN(PIN_MIPI_TXP2,	"MIPI_TXP2"),
+	PINCTRL_PIN(PIN_MIPI_TXM1,	"MIPI_TXM1"),
+	PINCTRL_PIN(PIN_MIPI_TXP1,	"MIPI_TXP1"),
+	PINCTRL_PIN(PIN_MIPI_TXM0,	"MIPI_TXM0"),
+	PINCTRL_PIN(PIN_MIPI_TXP0,	"MIPI_TXP0"),
+};
+
+static const struct cv1800_pin sg2002_pin_data[ARRAY_SIZE(sg2002_pins)] = {
+	CV1800_FUNC_PIN(PIN_AUD_AINL_MIC, "VDD18A_MIPI",
+			IO_TYPE_AUDIO,
+			CV1800_PINCONF_AREA_SYS, 0x1bc, 5),
+	CV1800_FUNC_PIN(PIN_AUD_AOUTR, "VDD18A_MIPI",
+			IO_TYPE_AUDIO,
+			CV1800_PINCONF_AREA_SYS, 0x1c8, 6),
+	CV1800_GENERAL_PIN(PIN_SD0_CLK, "VDDIO_SD0_EMMC",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x01c, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xa00),
+	CV1800_GENERAL_PIN(PIN_SD0_CMD, "VDDIO_SD0_EMMC",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x020, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xa04),
+	CV1800_GENERAL_PIN(PIN_SD0_D0, "VDDIO_SD0_EMMC",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x024, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xa08),
+	CV1800_GENERAL_PIN(PIN_SD0_D1, "VDDIO_SD0_EMMC",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x028, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xa0c),
+	CV1800_GENERAL_PIN(PIN_SD0_D2, "VDDIO_SD0_EMMC",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x02c, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xa10),
+	CV1800_GENERAL_PIN(PIN_SD0_D3, "VDDIO_SD0_EMMC",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x030, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xa14),
+	CV1800_GENERAL_PIN(PIN_SD0_CD, "VDDIO_SD0_EMMC",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x034, 3,
+			   CV1800_PINCONF_AREA_SYS, 0x900),
+	CV1800_GENERAL_PIN(PIN_SD0_PWR_EN, "VDDIO_SD0_EMMC",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x038, 3,
+			   CV1800_PINCONF_AREA_SYS, 0x904),
+	CV1800_GENERAL_PIN(PIN_SPK_EN, "VDDIO_SD0_EMMC",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x03c, 3,
+			   CV1800_PINCONF_AREA_SYS, 0x908),
+	CV1800_GENERAL_PIN(PIN_UART0_TX, "VDDIO_SD0_EMMC",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x040, 7,
+			   CV1800_PINCONF_AREA_SYS, 0x90c),
+	CV1800_GENERAL_PIN(PIN_UART0_RX, "VDDIO_SD0_EMMC",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x044, 7,
+			   CV1800_PINCONF_AREA_SYS, 0x910),
+	CV1800_GENERAL_PIN(PIN_EMMC_DAT2, "VDDIO_SD0_EMMC",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x04c, 3,
+			   CV1800_PINCONF_AREA_SYS, 0x918),
+	CV1800_GENERAL_PIN(PIN_EMMC_CLK, "VDDIO_SD0_EMMC",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x050, 3,
+			   CV1800_PINCONF_AREA_SYS, 0x91c),
+	CV1800_GENERAL_PIN(PIN_EMMC_DAT0, "VDDIO_SD0_EMMC",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x054, 3,
+			   CV1800_PINCONF_AREA_SYS, 0x920),
+	CV1800_GENERAL_PIN(PIN_EMMC_DAT3, "VDDIO_SD0_EMMC",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x058, 3,
+			   CV1800_PINCONF_AREA_SYS, 0x924),
+	CV1800_GENERAL_PIN(PIN_EMMC_CMD, "VDDIO_SD0_EMMC",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x05c, 3,
+			   CV1800_PINCONF_AREA_SYS, 0x928),
+	CV1800_GENERAL_PIN(PIN_EMMC_DAT1, "VDDIO_SD0_EMMC",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x060, 3,
+			   CV1800_PINCONF_AREA_SYS, 0x92c),
+	CV1800_GENERAL_PIN(PIN_JTAG_CPU_TMS, "VDDIO_SD0_EMMC",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x064, 7,
+			   CV1800_PINCONF_AREA_SYS, 0x930),
+	CV1800_GENERAL_PIN(PIN_JTAG_CPU_TCK, "VDDIO_SD0_EMMC",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x068, 7,
+			   CV1800_PINCONF_AREA_SYS, 0x934),
+	CV1800_GENERAL_PIN(PIN_IIC0_SCL, "VDDIO_SD0_EMMC",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x070, 7,
+			   CV1800_PINCONF_AREA_SYS, 0x93c),
+	CV1800_GENERAL_PIN(PIN_IIC0_SDA, "VDDIO_SD0_EMMC",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x074, 7,
+			   CV1800_PINCONF_AREA_SYS, 0x940),
+	CV1800_GENERAL_PIN(PIN_AUX0, "VDDIO_SD0_EMMC",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x078, 7,
+			   CV1800_PINCONF_AREA_SYS, 0x944),
+	CV1800_GENERAL_PIN(PIN_GPIO_ZQ, "VDDIO_RTC",
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x1d0, 4,
+			   CV1800_PINCONF_AREA_RTC, 0x0e0),
+	CV1800_GENERAL_PIN(PIN_PWR_VBAT_DET, "VDDIO_RTC",
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x07c, 0,
+			   CV1800_PINCONF_AREA_RTC, 0x000),
+	CV1800_GENERAL_PIN(PIN_PWR_RSTN, "VDDIO_RTC",
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x080, 0,
+			   CV1800_PINCONF_AREA_RTC, 0x004),
+	CV1800_GENERAL_PIN(PIN_PWR_SEQ1, "VDDIO_RTC",
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x084, 3,
+			   CV1800_PINCONF_AREA_RTC, 0x008),
+	CV1800_GENERAL_PIN(PIN_PWR_SEQ2, "VDDIO_RTC",
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x088, 3,
+			   CV1800_PINCONF_AREA_RTC, 0x00c),
+	CV1800_GENERAL_PIN(PIN_PWR_WAKEUP0, "VDDIO_RTC",
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x090, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x018),
+	CV1800_GENERAL_PIN(PIN_PWR_BUTTON1, "VDDIO_RTC",
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x098, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x020),
+	CV1800_GENERAL_PIN(PIN_XTAL_XIN, "VDDIO_RTC",
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x0a0, 0,
+			   CV1800_PINCONF_AREA_RTC, 0x028),
+	CV1800_GENERAL_PIN(PIN_PWR_GPIO0, "VDDIO_RTC",
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x0a4, 4,
+			   CV1800_PINCONF_AREA_RTC, 0x02c),
+	CV1800_GENERAL_PIN(PIN_PWR_GPIO1, "VDDIO_RTC",
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x0a8, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x030),
+	CV1800_GENERAL_PIN(PIN_PWR_GPIO2, "VDDIO_RTC",
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x0ac, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x034),
+	CV1800_GENERAL_PIN(PIN_SD1_D3, "VDDIO_SD1",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x0d0, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x058),
+	CV1800_GENERAL_PIN(PIN_SD1_D2, "VDDIO_SD1",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x0d4, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x05c),
+	CV1800_GENERAL_PIN(PIN_SD1_D1, "VDDIO_SD1",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x0d8, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x060),
+	CV1800_GENERAL_PIN(PIN_SD1_D0, "VDDIO_SD1",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x0dc, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x064),
+	CV1800_GENERAL_PIN(PIN_SD1_CMD, "VDDIO_SD1",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x0e0, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x068),
+	CV1800_GENERAL_PIN(PIN_SD1_CLK, "VDDIO_SD1",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x0e4, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x06c),
+	CV1800_GENERAL_PIN(PIN_PWM0_BUCK, "VDD18A_USB_PLL_ETH",
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x0ec, 3,
+			   CV1800_PINCONF_AREA_SYS, 0x804),
+	CV1800_GENERAL_PIN(PIN_ADC1, "VDD18A_USB_PLL_ETH",
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x0f8, 4,
+			   CV1800_PINCONF_AREA_SYS, 0x810),
+	CV1800_GENERAL_PIN(PIN_USB_VBUS_DET, "VDD18A_USB_PLL_ETH",
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x108, 5,
+			   CV1800_PINCONF_AREA_SYS, 0x820),
+	CV1800_FUNC_PIN(PIN_ETH_TXP, "VDD18A_USB_PLL_ETH",
+			IO_TYPE_ETH,
+			CV1800_PINCONF_AREA_SYS, 0x124, 7),
+	CV1800_FUNC_PIN(PIN_ETH_TXM, "VDD18A_USB_PLL_ETH",
+			IO_TYPE_ETH,
+			CV1800_PINCONF_AREA_SYS, 0x128, 7),
+	CV1800_FUNC_PIN(PIN_ETH_RXP, "VDD18A_USB_PLL_ETH",
+			IO_TYPE_ETH,
+			CV1800_PINCONF_AREA_SYS, 0x12c, 7),
+	CV1800_FUNC_PIN(PIN_ETH_RXM, "VDD18A_USB_PLL_ETH",
+			IO_TYPE_ETH,
+			CV1800_PINCONF_AREA_SYS, 0x130, 7),
+	CV1800_GENERAL_PIN(PIN_GPIO_RTX, "VDD18A_USB_PLL_ETH",
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x1cc, 5,
+			   CV1800_PINCONF_AREA_SYS, 0xc8c),
+	CV1800_GENERATE_PIN_MUX2(PIN_MIPIRX4N, "VDD18A_MIPI",
+				 IO_TYPE_1V8_ONLY,
+				 CV1800_PINCONF_AREA_SYS, 0x16c, 7,
+				 CV1800_PINCONF_AREA_SYS, 0x120, 7,
+				 CV1800_PINCONF_AREA_SYS, 0xc38),
+	CV1800_GENERATE_PIN_MUX2(PIN_MIPIRX4P, "VDD18A_MIPI",
+				 IO_TYPE_1V8_ONLY,
+				 CV1800_PINCONF_AREA_SYS, 0x170, 7,
+				 CV1800_PINCONF_AREA_SYS, 0x11c, 7,
+				 CV1800_PINCONF_AREA_SYS, 0xc3c),
+	CV1800_GENERATE_PIN_MUX2(PIN_MIPIRX3N, "VDD18A_MIPI",
+				 IO_TYPE_1V8_ONLY,
+				 CV1800_PINCONF_AREA_SYS, 0x174, 7,
+				 CV1800_PINCONF_AREA_SYS, 0x114, 7,
+				 CV1800_PINCONF_AREA_SYS, 0xc40),
+	CV1800_GENERATE_PIN_MUX2(PIN_MIPIRX3P, "VDD18A_MIPI",
+				 IO_TYPE_1V8_ONLY,
+				 CV1800_PINCONF_AREA_SYS, 0x178, 7,
+				 CV1800_PINCONF_AREA_SYS, 0x118, 7,
+				 CV1800_PINCONF_AREA_SYS, 0xc44),
+	CV1800_GENERAL_PIN(PIN_MIPIRX2N, "VDD18A_MIPI",
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x17c, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc48),
+	CV1800_GENERAL_PIN(PIN_MIPIRX2P, "VDD18A_MIPI",
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x180, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc4c),
+	CV1800_GENERAL_PIN(PIN_MIPIRX1N, "VDD18A_MIPI",
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x184, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc50),
+	CV1800_GENERAL_PIN(PIN_MIPIRX1P, "VDD18A_MIPI",
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x188, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc54),
+	CV1800_GENERAL_PIN(PIN_MIPIRX0N, "VDD18A_MIPI",
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x18c, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc58),
+	CV1800_GENERAL_PIN(PIN_MIPIRX0P, "VDD18A_MIPI",
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x190, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc5c),
+	CV1800_GENERAL_PIN(PIN_MIPI_TXM2, "VDD18A_MIPI",
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x1a4, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc70),
+	CV1800_GENERAL_PIN(PIN_MIPI_TXP2, "VDD18A_MIPI",
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x1a8, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc74),
+	CV1800_GENERAL_PIN(PIN_MIPI_TXM1, "VDD18A_MIPI",
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x1ac, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc78),
+	CV1800_GENERAL_PIN(PIN_MIPI_TXP1, "VDD18A_MIPI",
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x1b0, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc7c),
+	CV1800_GENERAL_PIN(PIN_MIPI_TXM0, "VDD18A_MIPI",
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x1b4, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc80),
+	CV1800_GENERAL_PIN(PIN_MIPI_TXP0, "VDD18A_MIPI",
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x1b8, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc84),
+};
+
+static const struct cv1800_pinctrl_data sg2002_pindata = {
+	.pins = sg2002_pins,
+	.pindata = sg2002_pin_data,
+	.npins = ARRAY_SIZE(sg2002_pins),
+};
+
+static const struct of_device_id sg2002_pinctrl_ids[] = {
+	{ .compatible = "sophgo,sg2002-pinctrl", .data = &sg2002_pindata },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, sg2002_pinctrl_ids);
+
+static struct platform_driver sg2002_pinctrl_driver = {
+	.probe	= cv1800_pinctrl_probe,
+	.driver	= {
+		.name			= "sg2002-pinctrl",
+		.suppress_bind_attrs	= true,
+		.of_match_table		= sg2002_pinctrl_ids,
+	},
+};
+module_platform_driver(sg2002_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for the SG2002 series SoC");
+MODULE_LICENSE("GPL");
--
2.45.2


