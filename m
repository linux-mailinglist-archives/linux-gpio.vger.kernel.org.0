Return-Path: <linux-gpio+bounces-33287-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iE9OG+cKs2kMRwAAu9opvQ
	(envelope-from <linux-gpio+bounces-33287-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 19:50:15 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A95277544
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 19:50:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 85C62303B933
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 18:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA7034014B2;
	Thu, 12 Mar 2026 18:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="b1aLmwHr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012015.outbound.protection.outlook.com [52.101.53.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D289401498;
	Thu, 12 Mar 2026 18:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773341390; cv=fail; b=KONAw/aXW7O7lA+goRbMZb6HPnUlhzU0u/Zk+s5nO7r3qqcUA2g6TyCJwZjZHOV9DFdQE59+69MAciwyjVr7oLdfSKrj4rgWu679vhCGSL7jctlFx8jlJDJ/p+h2Ur7uItJyA/tz8tr819i4ytAfjrt3wMkXYCe/MTQMznPWCJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773341390; c=relaxed/simple;
	bh=p9fN4JIwu1DOtEIUBAYcSfNjf9TrRxy2o5r0sDorn34=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PFsUIwtbn6n7MhYCZT8Rl9uvwydfbvSOSXGHFLbXe+nhllMwAopYVetSuQK26CP+kVXUwc9+I0FMgvWIyfWPGiiuYnI1gjZnFDFQkj6p+De8z5oMlXwY3Vt4IH15a7lwWCkdAIQpBRkzWG5GRcEUr9SzUs7mbAkvPZVYcuQD9IE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=b1aLmwHr; arc=fail smtp.client-ip=52.101.53.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XWzDdiOYlX0P3tFOi4ubkHRSTMB7gWNDfdLS7O/ebd2e2Tvklfzfxv0wUWzOQHHiXQPAnguyicUuKnWguVPUk+3r2aNp0zRefLgYYu8QXEbC5esBXG+HDdtLbqFnkV9Xf/GEFEwWM1FKDB2zy6n69mTL0dzKbIeSjz59FEd0BoM2NItiQCGmKCLwX4AoADFSj3PXuqB3Of8g+hMBgJjRAFy8d1PdtelWrQbyrJryBt1RNmQAS121fTwKq4ajbMhLP7PrcAInfisZ5vX3hTLvbFA5E2IGF0N68vPjr5he7QE9MIi70Brhzk7ZbFSSnWQ6qHtstxlWQNgIRgEIXB9F7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1eIEoplXhQU8OjDwHusDRHBzD3IdPIIU29qkdyc+LfA=;
 b=xiSQ/maUPpJAdyvyzXOdRRlQEcBURtFs5DmrUbuv5EsWb3wkV6UGNW6iKYNsklCec6+O05twd36kiy0veiTv3lBQzz1j9UB3PMI+eSWT+Xa4CiJtMcck2iMlh1Jr9bA1b/PAcGUYTHpYNJd4LW9DcOEfrJwJhpECRyE1/xyJRC8yN/4llhParbpZCpNrhH847MAQ1+/G688WKvUnbtN1eldvFXkDQWInB9xr6mqoQnjDcGqMuZ6pyaHqa/7N8ALu3I6clN3vdW9N83gRuf9ZeHPSqOArzCXRJ9gYW/UpHdIbwmltr9SIKVrOt6wLcZCm6W1Iyf1Ab6b6WlYnBHORdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=tipi-net.de smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1eIEoplXhQU8OjDwHusDRHBzD3IdPIIU29qkdyc+LfA=;
 b=b1aLmwHrS9N21J+S3Ue0qhXzfJCge1BLSfU6mbxJp4aM91mmwGF1jEK/0l4l1+JPesd3uMi+zu/Aju94QoX0emB+qSNzMa/kZKkmTs/wuE/xtxtC8qq54AnHy0KpmGBPt8UJ4YtvLW+5cDbROphYUNELCw2/+L5sxTWRSL/nRGk=
Received: from SJ0PR13CA0098.namprd13.prod.outlook.com (2603:10b6:a03:2c5::13)
 by IA1PR10MB6074.namprd10.prod.outlook.com (2603:10b6:208:3ae::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.14; Thu, 12 Mar
 2026 18:49:45 +0000
Received: from SJ1PEPF0000231B.namprd03.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::d1) by SJ0PR13CA0098.outlook.office365.com
 (2603:10b6:a03:2c5::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.13 via Frontend Transport; Thu,
 12 Mar 2026 18:49:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF0000231B.mail.protection.outlook.com (10.167.242.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 12 Mar 2026 18:49:45 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 13:49:44 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 13:49:44 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Mar 2026 13:49:44 -0500
Received: from LTPW0EX92E.dhcp.ti.com ([10.249.135.133])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62CIn54p2829533;
	Thu, 12 Mar 2026 13:49:38 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <lee@kernel.org>, <linusw@kernel.org>, <lgirdwood@gmail.com>,
	<broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <niranjan.hy@ti.com>,
	<nb@tipi-net.de>, <navada@ti.com>, <v-hampiholi@ti.com>, <sandeepk@ti.com>,
	<baojun.xu@ti.com>, <shenghao-ding@ti.com>
Subject: [PATCH v1 5/8] mfd: tac5x1x: Add TI TAC5x1x MFD core driver
Date: Fri, 13 Mar 2026 00:18:30 +0530
Message-ID: <20260312184833.263-6-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20260312184833.263-1-niranjan.hy@ti.com>
References: <20260312184833.263-1-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="yes"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231B:EE_|IA1PR10MB6074:EE_
X-MS-Office365-Filtering-Correlation-Id: 6752adcf-e18a-4f33-20cc-08de80682147
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|1800799024|82310400026|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	5OqocEaDDVy+jluGFPZCUf7dEkRGziCsYLsnptsmYwa9qpomjakUO4CoGeyPT/OTVTmNMXlzktAYBz5tVr+d1DgTdinB/ZNq20w1nTcxCVCKAQJj+YsFJ7UynA4Ms7kV12LpQr9U9bQh7EtW2oaZSWI288fOYmDKdtCnBJZtew8ORmKsCNjak0IGHcdOoh6uFhkJnfvnfSriV+6CvvQ00uQ12qxqDu0NIpi51/a1s4hhggFssGdmxYcvCSgfg36hbhjr5lJcXnN3+2xGkAXzl8hzgqksA7Lbzwg8R6dgcY/7o/GIxM1rnETWZvC1680rWWyB86z3G66IINqT/c7cIrO9Ry/cKVjZEAGRMwKUuS7wHCRvlmchXEe23pCcWH2kihdki+c3229UgkFird1HEW7w2XtmMbkfMv67Ut3dU5RsS9tzb/ThYwvtvsiZ/AMnpcSIogzJHza+Blut1x5AB/z0/RChcUa/uvlDKOXqunJtVQZ6kpdMPLbYGq2li789LdmDe1jlTsb5+7J1rwPuTe+/GZRRn1lwqa6juuljjfT4x8+nsxsuuFDuqysiNxhMnSV0zZAAKB6/CRaXrvfVCRsquaXe+5fzZ+Zw+xwOp4g+3ZkPWM5V4zeU8ZjOVeE0544X7043SpKdMQ77IcIvPyBxu9kxTtMOIRrRgFybDKOoLkW5nWgTdHDCVv8rlp6UsUyJRLfnd0EzyiRXJOixQA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(1800799024)(82310400026)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	er8Z2H4UTsiAlbiFGiXRRW0pNae5Uqc3JhvU2PvXRmMQNATDw2tXoiLs8nD1tRsdVN/EXA39OmerJ3U3IXRjW4TpjuIgSISmAS5tYf7+zWgF2yjUNUsOog5uzA5IOCjrgb6XVQ2ID4tjrMq2xECWbsg+rpRLUIeNOhVPaCLa7lOsOM68F7s0CNZCUI8vFn+VoqDiKhv+i1aRjHJkypI+DSxEzz3Mh6JWnVM1MsZA/N7v/XZv5TklkjG7OvN0CusWyafDUUzVckKciqZiQTtjFVMWpoXeKVBjYNqy8VvO7J8O4KG68MeOp6eGDwE5Dcyz7bytDZ9j3eu0FK4PX0HMrqid4bo/Nx/nNmnkwcUmrRz9HQOM3ZKeoBAFbWKr2u1h8OpIKUpQel7NhexpdZvexceFRVnOgiA4XfU7tPSdW3qlgVI/KL+tM2GOtjUQSBVY
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 18:49:45.5230
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6752adcf-e18a-4f33-20cc-08de80682147
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6074
X-Spamd-Result: default: False [2.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,ti.com,tipi-net.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33287-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niranjan.hy@ti.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 34A95277544
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch adds the core Multi-Function Device (MFD) driver for the Texas
Instruments TAC5x1x family of audio codecs. The MFD core handles device
initialization, power management, and common resources for child devices.

The TAC5x1x family includes various low-power, high-performance audio
codecs with integrated GPIO functionality:
- ADC-only devices (TAA5212, TAA5412)
- DAC-only devices (TAD5112, TAD5212)
- Codec solutions (TAC5111, TAC5112, TAC5211, TAC5212,
                  TAC5301, TAC5311, TAC5312, TAC5411, TAC5412)

The core driver provides:
- I2C communication and register map definitions
- Power management and regulator control
- Child device registration for pinctrl and codec components
- Interrupt handling for diagnostic functions

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
---
 drivers/mfd/Kconfig                   |   8 +
 drivers/mfd/Makefile                  |   4 +
 drivers/mfd/tac5x1x-core.c            | 684 ++++++++++++++++++++++++++
 include/linux/mfd/tac5x1x/core.h      |  69 +++
 include/linux/mfd/tac5x1x/registers.h | 291 +++++++++++
 5 files changed, 1056 insertions(+)
 create mode 100644 drivers/mfd/tac5x1x-core.c
 create mode 100644 include/linux/mfd/tac5x1x/core.h
 create mode 100644 include/linux/mfd/tac5x1x/registers.h

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 7192c9d1d268..9ed909595edb 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1551,6 +1551,14 @@ config MFD_SC27XX_PMIC
 	  This driver provides common support for accessing the SC27xx PMICs,
 	  and it also adds the irq_chip parts for handling the PMIC chip events.
 
+config MFD_TAC5X1X
+	tristate "Texas Instruments tac5x1x core driver"
+	select MFD_CORE
+	help
+	  Select this option to enable tac5x1x multi function
+	  diver which is required for audio codec functionality and gpio
+	  pincontrol configuration for the device.
+
 config RZ_MTU3
 	tristate "Renesas RZ/G2L MTU3a core driver"
 	depends on (ARCH_RZG2L && OF) || COMPILE_TEST
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index e75e8045c28a..9f57a5ce4e8c 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -69,6 +69,10 @@ obj-$(CONFIG_MFD_WM8350)	+= wm8350.o
 obj-$(CONFIG_MFD_WM8350_I2C)	+= wm8350-i2c.o
 wm8994-objs			:= wm8994-core.o wm8994-irq.o wm8994-regmap.o
 obj-$(CONFIG_MFD_WM8994)	+= wm8994.o
+
+tac5x1x-objs			:= tac5x1x-core.o
+obj-$(CONFIG_MFD_TAC5X1X)	+= tac5x1x.o
+
 obj-$(CONFIG_MFD_WM97xx)	+= wm97xx-core.o
 
 madera-objs			:= madera-core.o
diff --git a/drivers/mfd/tac5x1x-core.c b/drivers/mfd/tac5x1x-core.c
new file mode 100644
index 000000000000..b8dee84f7c31
--- /dev/null
+++ b/drivers/mfd/tac5x1x-core.c
@@ -0,0 +1,684 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * tac5x1x-core.c -- Device access for TAC5x1x
+ *
+ * Copyright (C) 2025 Texas Instruments Incorporated
+ *
+ * Author: Niranjan H Y <niranjan.hy@ti.com>
+ */
+
+#include <linux/device.h>
+#include <linux/i2c.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/tac5x1x/core.h>
+#include <linux/mfd/tac5x1x/registers.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+
+static const char * const tac5x1x_supply_names[TAC5X1X_NUM_SUPPLIES] = {
+	"avdd",
+	"iovdd",
+};
+
+static const struct regmap_range_cfg tac5x1x_ranges[] = {
+	{
+		.range_min = 0,
+		.range_max = 12 * 128,
+		.selector_reg = TAC_PAGE_SELECT,
+		.selector_mask = GENMASK(7, 0),
+		.selector_shift = 0,
+		.window_start = 0,
+		.window_len = 128,
+	},
+};
+
+static const struct regmap_range tac5x1x_volatile_ranges[] = {
+	regmap_reg_range(TAC5X1X_RESET, TAC5X1X_RESET),
+	regmap_reg_range(TAC5X1X_REG_INT_LTCH0, TAC5X1X_REG_INT_LTCH2),
+};
+
+static const struct regmap_access_table tac5x1x_volatile_table = {
+	.yes_ranges = tac5x1x_volatile_ranges,
+	.n_yes_ranges = ARRAY_SIZE(tac5x1x_volatile_ranges),
+};
+
+/* Read-only (latch) registers */
+static const struct regmap_range tac5x1x_read_only_ranges[] = {
+	regmap_reg_range(TAC5X1X_REG_INT_LTCH0, TAC5X1X_REG_INT_LTCH2),
+};
+
+static const struct regmap_access_table tac5x1x_wr_table = {
+	.no_ranges = tac5x1x_read_only_ranges,
+	.n_no_ranges = ARRAY_SIZE(tac5x1x_read_only_ranges),
+};
+
+static const struct regmap_config tac5x1x_regmap = {
+	.max_register = 12 * 128,
+	.reg_bits = 8,
+	.val_bits = 8,
+	.cache_type = REGCACHE_MAPLE,
+	.ranges = tac5x1x_ranges,
+	.num_ranges = ARRAY_SIZE(tac5x1x_ranges),
+	.volatile_table = &tac5x1x_volatile_table,
+	.wr_table = &tac5x1x_wr_table,
+};
+
+static int tac5x1x_reset(struct tac5x1x *tac5x1x)
+{
+	int ret;
+
+	ret = regmap_write(tac5x1x->regmap, TAC5X1X_RESET, 1);
+	if (ret < 0)
+		return ret;
+	/* Wait >= 10 ms after entering sleep mode. */
+	usleep_range(10000, 100000);
+	regcache_mark_dirty(tac5x1x->regmap);
+
+	return ret;
+}
+
+static int tac5x1x_suspend(struct device *dev)
+{
+	struct tac5x1x *tac5x1x = dev_get_drvdata(dev);
+
+	regcache_cache_only(tac5x1x->regmap, true);
+	regcache_mark_dirty(tac5x1x->regmap);
+
+	/* Only disable regulators if they are currently enabled */
+	if (tac5x1x->regulators_enabled) {
+		regulator_bulk_disable(TAC5X1X_NUM_SUPPLIES, tac5x1x->supplies);
+		tac5x1x->regulators_enabled = false;
+	}
+
+	return 0;
+}
+
+static int tac5x1x_resume(struct device *dev)
+{
+	struct tac5x1x *tac5x1x = dev_get_drvdata(dev);
+	int ret;
+
+	/* Only enable regulators if they are not already enabled */
+	if (!tac5x1x->regulators_enabled) {
+		ret = regulator_bulk_enable(TAC5X1X_NUM_SUPPLIES, tac5x1x->supplies);
+		if (ret) {
+			dev_err(dev, "Failed to enable regulators: %d\n", ret);
+			return ret;
+		}
+		tac5x1x->regulators_enabled = true;
+	}
+
+	regcache_cache_only(tac5x1x->regmap, false);
+	ret = regcache_sync(tac5x1x->regmap);
+	if (ret) {
+		dev_err(dev, "Failed to restore register map: %d\n", ret);
+		regulator_bulk_disable(TAC5X1X_NUM_SUPPLIES, tac5x1x->supplies);
+		tac5x1x->regulators_enabled = false;
+		return ret;
+	}
+
+	return 0;
+}
+
+static const int vref_uv[] = {
+	2750000,
+	2500000,
+	1375000,
+};
+
+static int voltage_to_vref_cfg(int voltage_uv)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(vref_uv); i++) {
+		if (vref_uv[i] == voltage_uv)
+			return i;
+	}
+
+	return -EINVAL;
+}
+
+static const int adc_impedance_ohms[] = {
+	5000,  /* Index 0: 5 kΩ */
+	10000, /* Index 1: 10 kΩ */
+	40000, /* Index 2: 40 kΩ */
+};
+
+static int impedance_to_cfg(int impedance_ohms)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(adc_impedance_ohms); i++)
+		if (adc_impedance_ohms[i] == impedance_ohms)
+			return i;
+	return -EINVAL;
+}
+
+static int micbias_thr_current_ua_to_reg(int current_ua)
+{
+	s64 temp;
+	int n;
+
+	/*
+	 * N = ((current_uA × 10 / 48461.54) + 2) × 4095 / 144
+	 *  x 10 to remove the decimal point on both sides
+	 * Rearrange: N = (current_uA × 10 × 4095) / (48461.54 × 144) + (2 × 4095 / 144)
+	 * N = (current_uA × 40950) / 6978461.76 + 56.875
+	 */
+
+	/* First term: (current_uA × 40950) / 6978461.76 */
+	temp = (s64)current_ua * 40950; /* × 40950 */
+	temp = div_s64(temp, 6978462);	/* / 6978461.76 ≈ 6978462 */
+	/* Second term: 56.875 ≈ 57 */
+	temp += 57;
+
+	n = (int)temp;
+	n = clamp(n, 0, 255);
+
+	return n;
+}
+
+static int tac5x1x_validate_gpa_thresholds(struct tac5x1x *tac5x1x,
+					   int *thresholds_mv)
+{
+	int orig_low = thresholds_mv[0];
+	int orig_high = thresholds_mv[1];
+
+	/* Clamp thresholds to valid ranges */
+	thresholds_mv[0] = clamp(thresholds_mv[0], 0, 6000);
+	thresholds_mv[1] = clamp(thresholds_mv[1], 0, 6000);
+
+	if (thresholds_mv[0] >= thresholds_mv[1]) {
+		dev_err(tac5x1x->dev,
+			"Invalid GPA thresholds: low(%dmV) must be < high(%dmV)\n",
+			thresholds_mv[0], thresholds_mv[1]);
+		return -EINVAL;
+	}
+
+	/* Warn if values were clamped */
+	if (orig_low != thresholds_mv[0]) {
+		dev_warn(tac5x1x->dev,
+			 "GPA low threshold clamped from %dmV to %dmV\n",
+			 orig_low, thresholds_mv[0]);
+	}
+	if (orig_high != thresholds_mv[1]) {
+		dev_warn(tac5x1x->dev,
+			 "GPA high threshold clamped from %dmV to %dmV\n",
+			 orig_high, thresholds_mv[1]);
+	}
+
+	return 0;
+}
+
+/* Voltage conversion functions (from previous discussion) */
+static int voltage_mv_to_register_value(int voltage_mv)
+{
+	s64 temp;
+	int n;
+
+	/* Clamp input to reasonable range */
+	voltage_mv = clamp(voltage_mv, 0, 6000);
+
+	/*
+	 * Formula: nd = ((0.9*(N*16)/4095) - 0.225) × 6 (V)
+	 * Solving for N: N = ((voltage_V/6 + 0.225) × 4095) / 14.4
+	 */
+
+	temp = (s64)voltage_mv * 1000000; /* Scale for precision */
+	temp = div_s64(temp, 6000);	  /* voltage_mV / 6000 */
+	temp += 225000;			  /* + 0.225 * 1000000 */
+	temp = temp * 4095;		  /* × 4095 */
+	temp = div_s64(temp, 14400000);	  /* / (14.4 * 1000000) */
+
+	n = (int)temp;
+
+	return clamp(n, 0, 255);
+}
+
+static int tac5x1x_parse_gpa_thresholds(struct tac5x1x *tac5x1x)
+{
+	int thresholds_mv[2] = {200, 2600}; /* TI datasheet defaults: 0.2V, 2.6V */
+	int ret;
+
+	/* Read thresholds from device tree */
+	ret = fwnode_property_read_u32_array(tac5x1x->dev->fwnode,
+					     "ti,gpa-threshold",
+					     thresholds_mv, 2);
+	if (ret)
+		dev_dbg(tac5x1x->dev,
+			"Using default GPA thresholds: [%d, %d] mV\n",
+			thresholds_mv[0], thresholds_mv[1]);
+
+	/* Validate threshold values */
+	ret = tac5x1x_validate_gpa_thresholds(tac5x1x, thresholds_mv);
+	if (ret)
+		return ret;
+
+	/* Convert mV values to register values */
+	tac5x1x->gpa_threshold[0] = voltage_mv_to_register_value(thresholds_mv[0]);
+	tac5x1x->gpa_threshold[1] = voltage_mv_to_register_value(thresholds_mv[1]);
+
+	dev_dbg(tac5x1x->dev, "GPA thresholds: %dmV->0x%02x, %dmV->0x%02x\n",
+		thresholds_mv[0], tac5x1x->gpa_threshold[0],
+		thresholds_mv[1], tac5x1x->gpa_threshold[1]);
+
+	return 0;
+}
+
+static int tac5x1x_parse_dt(struct tac5x1x *tac5x1x,
+			    struct device_node *np)
+{
+	struct regulator *avdd_reg;
+	struct tac5x1x_input_diag_config input_config = {};
+	int vref_voltage_uv = 2500000; /* Default 2.5V */
+	int micbias_voltage_uv = 0;
+	int vref_cfg, micbias_cfg;
+	int ret;
+	int avdd_uv;
+	int adc_impedance_ohms;
+	int micbias_thr_uv[2];
+
+	avdd_reg = devm_regulator_get(tac5x1x->dev, "avdd");
+	if (IS_ERR(avdd_reg)) {
+		dev_err(tac5x1x->dev, "Failed to get avdd regulator: %ld\n", PTR_ERR(avdd_reg));
+		return PTR_ERR(avdd_reg);
+	}
+
+	avdd_uv = regulator_get_voltage(avdd_reg);
+	if (avdd_uv < 0) {
+		dev_err(tac5x1x->dev, "Failed to get avdd voltage: %d\n", avdd_uv);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	/* Read VREF voltage directly */
+	ret = fwnode_property_read_u32(tac5x1x->dev->fwnode, "ti,vref-voltage",
+				       &vref_voltage_uv);
+	if (ret)
+		dev_dbg(tac5x1x->dev, "Using default vref-voltage: %duV\n", vref_voltage_uv);
+
+	/* Validate VREF voltage is one of the supported values */
+	vref_cfg = voltage_to_vref_cfg(vref_voltage_uv);
+	if (vref_cfg < 0) {
+		dev_err(tac5x1x->dev, "Invalid vref-voltage %duV. Supported: 1375000, 2500000, 2750000\n",
+			vref_voltage_uv);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	/* Validate VREF is lower than AVDD */
+	if (vref_voltage_uv >= avdd_uv) {
+		dev_err(tac5x1x->dev, "vref-voltage (%duV) must be lower than avdd-voltage (%duV)\n",
+			vref_voltage_uv, avdd_uv);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	/* Read micbias voltage directly */
+	ret = fwnode_property_read_u32(tac5x1x->dev->fwnode,
+				       "ti,micbias-voltage",
+				       &micbias_voltage_uv);
+	if (ret) {
+		micbias_voltage_uv = vref_voltage_uv;
+		dev_dbg(tac5x1x->dev,
+			"Using default micbias-voltage: %duV\n",
+			micbias_voltage_uv);
+		ret = 0;
+	}
+
+	if (micbias_voltage_uv == avdd_uv) {
+		micbias_cfg = TAC5X1X_MICBIAS_AVDD;
+		vref_cfg = TAC5X1X_VERF_2_75V; /* VREF to 2.75V for AVDD */
+		dev_dbg(tac5x1x->dev,
+			"micbias set to AVDD (%duV),forcing VREF to 2.75V\n",
+			avdd_uv);
+	} else if (micbias_voltage_uv == vref_voltage_uv) {
+		micbias_cfg = TAC5X1X_MICBIAS_VREF;
+	} else if (micbias_voltage_uv == (vref_voltage_uv / 2)) {
+		micbias_cfg = TAC5X1X_MICBIAS_0_5VREF;
+	} else {
+		dev_err(tac5x1x->dev,
+			"Invalid micbias %duV. Must be %duV, %duV, or %duV\n",
+			micbias_voltage_uv,
+			vref_voltage_uv / 2,
+			vref_voltage_uv, avdd_uv);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	/* Store the validated configurations */
+	tac5x1x->vref_vg = vref_cfg;
+	tac5x1x->micbias_vg = micbias_cfg;
+
+	dev_dbg(tac5x1x->dev,
+		"VREF: %duV, Micbias: %duV, AVDD: %duV\n",
+		vref_voltage_uv, micbias_voltage_uv, avdd_uv);
+
+	tac5x1x->adc_impedance[0] = -1;
+	tac5x1x->adc_impedance[1] = -1;
+	tac5x1x->out2x_vcom_cfg = -1;
+
+	tac5x1x->gpa_threshold[0] = TAC5X1X_GPA_LOW_THRESHOLD;
+	tac5x1x->gpa_threshold[1] = TAC5X1X_GPA_HIGH_THRESHOLD;
+
+	ret = tac5x1x_parse_gpa_thresholds(tac5x1x);
+	if (ret)
+		return ret;
+
+	fwnode_property_read_u32(tac5x1x->dev->fwnode, "ti,out2x-vcom-cfg",
+				 &tac5x1x->out2x_vcom_cfg);
+
+	switch (tac5x1x->codec_type) {
+	case TAA5212:
+	case TAC5212:
+		if (!fwnode_property_read_u32(tac5x1x->dev->fwnode,
+					      "ti,adc2-impedance",
+					      &adc_impedance_ohms)) {
+			int adc2_cfg = impedance_to_cfg(adc_impedance_ohms);
+
+			if (adc2_cfg < 0) {
+				dev_err(tac5x1x->dev,
+					"Invalid adc2-impedance %dOhm. Supported: 5000, 10000, 40000\n",
+					adc_impedance_ohms);
+				ret = -EINVAL;
+				goto out;
+			}
+			tac5x1x->adc_impedance[1] = adc2_cfg;
+			dev_dbg(tac5x1x->dev, "ADC2 impedance: %dOhm (cfg=%d)\n",
+				adc_impedance_ohms, adc2_cfg);
+		}
+		fallthrough;
+	case TAC5211:
+	case TAC5111:
+		if (!fwnode_property_read_u32(tac5x1x->dev->fwnode,
+					      "ti,adc1-impedance",
+					      &adc_impedance_ohms)) {
+			int adc1_cfg = impedance_to_cfg(adc_impedance_ohms);
+
+			if (adc1_cfg < 0) {
+				dev_err(tac5x1x->dev,
+					"Invalid adc1-impedance %dOhm. Supported: 5000, 10000, 40000\n",
+					adc_impedance_ohms);
+				ret = -EINVAL;
+				goto out;
+			}
+			tac5x1x->adc_impedance[0] = adc1_cfg;
+			dev_dbg(tac5x1x->dev, "ADC1 impedance: %dOhm (cfg=%d)\n",
+				adc_impedance_ohms, adc1_cfg);
+		}
+		fallthrough;
+	case TAC5112:
+	case TAD5112:
+	case TAD5212:
+		break;
+	case TAA5412:
+	case TAC5411:
+	case TAC5412:
+	case TAC5301:
+	case TAC5311:
+	case TAC5312:
+		tac5x1x->input_diag_config.in_ch_en = 0;
+		if (fwnode_property_read_u32(tac5x1x->dev->fwnode,
+					     "ti,in-ch-en",
+					     &input_config.in_ch_en))
+			dev_dbg(tac5x1x->dev,
+				"Fail to get ti,in-ch-en value\n");
+		tac5x1x->input_diag_config.out_ch_en = 0;
+		if (fwnode_property_read_u32(tac5x1x->dev->fwnode,
+					     "ti,out-ch-en",
+					     &input_config.in_ch_en))
+			dev_dbg(tac5x1x->dev,
+				"Fail to get ti,out-ch-en value\n");
+		tac5x1x->input_diag_config.incl_se_inm = 0;
+		if (fwnode_property_read_u32(tac5x1x->dev->fwnode,
+					     "ti,incl-se-inm",
+					     &input_config.incl_se_inm))
+			dev_dbg(tac5x1x->dev,
+				"Fail to get ti,incl-se-inm value\n");
+		tac5x1x->input_diag_config.incl_ac_coup = 0;
+		if (fwnode_property_read_u32(tac5x1x->dev->fwnode,
+					     "ti,incl-ac-coup",
+					     &input_config.incl_ac_coup))
+			dev_dbg(tac5x1x->dev,
+				"Fail to get ti,incl-ac-coup value\n");
+		tac5x1x->input_diag_config = input_config;
+
+		if (fwnode_property_read_u32_array(tac5x1x->dev->fwnode,
+						   "ti,micbias-threshold",
+						   micbias_thr_uv, 2)) {
+			tac5x1x->micbias_thr[0] = -1;
+			tac5x1x->micbias_thr[1] = -1;
+			dev_dbg(tac5x1x->dev,
+				"ignoring micbias threshold propert read err\n");
+		} else {
+			tac5x1x->micbias_thr[0] =
+				micbias_thr_current_ua_to_reg(micbias_thr_uv[0]);
+			tac5x1x->micbias_thr[1] =
+				micbias_thr_current_ua_to_reg(micbias_thr_uv[1]);
+		}
+		break;
+	}
+out:
+	return ret;
+}
+
+static int tac5x1x_init(struct tac5x1x *tac5x1x)
+{
+	struct regmap *regmap = tac5x1x->regmap;
+
+	/* ADC Channels input coupling configuration */
+	regmap_write(regmap, TAC5X1X_ADCCH1C0, 0x04);
+	regmap_write(regmap, TAC5X1X_ADCCH2C0, 0x04);
+
+	/* Disable inputs and outputs */
+	regmap_write(regmap, TAC5X1X_CH_EN, 0x00);
+	regmap_write(regmap, TAC5X1X_PASITXCH1, 0x00);
+	regmap_write(regmap, TAC5X1X_PASITXCH2, 0x01);
+	regmap_write(regmap, TAC5X1X_PASIRXCH1, 0x00);
+	regmap_write(regmap, TAC5X1X_PASIRXCH2, 0x01);
+
+	/* clear latch irrespctive of live status */
+	regmap_write(regmap, TAC5X1X_INT, 0x11);
+
+	return 0;
+}
+
+static const struct mfd_cell tac5x1x_mfd_devs[] = {
+	{
+		.id = 0,
+		.name = "tac5x1x-pinctrl",
+		.pm_runtime_no_callbacks = true,
+	},
+	{
+		.id = 1,
+		.name = "tac5x1x-codec",
+	}
+};
+
+static int tac5x1x_setup_regulators(struct device *dev,
+				    struct tac5x1x *tac5x1x)
+{
+	int i, ret;
+
+	for (i = 0; i < TAC5X1X_NUM_SUPPLIES; i++)
+		tac5x1x->supplies[i].supply = tac5x1x_supply_names[i];
+
+	ret = devm_regulator_bulk_get(dev, TAC5X1X_NUM_SUPPLIES,
+				      tac5x1x->supplies);
+	if (ret) {
+		dev_err(dev, "Failed to get regulators: %d\n", ret);
+		return ret;
+	}
+
+	/* Regulators managed by PM runtime during probe */
+	tac5x1x->regulators_enabled = false;
+
+	return 0;
+}
+
+static int tac5x1x_probe(struct device *dev, struct tac5x1x *tac5x1x)
+{
+	struct device_node *np = dev->of_node;
+	int ret;
+
+	ret = tac5x1x_setup_regulators(dev, tac5x1x);
+	if (ret)
+		return ret;
+
+	/* Initialize PM runtime before adding child devices */
+	pm_runtime_set_autosuspend_delay(dev, 3000);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_set_active(dev);
+	pm_runtime_mark_last_busy(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
+	/* Enable regulators for device initialization */
+	ret = regulator_bulk_enable(TAC5X1X_NUM_SUPPLIES, tac5x1x->supplies);
+	if (ret) {
+		dev_err(dev, "Failed to enable regulators: %d\n", ret);
+		return ret;
+	}
+	tac5x1x->regulators_enabled = true;
+
+	ret = tac5x1x_reset(tac5x1x);
+	if (ret) {
+		dev_err(dev, "Failed to reset device\n");
+		goto err_disable_regulators;
+	}
+	tac5x1x_init(tac5x1x);
+
+	ret = tac5x1x_parse_dt(tac5x1x, np);
+	if (ret) {
+		dev_err(dev, "Failed to parse DT node: %d\n", ret);
+		goto err_disable_regulators;
+	}
+
+	/* update if vcom property is found */
+	if (tac5x1x->out2x_vcom_cfg != -1) {
+		regmap_update_bits(tac5x1x->regmap, TAC5X1X_OUT2CFG0,
+				   TAC5X1X_OUT2CFG0_VCOM_MASK,
+				   tac5x1x->out2x_vcom_cfg);
+	}
+
+	dev_dbg(dev, "%s adding mfds\n", __func__);
+
+	/* Add child devices now PM runtime is initialized */
+	ret = mfd_add_devices(dev, PLATFORM_DEVID_NONE, tac5x1x_mfd_devs,
+			      ARRAY_SIZE(tac5x1x_mfd_devs), NULL, 0, NULL);
+	if (ret) {
+		dev_err(dev, "Failed to add mfd devices\n");
+		goto err_remove_mfd;
+	}
+
+	return 0;
+
+err_remove_mfd:
+	mfd_remove_devices(dev);
+err_disable_regulators:
+	if (tac5x1x->regulators_enabled) {
+		regulator_bulk_disable(TAC5X1X_NUM_SUPPLIES, tac5x1x->supplies);
+		tac5x1x->regulators_enabled = false;
+	}
+	return ret;
+}
+
+static void tac5x1x_remove(struct tac5x1x *tac5x1x)
+{
+	mfd_remove_devices(tac5x1x->dev);
+	/* Only disable regulators if they are still enabled */
+	if (tac5x1x->regulators_enabled) {
+		regulator_bulk_disable(TAC5X1X_NUM_SUPPLIES, tac5x1x->supplies);
+		tac5x1x->regulators_enabled = false;
+	}
+}
+
+const struct of_device_id tac5x1x_of_match[] = {
+	{ .compatible = "ti,taa5212", .data = (void *)TAA5212 },
+	{ .compatible = "ti,taa5412", .data = (void *)TAA5412 },
+	{ .compatible = "ti,tac5111", .data = (void *)TAC5111 },
+	{ .compatible = "ti,tac5112", .data = (void *)TAC5112 },
+	{ .compatible = "ti,tac5211", .data = (void *)TAC5211 },
+	{ .compatible = "ti,tac5212", .data = (void *)TAC5212 },
+	{ .compatible = "ti,tac5301", .data = (void *)TAC5301 },
+	{ .compatible = "ti,tac5311", .data = (void *)TAC5311 },
+	{ .compatible = "ti,tac5312", .data = (void *)TAC5312 },
+	{ .compatible = "ti,tac5411", .data = (void *)TAC5411 },
+	{ .compatible = "ti,tac5412", .data = (void *)TAC5412 },
+	{ .compatible = "ti,tad5112", .data = (void *)TAD5112 },
+	{ .compatible = "ti,tad5212", .data = (void *)TAD5212 },
+	{}
+};
+MODULE_DEVICE_TABLE(of, tac5x1x_of_match);
+
+static int tac5x1x_i2c_probe(struct i2c_client *i2c)
+{
+	enum tac5x1x_type type;
+	struct tac5x1x *tac5x1x;
+	struct regmap *regmap;
+	const struct regmap_config *config = &tac5x1x_regmap;
+
+	tac5x1x = devm_kzalloc(&i2c->dev, sizeof(struct tac5x1x),
+			       GFP_KERNEL);
+	if (!tac5x1x)
+		return -ENOMEM;
+
+	i2c_set_clientdata(i2c, tac5x1x);
+	regmap = devm_regmap_init_i2c(i2c, config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+	type = (uintptr_t)i2c_get_match_data(i2c);
+
+	tac5x1x->dev = &i2c->dev;
+	tac5x1x->codec_type = type;
+	tac5x1x->regmap = regmap;
+
+	return tac5x1x_probe(&i2c->dev, tac5x1x);
+}
+
+static void tac5x1x_i2c_remove(struct i2c_client *client)
+{
+	tac5x1x_remove(i2c_get_clientdata(client));
+}
+
+static const struct i2c_device_id tac5x1x_id[] = {
+	{"taa5212", TAA5212},
+	{"taa5412", TAA5412},
+	{"tac5111", TAC5111},
+	{"tac5112", TAC5112},
+	{"tac5211", TAC5211},
+	{"tac5212", TAC5212},
+	{"tac5301", TAC5301},
+	{"tac5311", TAC5311},
+	{"tac5312", TAC5312},
+	{"tac5411", TAC5411},
+	{"tac5412", TAC5412},
+	{"tad5112", TAD5112},
+	{"tad5212", TAD5212},
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, tac5x1x_id);
+
+static DEFINE_RUNTIME_DEV_PM_OPS(tac5x1x_pm_ops, tac5x1x_suspend,
+				 tac5x1x_resume, NULL);
+
+static struct i2c_driver tac5x1x_i2c_driver = {
+	.driver = {
+		.name = "tac5x1x-core",
+		.pm = pm_ptr(&tac5x1x_pm_ops),
+		.of_match_table = of_match_ptr(tac5x1x_of_match),
+	},
+	.probe = tac5x1x_i2c_probe,
+	.remove = tac5x1x_i2c_remove,
+	.id_table = tac5x1x_id,
+};
+module_i2c_driver(tac5x1x_i2c_driver);
+
+MODULE_DESCRIPTION("Core support for the ASoC tac5x1x codec driver");
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Niranjan H Y <niranjan.hy@ti.com>");
+MODULE_SOFTDEP("pre: tac5x1x_pinctrl");
diff --git a/include/linux/mfd/tac5x1x/core.h b/include/linux/mfd/tac5x1x/core.h
new file mode 100644
index 000000000000..117665e36724
--- /dev/null
+++ b/include/linux/mfd/tac5x1x/core.h
@@ -0,0 +1,69 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * mfd/tac5x1x/core.h -- TAC5x1x Core Interface
+ *
+ * Copyright 2025 Texas Instruments Incorporated
+ *
+ * Author: Niranjan H Y <niranjan.hy@ti.com>
+ */
+#ifndef __MFD_TAC5X1X_CORE_H__
+#define __MFD_TAC5X1X_CORE_H__
+
+#include <linux/interrupt.h>
+#include <linux/mutex.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+
+enum tac5x1x_type {
+	TAA5212 = 0,
+	TAA5412,
+	TAC5111,
+	TAC5112,
+	TAC5211,
+	TAC5212,
+	TAC5301,
+	TAC5311,
+	TAC5312,
+	TAC5411,
+	TAC5412,
+	TAD5112,
+	TAD5212,
+};
+
+struct tac5x1x_input_diag_config {
+	s32 in_ch_en;
+	s32 out_ch_en;
+	s32 incl_se_inm;
+	s32 incl_ac_coup;
+};
+
+struct tac5x1x_irqinfo {
+	s32 irq_gpio;
+	s32 irq;
+	bool irq_enable;
+	u32 *latch_regs;
+	u8 *latch_data;
+};
+
+#define TAC5X1X_NUM_SUPPLIES 2
+
+struct tac5x1x {
+	enum tac5x1x_type codec_type;
+	s32 vref_vg;
+	s32 micbias_vg;
+	s32 uad_en;
+	s32 vad_en;
+	s32 uag_en;
+	s32 micbias_thr[2];
+	s32 gpa_threshold[2];
+	s32 adc_impedance[2];
+	s32 out2x_vcom_cfg;
+	bool pdm_enabled;
+	bool regulators_enabled;
+	struct tac5x1x_input_diag_config input_diag_config;
+	struct regulator_bulk_data supplies[TAC5X1X_NUM_SUPPLIES];
+	struct device *dev;
+	struct regmap *regmap;
+};
+
+#endif
diff --git a/include/linux/mfd/tac5x1x/registers.h b/include/linux/mfd/tac5x1x/registers.h
new file mode 100644
index 000000000000..49c327316e82
--- /dev/null
+++ b/include/linux/mfd/tac5x1x/registers.h
@@ -0,0 +1,291 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Register definitions for TAC5x1x
+ *
+ * Copyright (C) 2025 Texas Instruments Incorporated - https://www.ti.com
+ * Author: Niranjan H Y <niranjan.hy@ti.com>
+ */
+
+#ifndef __TAC5X1X_REGISTERS_H__
+#define __TAC5X1X_REGISTERS_H__
+
+#define TAC_PAGE_SELECT 0x00
+#define TAC_PAGE_ID(reg) ((reg) / 128)
+#define TAC_PAGE_REG(reg) ((reg) % 128)
+#define TAC5X1X_REG(page, reg) (((page) * 128) + (reg))
+
+#define TAC5X1X_RESET TAC5X1X_REG(0, 0x1)
+#define TAC5X1X_VREF TAC5X1X_REG(0, 0x2)
+#define TAC5X1X_VDDSTS TAC5X1X_REG(0, 0x3)
+#define TAC5X1X_MISC TAC5X1X_REG(0, 0x4)
+#define TAC5X1X_MISC1 TAC5X1X_REG(0, 0x5)
+#define TAC5X1X_DACA0 TAC5X1X_REG(0, 0x6)
+#define TAC5X1X_MISC0 TAC5X1X_REG(0, 0x7)
+/* gpio control registers */
+#define TAC5X1X_GPIO1 TAC5X1X_REG(0, 0xa)
+#define TAC5X1X_GPIO2 TAC5X1X_REG(0, 0xb)
+#define TAC5X1X_GPO1 TAC5X1X_REG(0, 0xc)
+#define TAC5X1X_GPI1 TAC5X1X_REG(0, 0xd)
+
+#define TAC5X1X_GPIOVAL TAC5X1X_REG(0, 0xe)
+#define TAC5X1X_INTF0 TAC5X1X_REG(0, 0xf)
+#define TAC5X1X_INTF1 TAC5X1X_REG(0, 0x10)
+#define TAC5X1X_INTF2 TAC5X1X_REG(0, 0x11)
+#define TAC5X1X_INTF3 TAC5X1X_REG(0, 0x12)
+#define TAC5X1X_INTF4 TAC5X1X_REG(0, 0x13)
+#define TAC5X1X_INTF5 TAC5X1X_REG(0, 0x14)
+#define TAC5X1X_INTF6 TAC5X1X_REG(0, 0x15)
+#define TAC5X1X_ASI0 TAC5X1X_REG(0, 0x18)
+#define TAC5X1X_ASI1 TAC5X1X_REG(0, 0x19)
+#define TAC5X1X_PASI0 TAC5X1X_REG(0, 0x1a)
+#define TAC5X1X_PASITX0 TAC5X1X_REG(0, 0x1b)
+#define TAC5X1X_PASITX1 TAC5X1X_REG(0, 0x1c)
+#define TAC5X1X_PASITX2 TAC5X1X_REG(0, 0x1d)
+#define TAC5X1X_PASITXCH1 TAC5X1X_REG(0, 0x1e)
+#define TAC5X1X_PASITXCH2 TAC5X1X_REG(0, 0x1f)
+#define TAC5X1X_PASITXCH3 TAC5X1X_REG(0, 0x20)
+#define TAC5X1X_PASITXCH4 TAC5X1X_REG(0, 0x21)
+#define TAC5X1X_PASITXCH5 TAC5X1X_REG(0, 0x22)
+#define TAC5X1X_PASITXCH6 TAC5X1X_REG(0, 0x23)
+#define TAC5X1X_PASITXCH7 TAC5X1X_REG(0, 0x24)
+#define TAC5X1X_PASITXCH8 TAC5X1X_REG(0, 0x25)
+#define TAC5X1X_PASIRX0 TAC5X1X_REG(0, 0x26)
+#define TAC5X1X_PASIRX1 TAC5X1X_REG(0, 0x27)
+#define TAC5X1X_PASIRXCH1 TAC5X1X_REG(0, 0x28)
+#define TAC5X1X_PASIRXCH2 TAC5X1X_REG(0, 0x29)
+#define TAC5X1X_PASIRXCH3 TAC5X1X_REG(0, 0x2a)
+#define TAC5X1X_PASIRXCH4 TAC5X1X_REG(0, 0x2b)
+#define TAC5X1X_PASIRXCH5 TAC5X1X_REG(0, 0x2c)
+#define TAC5X1X_PASIRXCH6 TAC5X1X_REG(0, 0x2d)
+#define TAC5X1X_PASIRXCH7 TAC5X1X_REG(0, 0x2e)
+#define TAC5X1X_PASIRXCH8 TAC5X1X_REG(0, 0x2f)
+#define TAC5X1X_CLK0 TAC5X1X_REG(0, 0x32)
+#define TAC5X1X_CLK1 TAC5X1X_REG(0, 0x33)
+#define TAC5X1X_CLK2 TAC5X1X_REG(0, 0x34)
+#define TAC5X1X_CNTCLK0 TAC5X1X_REG(0, 0x35)
+#define TAC5X1X_CNTCLK1 TAC5X1X_REG(0, 0x36)
+#define TAC5X1X_CNTCLK2 TAC5X1X_REG(0, 0x37)
+#define TAC5X1X_CNTCLK3 TAC5X1X_REG(0, 0x38)
+#define TAC5X1X_CNTCLK4 TAC5X1X_REG(0, 0x39)
+#define TAC5X1X_CNTCLK5 TAC5X1X_REG(0, 0x3a)
+#define TAC5X1X_CNTCLK6 TAC5X1X_REG(0, 0x3b)
+#define TAC5X1X_CLKERRSTS0 TAC5X1X_REG(0, 0x3c)
+#define TAC5X1X_CLKERRSTS1 TAC5X1X_REG(0, 0x3d)
+#define TAC5X1X_CLKDETSTS0 TAC5X1X_REG(0, 0x3e)
+#define TAC5X1X_CLKDETSTS1 TAC5X1X_REG(0, 0x3f)
+#define TAC5X1X_CLKDETSTS2 TAC5X1X_REG(0, 0x40)
+#define TAC5X1X_CLKDETSTS3 TAC5X1X_REG(0, 0x41)
+#define TAC5X1X_INT TAC5X1X_REG(0, 0x42)
+#define TAC5X1X_DAC_FLT TAC5X1X_REG(0, 0x43)
+#define TAC5X1X_ADCDACMISC TAC5X1X_REG(0, 0x4b)
+#define TAC5X1X_IADC TAC5X1X_REG(0, 0x4c)
+#define TAC5X1X_VREFCFG TAC5X1X_REG(0, 0x4d)
+#define TAC5X1X_PWRTUNE0 TAC5X1X_REG(0, 0x4e)
+#define TAC5X1X_PWRTUNE1 TAC5X1X_REG(0, 0x4f)
+#define TAC5X1X_ADCCH1C0 TAC5X1X_REG(0, 0x50)
+#define TAC5X1X_ADCCH TAC5X1X_REG(0, 0x51)
+#define TAC5X1X_ADCCH1C2 TAC5X1X_REG(0, 0x52)
+#define TAC5X1X_ADCCH1C3 TAC5X1X_REG(0, 0x53)
+#define TAC5X1X_ADCCH1C4 TAC5X1X_REG(0, 0x54)
+#define TAC5X1X_ADCCH2C0 TAC5X1X_REG(0, 0x55)
+#define TAC5X1X_ADCCH2C2 TAC5X1X_REG(0, 0x57)
+#define TAC5X1X_ADCCH2C3 TAC5X1X_REG(0, 0x58)
+#define TAC5X1X_ADCCH2C4 TAC5X1X_REG(0, 0x59)
+#define TAC5X1X_ADCCH3C0 TAC5X1X_REG(0, 0x5a)
+#define TAC5X1X_ADCCH3C2 TAC5X1X_REG(0, 0x5b)
+#define TAC5X1X_ADCCH3C3 TAC5X1X_REG(0, 0x5c)
+#define TAC5X1X_ADCCH3C4 TAC5X1X_REG(0, 0x5d)
+#define TAC5X1X_ADCCH4C0 TAC5X1X_REG(0, 0x5e)
+#define TAC5X1X_ADCCH4C2 TAC5X1X_REG(0, 0x5f)
+#define TAC5X1X_ADCCH4C3 TAC5X1X_REG(0, 0x60)
+#define TAC5X1X_ADCCH4C4 TAC5X1X_REG(0, 0x61)
+#define TAC5X1X_ADCCFG1 TAC5X1X_REG(0, 0x62)
+#define TAC5X1X_OUT1CFG0 TAC5X1X_REG(0, 0x64)
+#define TAC5X1X_OUT1CFG1 TAC5X1X_REG(0, 0x65)
+#define TAC5X1X_OUT1CFG2 TAC5X1X_REG(0, 0x66)
+#define TAC5X1X_DACCH1A0 TAC5X1X_REG(0, 0x67)
+#define TAC5X1X_DACCH1A1 TAC5X1X_REG(0, 0x68)
+#define TAC5X1X_DACCH1B0 TAC5X1X_REG(0, 0x69)
+#define TAC5X1X_DACCH1B1 TAC5X1X_REG(0, 0x6a)
+#define TAC5X1X_OUT2CFG0 TAC5X1X_REG(0, 0x6b)
+#define TAC5X1X_OUT2CFG1 TAC5X1X_REG(0, 0x6c)
+#define TAC5X1X_OUT2CFG2 TAC5X1X_REG(0, 0x6d)
+#define TAC5X1X_DACCH2A0 TAC5X1X_REG(0, 0x6e)
+#define TAC5X1X_DACCH2A1 TAC5X1X_REG(0, 0x6f)
+#define TAC5X1X_DACCH2B0 TAC5X1X_REG(0, 0x70)
+#define TAC5X1X_DACCH2B1 TAC5X1X_REG(0, 0x71)
+#define TAC5X1X_DSP0 TAC5X1X_REG(0, 0x72)
+#define TAC5X1X_DSP1 TAC5X1X_REG(0, 0x73)
+#define TAC5X1X_CH_EN TAC5X1X_REG(0, 0x76)
+#define TAC5X1X_DYN_PUPD TAC5X1X_REG(0, 0x77)
+#define TAC5X1X_PWR_CFG TAC5X1X_REG(0, 0x78)
+#define TAC5X1X_DEVSTS0 TAC5X1X_REG(0, 0x79)
+#define TAC5X1X_DEVSTS1 TAC5X1X_REG(0, 0x7a)
+
+#define TAC5X1X_CLKCFG0 TAC5X1X_REG(1, 0xd)
+#define TAC5X1X_MICBIAS1 TAC5X1X_REG(1, 0x16)
+#define TAC5X1X_AGC_DRC TAC5X1X_REG(1, 0x24)
+#define TAC5X1X_PLIM TAC5X1X_REG(1, 0x2b)
+#define TAC5X1X_MIXER TAC5X1X_REG(1, 0x2c)
+
+#define TAC5X1X_DIAG_CFG0 TAC5X1X_REG(1, 0x46)
+#define TAC5X1X_DIAG_CFG1 TAC5X1X_REG(1, 0x47)
+#define TAC5X1X_DIAG_CFG2 TAC5X1X_REG(1, 0x48)
+#define TAC5X1X_DIAG_CFG6 TAC5X1X_REG(1, 0x4c)
+#define TAC5X1X_DIAG_CFG7 TAC5X1X_REG(1, 0x4d)
+#define TAC5X1X_DIAG_CFG8 TAC5X1X_REG(1, 0x4e)
+#define TAC5X1X_DIAG_CFG9 TAC5X1X_REG(1, 0x4f)
+
+/* interrupt latches */
+#define TAC5X1X_REG_INT_LTCH0 TAC5X1X_REG(0x1, 0x34)
+#define TAC5X1X_REG_CHX_LTCH TAC5X1X_REG(0x1, 0x35)
+#define TAC5X1X_REG_IN_CH1_LTCH TAC5X1X_REG(0x1, 0x36)
+#define TAC5X1X_REG_IN_CH2_LTCH TAC5X1X_REG(0x1, 0x37)
+#define TAC5X1X_REG_OUT_CH1_LTCH TAC5X1X_REG(0x1, 0x38)
+#define TAC5X1X_REG_OUT_CH2_LTCH TAC5X1X_REG(0x1, 0x39)
+#define TAC5X1X_REG_INT_LTCH1 TAC5X1X_REG(0x1, 0x3A)
+#define TAC5X1X_REG_INT_LTCH2 TAC5X1X_REG(0x1, 0x3B)
+
+/* Bits, masks, and shifts */
+/* TAC5X1X_CH_EN */
+#define TAC5X1X_CH_EN_ADC_MASK GENMASK(7, 4)
+#define TAC5X1X_CH_EN_ADC_CH1 BIT(7)
+#define TAC5X1X_CH_EN_ADC_CH2 BIT(6)
+#define TAC5X1X_CH_EN_ADC_CH3 BIT(5)
+#define TAC5X1X_CH_EN_ADC_CH4 BIT(4)
+
+#define TAC5X1X_CH_EN_DAC_MASK GENMASK(3, 0)
+#define TAC5X1X_CH_EN_DAC_CH1 BIT(3)
+#define TAC5X1X_CH_EN_DAC_CH2 BIT(2)
+#define TAC5X1X_CH_EN_DAC_CH3 BIT(1)
+#define TAC5X1X_CH_EN_DAC_CH4 BIT(0)
+
+/* TAC5X1X_GPIOVAL */
+#define TAC5X1X_GPIO1_VAL BIT(7)
+#define TAC5X1X_GPIO2_VAL BIT(6)
+#define TAC5X1X_GPO1_VAL BIT(5)
+#define TAC5X1X_GPIO1_MON BIT(3)
+#define TAC5X1X_GPIO2_MON BIT(2)
+#define TAC5X1X_GPI1_MON BIT(1)
+
+/* TAC5X1X_DIAG_CFG0 */
+#define TAC5X1X_IN_CH_DIAG_EN_MASK 0xc0
+#define TAC5X1X_INCL_SE_INM_MASK 0x20
+#define TAC5X1X_INCL_AC_COUP_MASK 0x10
+#define TAC5X1X_OUT1P_DIAG_EN_MASK 0x0f
+#define TAC5X1X_MICBIAS_LOW_THRESHOLD 0x48
+#define TAC5X1X_MICBIAS_HIGH_THRESHOLD 0xa2
+#define TAC5X1X_GPA_LOW_THRESHOLD 0x4b
+#define TAC5X1X_GPA_HIGH_THRESHOLD 0xba
+
+/* TAC5X1X_PASI0 */
+#define TAC5X1X_PASI_SAMP_RATE_MASK GENMASK(7, 2)
+#define TAC5X1X_PASI_FMT_MASK GENMASK(7, 6)
+#define TAC5X1X_PASI_FMT_TDM 0x00
+#define TAC5X1X_PASI_FMT_I2S 0x40
+#define TAC5X1X_PASI_FMT_LJ 0x80
+
+#define TAC5X1X_PASI_DATALEN_MASK GENMASK(5, 4)
+
+#define TAC5X1X_PASI_FSYNC_POL BIT(3)
+#define TAC5X1X_PASI_BCLK_POL BIT(2)
+#define TAC5X1X_WORD_LEN_16BITS 0x00
+#define TAC5X1X_WORD_LEN_20BITS 0x10
+#define TAC5X1X_WORD_LEN_24BITS 0x20
+#define TAC5X1X_WORD_LEN_32BITS 0x30
+
+/* TAC5X1X_CNTCLK2 */
+#define TAC5X1X_PASI_MODE_MASK 0x10
+#define TAC5X1X_SASI_MODE_MASK 0x08
+#define TAC5X1X_ASI_RATE_MASK 0x01
+
+#define TAC5X1X_PASI_RATE_48000 0x00
+#define TAC5X1X_PASI_RATE_44100 0x01
+
+/* TAC5X1X_PASITX0 */
+#define TAC5X1X_PASITX_OFFSET_MASK 0x1f
+
+/* TAC5X1X_PASIRX0 */
+#define TAC5X1X_PASIRX_OFFSET_MASK 0x1f
+
+/* TAC5X1X_VREF */
+#define TAC5X1X_VREF_SLEEP_EXIT_VREF_EN 0x80
+#define TAC5X1X_VREF_SLEEP_ACTIVE_MASK 0x01
+
+/* TAC5X1X_PWRCFG */
+#define TAC5X1X_PWR_CFG_ADC_PDZ BIT(7)
+#define TAC5X1X_PWR_CFG_DAC_PDZ BIT(6)
+#define TAC5X1X_PWR_CFG_MICBIAS BIT(5)
+#define TAC5X1X_PWR_CFG_UAD_EN BIT(3)
+#define TAC5X1X_PWR_CFG_VAD_EN BIT(2)
+#define TAC5X1X_PWR_CFG_UAG_EN BIT(1)
+
+/* TAC5X1X_GPIOx */
+#define TAC5X1X_GPIO1_DEFAULT_VAL 0x32
+#define TAC5X1X_GPIO2_DEFAULT_VAL 0x00
+#define TAC5X1X_GPI1_DEFAULT_VAL 0x00
+#define TAC5X1X_GPO1_DEFAULT_VAL 0x00
+
+#define TAC5X1X_GPIOX_CFG_MASK 0xf0
+#define TAC5X1X_GPI1_EN_MASK BIT(1)
+#define TAC5X1X_GPI2_EN_MASK BIT(2)
+#define TAC5X1X_GPIOX_CFG_SHFT 0x4
+#define TAC5X1X_GPIOX_DRV_MASK 0x07
+#define TAC5X1X_GPIOX_DRV_SHFT 0x0
+
+/* pdm related mask, shift values*/
+#define TAC5X1X_PDM_DIN12_SEL_MASK 0x0c
+#define TAC5X1X_PDM_DIN12_SEL_SHFT 0x2
+#define TAC5X1X_PDM_DIN34_SEL_MASK 0x03
+#define TAC5X1X_PDM_DIN34_SEL_SHFT 0x0
+/* pdm data in values */
+#define TAC5X1X_PDM_DIN_GPI01 1
+#define TAC5X1X_PDM_DIN_GPI02 2
+#define TAC5X1X_PDM_DIN_GPI2A 2
+#define TAC5X1X_PDM_DIN_GPI1  3
+
+#define TAC5X1X_GPIO_DISABLE 0
+#define TAC5X1X_GPIO_GPI 1
+#define TAC5X1X_GPIO_GPO 2
+#define TAC5X1X_GPIO_IRQ 3
+#define TAC5X1X_GPIO_PDMCLK 4
+#define TAC5X1X_GPIO_P_DOUT 5
+#define TAC5X1X_GPIO_P_DOUT2 6
+#define TAC5X1X_GPIO_S_DOUT 7
+#define TAC5X1X_GPIO_S_DOUT2 8
+#define TAC5X1X_GPIO_S_BCLK 9
+#define TAC5X1X_GPIO_S_FSYNC 10
+#define TAC5X1X_GPIO_CLKOUT 11
+#define TAC5X1X_GPIO_DOUT_MUX 12
+#define TAC5X1X_GPIO_DAISY_OUT 13
+
+#define TAC5X1X_GPIO_DRV_HIZ 0
+#define TAC5X1X_GPIO_DRV_ALAH 1
+#define TAC5X1X_GPIO_DRV_ALWH 2
+#define TAC5X1X_GPIO_DRV_ALHIZ 3
+#define TAC5X1X_GPIO_DRV_WLAH 4
+#define TAC5X1X_GPIO_DRV_HIZAH 5
+
+/* TAC5X1X_GPI1 */
+#define TAC5X1X_GPI1_CFG_MASK BIT(1)
+#define TAC5X1X_GPI2A_CFG_MASK BIT(0)
+#define TAC5X1X_GPA_CFG_MASK BIT(0)
+
+/* TAC5X1X_VREFCFG */
+#define TAC5X1X_VREFCFG_MICBIAS_VAL_MASK GENMASK(3, 2)
+#define TAC5X1X_VREFCFG_VREF_FSCALE_MASK GENMASK(1, 0)
+
+#define TAC5X1X_ADCCH1C0_IMPEDANCE_MASK GENMASK(5, 4)
+#define TAC5X1X_ADCCH2C0_IMPEDANCE_MASK GENMASK(5, 4)
+
+#define TAC5X1X_OUT2CFG0_VCOM_MASK BIT(1)
+
+#define TAC5X1X_MICBIAS_VREF 0
+#define TAC5X1X_MICBIAS_0_5VREF 1
+#define TAC5X1X_MICBIAS_AVDD 3
+
+#define TAC5X1X_VERF_2_75V 0
+#define TAC5X1X_VERF_2_5V 1
+#define TAC5X1X_VERF_1_375V 2
+
+#endif /* __TAC5X1X_REGISTERS_H__ */
-- 
2.34.1


