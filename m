Return-Path: <linux-gpio+bounces-27339-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EB8BF4CD7
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 09:04:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 45BD33514A5
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 07:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9900F27587D;
	Tue, 21 Oct 2025 07:04:20 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022106.outbound.protection.outlook.com [40.107.75.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AFC273D75;
	Tue, 21 Oct 2025 07:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761030260; cv=fail; b=kBNG06izd8eBaYI20lwJmo+DoeXv6UaMWlUfNoQMtyKCz33IeMFSjZRdZl0G8WFsMzFolU64bN8E4lzHG48fFFskeAkA28Yltw34TmjcAbTJDy58O5Z7wBaJtPJtGY5KT09IPXCwFM4l/hB4ULPHy1+isjZCEoajP0RujiuNmZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761030260; c=relaxed/simple;
	bh=JfjeNVkfeaeLc/9zipT0PTeeySLE5YTEfhPJxU8T4BY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gyzDlvZZvELFR8ZUka/8Bn5xgq0bzBZaAnv0o5y5pItz8P3RwpS70DMhHxoAJt6+T9MWdCDWZaOQCsmIvb5TfrOKHFyIPZPqiv0ie1IArjKOyw4bGvSxSbLqzXGRJLkkrXAIklSPAqrxQKsCBG4uywwTSMmcWqbi3oEPio3pLI8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rtm/kvxvKkf31v/r5/XIs/AhvtvwctWY8ktzFEzlBSG+FioFbtu6WTMU/Vt8Ctuda17UIF4zGeqeVoLQbrSZCH35yo1+05bJURduGcFvMZ1+2y7pr6cVm8K0ozsGWVLZf7KuEM89NG0hSNrEUY44cZ5reBsugWuhnuqHbqgNTPf5GimeS4k1zPVSVXFtJfMDnNY/dm16ow9bkIVzxLJcnvQmyUcMmTj64ECTBiQ4Y5MolB/G4mKz0LKPbRLuUPwj+5ZQmGnC90BbxJj7baQTcdchRUjRNHhEJppAIcKip2ARAGxvX5+qYS59zIACYHP7E6tfuJmNM2JQ57AyuEGfJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7eqTph48Dq/Z0ZN0IoNmOz44V3f21q6LcsbSFABWyaA=;
 b=eYJKpJSOypxLgDxYYjzdn1dogYQ/qUYGOe3vDHcNdOFP6LqTX8nJTZi16UZGeP8ppAbV3sgMhi5V6YAeaDDq8qm9pXz3oyI3+EtrM69jSpICRMu1nwtdanexBs2nvBq61hBkjTHeWb7YV4S6HuB833NRboX6GZOMHrC3Y+glWyAqblhL6pxZMsvyAnsiCfKDGjO5yj39o41/uGevRd/MKpZ1SkFHNRHyyZeRYTPu3L1FKd1ikfYa3J76Bp8iFt91L/SaYKwiIPjAG/btUT2Q4JvhJRGQ4i+o3wsXmsL/7eEXwbGFsVoy9xhWX1/9MobUGrumMcn1uXVHZsxAs5Inzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SE2P216CA0063.KORP216.PROD.OUTLOOK.COM (2603:1096:101:118::12)
 by SEYPR06MB6830.apcprd06.prod.outlook.com (2603:1096:101:1b3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Tue, 21 Oct
 2025 07:04:12 +0000
Received: from OSA0EPF000000CB.apcprd02.prod.outlook.com
 (2603:1096:101:118:cafe::ec) by SE2P216CA0063.outlook.office365.com
 (2603:1096:101:118::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.17 via Frontend Transport; Tue,
 21 Oct 2025 07:04:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CB.mail.protection.outlook.com (10.167.240.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Tue, 21 Oct 2025 07:04:12 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 149E44143A8E;
	Tue, 21 Oct 2025 15:04:11 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH v5 2/3] pinctrl: cix: Add pin-controller support for sky1
Date: Tue, 21 Oct 2025 15:04:09 +0800
Message-ID: <20251021070410.3585997-3-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251021070410.3585997-1-gary.yang@cixtech.com>
References: <20251021070410.3585997-1-gary.yang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CB:EE_|SEYPR06MB6830:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 59101ff4-ed05-440e-8088-08de10700a01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?d35dmCGXEtYyQRRZl6lItIlSQJTpozLoih9XcOgL9X+QLz7+3bRGvRvNOu6D?=
 =?us-ascii?Q?+m6bZPWW5ExTbpt4zvO9s5mpOpI5AeS7Pncowo0vNGElqncSUxhFNRq0qN0F?=
 =?us-ascii?Q?grskMGpANaWo6pzw82JalvxrCQw8/YnPOMafmHBIgUtqbg+nkvMQ68cvzcuV?=
 =?us-ascii?Q?3ANipXTUkpbl0jFsUxYhkX46jripYQVAOOOJ0tTmOGzwUMIAOl8gZbMWOiQ8?=
 =?us-ascii?Q?vhpjpjY18cxMDan96HVW8M7wVTcLAtWKKflZ2xFbDpM4AcH68bR5hT2Erh+s?=
 =?us-ascii?Q?M3wvMJNJDigVXvfIy175neG60kraOAPL+OMioLwXF0PtIGugEsEQYsOOwQ+U?=
 =?us-ascii?Q?qH09iFWoomfeD6xSD9yzMz0vncCirzbHLmDKl9TjYMmMdUj8EEvEPguUh+mK?=
 =?us-ascii?Q?uv5OHNO7kgri5cIoGPrrKoGO+axvvjh6upjnoVfNe0PCIOqwbpBbCmGF/mXc?=
 =?us-ascii?Q?SL00UL2CG2rtlF6KX8GTiTwXfMuA1INkW1ZkZNx6EjgIa/RFgy6wopzHrEKQ?=
 =?us-ascii?Q?eWneJ4h6lrAuNl5RGVv4fGLfUsesYnpqr7vpjsHhuELO0PM2Hq4QXx46z78A?=
 =?us-ascii?Q?/YWSWjeXkihIYNem7AoswV8NbeYbox+8alJ4TmDS+rt39YgOW9BBpZL0ruE1?=
 =?us-ascii?Q?qY3MVGB0M1xhYr+P451CMqv+/YmMUJGvlXWB8mVpc6GkNCUvuvZQfrl+Nm1D?=
 =?us-ascii?Q?yL6oVaWWHUDoxtQCJfdaxdspZXn6rbtrHdh3IUbqj9wwrZmQXHmM885AnCSR?=
 =?us-ascii?Q?Z+N7hgu5JZtEfiEpTqVOSl/0StMGeX0Gp28q+rmEKi6Vhrmc/pq7o+KBlrv1?=
 =?us-ascii?Q?IBlNd+8uajmu6JijtxheOnn+7cDdYHaHaTe0kBTqa4CvTWGYCEaGP166Nhf9?=
 =?us-ascii?Q?M2vHtTtL8/h3FuZQ4yu1CGnsbrDLv+5jdkIT3GI9LYbnP4kadl9E6MPqtLIq?=
 =?us-ascii?Q?lpvR624CcFD6bClUuxXnWU8KW8PKscC+pxzRQKjQTABEp6SO9sg4laXNmNtd?=
 =?us-ascii?Q?BccWIHvuiMhEG0Gsc2vN/tl0eXJegtHL0zVuUabq7t6OD3UgMUspsIwhRKff?=
 =?us-ascii?Q?qJjyIUCNz2+r2Z1thxsfx+C/sB0Lmpbv92xNphn7Sh9Oh1fJ/wq3Bqf2KMr8?=
 =?us-ascii?Q?vrtZujLNL8b1MYO6uYSrfX3SRdkMB8x9Ay1SGkDfJ4tvzR4R/7YurYG/fmPb?=
 =?us-ascii?Q?dcVaoOesfzj14afcn1bFrO3yAk19++yHhyuF0OycNqyyDpBsac/aua90whWR?=
 =?us-ascii?Q?TxptuYcUfXDV/aMNh7CDqkA5hAkyFJvH2W6EyCx9bLRAqWhDpMLj3oUUVC1q?=
 =?us-ascii?Q?J5dcLrRcbURT3SHM3R8vqA8RY0q0vQ7VTSBQ6dmgmNEgzplXXR9dJgjCACeR?=
 =?us-ascii?Q?mPLTTaIa1XiRjbo/TPHPy5vIT8M6k+jMcjghQSp+m059K/TTpJkR0yfcAZL5?=
 =?us-ascii?Q?/zDU+7Wit343A7B7tePZ4wLxbA3LEtpnt7SJxFpMTx7QTf6q8mQ3h475lR0o?=
 =?us-ascii?Q?YPbfHyCNsvX9UVxUpzVNBUP76Yi+49lSDe+lN7pOazzERVOSNox34AGIW6Qa?=
 =?us-ascii?Q?LsIiRl+Ozf+46RvBIvA=3D?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 07:04:12.0870
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59101ff4-ed05-440e-8088-08de10700a01
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000CB.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6830

There are two pin-controllers on Cix Sky1 platform.
one is used under S0 state, the other is used under S0 and S5 state.

Signed-off-by: Gary Yang <gary.yang@cixtech.com>
---
 drivers/pinctrl/Kconfig                 |   1 +
 drivers/pinctrl/Makefile                |   1 +
 drivers/pinctrl/cix/Kconfig             |  14 +
 drivers/pinctrl/cix/Makefile            |   4 +
 drivers/pinctrl/cix/pinctrl-sky1-base.c | 573 ++++++++++++++++++++++++
 drivers/pinctrl/cix/pinctrl-sky1.c      | 559 +++++++++++++++++++++++
 drivers/pinctrl/cix/pinctrl-sky1.h      |  48 ++
 7 files changed, 1200 insertions(+)
 create mode 100644 drivers/pinctrl/cix/Kconfig
 create mode 100644 drivers/pinctrl/cix/Makefile
 create mode 100644 drivers/pinctrl/cix/pinctrl-sky1-base.c
 create mode 100644 drivers/pinctrl/cix/pinctrl-sky1.c
 create mode 100644 drivers/pinctrl/cix/pinctrl-sky1.h

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 4f8507ebbdac..cb84b2f9896c 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -686,6 +686,7 @@ source "drivers/pinctrl/aspeed/Kconfig"
 source "drivers/pinctrl/bcm/Kconfig"
 source "drivers/pinctrl/berlin/Kconfig"
 source "drivers/pinctrl/cirrus/Kconfig"
+source "drivers/pinctrl/cix/Kconfig"
 source "drivers/pinctrl/freescale/Kconfig"
 source "drivers/pinctrl/intel/Kconfig"
 source "drivers/pinctrl/mediatek/Kconfig"
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index e0cfb9b7c99b..82d40eecbe22 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -69,6 +69,7 @@ obj-$(CONFIG_ARCH_ASPEED)	+= aspeed/
 obj-y				+= bcm/
 obj-$(CONFIG_PINCTRL_BERLIN)	+= berlin/
 obj-y				+= cirrus/
+obj-y				+= cix/
 obj-y				+= freescale/
 obj-$(CONFIG_X86)		+= intel/
 obj-y				+= mediatek/
diff --git a/drivers/pinctrl/cix/Kconfig b/drivers/pinctrl/cix/Kconfig
new file mode 100644
index 000000000000..455120dd7318
--- /dev/null
+++ b/drivers/pinctrl/cix/Kconfig
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config PINCTRL_SKY1_BASE
+	tristate
+	select GENERIC_PINCTRL_GROUPS
+	select GENERIC_PINMUX_FUNCTIONS
+	select GENERIC_PINCONF
+	select REGMAP
+
+config PINCTRL_SKY1
+	tristate "Cix Sky1 pinctrl driver"
+	depends on ARCH_CIX || COMPILE_TEST
+	select PINCTRL_SKY1_BASE
+	help
+	  Say Y here to enable the sky1 pinctrl driver
diff --git a/drivers/pinctrl/cix/Makefile b/drivers/pinctrl/cix/Makefile
new file mode 100644
index 000000000000..22685d6a107b
--- /dev/null
+++ b/drivers/pinctrl/cix/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+# Cix Sky1 pin control drivers
+obj-$(CONFIG_PINCTRL_SKY1_BASE)	+= pinctrl-sky1-base.o
+obj-$(CONFIG_PINCTRL_SKY1)	+= pinctrl-sky1.o
diff --git a/drivers/pinctrl/cix/pinctrl-sky1-base.c b/drivers/pinctrl/cix/pinctrl-sky1-base.c
new file mode 100644
index 000000000000..5d5249a20d7d
--- /dev/null
+++ b/drivers/pinctrl/cix/pinctrl-sky1-base.c
@@ -0,0 +1,573 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Author: Jerry Zhu <Jerry.Zhu@cixtech.com>
+// Author: Gary Yang <gary.yang@cixtech.com>
+
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_address.h>
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/platform_device.h>
+#include <linux/seq_file.h>
+#include <linux/slab.h>
+
+#include "../core.h"
+#include "../pinconf.h"
+#include "../pinctrl-utils.h"
+#include "../pinmux.h"
+#include "pinctrl-sky1.h"
+
+#define SKY1_PIN_SIZE		(4)
+#define SKY1_MUX_MASK		GENMASK(8, 7)
+#define SKY1_MUX_SHIFT		(7)
+#define SKY1_PULLCONF_MASK	GENMASK(6, 5)
+#define SKY1_PULLUP_BIT		(6)
+#define SKY1_PULLDN_BIT		(5)
+#define SKY1_DS_MASK		GENMASK(3, 0)
+
+#define CIX_PIN_NO_SHIFT	(8)
+#define CIX_PIN_FUN_MASK	GENMASK(1, 0)
+#define CIX_GET_PIN_NO(x)	((x) >> CIX_PIN_NO_SHIFT)
+#define CIX_GET_PIN_FUNC(x)	((x) & CIX_PIN_FUN_MASK)
+#define SKY1_DEFAULT_DS_VAL	(4)
+
+static const char * const sky1_gpio_functions[] = {
+	"func0", "func1", "func2", "func3",
+};
+
+static unsigned char sky1_ds_table[] = {
+	2, 3, 5, 6, 8, 9, 11, 12, 13, 14, 17, 18, 20, 21, 23, 24,
+};
+
+static bool sky1_pctrl_is_function_valid(struct sky1_pinctrl *spctl,
+		u32 pin_num, u32 fnum)
+{
+	int i;
+
+	for (i = 0; i < spctl->info->npins; i++) {
+		const struct sky1_pin_desc *pin = spctl->info->pins + i;
+
+		if (pin->pin.number == pin_num) {
+			if (fnum < pin->nfunc)
+				return true;
+
+			break;
+		}
+	}
+
+	return false;
+}
+
+static int sky1_pctrl_dt_node_to_map_func(struct sky1_pinctrl *spctl,
+		u32 pin, u32 fnum, struct sky1_pinctrl_group *grp,
+		struct pinctrl_map **map, unsigned int *reserved_maps,
+		unsigned int *num_maps)
+{
+	bool ret;
+
+	if (*num_maps == *reserved_maps)
+		return -ENOSPC;
+
+	(*map)[*num_maps].type = PIN_MAP_TYPE_MUX_GROUP;
+	(*map)[*num_maps].data.mux.group = grp->name;
+
+	ret = sky1_pctrl_is_function_valid(spctl, pin, fnum);
+	if (!ret) {
+		dev_err(spctl->dev, "invalid function %d on pin %d .\n",
+				fnum, pin);
+		return -EINVAL;
+	}
+
+	(*map)[*num_maps].data.mux.function = sky1_gpio_functions[fnum];
+	(*num_maps)++;
+
+	return 0;
+}
+
+static struct sky1_pinctrl_group *
+sky1_pctrl_find_group_by_pin(struct sky1_pinctrl *spctl, u32 pin)
+{
+	int i;
+
+	for (i = 0; i < spctl->info->npins; i++) {
+		struct sky1_pinctrl_group *grp =
+			(struct sky1_pinctrl_group *)spctl->groups + i;
+
+		if (grp->pin == pin)
+			return grp;
+	}
+
+	return NULL;
+}
+
+static int sky1_pctrl_dt_subnode_to_map(struct pinctrl_dev *pctldev,
+				      struct device_node *node,
+				      struct pinctrl_map **map,
+				      unsigned int *reserved_maps,
+				      unsigned int *num_maps)
+{
+	struct property *pins;
+	u32 pinfunc, pin, func;
+	int num_pins, num_funcs, maps_per_pin;
+	unsigned long *configs;
+	unsigned int num_configs;
+	bool has_config = false;
+	int i, err;
+	unsigned int reserve = 0;
+	struct sky1_pinctrl_group *grp;
+	struct sky1_pinctrl *spctl = pinctrl_dev_get_drvdata(pctldev);
+
+	pins = of_find_property(node, "pinmux", NULL);
+	if (!pins) {
+		dev_err(spctl->dev, "missing pins property in node %pOFn .\n",
+				node);
+		return -EINVAL;
+	}
+
+	err = pinconf_generic_parse_dt_config(node, pctldev, &configs,
+		&num_configs);
+	if (err)
+		return err;
+
+	if (num_configs)
+		has_config = true;
+
+	num_pins = pins->length / sizeof(u32);
+	num_funcs = num_pins;
+	maps_per_pin = 0;
+	if (num_funcs)
+		maps_per_pin++;
+	if (has_config && num_pins >= 1)
+		maps_per_pin++;
+
+	if (!num_pins || !maps_per_pin) {
+		err = -EINVAL;
+		goto exit;
+	}
+
+	reserve = num_pins * maps_per_pin;
+
+	err = pinctrl_utils_reserve_map(pctldev, map,
+			reserved_maps, num_maps, reserve);
+	if (err < 0)
+		goto exit;
+
+	for (i = 0; i < num_pins; i++) {
+		err = of_property_read_u32_index(node, "pinmux",
+				i, &pinfunc);
+		if (err)
+			goto exit;
+
+		pin = CIX_GET_PIN_NO(pinfunc);
+		func = CIX_GET_PIN_FUNC(pinfunc);
+		pctldev->num_functions = ARRAY_SIZE(sky1_gpio_functions);
+
+		if (pin >= pctldev->desc->npins ||
+			func >= pctldev->num_functions) {
+			dev_err(spctl->dev, "invalid pins value.\n");
+			err = -EINVAL;
+			goto exit;
+		}
+
+		grp = sky1_pctrl_find_group_by_pin(spctl, pin);
+		if (!grp) {
+			dev_err(spctl->dev, "unable to match pin %d to group\n",
+					pin);
+			err = -EINVAL;
+			goto exit;
+		}
+
+		err = sky1_pctrl_dt_node_to_map_func(spctl, pin, func, grp,
+				map, reserved_maps, num_maps);
+		if (err < 0)
+			goto exit;
+
+		if (has_config) {
+			err = pinctrl_utils_add_map_configs(pctldev, map,
+					reserved_maps, num_maps, grp->name,
+					configs, num_configs,
+					PIN_MAP_TYPE_CONFIGS_GROUP);
+			if (err < 0)
+				goto exit;
+		}
+	}
+
+	err = 0;
+
+exit:
+	kfree(configs);
+	return err;
+}
+
+static int sky1_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
+				 struct device_node *np_config,
+				 struct pinctrl_map **map, unsigned int *num_maps)
+{
+	unsigned int reserved_maps;
+	int ret;
+
+	*map = NULL;
+	*num_maps = 0;
+	reserved_maps = 0;
+
+	for_each_child_of_node_scoped(np_config, np) {
+		ret = sky1_pctrl_dt_subnode_to_map(pctldev, np, map,
+				&reserved_maps, num_maps);
+		if (ret < 0) {
+			pinctrl_utils_free_map(pctldev, *map, *num_maps);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static void sky1_dt_free_map(struct pinctrl_dev *pctldev,
+			     struct pinctrl_map *map,
+			     unsigned int num_maps)
+{
+	kfree(map);
+}
+
+static int sky1_pctrl_get_groups_count(struct pinctrl_dev *pctldev)
+{
+	struct sky1_pinctrl *spctl = pinctrl_dev_get_drvdata(pctldev);
+
+	return spctl->info->npins;
+}
+
+static const char *sky1_pctrl_get_group_name(struct pinctrl_dev *pctldev,
+					      unsigned int group)
+{
+	struct sky1_pinctrl *spctl = pinctrl_dev_get_drvdata(pctldev);
+
+	return spctl->groups[group].name;
+}
+
+static int sky1_pctrl_get_group_pins(struct pinctrl_dev *pctldev,
+				      unsigned int group,
+				      const unsigned int **pins,
+				      unsigned int *num_pins)
+{
+	struct sky1_pinctrl *spctl = pinctrl_dev_get_drvdata(pctldev);
+
+	*pins = (unsigned int *)&spctl->groups[group].pin;
+	*num_pins = 1;
+
+	return 0;
+}
+
+static void sky1_pin_dbg_show(struct pinctrl_dev *pctldev, struct seq_file *s,
+		   unsigned int offset)
+{
+	seq_printf(s, "%s", dev_name(pctldev->dev));
+}
+
+static const struct pinctrl_ops sky1_pctrl_ops = {
+	.dt_node_to_map = sky1_pctrl_dt_node_to_map,
+	.dt_free_map = sky1_dt_free_map,
+	.get_groups_count = sky1_pctrl_get_groups_count,
+	.get_group_name = sky1_pctrl_get_group_name,
+	.get_group_pins = sky1_pctrl_get_group_pins,
+	.pin_dbg_show = sky1_pin_dbg_show,
+};
+
+static int sky1_pmx_set_one_pin(struct sky1_pinctrl *spctl,
+				    unsigned int pin, unsigned char muxval)
+{
+	u32 reg_val;
+	void __iomem *pin_reg;
+
+	pin_reg = spctl->base + pin * SKY1_PIN_SIZE;
+	reg_val = readl(pin_reg);
+	reg_val &= ~SKY1_MUX_MASK;
+	reg_val |= muxval << SKY1_MUX_SHIFT;
+	writel(reg_val, pin_reg);
+
+	dev_dbg(spctl->dev, "write: offset 0x%x val 0x%x\n",
+		pin * SKY1_PIN_SIZE, reg_val);
+	return 0;
+}
+
+static int sky1_pmx_set_mux(struct pinctrl_dev *pctldev,
+			    unsigned int function,
+			    unsigned int group)
+{
+	bool ret;
+	struct sky1_pinctrl *spctl = pinctrl_dev_get_drvdata(pctldev);
+	struct sky1_pinctrl_group *g =
+		(struct sky1_pinctrl_group *)spctl->groups + group;
+
+	ret = sky1_pctrl_is_function_valid(spctl, g->pin, function);
+	if (!ret) {
+		dev_err(spctl->dev, "invalid function %d on group %d .\n",
+				function, group);
+		return -EINVAL;
+	}
+
+	sky1_pmx_set_one_pin(spctl, g->pin, function);
+	return 0;
+}
+
+static int sky1_pmx_get_funcs_cnt(struct pinctrl_dev *pctldev)
+{
+	return ARRAY_SIZE(sky1_gpio_functions);
+}
+
+static const char *sky1_pmx_get_func_name(struct pinctrl_dev *pctldev,
+					   unsigned int selector)
+{
+	return sky1_gpio_functions[selector];
+}
+
+static int sky1_pmx_get_func_groups(struct pinctrl_dev *pctldev,
+				     unsigned int function,
+				     const char * const **groups,
+				     unsigned int * const num_groups)
+{
+	struct sky1_pinctrl *spctl = pinctrl_dev_get_drvdata(pctldev);
+	const struct sky1_pinctrl_soc_info *info = spctl->info;
+
+	*groups = spctl->grp_names;
+	*num_groups = info->npins;
+
+	return 0;
+}
+
+static const struct pinmux_ops sky1_pmx_ops = {
+	.get_functions_count = sky1_pmx_get_funcs_cnt,
+	.get_function_groups = sky1_pmx_get_func_groups,
+	.get_function_name = sky1_pmx_get_func_name,
+	.set_mux = sky1_pmx_set_mux,
+};
+
+static int sky1_pconf_set_pull_select(struct sky1_pinctrl *spctl,
+		unsigned int pin, bool enable, bool isup)
+{
+	u32 reg_val, reg_pullsel = 0;
+	void __iomem *pin_reg;
+
+	pin_reg = spctl->base + pin * SKY1_PIN_SIZE;
+	reg_val = readl(pin_reg);
+	reg_val &= ~SKY1_PULLCONF_MASK;
+
+	if (!enable)
+		goto update;
+
+	if (isup)
+		reg_pullsel = BIT(SKY1_PULLUP_BIT);
+	else
+		reg_pullsel = BIT(SKY1_PULLDN_BIT);
+
+update:
+	reg_val |= reg_pullsel;
+	writel(reg_val, pin_reg);
+
+	dev_dbg(spctl->dev, "write: offset 0x%x val 0x%x\n",
+		pin * SKY1_PIN_SIZE, reg_val);
+	return 0;
+}
+
+static int sky1_ds_to_index(unsigned char driving)
+{
+	int i;
+
+	for (i = 0; i < sizeof(sky1_ds_table); i++)
+		if (driving == sky1_ds_table[i])
+			return i;
+	return SKY1_DEFAULT_DS_VAL;
+}
+
+static int sky1_pconf_set_driving(struct sky1_pinctrl *spctl,
+		unsigned int pin, unsigned char driving)
+{
+	unsigned int reg_val, val;
+	void __iomem *pin_reg;
+
+	if (pin >= spctl->info->npins)
+		return -EINVAL;
+
+	pin_reg = spctl->base + pin * SKY1_PIN_SIZE;
+	reg_val = readl(pin_reg);
+	reg_val &= ~SKY1_DS_MASK;
+	val = sky1_ds_to_index(driving);
+	reg_val |= (val & SKY1_DS_MASK);
+	writel(reg_val, pin_reg);
+
+	dev_dbg(spctl->dev, "write: offset 0x%x val 0x%x\n",
+		pin * SKY1_PIN_SIZE, reg_val);
+
+	return 0;
+}
+
+static int sky1_pconf_parse_conf(struct pinctrl_dev *pctldev,
+		unsigned int pin, enum pin_config_param param,
+		enum pin_config_param arg)
+{
+	int ret = 0;
+	struct sky1_pinctrl *spctl = pinctrl_dev_get_drvdata(pctldev);
+
+	switch (param) {
+	case PIN_CONFIG_BIAS_DISABLE:
+		ret = sky1_pconf_set_pull_select(spctl, pin, false, false);
+		break;
+	case PIN_CONFIG_BIAS_PULL_UP:
+		ret = sky1_pconf_set_pull_select(spctl, pin, true, true);
+		break;
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		ret = sky1_pconf_set_pull_select(spctl, pin, true, false);
+		break;
+	case PIN_CONFIG_DRIVE_STRENGTH:
+		ret = sky1_pconf_set_driving(spctl, pin, arg);
+		break;
+	default:
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+static int sky1_pconf_group_get(struct pinctrl_dev *pctldev,
+				 unsigned int group,
+				 unsigned long *config)
+{
+	struct sky1_pinctrl *spctl = pinctrl_dev_get_drvdata(pctldev);
+	struct sky1_pinctrl_group *g = &spctl->groups[group];
+
+	*config = g->config;
+
+	return 0;
+}
+
+static int sky1_pconf_group_set(struct pinctrl_dev *pctldev, unsigned int group,
+				 unsigned long *configs, unsigned int num_configs)
+{
+	struct sky1_pinctrl *spctl = pinctrl_dev_get_drvdata(pctldev);
+	struct sky1_pinctrl_group *g = &spctl->groups[group];
+	int i, ret;
+
+	for (i = 0; i < num_configs; i++) {
+		ret = sky1_pconf_parse_conf(pctldev, g->pin,
+			pinconf_to_config_param(configs[i]),
+			pinconf_to_config_argument(configs[i]));
+		if (ret < 0)
+			return ret;
+
+		g->config = configs[i];
+	}
+
+	return 0;
+}
+
+static const struct pinconf_ops sky1_pinconf_ops = {
+	.pin_config_group_get	= sky1_pconf_group_get,
+	.pin_config_group_set	= sky1_pconf_group_set,
+};
+
+static int sky1_pctrl_build_state(struct platform_device *pdev)
+{
+	struct sky1_pinctrl *spctl = platform_get_drvdata(pdev);
+	const struct sky1_pinctrl_soc_info *info = spctl->info;
+	int i;
+
+	/* Allocate groups */
+	spctl->groups = devm_kcalloc(&pdev->dev, info->npins,
+				    sizeof(*spctl->groups), GFP_KERNEL);
+	if (!spctl->groups)
+		return -ENOMEM;
+
+	/* We assume that one pin is one group, use pin name as group name. */
+	spctl->grp_names = devm_kcalloc(&pdev->dev, info->npins,
+				       sizeof(*spctl->grp_names), GFP_KERNEL);
+	if (!spctl->grp_names)
+		return -ENOMEM;
+
+	for (i = 0; i < info->npins; i++) {
+		const struct sky1_pin_desc *pin = spctl->info->pins + i;
+		struct sky1_pinctrl_group *group =
+			(struct sky1_pinctrl_group *)spctl->groups + i;
+
+		group->name = pin->pin.name;
+		group->pin = pin->pin.number;
+		spctl->grp_names[i] = pin->pin.name;
+	}
+
+	return 0;
+}
+
+int sky1_base_pinctrl_probe(struct platform_device *pdev,
+		      const struct sky1_pinctrl_soc_info *info)
+{
+	struct pinctrl_desc *sky1_pinctrl_desc;
+	struct sky1_pinctrl *spctl;
+	struct pinctrl_pin_desc *pins;
+	int ret, i;
+
+	if (!info || !info->pins || !info->npins) {
+		dev_err(&pdev->dev, "wrong pinctrl info\n");
+		return -EINVAL;
+	}
+
+	/* Create state holders etc for this driver */
+	spctl = devm_kzalloc(&pdev->dev, sizeof(*spctl), GFP_KERNEL);
+	if (!spctl)
+		return -ENOMEM;
+
+	spctl->info = info;
+	platform_set_drvdata(pdev, spctl);
+
+	spctl->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(spctl->base))
+		return PTR_ERR(spctl->base);
+
+	sky1_pinctrl_desc = devm_kzalloc(&pdev->dev, sizeof(*sky1_pinctrl_desc),
+					GFP_KERNEL);
+	if (!sky1_pinctrl_desc)
+		return -ENOMEM;
+
+	pins = devm_kcalloc(&pdev->dev, info->npins, sizeof(*pins),
+			    GFP_KERNEL);
+	if (!pins)
+		return -ENOMEM;
+	for (i = 0; i < info->npins; i++)
+		pins[i] = info->pins[i].pin;
+
+	ret = sky1_pctrl_build_state(pdev);
+	if (ret)
+		return ret;
+
+	sky1_pinctrl_desc->name = dev_name(&pdev->dev);
+	sky1_pinctrl_desc->pins = pins;
+	sky1_pinctrl_desc->npins = info->npins;
+	sky1_pinctrl_desc->pctlops = &sky1_pctrl_ops;
+	sky1_pinctrl_desc->pmxops = &sky1_pmx_ops;
+	sky1_pinctrl_desc->confops = &sky1_pinconf_ops;
+	sky1_pinctrl_desc->owner = THIS_MODULE;
+	spctl->dev = &pdev->dev;
+	ret = devm_pinctrl_register_and_init(&pdev->dev,
+					     sky1_pinctrl_desc, spctl,
+					     &spctl->pctl);
+	if (ret) {
+		dev_err(&pdev->dev, "could not register SKY1 pinctrl driver\n");
+		return ret;
+	}
+
+	pinctrl_provide_dummies();
+	dev_dbg(&pdev->dev, "initialized SKY1 pinctrl driver\n");
+
+	return pinctrl_enable(spctl->pctl);
+}
+EXPORT_SYMBOL_GPL(sky1_base_pinctrl_probe);
+
+
+MODULE_AUTHOR("Jerry Zhu <Jerry.Zhu@cixtech.com>");
+MODULE_DESCRIPTION("Cix SKy1 pinctrl base driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/pinctrl/cix/pinctrl-sky1.c b/drivers/pinctrl/cix/pinctrl-sky1.c
new file mode 100644
index 000000000000..5d0d8be815b2
--- /dev/null
+++ b/drivers/pinctrl/cix/pinctrl-sky1.c
@@ -0,0 +1,559 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Author: Jerry Zhu <Jerry.Zhu@cixtech.com>
+// Author: Gary Yang <gary.yang@cixtech.com>
+
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/platform_device.h>
+#include "linux/stddef.h"
+
+#include "../core.h"
+#include "pinctrl-sky1.h"
+
+/* Pad names for the s5 domain pinmux subsystem */
+static const char * const gpio1_group[] = {"GPIO1"};
+static const char * const gpio2_group[] = {"GPIO2"};
+static const char * const gpio3_group[] = {"GPIO3"};
+static const char * const gpio4_group[] = {"GPIO4"};
+static const char * const gpio5_group[] = {"GPIO5"};
+static const char * const gpio6_group[] = {"GPIO6"};
+static const char * const gpio7_group[] = {"GPIO7"};
+static const char * const gpio8_group[] = {"GPIO8"};
+static const char * const gpio9_group[] = {"GPIO9"};
+static const char * const gpio10_group[] = {"GPIO10"};
+static const char * const gpio11_group[] = {"GPIO11"};
+static const char * const gpio12_group[] = {"GPIO12"};
+static const char * const gpio13_group[] = {"GPIO13"};
+static const char * const gpio14_group[] = {"GPIO14"};
+static const char * const rsmrst_group[] = { };
+static const char * const srst_group[] = { };
+static const char * const slp_s3_group[] = { };
+static const char * const slp_s5_group[] = { };
+static const char * const pwrgd_group[] = { };
+static const char * const pwrok_group[] = { };
+static const char * const pwrbtn_group[] = { };
+static const char * const ddrio_gate_group[] = { };
+static const char * const jtag_gpio_group[] = { };
+static const char * const jtag_tck_group[] = { };
+static const char * const jtag_tdi_group[] = { };
+static const char * const jtag_tdo_group[] = { };
+static const char * const tms_group[] = { };
+static const char * const trsl_group[] = { };
+static const char * const sfi_i2c0_scl_group[] = {"SFI_I2C0_SCL",
+					"SFI_I3C0_SCL"};
+static const char * const sfi_i2c0_sda_group[] = {"SFI_I2C0_SDA",
+					"SFI_I3C0_SDA"};
+static const char * const sfi_i2c1_scl_group[] = {"SFI_I2C1_SCL",
+					"SFI_I3C1_SCL", "SFI_SPI_CS0"};
+static const char * const sfi_i2c1_sda_group[] = {"SFI_I2C1_SDA",
+					"SFI_I3C1_SDA", "SFI_SPI_CS1"};
+static const char * const sfi_gpio0_group[] = {"GPIO15", "SFI_SPI_SCK",
+					"SFI_GPIO0"};
+static const char * const sfi_gpio1_group[] = {"GPIO16", "SFI_SPI_MOSI",
+					"SFI_GPIO1"};
+static const char * const sfi_gpio2_group[] = {"GPIO17", "SFI_SPI_MISO",
+					"SFI_GPIO2"};
+static const char * const gpio18_group[] = {"SFI_GPIO3", "GPIO18"};
+static const char * const gpio19_group[] = {"SFI_GPIO4", "GPIO19"};
+static const char * const gpio20_group[] = {"SFI_GPIO5", "GPIO20"};
+static const char * const gpio21_group[] = {"SFI_GPIO6", "GPIO21"};
+static const char * const gpio22_group[] = {"SFI_GPIO7", "GPIO22"};
+static const char * const gpio23_group[] = {"SFI_GPIO8", "GPIO23",
+				"SFI_I3C0_PUR_EN_L"};
+static const char * const gpio24_group[] = {"SFI_GPIO9", "GPIO24",
+				"SFI_I3C1_PUR_EN_L"};
+static const char * const spi1_miso_group[] = {"SPI1_MISO", "GPIO25"};
+static const char * const spi1_cs0_group[] = {"SPI1_CS0", "GPIO26"};
+static const char * const spi1_cs1_group[] = {"SPI1_CS1", "GPIO27"};
+static const char * const spi1_mosi_group[] = {"SPI1_MOSI", "GPIO28"};
+static const char * const spi1_clk_group[] = {"SPI1_CLK", "GPIO29"};
+static const char * const gpio30_group[] = {"GPIO30", "USB_0C0_L"};
+static const char * const gpio31_group[] = {"GPIO31", "USB_0C1_L"};
+static const char * const gpio32_group[] = {"GPIO32", "USB_0C2_L"};
+static const char * const gpio33_group[] = {"GPIO33", "USB_0C3_L"};
+static const char * const gpio34_group[] = {"GPIO34", "USB_0C4_L"};
+static const char * const gpio35_group[] = {"GPIO35", "USB_0C5_L"};
+static const char * const gpio36_group[] = {"GPIO36", "USB_0C6_L"};
+static const char * const gpio37_group[] = {"GPIO37", "USB_0C7_L"};
+static const char * const gpio38_group[] = {"GPIO38", "USB_0C8_L"};
+static const char * const gpio39_group[] = {"GPIO39", "USB_0C9_L"};
+static const char * const gpio40_group[] = {"GPIO40", "USB_DRIVE_VBUS0"};
+static const char * const gpio41_group[] = {"GPIO41", "USB_DRIVE_VBUS4"};
+static const char * const gpio42_group[] = {"GPIO42", "USB_DRIVE_VBUS5"};
+static const char * const se_qspi_clk_group[] = {"SE_QSPI_CLK", "QSPI_CLK"};
+static const char * const se_qspi_cs_group[] = {"SE_QSPI_CS_L", "QSPI_CS_L"};
+static const char * const se_qspi_data0_group[] = {"SE_QSPI_DATA0",
+					"QSPI_DATA0"};
+static const char * const se_qspi_data1_group[] = {"SE_QSPI_DATA1",
+					"QSPI_DATA1"};
+static const char * const se_qspi_data2_group[] = {"SE_QSPI_DATA2",
+					"QSPI_DATA2"};
+static const char * const se_qspi_data3_group[] = {"SE_QSPI_DATA3",
+					"QSPI_DATA3"};
+static const struct sky1_pin_desc sky1_pinctrl_s5_pads[] = {
+	SKY_PINFUNCTION(PINCTRL_PIN(0, "GPIO1"), gpio1),
+	SKY_PINFUNCTION(PINCTRL_PIN(1, "GPIO2"), gpio2),
+	SKY_PINFUNCTION(PINCTRL_PIN(2, "GPIO3"), gpio3),
+	SKY_PINFUNCTION(PINCTRL_PIN(3, "GPIO4"), gpio4),
+	SKY_PINFUNCTION(PINCTRL_PIN(4, "GPIO5"), gpio5),
+	SKY_PINFUNCTION(PINCTRL_PIN(5, "GPIO6"), gpio6),
+	SKY_PINFUNCTION(PINCTRL_PIN(6, "GPIO7"), gpio7),
+	SKY_PINFUNCTION(PINCTRL_PIN(7, "GPIO8"), gpio8),
+	SKY_PINFUNCTION(PINCTRL_PIN(8, "GPIO9"), gpio9),
+	SKY_PINFUNCTION(PINCTRL_PIN(9, "GPIO10"), gpio10),
+	SKY_PINFUNCTION(PINCTRL_PIN(10, "GPIO11"), gpio11),
+	SKY_PINFUNCTION(PINCTRL_PIN(11, "GPIO12"), gpio12),
+	SKY_PINFUNCTION(PINCTRL_PIN(12, "GPIO13"), gpio13),
+	SKY_PINFUNCTION(PINCTRL_PIN(13, "GPIO14"), gpio14),
+	SKY_PINFUNCTION(PINCTRL_PIN(14, "RSMRST_L"), rsmrst),
+	SKY_PINFUNCTION(PINCTRL_PIN(15, "SRST_L"), srst),
+	SKY_PINFUNCTION(PINCTRL_PIN(16, "SLP_S3_L"), slp_s3),
+	SKY_PINFUNCTION(PINCTRL_PIN(17, "SLP_S5_L"), slp_s5),
+	SKY_PINFUNCTION(PINCTRL_PIN(18, "PWRGD"), pwrgd),
+	SKY_PINFUNCTION(PINCTRL_PIN(19, "PWROK"), pwrok),
+	SKY_PINFUNCTION(PINCTRL_PIN(20, "PWRBTN_L"), pwrbtn),
+	SKY_PINFUNCTION(PINCTRL_PIN(21, "VDD_DDRIO_GATE"), ddrio_gate),
+	SKY_PINFUNCTION(PINCTRL_PIN(22, "JTAG_GPIO_L"), jtag_gpio),
+	SKY_PINFUNCTION(PINCTRL_PIN(23, "JTAG_TCK"), jtag_tck),
+	SKY_PINFUNCTION(PINCTRL_PIN(24, "JTAG_TDI"), jtag_tdi),
+	SKY_PINFUNCTION(PINCTRL_PIN(25, "JTAG_TDO"), jtag_tdo),
+	SKY_PINFUNCTION(PINCTRL_PIN(26, "TMS"), tms),
+	SKY_PINFUNCTION(PINCTRL_PIN(27, "TRSL_L"), trsl),
+	SKY_PINFUNCTION(PINCTRL_PIN(28, "SFI_I2C0_SCL"), sfi_i2c0_scl),
+	SKY_PINFUNCTION(PINCTRL_PIN(29, "SFI_I2C0_SDA"), sfi_i2c0_sda),
+	SKY_PINFUNCTION(PINCTRL_PIN(30, "SFI_I2C1_SCL"), sfi_i2c1_scl),
+	SKY_PINFUNCTION(PINCTRL_PIN(31, "SFI_I2C1_SDA"), sfi_i2c1_sda),
+	SKY_PINFUNCTION(PINCTRL_PIN(32, "SFI_GPIO0"), sfi_gpio0),
+	SKY_PINFUNCTION(PINCTRL_PIN(33, "SFI_GPIO1"), sfi_gpio1),
+	SKY_PINFUNCTION(PINCTRL_PIN(34, "SFI_GPIO2"), sfi_gpio2),
+	SKY_PINFUNCTION(PINCTRL_PIN(35, "GPIO18"), gpio18),
+	SKY_PINFUNCTION(PINCTRL_PIN(36, "GPIO19"), gpio19),
+	SKY_PINFUNCTION(PINCTRL_PIN(37, "GPIO20"), gpio20),
+	SKY_PINFUNCTION(PINCTRL_PIN(38, "GPIO21"), gpio21),
+	SKY_PINFUNCTION(PINCTRL_PIN(39, "GPIO22"), gpio22),
+	SKY_PINFUNCTION(PINCTRL_PIN(40, "GPIO23"), gpio23),
+	SKY_PINFUNCTION(PINCTRL_PIN(41, "GPIO24"), gpio24),
+	SKY_PINFUNCTION(PINCTRL_PIN(42, "SPI1_MISO"), spi1_miso),
+	SKY_PINFUNCTION(PINCTRL_PIN(43, "SPI1_CS0"), spi1_cs0),
+	SKY_PINFUNCTION(PINCTRL_PIN(44, "SPI1_CS1"), spi1_cs1),
+	SKY_PINFUNCTION(PINCTRL_PIN(45, "SPI1_MOSI"), spi1_mosi),
+	SKY_PINFUNCTION(PINCTRL_PIN(46, "SPI1_CLK"), spi1_clk),
+	SKY_PINFUNCTION(PINCTRL_PIN(47, "GPIO30"), gpio30),
+	SKY_PINFUNCTION(PINCTRL_PIN(48, "GPIO31"), gpio31),
+	SKY_PINFUNCTION(PINCTRL_PIN(49, "GPIO32"), gpio32),
+	SKY_PINFUNCTION(PINCTRL_PIN(50, "GPIO33"), gpio33),
+	SKY_PINFUNCTION(PINCTRL_PIN(51, "GPIO34"), gpio34),
+	SKY_PINFUNCTION(PINCTRL_PIN(52, "GPIO35"), gpio35),
+	SKY_PINFUNCTION(PINCTRL_PIN(53, "GPIO36"), gpio36),
+	SKY_PINFUNCTION(PINCTRL_PIN(54, "GPIO37"), gpio37),
+	SKY_PINFUNCTION(PINCTRL_PIN(55, "GPIO38"), gpio38),
+	SKY_PINFUNCTION(PINCTRL_PIN(56, "GPIO39"), gpio39),
+	SKY_PINFUNCTION(PINCTRL_PIN(57, "GPIO40"), gpio40),
+	SKY_PINFUNCTION(PINCTRL_PIN(58, "GPIO41"), gpio41),
+	SKY_PINFUNCTION(PINCTRL_PIN(59, "GPIO42"), gpio42),
+	SKY_PINFUNCTION(PINCTRL_PIN(60, "SE_QSPI_CLK"), se_qspi_clk),
+	SKY_PINFUNCTION(PINCTRL_PIN(61, "SE_QSPI_CS_L"), se_qspi_cs),
+	SKY_PINFUNCTION(PINCTRL_PIN(62, "SE_QSPI_DATA0"), se_qspi_data0),
+	SKY_PINFUNCTION(PINCTRL_PIN(63, "SE_QSPI_DATA1"), se_qspi_data1),
+	SKY_PINFUNCTION(PINCTRL_PIN(64, "SE_QSPI_DATA2"), se_qspi_data2),
+	SKY_PINFUNCTION(PINCTRL_PIN(65, "SE_QSPI_DATA3"), se_qspi_data3),
+};
+
+/* Pad names for the s0 domain pinmux subsystem */
+static const char * const gpio43_group[] = {"GPIO43"};
+static const char * const gpio44_group[] = {"GPIO44"};
+static const char * const gpio45_group[] = {"GPIO45"};
+static const char * const gpio46_group[] = {"GPIO46"};
+static const char * const reset_in_group[] = { };
+static const char * const plt_reset_group[] = { };
+static const char * const thermtrip_group[] = { };
+static const char * const prochot_group[] = { };
+static const char * const pm_i2c0_clk_group[] = { };
+static const char * const pm_i2c0_data_group[] = { };
+static const char * const pm_i2c1_clk_group[] = { };
+static const char * const pm_i2c1_data_group[] = { };
+static const char * const pm_i2c2_clk_group[] = { };
+static const char * const pm_i2c2_data_group[] = { };
+static const char * const pm_i2c3_clk_group[] = { };
+static const char * const pm_i2c3_data_group[] = { };
+static const char * const strap0_group[] = { };
+static const char * const strap1_group[] = { };
+static const char * const dp2_digon_group[] = {"DP2_DIGON"};
+static const char * const dp2_blon_group[] = {"DP2_BLON"};
+static const char * const dp2_vary_bl_group[] = {"DP2_VARY_BL"};
+static const char * const i2c7_scl_group[] = {"I2C7_SCL"};
+static const char * const i2c7_sda_group[] = {"I2C7_SDA"};
+static const char * const uart6_csu_se_txd_group[] = { };
+static const char * const clk_req1_group[] = { };
+static const char * const clk_req3_group[] = { };
+static const char * const i2c5_scl_group[] = {"I2C5_SCL", "GPIO47"};
+static const char * const i2c5_sda_group[] = {"I2C5_SDA", "GPIO48"};
+static const char * const i2c6_scl_group[] = {"I2C6_SCL", "GPIO49"};
+static const char * const i2c6_sda_group[] = {"I2C6_SDA", "GPIO50"};
+static const char * const i2c0_scl_group[] = {"I2C0_SCL", "GPIO51"};
+static const char * const i2c0_sda_group[] = {"I2C0_SDA", "GPIO52"};
+static const char * const i2c1_scl_group[] = {"I2C1_SCL", "GPIO53"};
+static const char * const i2c1_sda_group[] = {"I2C1_SDA", "GPIO54"};
+static const char * const i2c2_scl_group[] = {"I2C2_SCL", "I3C0_SCL",
+					"GPIO55"};
+static const char * const i2c2_sda_group[] = {"I2C2_SDA", "I3C0_SDA",
+					"GPIO56"};
+static const char * const gpio57_group[] = {"GPIO57", "I3C0_PUR_EN_L"};
+static const char * const i2c3_scl_group[] = {"I2C3_SCL", "I3C1_SCL",
+					"GPIO58"};
+static const char * const i2c3_sda_group[] = {"I2C3_SDA", "I3C1_SDA",
+					"GPIO59"};
+static const char * const gpio60_group[] = {"GPIO60", "I3C1_PUR_EN_L"};
+static const char * const i2c4_scl_group[] = {"I2C4_SCL", "GPIO61"};
+static const char * const i2c4_sda_group[] = {"I2C4_SDA", "GPIO62"};
+static const char * const hda_bitclk_group[] = {"HDA_BITCLK", "I2S0_SCK",
+				"I2S9_RSCK_DBG"};
+static const char * const hda_rst_group[] = {"HDA_RST_L", "I2S0_DATA_IN",
+				"I2S9_DATA_IN_DBG"};
+static const char * const hda_sdin0_group[] = {"HDA_SDIN0", "I2S0_MCLK",
+				"I2S9_TSCK_DBG"};
+static const char * const hda_sdout0_group[] = {"HDA_SDOUT0", "I2S0_DATA_OUT",
+				"I2S9_TWS_DBG"};
+static const char * const hda_sync_group[] = {"HDA_SYNC", "I2S0_WS",
+				"I2S9_RWS_DBG"};
+static const char * const hda_sdin1_group[] = {"HDA_SDIN1", "GPIO63",
+				"I2S9_DATA_IN1_DBG"};
+static const char * const hda_sdout1_group[] = {"HDA_SDOUT1", "GPIO64",
+				"I2S9_DATA_OUT0_DBG"};
+static const char * const i2s1_mclk_group[] = {"I2S1_MCLK", "GPIO65"};
+static const char * const i2s1_sck_group[] = {"I2S1_SCK", "GPIO66"};
+static const char * const i2s1_ws_group[] = {"I2S1_WS", "GPIO67"};
+static const char * const i2s1_data_in_group[] = {"I2S1_DATA_IN", "GPIO68"};
+static const char * const i2s1_data_out_group[] = {"I2S1_DATA_OUT", "GPIO69"};
+static const char * const i2s2_mck_group[] = {"I2S2_MCLK", "GPIO70"};
+static const char * const i2s2_rsck_group[] = {"I2S2_RSCK", "GPIO71",
+				"I2S5_RSCK_DBG", "I2S6_RSCK_DBG"};
+static const char * const i2s2_rws_group[] = {"I2S2_RWS", "GPIO72",
+				"I2S5_RWS_DBG", "I2S6_RWS_DBG"};
+static const char * const i2s2_tsck_group[] = {"I2S2_TSCK", "GPIO73",
+				"I2S5_TSCK_DBG", "I2S6_TSCK_DBG"};
+static const char * const i2s2_tws_group[] = {"I2S2_TWS", "GPIO74",
+				"I2S5_TWS_DBG", "I2S6_TWS_DBG"};
+static const char * const i2s2_data_in0_group[] = {"I2S2_DATA_IN0", "GPIO75",
+				"I2S5_DATA_IN0_DBG", "I2S6_DATA_IN0_DBG"};
+static const char * const i2s2_data_in1_group[] = {"I2S2_DATA_IN1", "GPIO76",
+				"I2S5_DATA_IN1_DBG", "I2S6_DATA_IN1_DBG"};
+static const char * const i2s2_data_out0_group[] = {"I2S2_DATA_OUT0", "GPIO77",
+				"I2S5_DATA_OUT0_DBG", "I2S6_DATA_OUT0_DBG"};
+static const char * const i2s2_data_out1_group[] = {"I2S2_DATA_OUT1", "GPIO78",
+				"I2S5_DATA_OUT1_DBG", "I2S6_DATA_OUT1_DBG"};
+static const char * const i2s2_data_out2_group[] = {"I2S2_DATA_OUT2",
+				"GPIO79"};
+static const char * const i2s2_data_out3_group[] = {"I2S2_DATA_OUT3", "GPIO80",
+				"I2S9_DATA_OUT1_DBG"};
+static const char * const i2s3_mclk_group[] = {"I2S3_MCLK", "GPIO81"};
+static const char * const i2s3_rsck_group[] = {"I2S3_RSCK", "GPIO82",
+				"I2S7_RSCK_DBG", "I2S8_RSCK_DBG"};
+static const char * const i2s3_rws_group[] = {"I2S3_RWS", "GPIO83",
+				"I2S7_RWS_DBG", "I2S8_RWS_DBG"};
+static const char * const i2s3_tsck_group[] = {"I2S3_TSCK", "GPIO84",
+				"I2S7_TSCK_DBG", "I2S8_TSCK_DBG"};
+static const char * const i2s3_tws_group[] = {"I2S3_TWS", "GPIO85",
+				"I2S7_TWS_DBG", "I2S8_TWS_DBG"};
+static const char * const i2s3_data_in0_group[] = {"I2S3_DATA_IN0", "GPIO86",
+				"I2S7_DATA_IN0_DBG", "I2S8_DATA_IN0_DBG"};
+static const char * const i2s3_data_in1_group[] = {"I2S3_DATA_IN1", "GPIO87",
+				"I2S7_DATA_IN1_DBG", "I2S8_DATA_IN1_DBG"};
+static const char * const i2s3_data_out0_group[] = {"I2S3_DATA_OUT0", "GPIO88",
+				"I2S7_DATA_OUT0_DBG", "I2S8_DATA_OUT0_DBG"};
+static const char * const i2s3_data_out1_group[] = {"I2S3_DATA_OUT1", "GPIO89",
+				"I2S7_DATA_OUT1_DBG", "I2S8_DATA_OUT1_DBG"};
+static const char * const gpio90_group[] = {"GPIO90", "I2S4_MCLK_LB"};
+static const char * const gpio91_group[] = {"GPIO91", "I2S4_SCK_LB"};
+static const char * const gpio92_group[] = {"GPIO92", "I2S4_WS_LB"};
+static const char * const gpio93_group[] = {"GPIO93", "I2S4_DATA_IN_LB"};
+static const char * const gpio94_group[] = {"GPIO94", "I2S4_DATA_OUT_LB"};
+static const char * const uart0_txd_group[] = {"UART0_TXD", "PWM0", "GPIO95"};
+static const char * const uart0_rxd_group[] = {"UART0_RXD", "PWM1", "GPIO96"};
+static const char * const uart0_cts_group[] = {"UART0_CTS", "FAN_OUT2",
+				"GPIO97"};
+static const char * const uart0_rts_group[] = {"UART0_RTS", "FAN_TACH2",
+				"GPIO98"};
+static const char * const uart1_txd_group[] = {"UART1_TXD", "FAN_OUT0",
+				"GPIO99"};
+static const char * const uart1_rxd_group[] = {"UART1_RXD", "FAN_TACH0",
+				"GPIO100"};
+static const char * const uart1_cts_group[] = {"UART1_CTS", "FAN_OUT1",
+				"GPIO101"};
+static const char * const uart1_rts_group[] = {"UART1_RTS", "FAN_TACH1",
+				"GPIO102"};
+static const char * const uart2_txd_group[] = {"UART2_TXD", "GPIO103"};
+static const char * const uart2_rxd_group[] = {"UART2_RXD", "GPIO104"};
+static const char * const uart3_txd_group[] = {"UART3_TXD", "GPIO105"};
+static const char * const uart3_rxd_group[] = {"UART3_RXD", "GPIO106"};
+static const char * const uart3_cts_group[] = {"UART3_CTS", "GPIO107",
+				"TRIGIN0"};
+static const char * const uart3_rts_group[] = {"UART3_RTS", "GPIO108",
+				"TRIGIN1"};
+static const char * const uart4_csu_pm_txd_group[] = {"UART4_CSU_PM_TXD",
+				"GPIO109"};
+static const char * const uart4_csu_pm_rxd_group[] = {"UART4_CSU_PM_RXD",
+				"GPIO110"};
+static const char * const uart5_csu_se_txd_group[] = {"UART5_CSU_SE_TXD",
+				"GPIO111"};
+static const char * const uart5_csu_se_rxd_group[] = {"UART5_CSU_SE_RXD",
+				"GPIO112"};
+static const char * const uart6_csu_se_rxd_group[] = {"UART6_CSU_SE_RXD",
+				"GPIO113"};
+static const char * const clk_req0_group[] = {"CLK_REQ0_L", "GPIO114"};
+static const char * const clk_req2_group[] = {"CLK_REQ2_L", "GPIO115"};
+static const char * const clk_req4_group[] = {"CLK_REQ4_L", "GPIO116"};
+static const char * const csi0_mclk0_group[] = {"CSI0_MCLK0", "GPIO117"};
+static const char * const csi0_mclk1_group[] = {"CSI0_MCLK1", "GPIO118"};
+static const char * const csi1_mclk0_group[] = {"CSI1_MCLK0", "GPIO119"};
+static const char * const csi1_mclk1_group[] = {"CSI1_MCLK1", "GPIO120"};
+static const char * const gpio121_group[] = {"GPIO121", "GMAC0_REFCLK_25M"};
+static const char * const gpio122_group[] = {"GPIO122", "GMAC0_TX_CTL"};
+static const char * const gpio123_group[] = {"GPIO123", "GMAC0_TXD0"};
+static const char * const gpio124_group[] = {"GPIO124", "GMAC0_TXD1"};
+static const char * const gpio125_group[] = {"GPIO125", "GMAC0_TXD2"};
+static const char * const gpio126_group[] = {"GPIO126", "GMAC0_TXD3"};
+static const char * const gpio127_group[] = {"GPIO127", "GMAC0_TX_CLK"};
+static const char * const gpio128_group[] = {"GPIO128", "GMAC0_RX_CTL"};
+static const char * const gpio129_group[] = {"GPIO129", "GMAC0_RXD0"};
+static const char * const gpio130_group[] = {"GPIO130", "GMAC0_RXD1"};
+static const char * const gpio131_group[] = {"GPIO131", "GMAC0_RXD2"};
+static const char * const gpio132_group[] = {"GPIO132", "GMAC0_RXD3"};
+static const char * const gpio133_group[] = {"GPIO133", "GMAC0_RX_CLK"};
+static const char * const gpio134_group[] = {"GPIO134", "GMAC0_MDC"};
+static const char * const gpio135_group[] = {"GPIO135", "GMAC0_MDIO"};
+static const char * const gpio136_group[] = {"GPIO136", "GMAC1_REFCLK_25M"};
+static const char * const gpio137_group[] = {"GPIO137", "GMAC1_TX_CTL"};
+static const char * const gpio138_group[] = {"GPIO138", "GMAC1_TXD0",
+				"SPI2_MISO"};
+static const char * const gpio139_group[] = {"GPIO139", "GMAC1_TXD1",
+				"SPI2_CS0"};
+static const char * const gpio140_group[] = {"GPIO140", "GMAC1_TXD2",
+				"SPI2_CS1"};
+static const char * const gpio141_group[] = {"GPIO141", "GMAC1_TXD3",
+				"SPI2_MOSI"};
+static const char * const gpio142_group[] = {"GPIO142", "GMAC1_TX_CLK",
+				"SPI2_CLK"};
+static const char * const gpio143_group[] = {"GPIO143", "GMAC1_RX_CTL"};
+static const char * const gpio144_group[] = {"GPIO144", "GMAC1_RXD0"};
+static const char * const gpio145_group[] = {"GPIO145", "GMAC1_RXD1"};
+static const char * const gpio146_group[] = {"GPIO146", "GMAC1_RXD2"};
+static const char * const gpio147_group[] = {"GPIO147", "GMAC1_RXD3"};
+static const char * const gpio148_group[] = {"GPIO148", "GMAC1_RX_CLK"};
+static const char * const gpio149_group[] = {"GPIO149", "GMAC1_MDC"};
+static const char * const gpio150_group[] = {"GPIO150", "GMAC1_MDIO"};
+static const char * const gpio151_group[] = {"GPIO151", "PM_GPIO0"};
+static const char * const gpio152_group[] = {"GPIO152", "PM_GPIO1"};
+static const char * const gpio153_group[] = {"GPIO153", "PM_GPIO2"};
+static const struct sky1_pin_desc sky1_pinctrl_pads[] = {
+	SKY_PINFUNCTION(PINCTRL_PIN(0, "GPIO43"), gpio43),
+	SKY_PINFUNCTION(PINCTRL_PIN(1, "GPIO44"), gpio44),
+	SKY_PINFUNCTION(PINCTRL_PIN(2, "GPIO45"), gpio45),
+	SKY_PINFUNCTION(PINCTRL_PIN(3, "GPIO46"), gpio46),
+	SKY_PINFUNCTION(PINCTRL_PIN(4, "RESET_IN_L"), reset_in),
+	SKY_PINFUNCTION(PINCTRL_PIN(5, "PLT_RESET_L"), plt_reset),
+	SKY_PINFUNCTION(PINCTRL_PIN(6, "THERMTRIP_L"), thermtrip),
+	SKY_PINFUNCTION(PINCTRL_PIN(7, "PROCHOT_L"), prochot),
+	SKY_PINFUNCTION(PINCTRL_PIN(8, "PM_I2C0_CLK"), pm_i2c0_clk),
+	SKY_PINFUNCTION(PINCTRL_PIN(9, "PM_I2C0_DATA"), pm_i2c0_data),
+	SKY_PINFUNCTION(PINCTRL_PIN(10, "PM_I2C1_CLK"), pm_i2c1_clk),
+	SKY_PINFUNCTION(PINCTRL_PIN(11, "PM_I2C1_DATA"), pm_i2c1_data),
+	SKY_PINFUNCTION(PINCTRL_PIN(12, "PM_I2C2_CLK"), pm_i2c2_clk),
+	SKY_PINFUNCTION(PINCTRL_PIN(13, "PM_I2C2_DATA"), pm_i2c2_data),
+	SKY_PINFUNCTION(PINCTRL_PIN(14, "PM_I2C3_CLK"), pm_i2c3_clk),
+	SKY_PINFUNCTION(PINCTRL_PIN(15, "PM_I2C3_DATA"), pm_i2c3_data),
+	SKY_PINFUNCTION(PINCTRL_PIN(16, "STRAP0"), strap0),
+	SKY_PINFUNCTION(PINCTRL_PIN(17, "STRAP1"), strap1),
+	SKY_PINFUNCTION(PINCTRL_PIN(18, "DP2_DIGON"), dp2_digon),
+	SKY_PINFUNCTION(PINCTRL_PIN(19, "DP2_BLON"), dp2_blon),
+	SKY_PINFUNCTION(PINCTRL_PIN(20, "DP2_VARY_BL"), dp2_vary_bl),
+	SKY_PINFUNCTION(PINCTRL_PIN(21, "I2C7_SCL"), i2c7_scl),
+	SKY_PINFUNCTION(PINCTRL_PIN(22, "I2C7_SDA"), i2c7_sda),
+	SKY_PINFUNCTION(PINCTRL_PIN(23, "UART6_CSU_SE_TXD"), uart6_csu_se_txd),
+	SKY_PINFUNCTION(PINCTRL_PIN(24, "CLK_REQ1_L"), clk_req1),
+	SKY_PINFUNCTION(PINCTRL_PIN(25, "CLK_REQ3_L"), clk_req3),
+	SKY_PINFUNCTION(PINCTRL_PIN(26, "I2C5_SCL"), i2c5_scl),
+	SKY_PINFUNCTION(PINCTRL_PIN(27, "I2C5_SDA"), i2c5_sda),
+	SKY_PINFUNCTION(PINCTRL_PIN(28, "I2C6_SCL"), i2c6_scl),
+	SKY_PINFUNCTION(PINCTRL_PIN(29, "I2C6_SDA"), i2c6_sda),
+	SKY_PINFUNCTION(PINCTRL_PIN(30, "I2C0_CLK"), i2c0_scl),
+	SKY_PINFUNCTION(PINCTRL_PIN(31, "I2C0_SDA"), i2c0_sda),
+	SKY_PINFUNCTION(PINCTRL_PIN(32, "I2C1_CLK"), i2c1_scl),
+	SKY_PINFUNCTION(PINCTRL_PIN(33, "I2C1_SDA"), i2c1_sda),
+	SKY_PINFUNCTION(PINCTRL_PIN(34, "I2C2_SCL"), i2c2_scl),
+	SKY_PINFUNCTION(PINCTRL_PIN(35, "I2C2_SDA"), i2c2_sda),
+	SKY_PINFUNCTION(PINCTRL_PIN(36, "GPIO57"), gpio57),
+	SKY_PINFUNCTION(PINCTRL_PIN(37, "I2C3_SCL"), i2c3_scl),
+	SKY_PINFUNCTION(PINCTRL_PIN(38, "I2C3_SDA"), i2c3_sda),
+	SKY_PINFUNCTION(PINCTRL_PIN(39, "GPIO60"), gpio60),
+	SKY_PINFUNCTION(PINCTRL_PIN(40, "I2C4_SCL"), i2c4_scl),
+	SKY_PINFUNCTION(PINCTRL_PIN(41, "I2C4_SDA"), i2c4_sda),
+	SKY_PINFUNCTION(PINCTRL_PIN(42, "HDA_BITCLK"), hda_bitclk),
+	SKY_PINFUNCTION(PINCTRL_PIN(43, "HDA_RST_L"), hda_rst),
+	SKY_PINFUNCTION(PINCTRL_PIN(44, "HDA_SDIN0"), hda_sdin0),
+	SKY_PINFUNCTION(PINCTRL_PIN(45, "HDA_SDOUT0"), hda_sdout0),
+	SKY_PINFUNCTION(PINCTRL_PIN(46, "HDA_SYNC"), hda_sync),
+	SKY_PINFUNCTION(PINCTRL_PIN(47, "HDA_SDIN1"), hda_sdin1),
+	SKY_PINFUNCTION(PINCTRL_PIN(48, "HDA_SDOUT1"), hda_sdout1),
+	SKY_PINFUNCTION(PINCTRL_PIN(49, "I2S1_MCLK"), i2s1_mclk),
+	SKY_PINFUNCTION(PINCTRL_PIN(50, "I2S1_SCK"), i2s1_sck),
+	SKY_PINFUNCTION(PINCTRL_PIN(51, "I2S1_WS"), i2s1_ws),
+	SKY_PINFUNCTION(PINCTRL_PIN(52, "I2S1_DATA_IN"), i2s1_data_in),
+	SKY_PINFUNCTION(PINCTRL_PIN(53, "I2S1_DATA_OUT"), i2s1_data_out),
+	SKY_PINFUNCTION(PINCTRL_PIN(54, "I2S2_MCLK"), i2s2_mck),
+	SKY_PINFUNCTION(PINCTRL_PIN(55, "I2S2_RSCK"), i2s2_rsck),
+	SKY_PINFUNCTION(PINCTRL_PIN(56, "I2S2_RWS"), i2s2_rws),
+	SKY_PINFUNCTION(PINCTRL_PIN(57, "I2S2_TSCK"), i2s2_tsck),
+	SKY_PINFUNCTION(PINCTRL_PIN(58, "I2S2_TWS"), i2s2_tws),
+	SKY_PINFUNCTION(PINCTRL_PIN(59, "I2S2_DATA_IN0"), i2s2_data_in0),
+	SKY_PINFUNCTION(PINCTRL_PIN(60, "I2S2_DATA_IN1"), i2s2_data_in1),
+	SKY_PINFUNCTION(PINCTRL_PIN(61, "I2S2_DATA_OUT0"), i2s2_data_out0),
+	SKY_PINFUNCTION(PINCTRL_PIN(62, "I2S2_DATA_OUT1"), i2s2_data_out1),
+	SKY_PINFUNCTION(PINCTRL_PIN(63, "I2S2_DATA_OUT2"), i2s2_data_out2),
+	SKY_PINFUNCTION(PINCTRL_PIN(64, "I2S2_DATA_OUT3"), i2s2_data_out3),
+	SKY_PINFUNCTION(PINCTRL_PIN(65, "I2S3_MCLK"), i2s3_mclk),
+	SKY_PINFUNCTION(PINCTRL_PIN(66, "I2S3_RSCK"), i2s3_rsck),
+	SKY_PINFUNCTION(PINCTRL_PIN(67, "I2S3_RWS"), i2s3_rws),
+	SKY_PINFUNCTION(PINCTRL_PIN(68, "I2S3_TSCK"), i2s3_tsck),
+	SKY_PINFUNCTION(PINCTRL_PIN(69, "I2S3_TWS"), i2s3_tws),
+	SKY_PINFUNCTION(PINCTRL_PIN(70, "I2S3_DATA_IN0"), i2s3_data_in0),
+	SKY_PINFUNCTION(PINCTRL_PIN(71, "I2S3_DATA_IN1"), i2s3_data_in1),
+	SKY_PINFUNCTION(PINCTRL_PIN(72, "I2S3_DATA_OUT0"), i2s3_data_out0),
+	SKY_PINFUNCTION(PINCTRL_PIN(73, "I2S3_DATA_OUT1"), i2s3_data_out1),
+	SKY_PINFUNCTION(PINCTRL_PIN(74, "GPIO90"), gpio90),
+	SKY_PINFUNCTION(PINCTRL_PIN(75, "GPIO91"), gpio91),
+	SKY_PINFUNCTION(PINCTRL_PIN(76, "GPIO92"), gpio92),
+	SKY_PINFUNCTION(PINCTRL_PIN(77, "GPIO93"), gpio93),
+	SKY_PINFUNCTION(PINCTRL_PIN(78, "GPIO94"), gpio94),
+	SKY_PINFUNCTION(PINCTRL_PIN(79, "UART0_TXD"), uart0_txd),
+	SKY_PINFUNCTION(PINCTRL_PIN(80, "UART0_RXD"), uart0_rxd),
+	SKY_PINFUNCTION(PINCTRL_PIN(81, "UART0_CTS"), uart0_cts),
+	SKY_PINFUNCTION(PINCTRL_PIN(82, "UART0_RTS"), uart0_rts),
+	SKY_PINFUNCTION(PINCTRL_PIN(83, "UART1_TXD"), uart1_txd),
+	SKY_PINFUNCTION(PINCTRL_PIN(84, "UART1_RXD"), uart1_rxd),
+	SKY_PINFUNCTION(PINCTRL_PIN(85, "UART1_CTS"), uart1_cts),
+	SKY_PINFUNCTION(PINCTRL_PIN(86, "UART1_RTS"), uart1_rts),
+	SKY_PINFUNCTION(PINCTRL_PIN(87, "UART2_TXD"), uart2_txd),
+	SKY_PINFUNCTION(PINCTRL_PIN(88, "UART2_RXD"), uart2_rxd),
+	SKY_PINFUNCTION(PINCTRL_PIN(89, "UART3_TXD"), uart3_txd),
+	SKY_PINFUNCTION(PINCTRL_PIN(90, "UART3_RXD"), uart3_rxd),
+	SKY_PINFUNCTION(PINCTRL_PIN(91, "UART3_CTS"), uart3_cts),
+	SKY_PINFUNCTION(PINCTRL_PIN(92, "UART3_RTS"), uart3_rts),
+	SKY_PINFUNCTION(PINCTRL_PIN(93, "UART4_CSU_PM_TXD"), uart4_csu_pm_txd),
+	SKY_PINFUNCTION(PINCTRL_PIN(94, "UART4_CSU_PM_RXD"), uart4_csu_pm_rxd),
+	SKY_PINFUNCTION(PINCTRL_PIN(95, "UART5_CSU_SE_TXD"), uart5_csu_se_txd),
+	SKY_PINFUNCTION(PINCTRL_PIN(96, "UART5_CSU_SE_RXD"), uart5_csu_se_rxd),
+	SKY_PINFUNCTION(PINCTRL_PIN(97, "UART6_CSU_SE_RXD"), uart6_csu_se_rxd),
+	SKY_PINFUNCTION(PINCTRL_PIN(98, "CLK_REQ0_L"), clk_req0),
+	SKY_PINFUNCTION(PINCTRL_PIN(99, "CLK_REQ2_L"), clk_req2),
+	SKY_PINFUNCTION(PINCTRL_PIN(100, "CLK_REQ4_L"), clk_req4),
+	SKY_PINFUNCTION(PINCTRL_PIN(101, "CSI0_MCLK0"), csi0_mclk0),
+	SKY_PINFUNCTION(PINCTRL_PIN(102, "CSI0_MCLK1"), csi0_mclk1),
+	SKY_PINFUNCTION(PINCTRL_PIN(103, "CSI1_MCLK0"), csi1_mclk0),
+	SKY_PINFUNCTION(PINCTRL_PIN(104, "CSI1_MCLK1"), csi1_mclk1),
+	SKY_PINFUNCTION(PINCTRL_PIN(105, "GPIO121"), gpio121),
+	SKY_PINFUNCTION(PINCTRL_PIN(106, "GPIO122"), gpio122),
+	SKY_PINFUNCTION(PINCTRL_PIN(107, "GPIO123"), gpio123),
+	SKY_PINFUNCTION(PINCTRL_PIN(108, "GPIO124"), gpio124),
+	SKY_PINFUNCTION(PINCTRL_PIN(109, "GPIO125"), gpio125),
+	SKY_PINFUNCTION(PINCTRL_PIN(110, "GPIO126"), gpio126),
+	SKY_PINFUNCTION(PINCTRL_PIN(111, "GPIO127"), gpio127),
+	SKY_PINFUNCTION(PINCTRL_PIN(112, "GPIO128"), gpio128),
+	SKY_PINFUNCTION(PINCTRL_PIN(113, "GPIO129"), gpio129),
+	SKY_PINFUNCTION(PINCTRL_PIN(114, "GPIO130"), gpio130),
+	SKY_PINFUNCTION(PINCTRL_PIN(115, "GPIO131"), gpio131),
+	SKY_PINFUNCTION(PINCTRL_PIN(116, "GPIO132"), gpio132),
+	SKY_PINFUNCTION(PINCTRL_PIN(117, "GPIO133"), gpio133),
+	SKY_PINFUNCTION(PINCTRL_PIN(118, "GPIO134"), gpio134),
+	SKY_PINFUNCTION(PINCTRL_PIN(119, "GPIO135"), gpio135),
+	SKY_PINFUNCTION(PINCTRL_PIN(120, "GPIO136"), gpio136),
+	SKY_PINFUNCTION(PINCTRL_PIN(121, "GPIO137"), gpio137),
+	SKY_PINFUNCTION(PINCTRL_PIN(122, "GPIO138"), gpio138),
+	SKY_PINFUNCTION(PINCTRL_PIN(123, "GPIO139"), gpio139),
+	SKY_PINFUNCTION(PINCTRL_PIN(124, "GPIO140"), gpio140),
+	SKY_PINFUNCTION(PINCTRL_PIN(125, "GPIO141"), gpio141),
+	SKY_PINFUNCTION(PINCTRL_PIN(126, "GPIO142"), gpio142),
+	SKY_PINFUNCTION(PINCTRL_PIN(127, "GPIO143"), gpio143),
+	SKY_PINFUNCTION(PINCTRL_PIN(128, "GPIO144"), gpio144),
+	SKY_PINFUNCTION(PINCTRL_PIN(129, "GPIO145"), gpio145),
+	SKY_PINFUNCTION(PINCTRL_PIN(130, "GPIO146"), gpio146),
+	SKY_PINFUNCTION(PINCTRL_PIN(131, "GPIO147"), gpio147),
+	SKY_PINFUNCTION(PINCTRL_PIN(132, "GPIO148"), gpio148),
+	SKY_PINFUNCTION(PINCTRL_PIN(133, "GPIO149"), gpio149),
+	SKY_PINFUNCTION(PINCTRL_PIN(134, "GPIO150"), gpio150),
+	SKY_PINFUNCTION(PINCTRL_PIN(135, "GPIO151"), gpio151),
+	SKY_PINFUNCTION(PINCTRL_PIN(136, "GPIO152"), gpio152),
+	SKY_PINFUNCTION(PINCTRL_PIN(137, "GPIO153"), gpio153),
+};
+
+static const struct sky1_pinctrl_soc_info sky1_pinctrl_s5_info = {
+	.pins = sky1_pinctrl_s5_pads,
+	.npins = ARRAY_SIZE(sky1_pinctrl_s5_pads),
+};
+
+static const struct sky1_pinctrl_soc_info sky1_pinctrl_info = {
+	.pins = sky1_pinctrl_pads,
+	.npins = ARRAY_SIZE(sky1_pinctrl_pads),
+};
+
+static const struct of_device_id sky1_pinctrl_of_match[] = {
+	{ .compatible = "cix,sky1-pinctrl-s5", .data = &sky1_pinctrl_s5_info, },
+	{ .compatible = "cix,sky1-pinctrl", .data = &sky1_pinctrl_info, },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, sky1_pinctrl_of_match);
+
+static int __maybe_unused sky1_pinctrl_suspend(struct device *dev)
+{
+	struct sky1_pinctrl *spctl = dev_get_drvdata(dev);
+
+	return pinctrl_force_sleep(spctl->pctl);
+}
+
+static int __maybe_unused sky1_pinctrl_resume(struct device *dev)
+{
+	struct sky1_pinctrl *spctl = dev_get_drvdata(dev);
+
+	return pinctrl_force_default(spctl->pctl);
+}
+
+const struct dev_pm_ops sky1_pinctrl_pm_ops = {
+	SET_LATE_SYSTEM_SLEEP_PM_OPS(sky1_pinctrl_suspend,
+					sky1_pinctrl_resume)
+};
+EXPORT_SYMBOL_GPL(sky1_pinctrl_pm_ops);
+
+static int sky1_pinctrl_probe(struct platform_device *pdev)
+{
+	const struct sky1_pinctrl_soc_info *pinctrl_info;
+
+	pinctrl_info = device_get_match_data(&pdev->dev);
+	if (!pinctrl_info)
+		return -ENODEV;
+
+	return sky1_base_pinctrl_probe(pdev, pinctrl_info);
+}
+
+static struct platform_driver sky1_pinctrl_driver = {
+	.driver = {
+		.name = "sky1-pinctrl",
+		.of_match_table = sky1_pinctrl_of_match,
+		.pm = &sky1_pinctrl_pm_ops,
+	},
+	.probe = sky1_pinctrl_probe,
+};
+
+static int __init sky1_pinctrl_init(void)
+{
+	return platform_driver_register(&sky1_pinctrl_driver);
+}
+arch_initcall(sky1_pinctrl_init);
+
+MODULE_AUTHOR("Jerry Zhu <Jerry.Zhu@cixtech.com>");
+MODULE_DESCRIPTION("Cix Sky1 pinctrl driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/pinctrl/cix/pinctrl-sky1.h b/drivers/pinctrl/cix/pinctrl-sky1.h
new file mode 100644
index 000000000000..a8b099852965
--- /dev/null
+++ b/drivers/pinctrl/cix/pinctrl-sky1.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Author: Jerry Zhu <Jerry.Zhu@cixtech.com>
+ */
+
+#ifndef __DRIVERS_PINCTRL_SKY1_H
+#define __DRIVERS_PINCTRL_SKY1_H
+
+struct sky1_pinctrl_group {
+	const char *name;
+	unsigned long config;
+	unsigned int pin;
+};
+
+struct sky1_pin_desc {
+	const struct pinctrl_pin_desc pin;
+	const char * const *func_group;
+	unsigned int nfunc;
+};
+
+struct sky1_pinctrl_soc_info {
+	const struct sky1_pin_desc *pins;
+	unsigned int npins;
+};
+
+#define SKY_PINFUNCTION(_pin, _func)				\
+((struct sky1_pin_desc) {					\
+		.pin = _pin,					\
+		.func_group = _func##_group,			\
+		.nfunc = ARRAY_SIZE(_func##_group),		\
+	})
+/**
+ * @dev: a pointer back to containing device
+ * @base: the offset to the controller in virtual memory
+ */
+struct sky1_pinctrl {
+	struct device *dev;
+	struct pinctrl_dev *pctl;
+	void __iomem *base;
+	const struct sky1_pinctrl_soc_info *info;
+	struct sky1_pinctrl_group *groups;
+	const char **grp_names;
+};
+
+int sky1_base_pinctrl_probe(struct platform_device *pdev,
+			const struct sky1_pinctrl_soc_info *info);
+
+#endif /* __DRIVERS_PINCTRL_SKY1_H */
-- 
2.49.0


