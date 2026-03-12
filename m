Return-Path: <linux-gpio+bounces-33288-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Ad5ISELs2nURwAAu9opvQ
	(envelope-from <linux-gpio+bounces-33288-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 19:51:13 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 85663277594
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 19:51:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 756403033E44
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 18:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27629401A0C;
	Thu, 12 Mar 2026 18:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="eYI+S1kl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012026.outbound.protection.outlook.com [40.93.195.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02643FF8B1;
	Thu, 12 Mar 2026 18:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773341408; cv=fail; b=Q3DogBkueuQJM4GLD5/AMKEWeSHLEuLCGB+8H2mQtj/uco08hKstcQofux73QIMEsyftgosdfEJc9ZSRYMow00wS6IKGWQmhlLKsGfo5uUCREtjQk71WYZkZuP3JMY9OaqXReEfD7bgJRR73kv3jjPH2sWYeSwmvbyyLswYyLMM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773341408; c=relaxed/simple;
	bh=LubNzviG3Tlfra/SjmlRVHhu/0hx8iEZCj9/KgoInDg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DsdK7mDNHtUkCnYHQxf0HNX+ii7dAfQlk4henoKPVcK3Xhvp7ug3t4boVgBNvZNmKk+6VBijXg9aGY/edybT3w7jKJCvj3KWZOe1hAtHInYl5m39Hzqz3Rhe+i/MygLKdp5cI3xzDAfvbZ2pEv/ugph0Ld6w8sZ76KTYYNv8+AY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=eYI+S1kl; arc=fail smtp.client-ip=40.93.195.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZH7tz/S8FqIZU9TLZu5k1WG5N4XjYhk7EDz2WjDOynTXcaT9xhESMTk0IK61v+FMK4DcHEOIL5nphaaCxNVJYn7M2ktgAZUBs4YROTL7rTGn2kTNnhudptPiDTxpE2PnvUW8gTYceDlmu14xAaHZvsfUELE2vZin2YyVlp6/UbOJ2p8rW5zr4NdsylY/NRFrln8KQuGsd8exUYIv7HQiW+LZ4Z2r+q/ysmUEq7EM4fZKfnBxGntM6an8qlP1/enC88Vx0u8aLFGrxoj6aDg3y57Nc1uFrudwsx//c82RXpQa1mRV7f+xt6vNTli9EOOdxDcoP4JF0PC1wYzKPYuIcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eV7iEgDIY5aMwwGgR+sNsiROQVL0Rx0ezCcJWPboYZY=;
 b=UP1fEz2goLx+lenAuMzjsbT4HLZIbwez6MurlZI9xz/iFvY21x8XsvysGi+dira2vLxJuqXQ62kL2BAJXf3MZ70Bg/1KBJp+dZEi8a4Vq5RKBq+43Q6t+eBlUtcv6qCW03W2MEA1znvs4n3agvww14NU3vdPhgwNYbUkpH/EIbz7fkELNU+cdcMXM9gNXJq1GOocSlDdqFrPFJYdU1YQsWfUx7tsRr60X8JbuQU1ec+/szwyJsG5Vmv3iGSZk4JH4RmHnlRrU9eVjzcpYD+kLVqGeJrdT4V1wlqr4ipmYmjup7Z/AwsfzfbcBzvI37r6Vuc0oe4CRI+RDolKvxZ4ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=tipi-net.de smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eV7iEgDIY5aMwwGgR+sNsiROQVL0Rx0ezCcJWPboYZY=;
 b=eYI+S1klHgC8giT9qh0IT4LAkKyOuIsIh1AQn39XbPsyL1+2A1dubpTohc6cdLW/vPEBvF0yhRvySzqGKZ7nkeP38kAIpZZpjGzRRTXlM1BbpZTq3b9PxG9605AqSePFYcpm2+PEJgcRqZ6t7Qk+2vQ7pQW0/0e7InLM8ey29ko=
Received: from CH0PR04CA0043.namprd04.prod.outlook.com (2603:10b6:610:77::18)
 by CO6PR10MB5651.namprd10.prod.outlook.com (2603:10b6:303:14e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 18:49:57 +0000
Received: from CH2PEPF0000009D.namprd02.prod.outlook.com
 (2603:10b6:610:77:cafe::35) by CH0PR04CA0043.outlook.office365.com
 (2603:10b6:610:77::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.29 via Frontend Transport; Thu,
 12 Mar 2026 18:49:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH2PEPF0000009D.mail.protection.outlook.com (10.167.244.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 12 Mar 2026 18:49:55 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 13:49:51 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 13:49:50 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Mar 2026 13:49:50 -0500
Received: from LTPW0EX92E.dhcp.ti.com ([10.249.135.133])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62CIn54q2829533;
	Thu, 12 Mar 2026 13:49:45 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <lee@kernel.org>, <linusw@kernel.org>, <lgirdwood@gmail.com>,
	<broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <niranjan.hy@ti.com>,
	<nb@tipi-net.de>, <navada@ti.com>, <v-hampiholi@ti.com>, <sandeepk@ti.com>,
	<baojun.xu@ti.com>, <shenghao-ding@ti.com>
Subject: [PATCH v1 6/8] pinctrl: pinctrl-tac5x1x: Add TI TAC5x1x pinctrl driver
Date: Fri, 13 Mar 2026 00:18:31 +0530
Message-ID: <20260312184833.263-7-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20260312184833.263-1-niranjan.hy@ti.com>
References: <20260312184833.263-1-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009D:EE_|CO6PR10MB5651:EE_
X-MS-Office365-Filtering-Correlation-Id: 33e0295d-dcce-4d7b-dfc1-08de8068276d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|7416014|1800799024|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	vcZWWSoNHyrz1lvqtA0A2mu9S+VGAIi/fousyheDnJueNVGFHrJZ45mjSpZdgqiCuMnsdU4e2wRjBsofQoDLbh6YPJ/t8VM/PAzfCRIHSLWMyq2u0V7/4xegQR6aPBCmRgaaxmbMe6BgK1zx7WGsojDK/PVEuxy9yewu5H5fUk//Sne8S66F9i/+s1gjj54N4UhNdh06/RKf2g2yZRMht8T6jgh91BM0j1rnB+FIbXuVZ7nXT8mwf03S9OsKypn0ddksEdhLKWrFeg+KE157ZqbxxYiZ4N5IT3Rn2pjaKNy1lWiJdvz4zT/zGfSHB8YCOlcIQNZQc08TOPAC2v66+dcRdrfu4ULqxr2wL4jGjRlwyJ9Ba/KUWJMh8/02PuusdZV63mGnQDTiQGdF42b8dQA7kkokbvruxY54FX5cjPRBVLVu7cJefKIclmP8tWnh9RM8x8/yHtgA8MSKuoMDQV0vOwK8cNo4YOzUVvxwOWlgqFXScMt7Bt9zOCSpLY4auDrVaSUKf32kGgnfCySohlsllM5TW0gAoYrOddV20lujGNH7FpzF87DI7u5HCUYsXduJcpi3kP8ZRl5hn/+karMWv7aDLil/X4dihZRaQZN0mYpjEaw6nUqn1tHwutvt31DjGOK8W4AI7qQy7tcWxPYmRlgeLZzK/k2xGAyF6nL0w8Y4Dy1j2b2svI1VJvABR2WEvS9Dh8Tn9sL5g9Wfkg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(1800799024)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pAvPO9k1jj90IGFLNpV2KhxIpupaeXOV0uWoGFUrMYRWHPeppQgxctmIQ0Ua+38jkEfZ0lU3LTX97CWkq7qpcu/cYaYlSaBzn+ZRHQ+FF5w2gTW1bG49zDKbnB4+w+pY+rHutEX96W5fKhfvQgBpJ3cFVIOMRgQeRhJYMMJ24HKD53Gk0h8O5ugR8e7Pv/psE22g9kyLz7dR8yZb6q/1mII8YhezLKBwGqS+G8he9Hu2BHYxvS0POzXpxoMRLF5WxT7B+8MI90Ez9uEaaUEaRRtit1/yY28WXrytveehs+xbreDiZYf8Z7Ey+MdFzoATwxfGVpNi1W1lIUu5M2Yl2f78CcSQhB54BYWVm1HOJGiFILq5t3Yg1dxHuauQRuU2TWPdRiKiG0gHA+gudS06j96oaEEfAHou48SkGYx4TkZ2MR+RPvfuDRa5bWHwIBDJ
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 18:49:55.8726
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e0295d-dcce-4d7b-dfc1-08de8068276d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5651
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33288-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,ti.com,tipi-net.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niranjan.hy@ti.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 85663277594
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the Texas Instruments TAC5x1x pin controller driver. This driver
provides GPIO control for 5 configurable pins (GPIO1, GPIO2, GPO1, GPI1,
GPI2A) with support for GPIO, PDM, and IRQ functions.

The pinctrl driver handles:
- GPIO input/output operations
- Pin multiplexing between GPIO, PDM, and IRQ functions

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
---
 drivers/pinctrl/Kconfig           |  11 +
 drivers/pinctrl/Makefile          |   1 +
 drivers/pinctrl/pinctrl-tac5x1x.c | 889 ++++++++++++++++++++++++++++++
 3 files changed, 901 insertions(+)
 create mode 100644 drivers/pinctrl/pinctrl-tac5x1x.c

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index afecd9407f53..2054e9998880 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -585,6 +585,17 @@ config PINCTRL_SX150X
 	  - 8 bits:  sx1508q, sx1502q
 	  - 16 bits: sx1509q, sx1506q
 
+config PINCTRL_TI_TAC5X1X
+	tristate "TAC5X1X pin control driver"
+	depends on OF && (MFD_TAC5X1X || COMPILE_TEST)
+	select GENERIC_PINCTRL_GROUPS
+	select GENERIC_PINMUX_FUNCTIONS
+	select GENERIC_PINCONF
+	help
+	  TAC5X1X family may have 1 or more configurable GPIO pins
+	  which can be grouped and configured to function as PDM, GPIOs
+	  or interrupt outputs.
+
 config PINCTRL_TB10X
 	bool "Pinctrl for TB10X" if COMPILE_TEST
 	depends on OF && ARC_PLAT_TB10X || COMPILE_TEST
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index f7d5d5f76d0c..1fe6b0e8a666 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -58,6 +58,7 @@ obj-$(CONFIG_PINCTRL_SINGLE)	+= pinctrl-single.o
 obj-$(CONFIG_PINCTRL_ST) 	+= pinctrl-st.o
 obj-$(CONFIG_PINCTRL_STMFX) 	+= pinctrl-stmfx.o
 obj-$(CONFIG_PINCTRL_SX150X)	+= pinctrl-sx150x.o
+obj-$(CONFIG_PINCTRL_TI_TAC5X1X)+= pinctrl-tac5x1x.o
 obj-$(CONFIG_PINCTRL_TB10X)	+= pinctrl-tb10x.o
 obj-$(CONFIG_PINCTRL_TPS6594)	+= pinctrl-tps6594.o
 obj-$(CONFIG_PINCTRL_TH1520)	+= pinctrl-th1520.o
diff --git a/drivers/pinctrl/pinctrl-tac5x1x.c b/drivers/pinctrl/pinctrl-tac5x1x.c
new file mode 100644
index 000000000000..4e59501f3f78
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-tac5x1x.c
@@ -0,0 +1,889 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * TAC5X1X Pinctrl and GPIO driver
+ *
+ * Copyright (C) 2023-2025 Texas Instruments Incorporated - https://www.ti.com
+ */
+
+#include <linux/array_size.h>
+#include <linux/bits.h>
+#include <linux/bitfield.h>
+#include <linux/build_bug.h>
+#include <linux/err.h>
+#include <linux/gpio/driver.h>
+#include <linux/mfd/tac5x1x/registers.h>
+#include <linux/mfd/tac5x1x/core.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/string_choices.h>
+
+#include <linux/pinctrl/consumer.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinmux.h>
+
+#include "pinctrl-utils.h"
+
+/* 2 pins can be gpio */
+#define TAC5X1X_NUM_GPIO_PINS 5
+#define TAC5X1X_MAX_PINS 5
+
+struct tac5x1x_pin {
+	struct gpio_chip gpio_chip;
+	struct regmap *regmap;
+	struct device *dev;
+	struct tac5x1x *parent;
+};
+
+static const struct pinctrl_pin_desc tac5x1x_pin_pins[] = {
+	/* naming as per data sheet */
+	PINCTRL_PIN(0, "GPIO_1"),
+	PINCTRL_PIN(1, "GPIO_2"),
+	PINCTRL_PIN(2, "GPO_1"), /* same as GPO1A*/
+	PINCTRL_PIN(3, "GPI_1"), /* same as GPI1A*/
+	PINCTRL_PIN(4, "GPI_2A")
+};
+
+/* pin control registers */
+static const u32 pin_to_reg[] = {
+	TAC5X1X_GPIO1,
+	TAC5X1X_GPIO2,
+	TAC5X1X_GPO1,
+	TAC5X1X_GPI1,
+	TAC5X1X_GPI1,
+};
+
+static_assert(ARRAY_SIZE(tac5x1x_pin_pins) == ARRAY_SIZE(pin_to_reg));
+
+enum tac5x1x_gpio_pins {
+	PIN_GPIO1 = 0,
+	PIN_GPIO2,
+	PIN_GPO1,
+	PIN_GPI1,
+	PIN_GPI2A,
+};
+
+enum tac5x1x_pin_funcs {
+	TAC5X1X_FUNC_GPIO,
+	TAC5X1X_FUNC_PDM,
+	TAC5X1X_FUNC_IRQ,
+	TAC5X1X_FUNC_MAX
+};
+
+struct tac5x1x_config {
+	u32 reg;
+	u32 mask;
+	u32 val;
+};
+
+static const unsigned int tac5x1x_pin_gpio1_pins[] = { PIN_GPIO1 };
+static const unsigned int tac5x1x_pin_gpio2_pins[] = { PIN_GPIO2 };
+static const unsigned int tac5x1x_pin_gpo1_pins[] = { PIN_GPO1 };
+static const unsigned int tac5x1x_pin_gpi1_pins[] = { PIN_GPI1 };
+static const unsigned int tac5x1x_pin_gpi2a_pins[] = { PIN_GPI2A };
+
+/* pdm pins for - clk, data in */
+static const unsigned int tac5x1x_pin_pdm01_pins[] = { PIN_GPIO1, PIN_GPIO2 };
+static const unsigned int tac5x1x_pin_pdm03_pins[] = { PIN_GPIO1, PIN_GPI1 };
+static const unsigned int tac5x1x_pin_pdm04_pins[] = { PIN_GPIO1, PIN_GPI2A };
+static const unsigned int tac5x1x_pin_pdm10_pins[] = { PIN_GPIO2, PIN_GPIO1 };
+static const unsigned int tac5x1x_pin_pdm13_pins[] = { PIN_GPIO2, PIN_GPI1 };
+static const unsigned int tac5x1x_pin_pdm14_pins[] = { PIN_GPIO2, PIN_GPI2A };
+static const unsigned int tac5x1x_pin_pdm20_pins[] = { PIN_GPO1, PIN_GPIO1 };
+static const unsigned int tac5x1x_pin_pdm21_pins[] = { PIN_GPO1, PIN_GPIO2 };
+static const unsigned int tac5x1x_pin_pdm23_pins[] = { PIN_GPO1, PIN_GPI1 };
+static const unsigned int tac5x1x_pin_pdm24_pins[] = { PIN_GPO1, PIN_GPI2A };
+
+#define TAC5X1X_CFG_ENTRY(_reg, _mask, _val) \
+	{				\
+		.reg = TAC5X1X_##_reg,	\
+		.mask = TAC5X1X_##_mask,\
+		.val = TAC5X1X_##_val	\
+	}
+
+static const struct tac5x1x_config pdm_cfgs[] = {
+	/* pdm01 */
+	TAC5X1X_CFG_ENTRY(GPIO1, GPIOX_CFG_MASK, GPIO_PDMCLK),
+	TAC5X1X_CFG_ENTRY(GPIO2, GPIOX_CFG_MASK, GPIO_GPI),
+	TAC5X1X_CFG_ENTRY(INTF4, PDM_DIN12_SEL_MASK, PDM_DIN_GPI02),
+
+	/* pdm03 */
+	TAC5X1X_CFG_ENTRY(GPIO1, GPIOX_CFG_MASK, GPIO_PDMCLK),
+	TAC5X1X_CFG_ENTRY(GPI1, GPI1_CFG_MASK, GPIO_GPI),
+	TAC5X1X_CFG_ENTRY(INTF4, PDM_DIN12_SEL_MASK, PDM_DIN_GPI1),
+
+	/* pdm04 */
+	TAC5X1X_CFG_ENTRY(GPIO1, GPIOX_CFG_MASK, GPIO_PDMCLK),
+	TAC5X1X_CFG_ENTRY(GPI1, GPI2A_CFG_MASK, GPIO_GPI),
+	TAC5X1X_CFG_ENTRY(INTF4, PDM_DIN12_SEL_MASK, PDM_DIN_GPI2A),
+
+	/* pdm10 */
+	TAC5X1X_CFG_ENTRY(GPIO2, GPIOX_CFG_MASK, GPIO_PDMCLK),
+	TAC5X1X_CFG_ENTRY(GPIO1, GPIOX_CFG_MASK, GPIO_GPI),
+	TAC5X1X_CFG_ENTRY(INTF4, PDM_DIN12_SEL_MASK, PDM_DIN_GPI01),
+
+	/* pdm13 */
+	TAC5X1X_CFG_ENTRY(GPIO2, GPIOX_CFG_MASK, GPIO_PDMCLK),
+	TAC5X1X_CFG_ENTRY(GPI1, GPI1_CFG_MASK, GPIO_GPI),
+	TAC5X1X_CFG_ENTRY(INTF4, PDM_DIN12_SEL_MASK, PDM_DIN_GPI1),
+
+	/* pdm14 */
+	TAC5X1X_CFG_ENTRY(GPIO2, GPIOX_CFG_MASK, GPIO_PDMCLK),
+	TAC5X1X_CFG_ENTRY(GPI1, GPI2A_CFG_MASK, GPIO_GPI),
+	TAC5X1X_CFG_ENTRY(INTF4, PDM_DIN12_SEL_MASK, PDM_DIN_GPI2A),
+
+	/* pdm20 */
+	TAC5X1X_CFG_ENTRY(GPO1, GPIOX_CFG_MASK, GPIO_PDMCLK),
+	TAC5X1X_CFG_ENTRY(GPIO1, GPIOX_CFG_MASK, GPIO_GPI),
+	TAC5X1X_CFG_ENTRY(INTF4, PDM_DIN12_SEL_MASK, PDM_DIN_GPI01),
+
+	/* pdm21 */
+	TAC5X1X_CFG_ENTRY(GPO1, GPIOX_CFG_MASK, GPIO_PDMCLK),
+	TAC5X1X_CFG_ENTRY(GPIO2, GPIOX_CFG_MASK, GPIO_GPI),
+	TAC5X1X_CFG_ENTRY(INTF4, PDM_DIN12_SEL_MASK, PDM_DIN_GPI02),
+
+	/* pdm23 */
+	TAC5X1X_CFG_ENTRY(GPO1, GPIOX_CFG_MASK, GPIO_PDMCLK),
+	TAC5X1X_CFG_ENTRY(GPI1, GPI1_CFG_MASK, GPIO_GPI),
+	TAC5X1X_CFG_ENTRY(INTF4, PDM_DIN12_SEL_MASK, PDM_DIN_GPI1),
+
+	/* pdm24 */
+	TAC5X1X_CFG_ENTRY(GPO1, GPIOX_CFG_MASK, GPIO_PDMCLK),
+	TAC5X1X_CFG_ENTRY(GPI1, GPI2A_CFG_MASK, GPIO_GPI),
+	TAC5X1X_CFG_ENTRY(INTF4, PDM_DIN12_SEL_MASK, PDM_DIN_GPI2A),
+};
+
+static const struct tac5x1x_config irq_cfgs[] = {
+	TAC5X1X_CFG_ENTRY(GPIO1, GPIOX_CFG_MASK, GPIO_IRQ),
+	TAC5X1X_CFG_ENTRY(GPIO2, GPIOX_CFG_MASK, GPIO_IRQ),
+	TAC5X1X_CFG_ENTRY(GPO1, GPIOX_CFG_MASK, GPIO_IRQ),
+};
+
+struct tac5x1x_pingroup {
+	const char *name;
+	const unsigned int *pins;
+	const struct tac5x1x_config *regdata;
+	size_t npins; /* number of pins */
+	size_t nregdata; /* number of regdata */
+};
+
+#define TAC5X1X_PINCTRL_PINGROUP(_name, _pins, _npins, _regdata, _nregdata) \
+((struct tac5x1x_pingroup) {		\
+	.name = (_name),		\
+	.pins = (_pins),		\
+	.npins = (_npins),		\
+	.regdata = (_regdata),		\
+	.nregdata = (_nregdata),	\
+})
+
+static const struct tac5x1x_pingroup tac5x1x_pin_groups[] = {
+	TAC5X1X_PINCTRL_PINGROUP("gpio1", tac5x1x_pin_gpio1_pins,
+				 ARRAY_SIZE(tac5x1x_pin_gpio1_pins), 0, 0),
+	TAC5X1X_PINCTRL_PINGROUP("gpio2", tac5x1x_pin_gpio2_pins,
+				 ARRAY_SIZE(tac5x1x_pin_gpio2_pins), 0, 0),
+	TAC5X1X_PINCTRL_PINGROUP("gpo1", tac5x1x_pin_gpo1_pins,
+				 ARRAY_SIZE(tac5x1x_pin_gpo1_pins), 0, 0),
+	TAC5X1X_PINCTRL_PINGROUP("gpi1", tac5x1x_pin_gpi1_pins,
+				 ARRAY_SIZE(tac5x1x_pin_gpi1_pins), 0, 0),
+	TAC5X1X_PINCTRL_PINGROUP("gpi2a", tac5x1x_pin_gpi2a_pins,
+				 ARRAY_SIZE(tac5x1x_pin_gpi2a_pins), 0, 0),
+	TAC5X1X_PINCTRL_PINGROUP("pdm_gpio1_gpio2", tac5x1x_pin_pdm01_pins,
+				 ARRAY_SIZE(tac5x1x_pin_pdm01_pins),
+				 &pdm_cfgs[0], 3),
+	TAC5X1X_PINCTRL_PINGROUP("pdm_gpio1_gpi1", tac5x1x_pin_pdm03_pins,
+				 ARRAY_SIZE(tac5x1x_pin_pdm03_pins),
+				 &pdm_cfgs[3], 3),
+	TAC5X1X_PINCTRL_PINGROUP("pdm_gpio1_gpi2a", tac5x1x_pin_pdm04_pins,
+				 ARRAY_SIZE(tac5x1x_pin_pdm04_pins),
+				 &pdm_cfgs[6], 3),
+	TAC5X1X_PINCTRL_PINGROUP("pdm_gpio2_gpio1", tac5x1x_pin_pdm10_pins,
+				 ARRAY_SIZE(tac5x1x_pin_pdm10_pins),
+				 &pdm_cfgs[9], 3),
+	TAC5X1X_PINCTRL_PINGROUP("pdm_gpio2_gpi1", tac5x1x_pin_pdm13_pins,
+				 ARRAY_SIZE(tac5x1x_pin_pdm13_pins),
+				 &pdm_cfgs[12], 3),
+	TAC5X1X_PINCTRL_PINGROUP("pdm_gpio2_gpi2a", tac5x1x_pin_pdm14_pins,
+				 ARRAY_SIZE(tac5x1x_pin_pdm14_pins),
+				 &pdm_cfgs[15], 3),
+	TAC5X1X_PINCTRL_PINGROUP("pdm_gpo1_gpio1", tac5x1x_pin_pdm20_pins,
+				 ARRAY_SIZE(tac5x1x_pin_pdm20_pins),
+				 &pdm_cfgs[18], 3),
+	TAC5X1X_PINCTRL_PINGROUP("pdm_gpo1_gpio2", tac5x1x_pin_pdm21_pins,
+				 ARRAY_SIZE(tac5x1x_pin_pdm21_pins),
+				 &pdm_cfgs[21], 3),
+	TAC5X1X_PINCTRL_PINGROUP("pdm_gpo1_gpi1", tac5x1x_pin_pdm23_pins,
+				 ARRAY_SIZE(tac5x1x_pin_pdm23_pins),
+				 &pdm_cfgs[24], 3),
+	TAC5X1X_PINCTRL_PINGROUP("pdm_gpo1_gpi2a", tac5x1x_pin_pdm24_pins,
+				 ARRAY_SIZE(tac5x1x_pin_pdm24_pins),
+				 &pdm_cfgs[27], 3),
+};
+
+static int tac5x1x_pin_get_groups_count(struct pinctrl_dev *pctldev)
+{
+	return ARRAY_SIZE(tac5x1x_pin_groups);
+}
+
+static const char *tac5x1x_pin_get_group_name(struct pinctrl_dev *pctldev,
+					      unsigned int group)
+{
+	return tac5x1x_pin_groups[group].name;
+}
+
+static int tac5x1x_pin_get_group_pins(struct pinctrl_dev *pctldev,
+				      unsigned int group,
+				      const unsigned int **pins,
+				      unsigned int *num_pins)
+{
+	*pins = tac5x1x_pin_groups[group].pins;
+	*num_pins = tac5x1x_pin_groups[group].npins;
+	return 0;
+}
+
+static const struct pinctrl_ops tac5x1x_pin_group_ops = {
+	.get_groups_count = tac5x1x_pin_get_groups_count,
+	.get_group_name = tac5x1x_pin_get_group_name,
+	.get_group_pins = tac5x1x_pin_get_group_pins,
+#if IS_ENABLED(CONFIG_OF)
+	.dt_node_to_map = pinconf_generic_dt_node_to_map_all,
+	.dt_free_map = pinconf_generic_dt_free_map,
+#endif
+};
+
+static const char *const tac5x1x_pin_funcs[] = {
+	"gpio", "pdm", "irq"
+};
+
+static const char * const tac5x1x_pin_gpio_groups[] = {
+	"gpio1", "gpio2", "gpo1", "gpi1", "gpi2a"
+};
+
+static const char * const tac5x1x_pin_pdm_groups[] = {
+	"pdm_gpio1_gpio2",
+	"pdm_gpio1_gpi1",
+	"pdm_gpio1_gpi2a",
+	"pdm_gpio2_gpio1",
+	"pdm_gpio2_gpi1",
+	"pdm_gpio2_gpi2a",
+	"pdm_gpo1_gpio1",
+	"pdm_gpo1_gpio2",
+	"pdm_gpo1_gpi1",
+	"pdm_gpo1_gpi2a"
+};
+
+static const char * const tac5x1x_pin_irq_groups[] = {
+	"gpio1", "gpio2", "gpo1"
+};
+
+static const struct pinfunction tac5x1x_pin_func_groups[] = {
+	PINCTRL_PINFUNCTION("gpio", tac5x1x_pin_gpio_groups,
+			    ARRAY_SIZE(tac5x1x_pin_gpio_groups)),
+	PINCTRL_PINFUNCTION("pdm",  tac5x1x_pin_pdm_groups,
+			    ARRAY_SIZE(tac5x1x_pin_pdm_groups)),
+	PINCTRL_PINFUNCTION("irq",  tac5x1x_pin_irq_groups,
+			    ARRAY_SIZE(tac5x1x_pin_irq_groups)),
+};
+
+static_assert(ARRAY_SIZE(tac5x1x_pin_funcs) == TAC5X1X_FUNC_MAX);
+static_assert(ARRAY_SIZE(tac5x1x_pin_func_groups) == TAC5X1X_FUNC_MAX);
+
+static int tac5x1x_pin_get_func_count(struct pinctrl_dev *pctldev)
+{
+	return ARRAY_SIZE(tac5x1x_pin_funcs);
+}
+
+static const char *tac5x1x_pin_get_func_name(struct pinctrl_dev *pctldev,
+					     unsigned int func_idx)
+{
+	return tac5x1x_pin_funcs[func_idx];
+}
+
+static int tac5x1x_pin_get_func_groups(struct pinctrl_dev *pctldev,
+				       unsigned int func_idx,
+				       const char * const **groups,
+				       unsigned int * const num_groups)
+{
+	*groups = tac5x1x_pin_func_groups[func_idx].groups;
+	*num_groups = tac5x1x_pin_func_groups[func_idx].ngroups;
+
+	return 0;
+}
+
+static int tac5x1x_setup_pdm(struct pinctrl_dev *pinctrl, u32 group)
+{
+	int ret = 0, i;
+	u32 val;
+	size_t reg_count;
+	const struct tac5x1x_config *regdata;
+	struct tac5x1x_pin *priv;
+	const struct tac5x1x_pingroup *grp = &tac5x1x_pin_groups[group];
+
+	regdata = grp->regdata;
+	reg_count = grp->nregdata;
+	priv = pinctrl_dev_get_drvdata(pinctrl);
+
+	/*
+	 * PDM pin groups use naming convention: pdm_<clk_pin>_<data_pin>
+	 * First pin in the group is PDM Clock (output)
+	 * Second pin in the group is PDM Data (input)
+	 */
+	if (grp->npins >= 2) {
+		dev_dbg(priv->dev, "PDM config: %s CLK=%s DATA=%s\n", grp->name,
+			tac5x1x_pin_pins[grp->pins[0]].name,
+			tac5x1x_pin_pins[grp->pins[1]].name);
+	}
+
+	for (i = 0; i < reg_count; i++) {
+		val = (regdata[i].val << (ffs(regdata[i].mask) - 1)) & regdata[i].mask;
+		ret = regmap_update_bits(priv->regmap, regdata[i].reg,
+					 regdata[i].mask, val);
+		if (ret) {
+			dev_err(priv->dev, "pdm setup failed, reg=%x err=%d",
+				regdata[i].reg, ret);
+			break;
+		}
+	}
+
+	/* Mark PDM as enabled in parent structure for codec driver */
+	if (!ret)
+		priv->parent->pdm_enabled = true;
+
+	return ret;
+}
+
+/* configure a gpio pin to generate HW interrupt */
+static int tac5x1x_setup_irq(struct pinctrl_dev *pinctrl, u32 group)
+{
+	struct tac5x1x_pin *priv = pinctrl_dev_get_drvdata(pinctrl);
+	const struct tac5x1x_config *const cfg = &irq_cfgs[group];
+	u32 val;
+
+	dev_dbg(priv->dev, "Configuring %s as IRQ output\n",
+		tac5x1x_pin_groups[group].name);
+	val = (cfg->val << (ffs(cfg->mask) - 1)) & cfg->mask;
+	return regmap_update_bits(priv->regmap, cfg->reg, cfg->mask, val);
+}
+
+static int tac5x1x_pin_set_mux(struct pinctrl_dev *pinctrl,
+			       unsigned int func_idx, unsigned int group)
+{
+	int ret;
+	struct tac5x1x_pin *priv = pinctrl_dev_get_drvdata(pinctrl);
+
+	dev_dbg(priv->dev, "%s Setting %s(%d) to %s(%d)\n", __func__,
+		tac5x1x_pin_groups[group].name, group,
+		tac5x1x_pin_funcs[func_idx], func_idx);
+
+	switch (func_idx) {
+	case TAC5X1X_FUNC_GPIO:
+		ret = 0;
+		break;
+	case TAC5X1X_FUNC_PDM:
+		ret = tac5x1x_setup_pdm(pinctrl, group);
+		break;
+	case TAC5X1X_FUNC_IRQ:
+		ret = tac5x1x_setup_irq(pinctrl, group);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+static int tac5x1x_gpio_set_direction(struct pinctrl_dev *pctldev,
+				      struct pinctrl_gpio_range *range,
+				      unsigned int offset, bool input)
+{
+	int ret;
+	u32 val;
+	struct tac5x1x_pin *priv;
+	struct device *parent;
+
+	priv = pinctrl_dev_get_drvdata(pctldev);
+	parent = priv->dev->parent;
+
+	dev_dbg(priv->dev, "Setting gpio offset=%s to %s\n",
+		tac5x1x_pin_pins[offset].name, input ? "input" : "output");
+
+	ret = pm_runtime_resume_and_get(parent);
+	if (ret) {
+		dev_err(priv->dev, "Failed to resume for direction: %d\n", ret);
+		return ret;
+	}
+
+	val = (input ? TAC5X1X_GPIO_GPI : TAC5X1X_GPIO_GPO) <<
+		TAC5X1X_GPIOX_CFG_SHFT;
+
+	switch (offset) {
+	case PIN_GPIO1:
+	case PIN_GPIO2:
+		ret = regmap_update_bits(priv->regmap,
+					 pin_to_reg[offset],
+					 TAC5X1X_GPIOX_CFG_MASK,
+					 val);
+		break;
+	case PIN_GPO1:
+		if (input) {
+			ret = -EOPNOTSUPP;
+			break;
+		}
+		ret = regmap_update_bits(priv->regmap, pin_to_reg[offset],
+					 TAC5X1X_GPIOX_CFG_MASK, val);
+		break;
+	case PIN_GPI1:
+		if (!input) {
+			ret = -EOPNOTSUPP;
+			break;
+		}
+		ret = regmap_update_bits(priv->regmap, pin_to_reg[offset],
+					 TAC5X1X_GPI1_EN_MASK, TAC5X1X_GPI1_EN_MASK);
+		break;
+	case PIN_GPI2A:
+		if (!input) {
+			ret = -EOPNOTSUPP;
+			break;
+		}
+		ret = regmap_update_bits(priv->regmap, pin_to_reg[offset],
+					 TAC5X1X_GPI2_EN_MASK, TAC5X1X_GPI2_EN_MASK);
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+		break;
+	}
+	if (ret)
+		dev_err(priv->dev, "Failed to set gpio%d direction: %d\n",
+			offset + 1, ret);
+
+	pm_runtime_mark_last_busy(parent);
+	pm_runtime_put_autosuspend(parent);
+
+	return ret;
+}
+
+static int tac5x1x_gpio_request_enable(struct pinctrl_dev *pctldev,
+				       struct pinctrl_gpio_range *range,
+				       unsigned int offset)
+{
+	return tac5x1x_pin_set_mux(pctldev, TAC5X1X_FUNC_GPIO, offset);
+}
+
+static void tac5x1x_gpio_disable_free(struct pinctrl_dev *pctldev,
+				      struct pinctrl_gpio_range *range,
+				      unsigned int offset)
+{
+	struct tac5x1x_pin *priv = pinctrl_dev_get_drvdata(pctldev);
+	struct device *parent = priv->dev->parent;
+	int ret;
+
+	/* Ensure parent device is resumed before register access */
+	ret = pm_runtime_resume_and_get(parent);
+	if (ret) {
+		dev_warn(priv->dev, "PM resume failed for gpio_disable_free: %d (ignoring)\n", ret);
+		return;
+	}
+
+	regmap_update_bits(priv->regmap, pin_to_reg[offset],
+			   TAC5X1X_GPIOX_CFG_MASK, 0);
+
+	pm_runtime_mark_last_busy(parent);
+	pm_runtime_put_autosuspend(parent);
+}
+
+static const struct pinmux_ops tac5x1x_pin_mux_ops = {
+	.get_functions_count	= tac5x1x_pin_get_func_count,
+	.get_function_name	= tac5x1x_pin_get_func_name,
+	.get_function_groups	= tac5x1x_pin_get_func_groups,
+
+	.set_mux		= tac5x1x_pin_set_mux,
+
+	.gpio_request_enable	= tac5x1x_gpio_request_enable,
+	.gpio_disable_free	= tac5x1x_gpio_disable_free,
+	.gpio_set_direction	= tac5x1x_gpio_set_direction,
+
+	.strict			= true,
+};
+
+static int tac5x1x_pin_config_get(struct pinctrl_dev *pctldev,
+				  u32 pin, unsigned long *config)
+{
+	struct tac5x1x_pin *priv = pinctrl_dev_get_drvdata(pctldev);
+	struct device *parent = priv->dev->parent;
+	u32 param = pinconf_to_config_param(*config);
+	u32 reg, value, drive_mode;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(parent);
+	if (ret) {
+		dev_err(priv->dev, "Failed to resume for config: %d\n", ret);
+		return ret;
+	}
+
+	if (pin >= TAC5X1X_MAX_PINS) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	dev_dbg(priv->dev, "Get config for %s, param=%d\n",
+		tac5x1x_pin_pins[pin].name, param);
+
+	reg = pin_to_reg[pin];
+	ret = regmap_read(priv->regmap, reg, &value);
+	if (ret) {
+		dev_err(priv->dev, "Failed to get config: %d\n", ret);
+		goto out;
+	}
+
+	drive_mode = (value & TAC5X1X_GPIOX_DRV_MASK) >> TAC5X1X_GPIOX_DRV_SHFT;
+	switch (drive_mode) {
+	case TAC5X1X_GPIO_DRV_HIZ:
+		*config = pinconf_to_config_packed(PIN_CONFIG_BIAS_HIGH_IMPEDANCE, 1);
+		break;
+	case TAC5X1X_GPIO_DRV_ALAH:
+		*config = pinconf_to_config_packed(PIN_CONFIG_DRIVE_PUSH_PULL, 1);
+		break;
+	case TAC5X1X_GPIO_DRV_ALWH:
+		*config = pinconf_to_config_packed(PIN_CONFIG_BIAS_PULL_UP, 1);
+		break;
+	case TAC5X1X_GPIO_DRV_ALHIZ:
+		*config = pinconf_to_config_packed(PIN_CONFIG_DRIVE_OPEN_DRAIN, 1);
+		break;
+	case TAC5X1X_GPIO_DRV_WLAH:
+		*config = pinconf_to_config_packed(PIN_CONFIG_BIAS_PULL_DOWN, 1);
+		break;
+	case TAC5X1X_GPIO_DRV_HIZAH:
+		*config = pinconf_to_config_packed(PIN_CONFIG_DRIVE_OPEN_SOURCE, 1);
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+		goto out;
+	}
+	ret = 0;
+out:
+	pm_runtime_mark_last_busy(parent);
+	pm_runtime_put_autosuspend(parent);
+	return ret;
+}
+
+static int tac5x1x_pin_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
+				  unsigned long *configs, unsigned int num_configs)
+{
+	struct tac5x1x_pin *priv = pinctrl_dev_get_drvdata(pctldev);
+	unsigned int val, param;
+	int ret = 0;
+
+	/*
+	 * push-pull	-> active low, active high
+	 * pull up	-> active low, weak high (on-chip pullup)
+	 * pull down	-> weak low, active high (on-chip pulldown)
+	 * open-drain	-> active low, hiz
+	 * open-source	-> hiz active low
+	 */
+	while (num_configs) {
+		val = pinconf_to_config_argument(*configs);
+		param = pinconf_to_config_param(*configs);
+		dev_dbg(priv->dev,
+			"set config for name=%s (pin=%d), param=%u val=%u\n",
+			tac5x1x_pin_pins[pin].name, pin, param, val);
+
+		switch (param) {
+		case PIN_CONFIG_DRIVE_PUSH_PULL:
+			val = TAC5X1X_GPIO_DRV_ALAH << TAC5X1X_GPIOX_DRV_SHFT;
+			break;
+		case PIN_CONFIG_BIAS_PULL_UP:
+			val = TAC5X1X_GPIO_DRV_ALWH << TAC5X1X_GPIOX_DRV_SHFT;
+			break;
+		case PIN_CONFIG_BIAS_PULL_DOWN:
+			val = TAC5X1X_GPIO_DRV_WLAH << TAC5X1X_GPIOX_DRV_SHFT;
+			break;
+		case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+			val = TAC5X1X_GPIO_DRV_ALHIZ << TAC5X1X_GPIOX_DRV_SHFT;
+			break;
+		case PIN_CONFIG_DRIVE_OPEN_SOURCE:
+			val = TAC5X1X_GPIO_DRV_HIZAH << TAC5X1X_GPIOX_DRV_SHFT;
+			break;
+		case PIN_CONFIG_BIAS_HIGH_IMPEDANCE:
+			val = TAC5X1X_GPIO_DRV_HIZ << TAC5X1X_GPIOX_DRV_SHFT;
+			break;
+		default:
+			ret = -EOPNOTSUPP;
+			break;
+		}
+
+		/* input pin can't have driver strength */
+		if (pin != PIN_GPI1 && pin != PIN_GPI2A) {
+			ret = regmap_update_bits(priv->regmap, pin_to_reg[pin],
+						 TAC5X1X_GPIOX_DRV_MASK, val);
+			if (ret)
+				dev_err(priv->dev,
+					"pinconfig error for %s(%x), err=%d",
+					tac5x1x_pin_pins[pin].name,
+					pin_to_reg[pin], ret);
+		}
+
+		if (ret)
+			break;
+
+		configs++;
+		num_configs--;
+	}
+
+	return ret;
+}
+
+static int tac5x1x_pin_config_group_get(struct pinctrl_dev *pctldev,
+					unsigned int selector, unsigned long *config)
+{
+	int i, ret = 0;
+
+	for (i = 0; i < tac5x1x_pin_groups[selector].npins; ++i) {
+		ret = tac5x1x_pin_config_get(pctldev,
+					     tac5x1x_pin_groups[selector].pins[i],
+					     config);
+		if (ret)
+			break;
+	}
+
+	return ret;
+}
+
+static int tac5x1x_pin_config_group_set(struct pinctrl_dev *pctldev,
+					unsigned int selector,
+					unsigned long *configs,
+					unsigned int num_configs)
+{
+	int i, ret = 0;
+
+	for (i = 0; i < tac5x1x_pin_groups[selector].npins; ++i) {
+		ret = tac5x1x_pin_config_set(pctldev,
+					     tac5x1x_pin_groups[selector].pins[i],
+					     configs, num_configs);
+		if (ret)
+			break;
+	}
+
+	return 0;
+}
+
+static const struct pinconf_ops tac5x1x_pin_conf_ops = {
+	.is_generic		= true,
+
+	.pin_config_get		= tac5x1x_pin_config_get,
+	.pin_config_set		= tac5x1x_pin_config_set,
+	.pin_config_group_get	= tac5x1x_pin_config_group_get,
+	.pin_config_group_set	= tac5x1x_pin_config_group_set,
+};
+
+static const struct pinctrl_desc tac5x1x_pin_desc = {
+	.name		= "tac5x1x-pinctrl",
+	.owner		= THIS_MODULE,
+
+	.pins		= tac5x1x_pin_pins,
+	.npins		= ARRAY_SIZE(tac5x1x_pin_pins),
+
+	.pctlops	= &tac5x1x_pin_group_ops,
+	.pmxops		= &tac5x1x_pin_mux_ops,
+	.confops	= &tac5x1x_pin_conf_ops,
+};
+
+static int tac5x1x_gpio_get(struct gpio_chip *chip, unsigned int offset)
+{
+	struct tac5x1x_pin *priv = gpiochip_get_data(chip);
+	struct device *parent = priv->dev->parent;
+	unsigned int val;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(parent);
+	if (ret) {
+		dev_err(priv->dev, "Failed to resume for get: %d\n", ret);
+		return ret;
+	}
+
+	ret = regmap_read(priv->regmap, TAC5X1X_GPIOVAL, &val);
+	if (ret) {
+		dev_err(priv->dev, "Failed to get gpio%d: %d\n", offset + 1, ret);
+		goto done_gpio_get;
+	}
+
+	switch (offset) {
+	case PIN_GPIO1:
+	case PIN_GPIO2:
+		ret = !!(val & BIT(3 - offset));
+		break;
+	case PIN_GPI1:
+		ret = !!(val & BIT(1));
+		break;
+	case PIN_GPI2A:
+		ret = !!(val & BIT(2));
+		break;
+	case PIN_GPO1:
+	default:
+		ret = -EINVAL;
+	}
+
+done_gpio_get:
+	pm_runtime_mark_last_busy(parent);
+	pm_runtime_put_autosuspend(parent);
+
+	return ret;
+}
+
+static int tac5x1x_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			    int value)
+{
+	struct tac5x1x_pin *priv = gpiochip_get_data(chip);
+	struct device *parent = priv->dev->parent;
+	u32 mask, val;
+	int ret;
+
+	dev_dbg(priv->dev, "setting %s to %d\n",
+		tac5x1x_pin_pins[offset].name, value);
+
+	ret = pm_runtime_resume_and_get(parent);
+	if (ret)
+		return ret;
+
+	switch (offset) {
+	case PIN_GPIO1:
+	case PIN_GPIO2:
+	case PIN_GPO1:
+		mask = BIT(7 - offset);
+		val = value ? mask : 0;
+		ret = regmap_update_bits(priv->regmap, TAC5X1X_GPIOVAL, mask,
+					 val);
+		break;
+	case PIN_GPI1:
+	case PIN_GPI2A:
+		dev_err(priv->dev, "gpi1/2a are input only, set not supported\n");
+		ret = -EINVAL;
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+		break;
+	}
+
+	pm_runtime_mark_last_busy(parent);
+	pm_runtime_put_autosuspend(parent);
+
+	return ret;
+}
+
+static int tac5x1x_gpio_direction_in(struct gpio_chip *chip,
+				     unsigned int offset)
+{
+	struct tac5x1x_pin *priv = gpiochip_get_data(chip);
+
+	dev_dbg(priv->dev, "setting %s to input",
+		tac5x1x_pin_pins[offset].name);
+
+	/* input is not supported in GPO1 pin */
+	if (offset == PIN_GPO1) {
+		dev_err(priv->dev, "gpo1 is output only, read is not supported\n");
+		return -EOPNOTSUPP;
+	}
+
+	return pinctrl_gpio_direction_input(chip, offset);
+}
+
+static int tac5x1x_gpio_direction_out(struct gpio_chip *chip,
+				      unsigned int offset, int value)
+{
+	int ret;
+
+	ret = tac5x1x_gpio_set(chip, offset, value);
+	if (ret)
+		return ret;
+
+	return pinctrl_gpio_direction_output(chip, offset);
+}
+
+static int tac5x1x_gpio_add_pin_ranges(struct gpio_chip *chip)
+{
+	struct tac5x1x_pin *priv = gpiochip_get_data(chip);
+	int ret;
+
+	dev_dbg(priv->dev, "gpio add range");
+	ret = gpiochip_add_pin_range(&priv->gpio_chip, priv->gpio_chip.label,
+				     0, 0, TAC5X1X_NUM_GPIO_PINS);
+	if (ret)
+		dev_err(priv->dev, "Failed to add GPIO pin range: %d\n", ret);
+
+	return ret;
+}
+
+static int tac5x1x_pin_probe(struct platform_device *pdev)
+{
+	struct tac5x1x *tac5x1x = dev_get_drvdata(pdev->dev.parent);
+	struct tac5x1x_pin *priv;
+	struct pinctrl_dev *pctldev;
+	struct fwnode_handle *fwnode = dev_fwnode(tac5x1x->dev);
+	int ret;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = &pdev->dev;
+	priv->regmap = tac5x1x->regmap;
+	priv->parent = tac5x1x;
+
+	priv->gpio_chip.request = gpiochip_generic_request;
+	priv->gpio_chip.free = gpiochip_generic_free;
+	priv->gpio_chip.direction_input = tac5x1x_gpio_direction_in;
+	priv->gpio_chip.direction_output = tac5x1x_gpio_direction_out;
+	priv->gpio_chip.add_pin_ranges = tac5x1x_gpio_add_pin_ranges;
+	priv->gpio_chip.get = tac5x1x_gpio_get;
+	priv->gpio_chip.set = tac5x1x_gpio_set;
+	priv->gpio_chip.label = dev_name(priv->dev);
+	priv->gpio_chip.parent = priv->dev;
+	priv->gpio_chip.can_sleep = true;
+	priv->gpio_chip.base = -1; /* no base*/
+	priv->gpio_chip.ngpio = TAC5X1X_NUM_GPIO_PINS;
+
+	if (is_of_node(fwnode)) {
+		fwnode = fwnode_get_named_child_node(fwnode, "pinctrl");
+
+		if (fwnode && !fwnode->dev)
+			fwnode->dev = priv->dev;
+	}
+
+	priv->gpio_chip.fwnode = fwnode;
+
+	device_set_node(priv->dev, fwnode);
+
+	pctldev = devm_pinctrl_register(priv->dev, &tac5x1x_pin_desc, priv);
+	if (IS_ERR(pctldev))
+		return dev_err_probe(priv->dev, PTR_ERR(pctldev),
+				     "Failed to register pinctrl\n");
+
+	ret = devm_gpiochip_add_data(priv->dev, &priv->gpio_chip, priv);
+	if (ret)
+		return dev_err_probe(priv->dev, ret,
+				     "Failed to register gpiochip\n");
+
+	return 0;
+}
+
+static const struct platform_device_id tac5x1x_pin_id_table[] = {
+	{ "tac5x1x-pinctrl", },
+	{}
+};
+MODULE_DEVICE_TABLE(platform, tac5x1x_pin_id_table);
+
+static struct platform_driver tac5x1x_pin_driver = {
+	.driver = {
+		.name	= "tac5x1x-pinctrl",
+	},
+	.probe		= tac5x1x_pin_probe,
+	.id_table	= tac5x1x_pin_id_table,
+};
+module_platform_driver(tac5x1x_pin_driver);
+
+MODULE_DESCRIPTION("TAC5X1X Pinctrl Driver");
+MODULE_AUTHOR("Niranjan H Y <niranjan.hy@ti.com>");
+MODULE_LICENSE("GPL");
-- 
2.34.1


