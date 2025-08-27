Return-Path: <linux-gpio+bounces-25011-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E3FB37842
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Aug 2025 04:42:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06D007C1891
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Aug 2025 02:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ADA52E229C;
	Wed, 27 Aug 2025 02:42:33 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022124.outbound.protection.outlook.com [40.107.75.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C082882DD;
	Wed, 27 Aug 2025 02:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756262553; cv=fail; b=pBPCDbXmnVKO8PtSEd5bWlEEJqvjSb+lAesey7dmvJVjGHGgoO8+55Ea+5oTclM8IbMDMSHGOl/EZN8jgXi9iB5REb+Bf14Q8TCmlwd5Qz4GqL81XMUeM5YyMfthIztG16fCCuI9eefHNIOVOqVZPFeHdq2q1n1+W8CB5i48gwc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756262553; c=relaxed/simple;
	bh=PDuOwdpux2UwN9uJq7IaZp1Zz6Gu5oNZqVgvAP3JHXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ejsfLfaq2z6SPwy+t2ul/ynRR5YbE9EOIRCSr38ZYDgFpWBnc7K8hYGkN8dQZ9qz97ZWrWeIMz1HZw9hVXmRcq54QaU283jAvyIebrsw7TbUpV0rU80hgVRzYEKb65yZif5AErz9ghzytINfawJPlxpQlg/oaYRIiwTz9+vwYQw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DdBS4DLM6NoNqI4XtZzyl5193OYIrTFl/oTyZt3sM+D+XOkj9GfGF9vtyUxjm1to6TiShs6zjTVxDschOQXkI1fheaAqcjUBgDcNxEpasbMBYOgSDpHOmGapKLv5p/WLrw5x0jtwAk4BhyH+SIEqNBUfmmR+0cJQcfMEX7o7tj1rnm0IL8BopQJiMW6Ywjle3dJAK2RIu3ImQB4SArxhTJLKlJQok9/33bzPYYHe066uYSjN8HpI2zns9iPOfPAZmRG2Ekse6CNMz79f0BuDPL27o8psgfBHKesx3fisJUNGmqouEqlMkovHR6UJe+XxN3Hi7vhYFo4xCt/HhvJwhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6L2HaCArQnJgVQ9QisIWi8+SgRoi+GkR03qRggmmfbs=;
 b=uy4kGNv0ocvNYgc1Ft12av2kngiiS4seYX0HQjQ8VRawmtVg4Am4sxhbg2JoyfUNWjUTDBy45ZhS5usoiUUPj9M6P42JUbN0A0wZwpQ6nvdXFPGxzIMVf/vORYtyJoJrx4V7JQkmA/i+VJamhUfHjCdPteaqgBAnhAkMvQwmXFgFycAbaQUnzCFoqQVXHORzIWzG5WssQe7V4IE7DPTYSC9Ps+CRkrgX7N0OT23pXuinNLPTj0HBrllW07V7yZdSECrFv+HGECdFJ5QSvux9RY8u4SAXjLogjlq7LHfkBl98QPJ1oKuc3zRT/+eflh/dcMJlbxmRBTMo+x4dSbzxrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR01CA0147.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::27) by JH0PR06MB6630.apcprd06.prod.outlook.com
 (2603:1096:990:30::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.13; Wed, 27 Aug
 2025 02:42:24 +0000
Received: from SG1PEPF000082E3.apcprd02.prod.outlook.com
 (2603:1096:4:8f:cafe::95) by SG2PR01CA0147.outlook.office365.com
 (2603:1096:4:8f::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.13 via Frontend Transport; Wed,
 27 Aug 2025 02:42:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E3.mail.protection.outlook.com (10.167.240.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.11 via Frontend Transport; Wed, 27 Aug 2025 02:42:23 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id F0B4241C0148;
	Wed, 27 Aug 2025 10:42:22 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH 1/3] pinctrl: cix: Add pin-controller support for sky1
Date: Wed, 27 Aug 2025 10:42:20 +0800
Message-ID: <20250827024222.588082-2-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250827024222.588082-1-gary.yang@cixtech.com>
References: <20250827024222.588082-1-gary.yang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E3:EE_|JH0PR06MB6630:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 18eacf9a-a388-44cf-2312-08dde5135a46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MLP3CcjYS835G+ZPRcYpAdi651Od5wYmDcK3j9WtDeW4x+w9Tc+dlp8ZCHh2?=
 =?us-ascii?Q?/kE1K3r7Z0taDq1DoNYCyb/t4rPFU9mzJLySyB241pvIDBRnlQNqSEBeVGEi?=
 =?us-ascii?Q?f1PumngkkcByJ1e5UinnnE4Ma8vRDmntxqTV0EUB9d2++BgbRfQyzVaxSFWF?=
 =?us-ascii?Q?9mHyf9ZYMGtcmiz8JIuHTrX7rhNyPvyTnwCL3zuNIvX6oy8AZbmM7gcn77ax?=
 =?us-ascii?Q?07wngeierdmVU+zZF5BbmgI2gdvS7c3Rsa+q+KD2GSRelwxJ2NJqP5Qui5z1?=
 =?us-ascii?Q?/0Ggh4geOT2w6ZMsCZgKbsxQzm11il8HMAaQDPwkSOp+xaRJNo6b5lJRPnTq?=
 =?us-ascii?Q?KSgz34TUaBRldt0IZtDC1GZU1ZjxYz+OSdxDM5V1KdBBN//3I0D/EcqkFzEi?=
 =?us-ascii?Q?JIEAl2ypQjM1tCdlbMRWj76jeexAvmhEnIR30/tUrzsXB82KOEpDb+ykseAU?=
 =?us-ascii?Q?kkrRlwR8fxF69eahgXjvXH34VnS0gPgNjFRqorI6UvdVoX01txo85csY/87C?=
 =?us-ascii?Q?RWwqr1jX3xZx4G6WYSFYS99g3Vm0GcbtHShnNoI0Yff0nKg4evi1fhSuUqbN?=
 =?us-ascii?Q?ikrjQWNo70ZSbDCxyvCBf6wwb2rW19QEgl+9lB9A4dzfjYikQACIThoXrGO1?=
 =?us-ascii?Q?nP8ikEj5+soF4SWNMCiSrQSdjpnM7U/HXWUckdTiM+Zi4eNVgs9Flcs6PcbL?=
 =?us-ascii?Q?cDVGHm4MYF+fIveCBcRkMDMV6ZD1klbaJBL0dRmjmBcplO1gkwKEX6jRGqOX?=
 =?us-ascii?Q?887AgJZlk2Bwho/sZFOehB3TDvMOhhFwP2yTT2uv4fiYWBwQ+su38aRHBybb?=
 =?us-ascii?Q?F4sOXUKo7WJu+BWB2fjenHGfTtIQA0hFhQLeWHK4KlykKuH9zt/22nzFOJkL?=
 =?us-ascii?Q?NGO73Sl6UNhoLn9j6PUGVmfvRh82b8cBbjVtCMc0KNmGjahSObeWpkZoYuuo?=
 =?us-ascii?Q?42+mFBQTbDUN8h+eAvmScY+nD7adVYx/3+KGuer0gRpCQ2hS1qnkcW4KhPtX?=
 =?us-ascii?Q?JqFWCqfgZdmjOysKtQ2IIIZ08WSX4PWeSB3kFoa8NuFtm4XbcXtRxNPuw6SR?=
 =?us-ascii?Q?BwsKoqnUH2Yl8UKGZTGtC1f/1aTHtwHJf+7aYdjSBc6bsmcbZ3k9BpcJ4jPy?=
 =?us-ascii?Q?NCjQp9G0KXW3gCruVKPewa/nNUypI6083EaVVoRW3awtznN3aIa7ck0a6lSO?=
 =?us-ascii?Q?EP3UWk3jkd+pHlE79FBByjqFbFbYXa0ksPsq22uYAqzjbwITBG/5Gc6g62Fq?=
 =?us-ascii?Q?/J/NXvwzGzhmUOeMrAvtZ3DoShMVb3kZSOOPK/dF06s8wm9DtdwLNWMwcZwF?=
 =?us-ascii?Q?cynVEXHYLWK6iXFGQnZy23QukroE5/jtqkY20XW2QJAXpcns6Aj6oehV1EI5?=
 =?us-ascii?Q?REJxgOoxLsQ4f5IA+yD/kwkeWxeNTOH/lydgak53j4W2r6iT0GnUhc63gwSM?=
 =?us-ascii?Q?XHIAGJXAWVX+bGZRiMNi4LLtGmO2+990sW3jbYPaaV9EUQ+VNYPfzgf7Tzhv?=
 =?us-ascii?Q?W4d1DNQjM+Dei7N19z/qwYuYYPK85vvUkP+Q?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 02:42:23.6547
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18eacf9a-a388-44cf-2312-08dde5135a46
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E3.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6630

Add the pin-controller driver for Sky1 platform

Signed-off-by: Gary Yang <gary.yang@cixtech.com>
---
 drivers/pinctrl/Kconfig                 |   1 +
 drivers/pinctrl/Makefile                |   1 +
 drivers/pinctrl/cix/Kconfig             |  14 +
 drivers/pinctrl/cix/Makefile            |   4 +
 drivers/pinctrl/cix/pinctrl-sky1-base.c | 622 ++++++++++++++++++++++++
 drivers/pinctrl/cix/pinctrl-sky1.c      | 502 +++++++++++++++++++
 drivers/pinctrl/cix/pinctrl-sky1.h      |  55 +++
 7 files changed, 1199 insertions(+)
 create mode 100644 drivers/pinctrl/cix/Kconfig
 create mode 100644 drivers/pinctrl/cix/Makefile
 create mode 100644 drivers/pinctrl/cix/pinctrl-sky1-base.c
 create mode 100644 drivers/pinctrl/cix/pinctrl-sky1.c
 create mode 100644 drivers/pinctrl/cix/pinctrl-sky1.h

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index ddd11668457c..a5b7177be115 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -653,6 +653,7 @@ source "drivers/pinctrl/aspeed/Kconfig"
 source "drivers/pinctrl/bcm/Kconfig"
 source "drivers/pinctrl/berlin/Kconfig"
 source "drivers/pinctrl/cirrus/Kconfig"
+source "drivers/pinctrl/cix/Kconfig"
 source "drivers/pinctrl/freescale/Kconfig"
 source "drivers/pinctrl/intel/Kconfig"
 source "drivers/pinctrl/mediatek/Kconfig"
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index 909ab89a56d2..8f353fc38e0e 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -67,6 +67,7 @@ obj-$(CONFIG_ARCH_ASPEED)	+= aspeed/
 obj-y				+= bcm/
 obj-$(CONFIG_PINCTRL_BERLIN)	+= berlin/
 obj-y				+= cirrus/
+obj-y				+= cix/
 obj-y				+= freescale/
 obj-$(CONFIG_X86)		+= intel/
 obj-y				+= mediatek/
diff --git a/drivers/pinctrl/cix/Kconfig b/drivers/pinctrl/cix/Kconfig
new file mode 100644
index 000000000000..42e064b6e7a2
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
+	depends on ARCH_CIX
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
index 000000000000..a80c68fdadfc
--- /dev/null
+++ b/drivers/pinctrl/cix/pinctrl-sky1-base.c
@@ -0,0 +1,622 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Author: Jerry Zhu <Jerry.Zhu@cixtech.com>
+
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_address.h>
+#include <linux/pinctrl/machine.h>
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/platform_device.h>
+#include <linux/seq_file.h>
+#include <linux/slab.h>
+#include <linux/regmap.h>
+
+#include "../core.h"
+#include "../pinconf.h"
+#include "../pinmux.h"
+#include "pinctrl-sky1.h"
+
+#define SKY1_PIN_SIZE		(0xc)
+#define SKY1_MUX_MASK		(0x180L)
+#define SKY1_CONF_MASK		(0x7fL)
+#define PADS_FUNCS_MASK		(0x3)
+#define PADS_FUNCS_BITS		(0x7)
+#define PADS_CONFS_MASK		(0x7f)
+
+static inline const struct group_desc *sky1_pinctrl_find_group_by_name(
+				struct pinctrl_dev *pctldev,
+				const char *name)
+{
+	const struct group_desc *grp = NULL;
+	int i;
+
+	for (i = 0; i < pctldev->num_groups; i++) {
+		grp = pinctrl_generic_get_group(pctldev, i);
+		if (grp && !strcmp(grp->grp.name, name))
+			break;
+	}
+
+	return grp;
+}
+
+static void sky1_pin_dbg_show(struct pinctrl_dev *pctldev, struct seq_file *s,
+		   unsigned int offset)
+{
+	seq_printf(s, "%s", dev_name(pctldev->dev));
+}
+
+static int sky1_dt_node_to_map(struct pinctrl_dev *pctldev,
+			struct device_node *np,
+			struct pinctrl_map **map, unsigned int *num_maps)
+{
+	struct sky1_pinctrl *spctl = pinctrl_dev_get_drvdata(pctldev);
+	const struct group_desc *grp;
+	struct pinctrl_map *new_map;
+	struct device_node *parent;
+	struct sky1_pin *pin;
+	int map_num = 1;
+	int i, j;
+
+	/*
+	 * first find the group of this node and check if we need create
+	 * config maps for pins
+	 */
+	grp = sky1_pinctrl_find_group_by_name(pctldev, np->name);
+	if (!grp) {
+		dev_err(spctl->dev, "unable to find group for node %pOFn\n", np);
+		return -EINVAL;
+	}
+
+	map_num += grp->grp.npins;
+
+	new_map = kmalloc_array(map_num, sizeof(struct pinctrl_map),
+				GFP_KERNEL);
+	if (!new_map)
+		return -ENOMEM;
+
+	*map = new_map;
+	*num_maps = map_num;
+
+	/* create mux map */
+	parent = of_get_parent(np);
+	if (!parent) {
+		kfree(new_map);
+		return -EINVAL;
+	}
+	new_map[0].type = PIN_MAP_TYPE_MUX_GROUP;
+	new_map[0].data.mux.function = parent->name;
+	new_map[0].data.mux.group = np->name;
+	of_node_put(parent);
+
+	/* create config map */
+	new_map++;
+	for (i = j = 0; i < grp->grp.npins; i++) {
+		pin = &((struct sky1_pin *)(grp->data))[i];
+
+		new_map[j].type = PIN_MAP_TYPE_CONFIGS_PIN;
+		new_map[j].data.configs.group_or_pin =
+			pin_get_name(pctldev, pin->offset/4);
+		new_map[j].data.configs.configs = &pin->configs;
+		new_map[j].data.configs.num_configs = 1;
+
+		j++;
+	}
+
+	dev_dbg(pctldev->dev, "maps: function %s group %s num %d\n",
+		(*map)->data.mux.function, (*map)->data.mux.group, map_num);
+
+	return 0;
+}
+
+static inline const char *
+sky1_pinctrl_find_pin_group(struct pinctrl_dev *pctldev,
+			    unsigned int selector,
+			    unsigned int *pins_in,
+			    size_t npins_in)
+{
+	int i, j;
+	int ret;
+	const char *const *groups;
+	unsigned int num_groups;
+	const unsigned int *pins;
+	unsigned int num_pins;
+
+	ret = pinmux_generic_get_function_groups(pctldev, selector, &groups,
+						 &num_groups);
+	for (i = 0; i < num_groups; i++) {
+		ret = pinctrl_get_group_pins(pctldev, groups[i], &pins,
+					     &num_pins);
+		if (npins_in != num_pins)
+			continue;
+		for (j = 0; j < num_pins; j++) {
+			if (pins[j] == pins_in[0])
+				return groups[i];
+		}
+	}
+	return NULL;
+}
+
+static void sky1_dt_free_map(struct pinctrl_dev *pctldev,
+			     struct pinctrl_map *map,
+			     unsigned int num_maps)
+{
+	kfree(map);
+}
+
+static const struct pinctrl_ops sky1_pctrl_ops = {
+	.get_groups_count = pinctrl_generic_get_group_count,
+	.get_group_name = pinctrl_generic_get_group_name,
+	.get_group_pins = pinctrl_generic_get_group_pins,
+	.pin_dbg_show = sky1_pin_dbg_show,
+	.dt_node_to_map = sky1_dt_node_to_map,
+	.dt_free_map = sky1_dt_free_map,
+};
+
+static int sky1_pmx_set_one_pin(struct sky1_pinctrl *spctl,
+				    struct sky1_pin *pin)
+{
+	u32 reg_val;
+	u32 *pin_reg;
+
+	pin_reg = spctl->base + pin->offset;
+	reg_val = readl(pin_reg);
+	reg_val &= ~SKY1_MUX_MASK;
+	reg_val |= pin->configs & SKY1_MUX_MASK;
+	writel(reg_val, pin_reg);
+
+	dev_dbg(spctl->dev, "write: offset 0x%x val 0x%x\n",
+		pin->offset, reg_val);
+	return 0;
+}
+
+static int sky1_pmx_set(struct pinctrl_dev *pctldev, unsigned int selector,
+		       unsigned int group)
+{
+	struct sky1_pinctrl *spctl = pinctrl_dev_get_drvdata(pctldev);
+	struct function_desc *func;
+	struct group_desc *grp;
+	struct sky1_pin *pin;
+	unsigned int npins;
+	int i, err;
+
+	/*
+	 * Configure the mux mode for each pin in the group for a specific
+	 * function.
+	 */
+	grp = pinctrl_generic_get_group(pctldev, group);
+	if (!grp)
+		return -EINVAL;
+
+	func = pinmux_generic_get_function(pctldev, selector);
+	if (!func)
+		return -EINVAL;
+
+	npins = grp->grp.npins;
+
+	dev_dbg(spctl->dev, "enable function %s group %s\n",
+		func->func.name, grp->grp.name);
+
+	for (i = 0; i < npins; i++) {
+		/*
+		 * Config for Sky1 one pin
+		 */
+		pin = &((struct sky1_pin *)(grp->data))[i];
+		err = sky1_pmx_set_one_pin(spctl, pin);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
+static const struct pinmux_ops sky1_pmx_ops = {
+	.get_functions_count = pinmux_generic_get_function_count,
+	.get_function_name = pinmux_generic_get_function_name,
+	.get_function_groups = pinmux_generic_get_function_groups,
+	.set_mux = sky1_pmx_set,
+};
+
+static int sky1_pinconf_get(struct pinctrl_dev *pctldev,
+			   unsigned int pin_id, unsigned long *config)
+{
+	struct sky1_pinctrl *spctl = pinctrl_dev_get_drvdata(pctldev);
+	*config = readl(spctl->base + spctl->pin_regs[pin_id]);
+
+	return 0;
+}
+
+static int sky1_pinconf_set(struct pinctrl_dev *pctldev,
+			   unsigned int pin_id, unsigned long *configs,
+			   unsigned int num_configs)
+{
+	struct sky1_pinctrl *spctl = pinctrl_dev_get_drvdata(pctldev);
+	u32 reg_val;
+	u32 *pin_reg;
+	int i;
+
+	pin_reg = spctl->base + spctl->pin_regs[pin_id];
+
+	for (i = 0; i < num_configs; i++) {
+		reg_val = readl(pin_reg);
+		reg_val &= ~SKY1_CONF_MASK;
+		reg_val |= (configs[i] & SKY1_CONF_MASK);
+		writel(reg_val, pin_reg);
+
+		dev_dbg(spctl->dev, "write: offset 0x%x val 0x%x\n",
+			spctl->pin_regs[pin_id], reg_val);
+	}
+
+	return 0;
+}
+
+static void sky1_pinconf_dbg_show(struct pinctrl_dev *pctldev,
+				   struct seq_file *s, unsigned int pin_id)
+{
+	struct sky1_pinctrl *spctl = pinctrl_dev_get_drvdata(pctldev);
+	u32 config;
+	u32 *pin_reg;
+
+	if (spctl->pin_regs[pin_id] == -1) {
+		seq_puts(s, "N/A");
+		return;
+	}
+
+	pin_reg = spctl->base + spctl->pin_regs[pin_id];
+	config = readl(pin_reg) & SKY1_CONF_MASK;
+
+	seq_printf(s, "0x%x", config);
+}
+
+static void sky1_pinconf_group_dbg_show(struct pinctrl_dev *pctldev,
+					 struct seq_file *s, unsigned int group)
+{
+	struct group_desc *grp;
+	unsigned long config;
+	const char *name;
+	int i, pin_id, ret;
+
+	if (group >= pctldev->num_groups)
+		return;
+
+	seq_puts(s, "\n");
+	grp = pinctrl_generic_get_group(pctldev, group);
+	if (!grp)
+		return;
+
+	for (i = 0; i < grp->grp.npins; i++) {
+		struct sky1_pin *pin = &(((struct sky1_pin *)(grp->data))[i]);
+
+		pin_id = pin->offset / 4;
+		name = pin_get_name(pctldev, pin_id);
+		ret = sky1_pinconf_get(pctldev, pin_id, &config);
+		if (ret)
+			return;
+		seq_printf(s, "  %s: 0x%lx\n", name, config);
+	}
+}
+
+static const struct pinconf_ops sky1_pinconf_ops = {
+	.pin_config_get = sky1_pinconf_get,
+	.pin_config_set = sky1_pinconf_set,
+	.pin_config_dbg_show = sky1_pinconf_dbg_show,
+	.pin_config_group_dbg_show = sky1_pinconf_group_dbg_show,
+};
+
+/*
+ * Each pin represented in cix,pins consists of
+ * a number of u32 OFFSET and a number of u32 CONFIGS,
+ * the total size is OFFSET + CONFIGS for each pin.
+ *
+ * Default:
+ *     <offset, configs>
+ *     <4byte,  4byte>
+ */
+
+static void sky1_pinctrl_parse_pin(struct sky1_pinctrl *spctl,
+				       unsigned int *pin_id,
+				       struct sky1_pin *pin,
+				       const __be32 **list_p,
+				       struct device_node *np)
+{
+	const __be32 *list = *list_p;
+	unsigned int configs0, configs1;
+	const struct sky1_pinctrl_soc_info *info = spctl->info;
+
+	pin->offset = be32_to_cpu(*list++);
+	*pin_id = pin->offset / 4;
+	pin->pin_id = *pin_id;
+
+	configs0 = be32_to_cpu(*list++);
+	configs1 = be32_to_cpu(*list++);
+	pin->configs =  (((configs0 & PADS_FUNCS_MASK) << PADS_FUNCS_BITS) |
+			(configs1 & PADS_CONFS_MASK));
+	spctl->pin_regs[*pin_id] = pin->offset;
+
+	*list_p = list;
+
+	dev_dbg(spctl->dev, "%s: 0x%x 0x%08lx", info->pins[*pin_id].name,
+		pin->offset, pin->configs);
+}
+
+static int sky1_pinctrl_parse_groups(struct device_node *np,
+				    struct group_desc *grp,
+				    struct sky1_pinctrl *spctl,
+				    u32 index)
+{
+	struct sky1_pin *pin;
+	int size;
+	const __be32 *list;
+	int i;
+	unsigned int *pins;
+
+	dev_dbg(spctl->dev, "group(%d): %pOFn\n", index, np);
+
+	/* Initialise group */
+	grp->grp.name = np->name;
+
+	/*
+	 * the binding format is cix,pins = <PIN_FUNC_ID CONFIG ...>,
+	 * do sanity check and calculate pins number
+	 *
+	 * First try legacy 'cix,pins' property, then fall back to the
+	 * generic 'pinmux'.
+	 *
+	 * Note: for generic 'pinmux' case, there's no CONFIG part in
+	 * the binding format.
+	 */
+	list = of_get_property(np, "cix,pins", &size);
+	if (!list) {
+		list = of_get_property(np, "pinmux", &size);
+		if (!list) {
+			dev_err(spctl->dev,
+				"no cix,pins and pins property in node %pOF\n", np);
+			return -EINVAL;
+		}
+	}
+
+	/* we do not check return since it's safe node passed down */
+	if (!size || size % SKY1_PIN_SIZE) {
+		dev_err(spctl->dev, "Invalid cix,pins or pins property in node %pOF\n", np);
+		return -EINVAL;
+	}
+
+	grp->grp.npins = size / SKY1_PIN_SIZE;
+	grp->data = devm_kcalloc(spctl->dev,
+				 grp->grp.npins, sizeof(struct sky1_pin),
+				 GFP_KERNEL);
+	pins = devm_kcalloc(spctl->dev,
+				 grp->grp.npins, sizeof(unsigned int),
+				 GFP_KERNEL);
+	if (!pins || !grp->data)
+		return -ENOMEM;
+
+	for (i = 0; i < grp->grp.npins; i++) {
+		pin = &((struct sky1_pin *)(grp->data))[i];
+		sky1_pinctrl_parse_pin(spctl, &pins[i], pin, &list, np);
+	}
+	grp->grp.pins = pins;
+	return 0;
+}
+
+static int sky1_pinctrl_parse_functions(struct device_node *np,
+				       struct sky1_pinctrl *spctl,
+				       u32 index)
+{
+	struct pinctrl_dev *pctl = spctl->pctl;
+	struct device_node *child;
+	struct function_desc *func;
+	struct group_desc *grp;
+	const char **group_names;
+	u32 i = 0;
+
+	dev_dbg(pctl->dev, "parse function(%d): %pOFn\n", index, np);
+
+	func = pinmux_generic_get_function(pctl, index);
+	if (!func)
+		return -EINVAL;
+
+	/* Initialise function */
+	func->func.name = np->name;
+	func->func.ngroups = of_get_child_count(np);
+	if (func->func.ngroups == 0) {
+		dev_err(spctl->dev, "no groups defined in %pOF\n", np);
+		return -EINVAL;
+	}
+	group_names = devm_kcalloc(spctl->dev, func->func.ngroups,
+					 sizeof(char *), GFP_KERNEL);
+	if (!group_names)
+		return -ENOMEM;
+
+	for_each_child_of_node(np, child)
+		group_names[i++] = child->name;
+	func->func.groups = group_names;
+
+	i = 0;
+	for_each_child_of_node(np, child) {
+		grp = devm_kzalloc(spctl->dev, sizeof(struct group_desc),
+				   GFP_KERNEL);
+		if (!grp) {
+			of_node_put(child);
+			return -ENOMEM;
+		}
+
+		mutex_lock(&spctl->mutex);
+		radix_tree_insert(&pctl->pin_group_tree,
+				  spctl->group_index++, grp);
+		mutex_unlock(&spctl->mutex);
+
+		sky1_pinctrl_parse_groups(child, grp, spctl, i++);
+	}
+
+	return 0;
+}
+
+/*
+ * Check if the DT contains pins in the direct child nodes. This indicates the
+ * newer DT format to store pins. This function returns true if the first found
+ * cix,pins property is in a child of np. Otherwise false is returned.
+ */
+static bool sky1_pinctrl_dt_is_flat_functions(struct device_node *np)
+{
+	struct device_node *function_np;
+	struct device_node *pinctrl_np;
+
+	for_each_child_of_node(np, function_np) {
+		if (of_property_read_bool(function_np, "cix,pins")) {
+			of_node_put(function_np);
+			return true;
+		}
+
+		for_each_child_of_node(function_np, pinctrl_np) {
+			if (of_property_read_bool(pinctrl_np, "cix,pins")) {
+				of_node_put(pinctrl_np);
+				of_node_put(function_np);
+				return false;
+			}
+		}
+	}
+
+	return true;
+}
+
+static int sky1_pinctrl_probe_dt(struct platform_device *pdev,
+				struct sky1_pinctrl *spctl)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct device_node *child;
+	struct pinctrl_dev *pctl = spctl->pctl;
+	u32 nfuncs = 0;
+	u32 i = 0;
+	bool flat_funcs;
+
+	if (!np)
+		return -ENODEV;
+
+	flat_funcs = sky1_pinctrl_dt_is_flat_functions(np);
+	if (flat_funcs) {
+		nfuncs = 1;
+	} else {
+		nfuncs = of_get_child_count(np);
+		if (nfuncs == 0) {
+			dev_err(&pdev->dev, "no functions defined\n");
+			return -EINVAL;
+		}
+	}
+
+	for (i = 0; i < nfuncs; i++) {
+		struct function_desc *function;
+
+		function = devm_kzalloc(&pdev->dev, sizeof(*function),
+					GFP_KERNEL);
+		if (!function)
+			return -ENOMEM;
+
+		mutex_lock(&spctl->mutex);
+		radix_tree_insert(&pctl->pin_function_tree, i, function);
+		mutex_unlock(&spctl->mutex);
+	}
+	pctl->num_functions = nfuncs;
+
+	spctl->group_index = 0;
+	if (flat_funcs) {
+		pctl->num_groups = of_get_child_count(np);
+	} else {
+		pctl->num_groups = 0;
+		for_each_child_of_node(np, child)
+			pctl->num_groups += of_get_child_count(child);
+	}
+
+	if (flat_funcs) {
+		sky1_pinctrl_parse_functions(np, spctl, 0);
+	} else {
+		i = 0;
+		for_each_child_of_node(np, child)
+			sky1_pinctrl_parse_functions(child, spctl, i++);
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
+	spctl->pin_regs = devm_kmalloc_array(&pdev->dev, info->npins,
+					    sizeof(*spctl->pin_regs),
+					    GFP_KERNEL);
+	if (!spctl->pin_regs)
+		return -ENOMEM;
+
+	for (i = 0; i < info->npins; i++)
+		spctl->pin_regs[i] = -1;
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
+	sky1_pinctrl_desc->name = dev_name(&pdev->dev);
+	sky1_pinctrl_desc->pins = info->pins;
+	sky1_pinctrl_desc->npins = info->npins;
+	sky1_pinctrl_desc->pctlops = &sky1_pctrl_ops;
+	sky1_pinctrl_desc->pmxops = &sky1_pmx_ops;
+	sky1_pinctrl_desc->confops = &sky1_pinconf_ops;
+	sky1_pinctrl_desc->owner = THIS_MODULE;
+
+	mutex_init(&spctl->mutex);
+
+	spctl->info = info;
+	spctl->dev = &pdev->dev;
+	platform_set_drvdata(pdev, spctl);
+	ret = devm_pinctrl_register_and_init(&pdev->dev,
+					     sky1_pinctrl_desc, spctl,
+					     &spctl->pctl);
+	if (ret) {
+		dev_err(&pdev->dev, "could not register SKY1 pinctrl driver\n");
+		return ret;
+	}
+
+	ret = sky1_pinctrl_probe_dt(pdev, spctl);
+
+	if (ret) {
+		dev_err(&pdev->dev, "fail to probe dt properties\n");
+		return ret;
+	}
+
+	pinctrl_provide_dummies();
+	dev_info(&pdev->dev, "initialized SKY1 pinctrl driver\n");
+
+	return pinctrl_enable(spctl->pctl);
+}
+EXPORT_SYMBOL_GPL(sky1_base_pinctrl_probe);
+
+
+MODULE_AUTHOR("Jerry Zhu <Jerry.Zhu@cixtech.com>");
+MODULE_DESCRIPTION("Cix SKy1 pinctrl driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/pinctrl/cix/pinctrl-sky1.c b/drivers/pinctrl/cix/pinctrl-sky1.c
new file mode 100644
index 000000000000..0e184eacbc0b
--- /dev/null
+++ b/drivers/pinctrl/cix/pinctrl-sky1.c
@@ -0,0 +1,502 @@
+// SPDX-License-Identifier: GPL-2.0
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
+enum sky1_pads_s5 {
+	SKY1_IOMUXC_GPIO1 =	0,
+	SKY1_IOMUXC_GPIO2 =	1,
+	SKY1_IOMUXC_GPIO3 =	2,
+	SKY1_IOMUXC_GPIO4 =	3,
+	SKY1_IOMUXC_GPIO5 =	4,
+	SKY1_IOMUXC_GPIO6 =	5,
+	SKY1_IOMUXC_GPIO7 =	6,
+	SKY1_IOMUXC_GPIO8 =	7,
+	SKY1_IOMUXC_GPIO9 =	8,
+	SKY1_IOMUXC_GPIO10 =	9,
+	SKY1_IOMUXC_GPIO11 =	10,
+	SKY1_IOMUXC_GPIO12 =	11,
+	SKY1_IOMUXC_GPIO13 =	12,
+	SKY1_IOMUXC_GPIO14 =	13,
+	SKY1_IOMUXC_RSMRST_L =	14,
+	SKY1_IOMUXC_SRST_L =	15,
+	SKY1_IOMUXC_SLP_S3_L =	16,
+	SKY1_IOMUXC_SLP_S5_L =	17,
+	SKY1_IOMUXC_PWRGD =	18,
+	SKY1_IOMUXC_PWROK =	19,
+	SKY1_IOMUXC_PWRBTN_L =	20,
+	SKY1_IOMUXC_VDD_DDRIO_GATE =	21,
+	SKY1_IOMUXC_JTAG_GPIO_L =	22,
+	SKY1_IOMUXC_JTAG_TCK =		23,
+	SKY1_IOMUXC_JTAG_TDI =		24,
+	SKY1_IOMUXC_JTAG_TDO =		25,
+	SKY1_IOMUXC_TMS =		26,
+	SKY1_IOMUXC_TRST_L  =		27,
+	SKY1_IOMUXC_SFI_I2C0_SCL = 28,
+	SKY1_IOMUXC_SFI_I2C0_SDA = 29,
+	SKY1_IOMUXC_SFI_I2C1_SCL = 30,
+	SKY1_IOMUXC_SFI_I2C1_SDA = 31,
+	SKY1_IOMUXC_SFI_GPIO0	 = 32,
+	SKY1_IOMUXC_SFI_GPIO1	 = 33,
+	SKY1_IOMUXC_SFI_GPIO2	 = 34,
+	SKY1_IOMUXC_SFI_GPIO3	 = 35,
+	SKY1_IOMUXC_SFI_GPIO4	 = 36,
+	SKY1_IOMUXC_SFI_GPIO5	 = 37,
+	SKY1_IOMUXC_SFI_GPIO6	 = 38,
+	SKY1_IOMUXC_SFI_GPIO7	 = 39,
+	SKY1_IOMUXC_SFI_GPIO8	 = 40,
+	SKY1_IOMUXC_SFI_GPIO9	 = 41,
+	SKY1_IOMUXC_SPI1_MISO	 = 42,
+	SKY1_IOMUXC_SPI1_CS0	 = 43,
+	SKY1_IOMUXC_SPI1_CS1	 = 44,
+	SKY1_IOMUXC_SPI1_MOSI	 = 45,
+	SKY1_IOMUXC_SPI1_CLK	 = 46,
+	SKY1_IOMUXC_USB_OC0_L	 = 47,
+	SKY1_IOMUXC_USB_OC1_L	 = 48,
+	SKY1_IOMUXC_USB_OC2_L	 = 49,
+	SKY1_IOMUXC_USB_OC3_L	 = 50,
+	SKY1_IOMUXC_USB_OC4_L	 = 51,
+	SKY1_IOMUXC_USB_OC5_L	 = 52,
+	SKY1_IOMUXC_USB_OC6_L	 = 53,
+	SKY1_IOMUXC_USB_OC7_L	 = 54,
+	SKY1_IOMUXC_USB_OC8_L	 = 55,
+	SKY1_IOMUXC_USB_OC9_L	 = 56,
+	SKY1_IOMUXC_DRIVE_VBUS0	 = 57,
+	SKY1_IOMUXC_DRIVE_VBUS4	 = 58,
+	SKY1_IOMUXC_DRIVE_VBUS5  = 59,
+	SKY1_IOMUXC_SE_QSPI_CLK =  60,
+	SKY1_IOMUXC_SE_QSPI_CS_L = 61,
+	SKY1_IOMUXC_SE_QSPI_DATA0 = 62,
+	SKY1_IOMUXC_SE_QSPI_DATA1 = 63,
+	SKY1_IOMUXC_SE_QSPI_DATA2 = 64,
+	SKY1_IOMUXC_SE_QSPI_DATA3 = 65,
+};
+
+enum sky1_pads {
+	SKY1_IOMUXC_GPIO43	  = 0,
+	SKY1_IOMUXC_GPIO44	  = 1,
+	SKY1_IOMUXC_GPIO45	  = 2,
+	SKY1_IOMUXC_GPIO46	  = 3,
+	SKY1_IOMUXC_RESET_IN_L	  = 4,
+	SKY1_IOMUXC_PLT_RESET_L	  = 5,
+	SKY1_IOMUXC_THERMRIP_L	  = 6,
+	SKY1_IOMUXC_PROCHOT_L	  = 7,
+	SKY1_IOMUXC_PM_I2C0_CLK	  = 8,
+	SKY1_IOMUXC_PM_I2C0_DATA  = 9,
+	SKY1_IOMUXC_PM_I2C1_CLK	  = 10,
+	SKY1_IOMUXC_PM_I2C1_DATA  = 11,
+	SKY1_IOMUXC_PM_I2C2_CLK	  = 12,
+	SKY1_IOMUXC_PM_I2C2_DATA  = 13,
+	SKY1_IOMUXC_PM_I2C3_CLK	  = 14,
+	SKY1_IOMUXC_PM_I2C3_DATA  = 15,
+	SKY1_IOMUXC_STRAP0	  = 16,
+	SKY1_IOMUXC_STRAP1	  = 17,
+	SKY1_IOMUXC_DP2_DIGON	  = 18,
+	SKY1_IOMUXC_DP2_BLON	  = 19,
+	SKY1_IOMUXC_DP2_VARY_BL	  = 20,
+	SKY1_IOMUXC_I2C7_SCL	  = 21,
+	SKY1_IOMUXC_I2C7_SDA	  = 22,
+	SKY1_IOMUXC_UART6_CSU_SE_TXD = 23,
+	SKY1_IOMUXC_CLK_REQ1_L	  = 24,
+	SKY1_IOMUXC_CLK_REQ3_L	  = 25,
+	SKY1_IOMUXC_I2C5_SCL	  = 26,
+	SKY1_IOMUXC_I2C5_SDA	  = 27,
+	SKY1_IOMUXC_I2C6_SCL	  = 28,
+	SKY1_IOMUXC_I2C6_SDA	  = 29,
+	SKY1_IOMUXC_I2C0_CLK	  = 30,
+	SKY1_IOMUXC_I2C0_SDA	  = 31,
+	SKY1_IOMUXC_I2C1_CLK	  = 32,
+	SKY1_IOMUXC_I2C1_SDA	  = 33,
+	SKY1_IOMUXC_I2C2_SCL	  = 34,
+	SKY1_IOMUXC_I2C2_SDA	  = 35,
+	SKY1_IOMUXC_I3C0_PUR_EN_L = 36,
+	SKY1_IOMUXC_I2C3_CLK	  = 37,
+	SKY1_IOMUXC_I2C3_SDA	  = 38,
+	SKY1_IOMUXC_I3C1_PUR_EN_L = 39,
+	SKY1_IOMUXC_I2C4_CLK	  = 40,
+	SKY1_IOMUXC_I2C4_SDA	  = 41,
+	SKY1_IOMUXC_HDA_BITCLK	  = 42,
+	SKY1_IOMUXC_HDA_RST_L	  = 43,
+	SKY1_IOMUXC_HDA_SDIN0	  = 44,
+	SKY1_IOMUXC_HDA_SDOUT0	  = 45,
+	SKY1_IOMUXC_HDA_SYNC	  = 46,
+	SKY1_IOMUXC_HDA_SDIN1	  = 47,
+	SKY1_IOMUXC_HDA_SDOUT1	  = 48,
+	SKY1_IOMUXC_I2S1_MCLK	  = 49,
+	SKY1_IOMUXC_I2S1_SCK	  = 50,
+	SKY1_IOMUXC_I2S1_WS	  = 51,
+	SKY1_IOMUXC_I2S1_DATA_IN  = 52,
+	SKY1_IOMUXC_I2S1_DATA_OUT = 53,
+	SKY1_IOMUXC_I2S2_MCLK	  = 54,
+	SKY1_IOMUXC_I2S2_RSCK	  = 55,
+	SKY1_IOMUXC_I2S2_RWS	  = 56,
+	SKY1_IOMUXC_I2S2_TSCK	  = 57,
+	SKY1_IOMUXC_I2S2_TWS	  = 58,
+	SKY1_IOMUXC_I2S2_DATA_IN0  = 59,
+	SKY1_IOMUXC_I2S2_DATA_IN1  = 60,
+	SKY1_IOMUXC_I2S2_DATA_OUT0 = 61,
+	SKY1_IOMUXC_I2S2_DATA_OUT1 = 62,
+	SKY1_IOMUXC_I2S2_DATA_OUT2 = 63,
+	SKY1_IOMUXC_I2S2_DATA_OUT3 = 64,
+	SKY1_IOMUXC_I2S3_MCLK	  = 65,
+	SKY1_IOMUXC_I2S3_RSCK	  = 66,
+	SKY1_IOMUXC_I2S3_RWS	  = 67,
+	SKY1_IOMUXC_I2S3_TSCK	  = 68,
+	SKY1_IOMUXC_I2S3_TWS	  = 69,
+	SKY1_IOMUXC_I2S3_DATA_IN0  = 70,
+	SKY1_IOMUXC_I2S3_DATA_IN1  = 71,
+	SKY1_IOMUXC_I2S3_DATA_OUT0 = 72,
+	SKY1_IOMUXC_I2S3_DATA_OUT1 = 73,
+	SKY1_IOMUXC_I2S4_MCLK_LB  = 74,
+	SKY1_IOMUXC_I2S4_SCK_LB	  = 75,
+	SKY1_IOMUXC_I2S4_WS_LB	  = 76,
+	SKY1_IOMUXC_I2S4_DATA_IN_LB  = 77,
+	SKY1_IOMUXC_I2S4_DATA_OUT_LB = 78,
+	SKY1_IOMUXC_UART0_TXD	  = 79,
+	SKY1_IOMUXC_UART0_RXD	  = 80,
+	SKY1_IOMUXC_UART0_CTS	  = 81,
+	SKY1_IOMUXC_UART0_RTS	  = 82,
+	SKY1_IOMUXC_UART1_TXD	  = 83,
+	SKY1_IOMUXC_UART1_RXD	  = 84,
+	SKY1_IOMUXC_UART1_CTS	  = 85,
+	SKY1_IOMUXC_UART1_RTS	  = 86,
+	SKY1_IOMUXC_UART2_TXD	  = 87,
+	SKY1_IOMUXC_UART2_RXD	  = 88,
+	SKY1_IOMUXC_UART3_TXD	  = 89,
+	SKY1_IOMUXC_UART3_RXD	  = 90,
+	SKY1_IOMUXC_UART3_CTS	  = 91,
+	SKY1_IOMUXC_UART3_RTS	  = 92,
+	SKY1_IOMUXC_UART4_CSU_PM_TXD = 93,
+	SKY1_IOMUXC_UART4_CSU_PM_RXD = 94,
+	SKY1_IOMUXC_UART5_CSU_SE_TXD = 95,
+	SKY1_IOMUXC_UART5_CSU_SE_RXD = 96,
+	SKY1_IOMUXC_UART6_CSU_SE_RXD = 97,
+	SKY1_IOMUXC_CLK_REQ0_L	     = 98,
+	SKY1_IOMUXC_CLK_REQ2_L	     = 99,
+	SKY1_IOMUXC_CLK_REQ4_L	     = 100,
+	SKY1_IOMUXC_CSI0_MCLK0	     = 101,
+	SKY1_IOMUXC_CSI0_MCLK1	     = 102,
+	SKY1_IOMUXC_CSI1_MCLK0	     = 103,
+	SKY1_IOMUXC_CSI1_MCLK1	     = 104,
+	SKY1_IOMUXC_GMAC0_REFCLK_25M = 105,
+	SKY1_IOMUXC_GMAC0_TX_CTL     = 106,
+	SKY1_IOMUXC_GMAC0_TXD0	     = 107,
+	SKY1_IOMUXC_GMAC0_TXD1	     = 108,
+	SKY1_IOMUXC_GMAC0_TXD2	     = 109,
+	SKY1_IOMUXC_GMAC0_TXD3	     = 110,
+	SKY1_IOMUXC_GMAC0_TX_CLK     = 111,
+	SKY1_IOMUXC_GMAC0_RX_CTL     = 112,
+	SKY1_IOMUXC_GMAC0_RXD0	     = 113,
+	SKY1_IOMUXC_GMAC0_RXD1	     = 114,
+	SKY1_IOMUXC_GMAC0_RXD2	     = 115,
+	SKY1_IOMUXC_GMAC0_RXD3	     = 116,
+	SKY1_IOMUXC_GMAC0_RX_CLK     = 117,
+	SKY1_IOMUXC_GMAC0_MDC	     = 118,
+	SKY1_IOMUXC_GMAC0_MDIO	     = 119,
+	SKY1_IOMUXC_GMAC1_REFCLK_25M = 120,
+	SKY1_IOMUXC_GMAC1_TX_CTL     = 121,
+	SKY1_IOMUXC_GMAC1_TXD0	     = 122,
+	SKY1_IOMUXC_GMAC1_TXD1	     = 123,
+	SKY1_IOMUXC_GMAC1_TXD2	     = 124,
+	SKY1_IOMUXC_GMAC1_TXD3	     = 125,
+	SKY1_IOMUXC_GMAC1_TX_CLK     = 126,
+	SKY1_IOMUXC_GMAC1_RX_CTL     = 127,
+	SKY1_IOMUXC_GMAC1_RXD0	     = 128,
+	SKY1_IOMUXC_GMAC1_RXD1	     = 129,
+	SKY1_IOMUXC_GMAC1_RXD2	     = 130,
+	SKY1_IOMUXC_GMAC1_RXD3	     = 131,
+	SKY1_IOMUXC_GMAC1_RX_CLK     = 132,
+	SKY1_IOMUXC_GMAC1_MDC	     = 133,
+	SKY1_IOMUXC_GMAC1_MDIO	     = 134,
+	SKY1_IOMUXC_PM_GPIO0	     = 135,
+	SKY1_IOMUXC_PM_GPIO1	     = 136,
+	SKY1_IOMUXC_PM_GPIO2	     = 137,
+};
+
+/* Pad names for the s5 domain pinmux subsystem */
+static const struct pinctrl_pin_desc sky1_pinctrl_s5_pads[] = {
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_GPIO1),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_GPIO2),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_GPIO3),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_GPIO4),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_GPIO5),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_GPIO6),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_GPIO7),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_GPIO8),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_GPIO9),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_GPIO10),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_GPIO11),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_GPIO12),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_GPIO13),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_GPIO14),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_RSMRST_L),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_SRST_L),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_SLP_S3_L),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_SLP_S5_L),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_PWRGD),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_PWROK),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_PWRBTN_L),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_VDD_DDRIO_GATE),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_JTAG_GPIO_L),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_JTAG_TCK),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_JTAG_TDI),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_JTAG_TDO),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_TMS),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_TRST_L),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_SFI_I2C0_SCL),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_SFI_I2C0_SDA),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_SFI_I2C1_SCL),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_SFI_I2C1_SDA),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_SFI_GPIO0),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_SFI_GPIO1),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_SFI_GPIO2),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_SFI_GPIO3),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_SFI_GPIO4),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_SFI_GPIO5),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_SFI_GPIO6),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_SFI_GPIO7),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_SFI_GPIO8),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_SFI_GPIO9),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_SPI1_MISO),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_SPI1_CS0),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_SPI1_CS1),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_SPI1_MOSI),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_SPI1_CLK),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_USB_OC0_L),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_USB_OC1_L),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_USB_OC2_L),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_USB_OC3_L),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_USB_OC4_L),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_USB_OC5_L),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_USB_OC6_L),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_USB_OC7_L),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_USB_OC8_L),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_USB_OC9_L),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_DRIVE_VBUS0),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_DRIVE_VBUS4),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_DRIVE_VBUS5),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_SE_QSPI_CLK),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_SE_QSPI_CS_L),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_SE_QSPI_DATA0),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_SE_QSPI_DATA1),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_SE_QSPI_DATA2),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_SE_QSPI_DATA3),
+};
+
+/* Pad names for the s0 domain pinmux subsystem */
+static const struct pinctrl_pin_desc sky1_pinctrl_pads[] = {
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_GPIO43),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_GPIO44),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_GPIO45),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_GPIO46),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_RESET_IN_L),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_PLT_RESET_L),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_THERMRIP_L),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_PROCHOT_L),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_PM_I2C0_CLK),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_PM_I2C0_DATA),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_PM_I2C1_CLK),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_PM_I2C1_DATA),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_PM_I2C2_CLK),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_PM_I2C2_DATA),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_PM_I2C3_CLK),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_PM_I2C3_DATA),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_STRAP0),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_STRAP1),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_DP2_DIGON),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_DP2_BLON),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_DP2_VARY_BL),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_I2C7_SCL),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_I2C7_SDA),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_UART6_CSU_SE_TXD),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_CLK_REQ1_L),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_CLK_REQ3_L),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_I2C5_SCL),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_I2C5_SDA),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_I2C6_SCL),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_I2C6_SDA),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_I2C0_CLK),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_I2C0_SDA),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_I2C1_CLK),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_I2C1_SDA),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_I2C2_SCL),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_I2C2_SDA),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_I3C0_PUR_EN_L),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_I2C3_CLK),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_I2C3_SDA),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_I3C1_PUR_EN_L),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_I2C4_CLK),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_I2C4_SDA),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_HDA_BITCLK),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_HDA_RST_L),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_HDA_SDIN0),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_HDA_SDOUT0),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_HDA_SYNC),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_HDA_SDIN1),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_HDA_SDOUT1),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_I2S1_MCLK),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_I2S1_SCK),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_I2S1_WS),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_I2S1_DATA_IN),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_I2S1_DATA_OUT),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_I2S2_MCLK),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_I2S2_RSCK),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_I2S2_RWS),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_I2S2_TSCK),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_I2S2_TWS),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_I2S2_DATA_IN0),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_I2S2_DATA_IN1),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_I2S2_DATA_OUT0),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_I2S2_DATA_OUT1),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_I2S2_DATA_OUT2),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_I2S2_DATA_OUT3),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_I2S3_MCLK),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_I2S3_RSCK),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_I2S3_RWS),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_I2S3_TSCK),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_I2S3_TWS),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_I2S3_DATA_IN0),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_I2S3_DATA_IN1),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_I2S3_DATA_OUT0),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_I2S3_DATA_OUT1),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_I2S4_MCLK_LB),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_I2S4_SCK_LB),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_I2S4_WS_LB),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_I2S4_DATA_IN_LB),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_I2S4_DATA_OUT_LB),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_UART0_TXD),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_UART0_RXD),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_UART0_CTS),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_UART0_RTS),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_UART1_TXD),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_UART1_RXD),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_UART1_CTS),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_UART1_RTS),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_UART2_TXD),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_UART2_RXD),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_UART3_TXD),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_UART3_RXD),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_UART3_CTS),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_UART3_RTS),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_UART4_CSU_PM_TXD),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_UART4_CSU_PM_RXD),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_UART5_CSU_SE_TXD),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_UART5_CSU_SE_RXD),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_UART6_CSU_SE_RXD),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_CLK_REQ0_L),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_CLK_REQ2_L),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_CLK_REQ4_L),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_CSI0_MCLK0),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_CSI0_MCLK1),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_CSI1_MCLK0),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_CSI1_MCLK1),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_GMAC0_REFCLK_25M),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_GMAC0_TX_CTL),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_GMAC0_TXD0),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_GMAC0_TXD1),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_GMAC0_TXD2),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_GMAC0_TXD3),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_GMAC0_TX_CLK),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_GMAC0_RX_CTL),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_GMAC0_RXD0),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_GMAC0_RXD1),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_GMAC0_RXD2),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_GMAC0_RXD3),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_GMAC0_RX_CLK),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_GMAC0_MDC),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_GMAC0_MDIO),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_GMAC1_REFCLK_25M),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_GMAC1_TX_CTL),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_GMAC1_TXD0),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_GMAC1_TXD1),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_GMAC1_TXD2),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_GMAC1_TXD3),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_GMAC1_TX_CLK),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_GMAC1_RX_CTL),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_GMAC1_RXD0),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_GMAC1_RXD1),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_GMAC1_RXD2),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_GMAC1_RXD3),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_GMAC1_RX_CLK),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_GMAC1_MDC),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_GMAC1_MDIO),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_PM_GPIO0),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_PM_GPIO1),
+	SKY1_PINCTRL_PIN(SKY1_IOMUXC_PM_GPIO2),
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
+	{ .compatible = "cix,sky1-iomuxc-s5", .data = &sky1_pinctrl_s5_info, },
+	{ .compatible = "cix,sky1-iomuxc", .data = &sky1_pinctrl_info, },
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
+		.of_match_table = of_match_ptr(sky1_pinctrl_of_match),
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
index 000000000000..09b25dbb6db3
--- /dev/null
+++ b/drivers/pinctrl/cix/pinctrl-sky1.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Author: Jerry Zhu <Jerry.Zhu@cixtech.com>
+ */
+
+#ifndef __DRIVERS_PINCTRL_SKY1_H
+#define __DRIVERS_PINCTRL_SKY1_H
+
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinmux.h>
+
+/**
+ * struct sky1_pin - describes a single SKY1 pin
+ * @pin_id: the pin id of this pin
+ * @offest: the iomux register offset
+ * @configs: the mux and config value for pin
+ */
+struct sky1_pin {
+	unsigned int pin_id;
+	unsigned int offset;
+	unsigned long configs;
+};
+
+/**
+ * sky1_pin_reg contains 32 bits
+ * bit7:bit8 for function select
+ * bit0:bit6 for pad configuration
+ */
+typedef u32 sky1_pin_reg;
+
+/**
+ * @dev: a pointer back to containing device
+ * @base: the offset to the controller in virtual memory
+ */
+struct sky1_pinctrl {
+	struct device *dev;
+	struct pinctrl_dev *pctl;
+	void __iomem *base;
+	const struct sky1_pinctrl_soc_info *info;
+	sky1_pin_reg *pin_regs;
+	unsigned int group_index;
+	struct mutex mutex;
+};
+
+struct sky1_pinctrl_soc_info {
+	const struct pinctrl_pin_desc *pins;
+	unsigned int npins;
+};
+
+#define SKY1_PINCTRL_PIN(pin) PINCTRL_PIN(pin, #pin)
+
+int sky1_base_pinctrl_probe(struct platform_device *pdev,
+			const struct sky1_pinctrl_soc_info *info);
+
+#endif /* __DRIVERS_PINCTRL_SKY1_H */
-- 
2.49.0


