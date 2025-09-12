Return-Path: <linux-gpio+bounces-25995-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E594B54279
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 08:07:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D25F6A06629
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 06:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 499DE2857FC;
	Fri, 12 Sep 2025 06:06:59 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022073.outbound.protection.outlook.com [40.107.75.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82992AD20;
	Fri, 12 Sep 2025 06:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757657219; cv=fail; b=XVpodiIQLk7BjP9MXASY8kzGqiLerhqWLX8MEgh+wr+fPtunsVH04JydCFtrF8Rei/0bQMENodphup7TPArhAGzzmcvPZi/XgZmK3M7OMI/YA1YPZuCT8AUzsU5nrNUosG3rlavdBc3xxMzaUGNBOYpZ7Psed/DwuFZZg9zF9Oc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757657219; c=relaxed/simple;
	bh=iH3vsHbEm0yU43n4U/E4AlmgPeRc3h27w2ga5xrNH4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fEK59duPV/ABk48PBVYkiMHHx+HBONauSnd6ugFG3QW25TZn4dXBiKbqCIHVKdyhDWBnVYoAgsQ4T/NwrGubTvP4YODsUSP1GRH9smYzsNPRhn+rp+Wte5Q3bXBc2Ej199dQKEmPDX/rKPzoLSpwlijtHXyN2Q41bwRpCGBKnZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oeBDIIXT3A5X6icQnJF6FYdAeUQtBs7c8iApuNwMAqWnleWFR52w44ZC3PvgJgMZkiXtBNE2cLfeK18anAGXQh99v/F8Ma/jYyGifMTHI3RYu5WWA6M4b9BNMK2YQocL2k2g56MVny+UMAtU4+FJ3QIcCrqvDvJcfhxo8K/auldLYRmdWtrN5AjW5S56oqb6WTJTX1RBmeFb/QiROMe7DpBHFoUpCjlzl0pJTZFVIjNaza0cx/mEYD3+jZSheHuRPtth3SRnNVtYJC1pjGMotQt0QKedPm8ao6fKIgS2jyNExqUcawJ/5b+9HErZgvDdy+ZGjMtE0ryCWlU1wScJoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y9bXWdKmEccZCF2v66qv3hMZEqmNEqAIpWWfJZQGXrk=;
 b=GNhbAuFs2+7pzAoBJ7qp/nVmU1ByYCzc+Rskxej/gAnuRQDO1hrNaL79SXZf7O+75b15lupSbDwt7BsanvJph3ZfEsaTGJKdxLZTzm70pCf6fyzGrcpXXyvAUuCxb84HpWWfjKLxQu8mA6AY8xESrcliD3gFOz1BK3MtwTLYFLC5qOzOWPOHD3LdCxlqwPctS2ur+18MaqnOoL+My/z/qdkYwZnfzwYfJRRTh8Zi5HnrPekwKDxFiHQsd6YWulddXCHWy0IaeddhTuFLXqNelA30ct7LD8JXZFRmM6xsKBYRQ9IWQZEL8Vukn63wSGruZRIRwCOS7e36BXPhQsgeIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR02CA0045.apcprd02.prod.outlook.com (2603:1096:4:196::21)
 by TYQPR06MB8130.apcprd06.prod.outlook.com (2603:1096:405:374::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 06:06:52 +0000
Received: from SG2PEPF000B66CF.apcprd03.prod.outlook.com
 (2603:1096:4:196:cafe::e5) by SI2PR02CA0045.outlook.office365.com
 (2603:1096:4:196::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.16 via Frontend Transport; Fri,
 12 Sep 2025 06:06:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CF.mail.protection.outlook.com (10.167.240.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Fri, 12 Sep 2025 06:06:51 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id BD72241C0148;
	Fri, 12 Sep 2025 14:06:50 +0800 (CST)
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
Subject: [v2 1/3] pinctrl: cix: Add pin-controller support for sky1
Date: Fri, 12 Sep 2025 14:06:48 +0800
Message-ID: <20250912060650.2180691-2-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250912060650.2180691-1-gary.yang@cixtech.com>
References: <20250912060650.2180691-1-gary.yang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CF:EE_|TYQPR06MB8130:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9fdf6f7f-eaf2-406e-3046-08ddf1c29104
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?smmPri9MvLc8IWwbM+bAM9o3YR/bMZjswF3mN1G08O+SmGC8io8gvhXNNrWC?=
 =?us-ascii?Q?fetGRnn0LyblP//ZGMpiPCMULYL6LMQMjwmWQ/lGfqBRGFfjZmG42jua0rsx?=
 =?us-ascii?Q?Xe9ijZqR+wF4OP7FqLK/33YLiYZHFf9kHEWSeYlwulSUMoHCVx6VeNdDE+JS?=
 =?us-ascii?Q?MoxRXfFoAN5Emc8QEXuGgGabXFILUsjJGgrZx6p2JsL2ur8tTfi6i9tni7SL?=
 =?us-ascii?Q?MWIJEPseehQ6dl5+Do2e0yNPODlMqnirUEQGaROcQv5vGo4a2rRqIDfDXe/x?=
 =?us-ascii?Q?IwcxxSs3eD7Dt5O/YDBuTD/xtNupwk/zau/WjukLLE8UT3HyNJvAUk2IX3bl?=
 =?us-ascii?Q?gKZr9XYe4d/QcDv+bpii6XBrynx+APbUWdnhOBCujZLpLnRevwSaOyx28g0z?=
 =?us-ascii?Q?bleVa63PJZi1YmG4r9159Kkw0ZaB/13lHvqnuJzcn1b5tH+R3r5X3hHQ78qS?=
 =?us-ascii?Q?rv5dM6DJnhX0tRBb7JYNOHauKvaUSywDyhw/F0aJs95EUhv+xH825OaAf2Lt?=
 =?us-ascii?Q?KMyKhXIzCAkSceU+lQvHlJvJo08VaRQuEgcc4e5CiguTViB0+RzooCIJQAeE?=
 =?us-ascii?Q?VfyoREnSiMw3OTdXn0qJVO/b/IIPt5s/JYRhz+JTelQqKTl6fFsj25j5GHNQ?=
 =?us-ascii?Q?Bk5uX+9rPys0dl35wLtbFF7EKgjU10dl2MgJ2AA0Q1MbcQPztPTz9JXUstvl?=
 =?us-ascii?Q?UuJ6ZiyNO7wvUPXRbIGUL3l2EC8x2BBYXie4Rg0lcoJYPhxHVIGzyzYa/4SF?=
 =?us-ascii?Q?rGjREcFYxaizN62OwGHGixvvOCseEooBfItYcIkt+C9j1yDAxoLXvJ64/KD2?=
 =?us-ascii?Q?hu7TRnmmLSsv8YWYN4TwpMj9DcqMRNltXInr/TT26oJVpr9QhZ8kjuPExgvu?=
 =?us-ascii?Q?rK/Hbn8FaH/LgjI60RSKIxihYDPfdEuYRExCTw4d/BcZ5m2sFrGtqNwnl5e8?=
 =?us-ascii?Q?1blfPT9oNJaHOGdNHMuO5MgUrWgQqEgDjpx69NGdWLsur+jOTBj6YMYSV9f2?=
 =?us-ascii?Q?hte/vhJAkA8yj0/Gx4+mEwchbTwyKEvl3A1nhyZd1O6jxLxQk0y4XKEf+N5Q?=
 =?us-ascii?Q?4YGluS6bIXwAPIfVuG32wXMrLtwLvLJ2Dxn4UfAF0IEwkr9yutImf2ColLts?=
 =?us-ascii?Q?YNhxvBFuT6PHoFrTOSn3DcD5HWATuaL/rKYoqsSEswvt6z/hap6X2Nojv4aD?=
 =?us-ascii?Q?pxyeKo8WPcV/bqa1O2KV9Nadd8XlRG7rL72fY+bBxCAW+Scf0Ow1vNtZvTie?=
 =?us-ascii?Q?xk5bEZffs2PRK85glhwqJ4Vy605dqsrXKY9B6wIVQOYdD9e8LT7+ksZ1ROFN?=
 =?us-ascii?Q?g6NX87CRKdu7odbAFvTskYT2UFZWdfQI20HLLvtnpz3+k1ETq0fPXo+fLsNq?=
 =?us-ascii?Q?589q4uH4EwgqtA0iruITSai2f+OhN5KamqSiwrROX61P9mXTbdkDYtYXEwpI?=
 =?us-ascii?Q?hdchsA9sZDug2U0fb5/HfwGXBcsfWoKFoR4LS3rzug63JlFvpN7Kpq4D0XIZ?=
 =?us-ascii?Q?HOsvOFal76Kq44b4GwqEav1XqNzEm12MZBX4?=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 06:06:51.3545
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fdf6f7f-eaf2-406e-3046-08ddf1c29104
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CF.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYQPR06MB8130

Add the pin-controller driver for Sky1 platform

Signed-off-by: Gary Yang <gary.yang@cixtech.com>
---
 drivers/pinctrl/Kconfig                 |    1 +
 drivers/pinctrl/Makefile                |    1 +
 drivers/pinctrl/cix/Kconfig             |   14 +
 drivers/pinctrl/cix/Makefile            |    4 +
 drivers/pinctrl/cix/pinctrl-sky1-base.c |  581 +++++++++
 drivers/pinctrl/cix/pinctrl-sky1.c      | 1435 +++++++++++++++++++++++
 drivers/pinctrl/cix/pinctrl-sky1.h      |   46 +
 7 files changed, 2082 insertions(+)
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
index 000000000000..f0028f255647
--- /dev/null
+++ b/drivers/pinctrl/cix/pinctrl-sky1-base.c
@@ -0,0 +1,581 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Author: Jerry Zhu <Jerry.Zhu@cixtech.com>
+
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_address.h>
+#include <linux/pinctrl/machine.h>
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
+#define SKY1_PIN_SIZE		(0x4)
+#define SKY1_MUX_MASK		(0x180)
+#define SKY1_MUX_SHIFT		(0x7)
+#define SKY1_PULLCONF_MASK	(0x60)
+#define SKY1_PULLUP_SHIFT	(0x6)
+#define SKY1_PULLDN_SHIFT	(0x5)
+#define SKY1_DS_MASK		(0x0f)
+
+#define CIX_GET_PIN_NO(x) ((x) >> 8)
+#define CIX_GET_PIN_FUNC(x) ((x) & 0xf)
+
+static const char * const sky1_gpio_functions[] = {
+	"func0", "func1", "func2", "func3",
+};
+
+static const struct sky1_function_desc *sky1_pctrl_find_function_by_pin(
+		struct sky1_pinctrl *spctl, u32 pin_num, u32 fnum)
+{
+	const struct sky1_pin_desc *pin = spctl->info->pins + pin_num;
+	const struct sky1_function_desc *func = pin->functions;
+
+	while (func && func->name) {
+		if (func->muxval == fnum)
+			return func;
+		func++;
+	}
+
+	return NULL;
+}
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
+			const struct sky1_function_desc *func =
+					pin->functions;
+
+			while (func && func->name) {
+				if (func->muxval == fnum)
+					return true;
+				func++;
+			}
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
+		pctldev->num_functions = 4;
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
+	u32 *pin_reg;
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
+	const struct sky1_function_desc *desc;
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
+	desc = sky1_pctrl_find_function_by_pin(spctl, g->pin, function);
+	if (!desc)
+		return -EINVAL;
+
+	sky1_pmx_set_one_pin(spctl, g->pin, desc->muxval);
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
+	u32 *pin_reg;
+
+	pin_reg = spctl->base + pin * SKY1_PIN_SIZE;
+	reg_val = readl(pin_reg);
+	reg_val &= ~SKY1_PULLCONF_MASK;
+
+	if (!enable)
+		goto update;
+
+	if (isup)
+		reg_pullsel = BIT(SKY1_PULLUP_SHIFT);
+	else
+		reg_pullsel = BIT(SKY1_PULLDN_SHIFT);
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
+static int sky1_pconf_set_driving(struct sky1_pinctrl *spctl,
+		unsigned int pin, unsigned char driving)
+{
+	unsigned int reg_val;
+	u32 *pin_reg;
+
+	if (pin >= spctl->info->npins)
+		return -EINVAL;
+
+	pin_reg = spctl->base + pin * SKY1_PIN_SIZE;
+	reg_val = readl(pin_reg);
+	reg_val &= ~SKY1_DS_MASK;
+	reg_val |= (driving & SKY1_DS_MASK);
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
+MODULE_DESCRIPTION("Cix SKy1 pinctrl driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/pinctrl/cix/pinctrl-sky1.c b/drivers/pinctrl/cix/pinctrl-sky1.c
new file mode 100644
index 000000000000..3205665959ca
--- /dev/null
+++ b/drivers/pinctrl/cix/pinctrl-sky1.c
@@ -0,0 +1,1435 @@
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
+/* Pad names for the s5 domain pinmux subsystem */
+static const struct sky1_pin_desc sky1_pinctrl_s5_pads[] = {
+	{
+		.pin = PINCTRL_PIN(0, "GPIO1"),
+		.functions = {
+			[0] = {0, "GPIO1"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(1, "GPIO2"),
+		.functions = {
+			[0] = {0, "GPIO2"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(2, "GPIO3"),
+		.functions = {
+			[0] = {0, "GPIO3"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(3, "GPIO4"),
+		.functions = {
+			[0] = {0, "GPIO4"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(4, "GPIO5"),
+		.functions = {
+			[0] = {0, "GPIO5"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(5, "GPIO6"),
+		.functions = {
+			[0] = {0, "GPIO6"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(6, "GPIO7"),
+		.functions = {
+			[0] = {0, "GPIO7"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(7, "GPIO8"),
+		.functions = {
+			[0] = {0, "GPIO8"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(8, "GPIO9"),
+		.functions = {
+			[0] = {0, "GPIO9"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(9, "GPIO10"),
+		.functions = {
+			[0] = {0, "GPIO10"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(10, "GPIO11"),
+		.functions = {
+			[0] = {0, "GPIO11"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(11, "GPIO12"),
+		.functions = {
+			[0] = {0, "GPIO12"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(12, "GPIO13"),
+		.functions = {
+			[0] = {0, "GPIO13"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(13, "GPIO14"),
+		.functions = {
+			[0] = {0, "GPIO14"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(14, "RSMRST_L"),
+	},
+	{
+		.pin = PINCTRL_PIN(15, "SRST_L"),
+	},
+	{
+		.pin = PINCTRL_PIN(16, "SLP_S3_L"),
+	},
+	{
+		.pin = PINCTRL_PIN(17, "SLP_S5_L"),
+	},
+	{
+		.pin = PINCTRL_PIN(18, "PWRGD"),
+	},
+	{
+		.pin = PINCTRL_PIN(19, "PWROK"),
+	},
+	{
+		.pin = PINCTRL_PIN(20, "PWRBTN_L"),
+	},
+	{
+		.pin = PINCTRL_PIN(21, "VDD_DDRIO_GATE"),
+	},
+	{
+		.pin = PINCTRL_PIN(22, "JTAG_GPIO_L"),
+	},
+	{
+		.pin = PINCTRL_PIN(23, "JTAG_TCK"),
+	},
+	{
+		.pin = PINCTRL_PIN(24, "JTAG_TDI"),
+	},
+	{
+		.pin = PINCTRL_PIN(25, "JTAG_TDO"),
+	},
+	{
+		.pin = PINCTRL_PIN(26, "TMS"),
+	},
+	{
+		.pin = PINCTRL_PIN(27, "TRSL_L"),
+	},
+	{
+		.pin = PINCTRL_PIN(28, "SFI_I2C0_SCL"),
+		.functions = {
+			[0] = {0, "SFI_I2C0_SCL"},
+			[1] = {1, "SFI_I3C0_SCL"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(29, "SFI_I2C0_SDA"),
+		.functions = {
+			[0] = {0, "SFI_I2C0_SDA"},
+			[1] = {1, "SFI_I3C0_SDA"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(30, "SFI_I2C1_SCL"),
+		.functions = {
+			[0] = {0, "SFI_I2C1_SCL"},
+			[1] = {1, "SFI_I3C1_SCL"},
+			[2] = {2, "SFI_SPI_CS0"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(31, "SFI_I2C1_SDA"),
+		.functions = {
+			[0] = {0, "SFI_I2C1_SDA"},
+			[1] = {1, "SFI_I3C1_SDA"},
+			[2] = {2, "SFI_SPI_CS1"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(32, "SFI_GPIO0"),
+		.functions = {
+			[0] = {0, "GPIO15"},
+			[1] = {1, "SFI_SPI_SCK"},
+			[2] = {2, "SFI_GPIO0"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(33, "SFI_GPIO1"),
+		.functions = {
+			[0] = {0, "GPIO16"},
+			[1] = {1, "SFI_SPI_MOSI"},
+			[2] = {2, "SFI_GPIO1"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(34, "SFI_GPIO2"),
+		.functions = {
+			[0] = {0, "GPIO17"},
+			[1] = {1, "SFI_SPI_MISO"},
+			[2] = {2, "SFI_GPIO2"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(35, "GPIO18"),
+		.functions = {
+			[0] = {0, "SFI_GPIO3"},
+			[1] = {1, "GPIO18"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(36, "GPIO19"),
+		.functions = {
+			[0] = {0, "SFI_GPIO4"},
+			[1] = {1, "GPIO19"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(37, "GPIO20"),
+		.functions = {
+			[0] = {0, "SFI_GPIO5"},
+			[1] = {1, "GPIO20"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(38, "GPIO21"),
+		.functions = {
+			[0] = {0, "SFI_GPIO6"},
+			[1] = {1, "GPIO21"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(39, "GPIO22"),
+		.functions = {
+			[0] = {0, "SFI_GPIO7"},
+			[1] = {1, "GPIO22"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(40, "GPIO23"),
+		.functions = {
+			[0] = {0, "SFI_GPIO8"},
+			[1] = {1, "GPIO23"},
+			[2] = {2, "SFI_I3C0_PUR_EN_L"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(41, "GPIO24"),
+		.functions = {
+			[0] = {0, "SFI_GPIO9"},
+			[1] = {1, "GPIO24"},
+			[2] = {2, "SFI_I3C1_PUR_EN_L"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(42, "SPI1_MISO"),
+		.functions = {
+			[0] = {0, "SPI1_MISO"},
+			[1] = {1, "GPIO25"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(43, "SPI1_CS0"),
+		.functions = {
+			[0] = {0, "SPI1_CS0"},
+			[1] = {1, "GPIO26"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(44, "SPI1_CS1"),
+		.functions = {
+			[0] = {0, "SPI1_CS1"},
+			[1] = {1, "GPIO27"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(45, "SPI1_MOSI"),
+		.functions = {
+			[0] = {0, "SPI1_MOSI"},
+			[1] = {1, "GPIO28"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(46, "SPI1_CLK"),
+		.functions = {
+			[0] = {0, "SPI1_CLK"},
+			[1] = {1, "GPIO29"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(47, "GPIO30"),
+		.functions = {
+			[0] = {0, "GPIO30"},
+			[1] = {1, "USB_0C0_L"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(48, "GPIO31"),
+		.functions = {
+			[0] = {0, "GPIO31"},
+			[1] = {1, "USB_0C1_L"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(49, "GPIO32"),
+		.functions = {
+			[0] = {0, "GPIO32"},
+			[1] = {1, "USB_0C2_L"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(50, "GPIO33"),
+		.functions = {
+			[0] = {0, "GPIO33"},
+			[1] = {1, "USB_0C3_L"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(51, "GPIO34"),
+		.functions = {
+			[0] = {0, "GPIO34"},
+			[1] = {1, "USB_0C4_L"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(52, "GPIO35"),
+		.functions = {
+			[0] = {0, "GPIO35"},
+			[1] = {1, "USB_0C5_L"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(53, "GPIO36"),
+		.functions = {
+			[0] = {0, "GPIO36"},
+			[1] = {1, "USB_0C6_L"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(54, "GPIO37"),
+		.functions = {
+			[0] = {0, "GPIO37"},
+			[1] = {1, "USB_0C7_L"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(55, "GPIO38"),
+		.functions = {
+			[0] = {0, "GPIO38"},
+			[1] = {1, "USB_0C8_L"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(56, "GPIO39"),
+		.functions = {
+			[0] = {0, "GPIO39"},
+			[1] = {1, "USB_0C9_L"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(57, "GPIO40"),
+		.functions = {
+			[0] = {0, "GPIO40"},
+			[1] = {1, "USB_DRIVE_VBUS0"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(58, "GPIO41"),
+		.functions = {
+			[0] = {0, "GPIO41"},
+			[1] = {1, "USB_DRIVE_VBUS4"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(59, "GPIO42"),
+		.functions = {
+			[0] = {0, "GPIO42"},
+			[1] = {1, "USB_DRIVE_VBUS5"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(60, "SE_QSPI_CLK"),
+		.functions = {
+			[0] = {0, "SE_QSPI_CLK"},
+			[1] = {1, "QSPI_CLK"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(61, "SE_QSPI_CS_L"),
+		.functions = {
+			[0] = {0, "SE_QSPI_CS_L"},
+			[1] = {1, "QSPI_CS_L"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(62, "SE_QSPI_DATA0"),
+		.functions = {
+			[0] = {0, "SE_QSPI_DATA0"},
+			[1] = {1, "QSPI_DATA0"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(63, "SE_QSPI_DATA1"),
+		.functions = {
+			[0] = {0, "SE_QSPI_DATA1"},
+			[1] = {1, "QSPI_DATA1"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(64, "SE_QSPI_DATA2"),
+		.functions = {
+			[0] = {0, "SE_QSPI_DATA2"},
+			[1] = {1, "QSPI_DATA2"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(65, "SE_QSPI_DATA3"),
+		.functions = {
+			[0] = {0, "SE_QSPI_DATA3"},
+			[1] = {1, "QSPI_DATA3"},
+		},
+	},
+};
+
+/* Pad names for the s0 domain pinmux subsystem */
+static const struct sky1_pin_desc sky1_pinctrl_pads[] = {
+	{
+		.pin = PINCTRL_PIN(0, "GPIO43"),
+		.functions = {
+			[0] = {0, "GPIO43"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(1, "GPIO44"),
+		.functions = {
+			[0] = {0, "GPIO44"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(2, "GPIO45"),
+		.functions = {
+			[0] = {0, "GPIO45"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(3, "GPIO46"),
+		.functions = {
+			[0] = {0, "GPIO46"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(4, "RESET_IN_L"),
+	},
+	{
+		.pin = PINCTRL_PIN(5, "PLT_RESET_L"),
+	},
+	{
+		.pin = PINCTRL_PIN(6, "THERMTRIP_L"),
+	},
+	{
+		.pin = PINCTRL_PIN(7, "PROCHOT_L"),
+	},
+	{
+		.pin = PINCTRL_PIN(8, "PM_I2C0_CLK"),
+	},
+	{
+		.pin = PINCTRL_PIN(9, "PM_I2C0_DATA"),
+	},
+	{
+		.pin = PINCTRL_PIN(10, "PM_I2C1_CLK"),
+	},
+	{
+		.pin = PINCTRL_PIN(11, "PM_I2C1_DATA"),
+	},
+	{
+		.pin = PINCTRL_PIN(12, "PM_I2C2_CLK"),
+	},
+	{
+		.pin = PINCTRL_PIN(13, "PM_I2C2_DATA"),
+	},
+	{
+		.pin = PINCTRL_PIN(14, "PM_I2C3_CLK"),
+	},
+	{
+		.pin = PINCTRL_PIN(15, "PM_I2C3_DATA"),
+	},
+	{
+		.pin = PINCTRL_PIN(16, "STRAP0"),
+	},
+	{
+		.pin = PINCTRL_PIN(17, "STRAP1"),
+	},
+	{
+		.pin = PINCTRL_PIN(18, "DP2_DIGON"),
+		.functions = {
+			[0] = {0, "DP2_DIGON"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(19, "DP2_BLON"),
+		.functions = {
+			[0] = {0, "DP2_BLON"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(20, "DP2_VARY_BL"),
+		.functions = {
+			[0] = {0, "DP2_VARY_BL"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(21, "I2C7_SCL"),
+		.functions = {
+			[0] = {0, "I2C7_SCL"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(22, "I2C7_SDA"),
+		.functions = {
+			[0] = {0, "I2C7_SDA"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(23, "UART6_CSU_SE_TXD"),
+	},
+	{
+		.pin = PINCTRL_PIN(24, "CLK_REQ1_L"),
+	},
+	{
+		.pin = PINCTRL_PIN(25, "CLK_REQ3_L"),
+	},
+	{
+		.pin = PINCTRL_PIN(26, "I2C5_SCL"),
+		.functions = {
+			[0] = {0, "I2C5_SCL"},
+			[1] = {1, "GPIO47"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(27, "I2C5_SDA"),
+		.functions = {
+			[0] = {0, "I2C5_SDA"},
+			[1] = {1, "GPIO48"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(28, "I2C6_SCL"),
+		.functions = {
+			[0] = {0, "I2C6_SCL"},
+			[1] = {1, "GPIO49"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(29, "I2C6_SDA"),
+		.functions = {
+			[0] = {0, "I2C6_SDA"},
+			[1] = {1, "GPIO50"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(30, "I2C0_CLK"),
+		.functions = {
+			[0] = {0, "I2C0_CLK"},
+			[1] = {1, "GPIO51"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(31, "I2C0_SDA"),
+		.functions = {
+			[0] = {0, "I2C0_SDA"},
+			[1] = {1, "GPIO52"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(32, "I2C1_CLK"),
+		.functions = {
+			[0] = {0, "I2C1_CLK"},
+			[1] = {1, "GPIO53"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(33, "I2C1_SDA"),
+		.functions = {
+			[0] = {0, "I2C5_SCL"},
+			[1] = {1, "GPIO54"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(34, "I2C2_SCL"),
+		.functions = {
+			[0] = {0, "I2C2_SCL"},
+			[1] = {1, "I3C0_SCL"},
+			[2] = {2, "GPIO55"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(35, "I2C2_SDA"),
+		.functions = {
+			[0] = {0, "I2C2_SDA"},
+			[1] = {1, "I3C0_SDA"},
+			[2] = {2, "GPIO56"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(36, "GPIO57"),
+		.functions = {
+			[0] = {0, "GPIO57"},
+			[1] = {1, "I3C0_PUR_EN_L"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(37, "I2C3_CLK"),
+		.functions = {
+			[0] = {0, "I2C3_CLK"},
+			[1] = {1, "I3C1_CLK"},
+			[2] = {2, "GPIO58"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(38, "I2C3_SDA"),
+		.functions = {
+			[0] = {0, "I2C3_SDA"},
+			[1] = {1, "I3C1_SDA"},
+			[2] = {2, "GPIO59"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(39, "GPIO60"),
+		.functions = {
+			[0] = {0, "GPIO60"},
+			[1] = {1, "I3C1_PUR_EN_L"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(40, "I2C4_CLK"),
+		.functions = {
+			[0] = {0, "I2C4_CLK"},
+			[1] = {1, "GPIO61"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(41, "I2C4_SDA"),
+		.functions = {
+			[0] = {0, "I2C4_SDA"},
+			[1] = {1, "GPIO62"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(42, "HDA_BITCLK"),
+		.functions = {
+			[0] = {0, "HDA_BITCLK"},
+			[1] = {1, "I2S0_SCK"},
+			[2] = {2, "I2S9_RSCK_DBG"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(43, "HDA_RST_L"),
+		.functions = {
+			[0] = {0, "HDA_RST_L"},
+			[1] = {1, "I2S0_DATA_IN"},
+			[2] = {2, "I2S9_DATA_IN_DBG"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(44, "HDA_SDIN0"),
+		.functions = {
+			[0] = {0, "HDA_SDIN0"},
+			[1] = {1, "I2S0_MCLK"},
+			[2] = {2, "I2S9_TSCK_DBG"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(45, "HDA_SDOUT0"),
+		.functions = {
+			[0] = {0, "HDA_SDOUT0"},
+			[1] = {1, "I2S0_DATA_OUT"},
+			[2] = {2, "I2S9_TWS_DBG"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(46, "HDA_SYNC"),
+		.functions = {
+			[0] = {0, "HDA_SYNC"},
+			[1] = {1, "I2S0_WS"},
+			[2] = {2, "I2S9_RWS_DBG"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(47, "HDA_SDIN1"),
+		.functions = {
+			[0] = {0, "HDA_SDIN1"},
+			[1] = {1, "GPIO63"},
+			[2] = {2, "I2S9_DATA_IN1_DBG"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(48, "HDA_SDOUT1"),
+		.functions = {
+			[0] = {0, "HDA_SDOUT1"},
+			[1] = {1, "GPIO64"},
+			[2] = {2, "I2S9_DATA_OUT0_DBG"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(49, "I2S1_MCLK"),
+		.functions = {
+			[0] = {0, "I2S1_MCLK"},
+			[1] = {1, "GPIO65"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(50, "I2S1_SCK"),
+		.functions = {
+			[0] = {0, "I2S1_SCK"},
+			[1] = {1, "GPIO66"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(51, "I2S1_WS"),
+		.functions = {
+			[0] = {0, "I2S1_WS"},
+			[1] = {1, "GPIO67"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(52, "I2S1_DATA_IN"),
+		.functions = {
+			[0] = {0, "I2S1_DATA_IN"},
+			[1] = {1, "GPIO68"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(53, "I2S1_DATA_OUT"),
+		.functions = {
+			[0] = {0, "I2S1_DATA_OUT"},
+			[1] = {1, "GPIO69"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(54, "I2S2_MCLK"),
+		.functions = {
+			[0] = {0, "I2S2_MCLK"},
+			[1] = {1, "GPIO70"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(55, "I2S2_RSCK"),
+		.functions = {
+			[0] = {0, "I2S2_RSCK"},
+			[1] = {1, "GPIO71"},
+			[2] = {2, "I2S5_RSCK_DBG"},
+			[3] = {3, "I2S6_RSCK_DBG"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(56, "I2S2_RWS"),
+		.functions = {
+			[0] = {0, "I2S2_RWS"},
+			[1] = {1, "GPIO72"},
+			[2] = {2, "I2S5_RWS_DBG"},
+			[3] = {3, "I2S6_RWS_DBG"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(57, "I2S2_TSCK"),
+		.functions = {
+			[0] = {0, "I2S2_TSCK"},
+			[1] = {1, "GPIO73"},
+			[2] = {2, "I2S5_TSCK_DBG"},
+			[3] = {3, "I2S6_TSCK_DBG"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(58, "I2S2_TWS"),
+		.functions = {
+			[0] = {0, "I2S2_TWS"},
+			[1] = {1, "GPIO74"},
+			[2] = {2, "I2S5_TWS_DBG"},
+			[3] = {3, "I2S6_TWS_DBG"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(59, "I2S2_DATA_IN0"),
+		.functions = {
+			[0] = {0, "I2S2_DATA_IN0"},
+			[1] = {1, "GPIO75"},
+			[2] = {2, "I2S5_DATA_IN0_DBG"},
+			[3] = {3, "I2S6_DATA_IN0_DBG"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(60, "I2S2_DATA_IN1"),
+		.functions = {
+			[0] = {0, "I2S2_DATA_IN1"},
+			[1] = {1, "GPIO76"},
+			[2] = {2, "I2S5_DATA_IN1_DBG"},
+			[3] = {3, "I2S6_DATA_IN1_DBG"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(61, "I2S2_DATA_OUT0"),
+		.functions = {
+			[0] = {0, "I2S2_DATA_OUT0"},
+			[1] = {1, "GPIO77"},
+			[2] = {2, "I2S5_DATA_OUT0_DBG"},
+			[3] = {3, "I2S6_DATA_OUT0_DBG"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(62, "I2S2_DATA_OUT1"),
+		.functions = {
+			[0] = {0, "I2S2_DATA_OUT1"},
+			[1] = {1, "GPIO78"},
+			[2] = {2, "I2S5_DATA_OUT1_DBG"},
+			[3] = {3, "I2S6_DATA_OUT1_DBG"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(63, "I2S2_DATA_OUT2"),
+		.functions = {
+			[0] = {0, "I2S2_DATA_OUT2"},
+			[1] = {1, "GPIO79"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(64, "I2S2_DATA_OUT3"),
+		.functions = {
+			[0] = {0, "I2S2_DATA_OUT3"},
+			[1] = {1, "GPIO80"},
+			[2] = {2, "I2S9_DATA_OUT1_DBG"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(65, "I2S3_MCLK"),
+		.functions = {
+			[0] = {0, "I2S3_MCLK"},
+			[1] = {1, "GPIO81"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(66, "I2S3_RSCK"),
+		.functions = {
+			[0] = {0, "I2S3_RSCK"},
+			[1] = {1, "GPIO82"},
+			[2] = {2, "I2S7_RSCK_DBG"},
+			[3] = {3, "I2S8_RSCK_DBG"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(67, "I2S3_RWS"),
+		.functions = {
+			[0] = {0, "I2S3_RWS"},
+			[1] = {1, "GPIO83"},
+			[2] = {2, "I2S7_RWS_DBG"},
+			[3] = {3, "I2S8_RWS_DBG"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(68, "I2S3_TSCK"),
+		.functions = {
+			[0] = {0, "I2S3_TSCK"},
+			[1] = {1, "GPIO84"},
+			[2] = {2, "I2S7_TSCK_DBG"},
+			[3] = {3, "I2S8_TSCK_DBG"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(69, "I2S3_TWS"),
+		.functions = {
+			[0] = {0, "I2S3_TWS"},
+			[1] = {1, "GPIO85"},
+			[2] = {2, "I2S7_TWS_DBG"},
+			[3] = {3, "I2S8_TWS_DBG"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(70, "I2S3_DATA_IN0"),
+		.functions = {
+			[0] = {0, "I2S3_DATA_IN0"},
+			[1] = {1, "GPIO86"},
+			[2] = {2, "I2S7_DATA_IN0_DBG"},
+			[3] = {3, "I2S8_DATA_IN0_DBG"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(71, "I2S3_DATA_IN1"),
+		.functions = {
+			[0] = {0, "I2S3_DATA_IN1"},
+			[1] = {1, "GPIO87"},
+			[2] = {2, "I2S7_DATA_IN1_DBG"},
+			[3] = {3, "I2S8_DATA_IN1_DBG"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(72, "I2S3_DATA_OUT0"),
+		.functions = {
+			[0] = {0, "I2S3_DATA_OUT0"},
+			[1] = {1, "GPIO88"},
+			[2] = {2, "I2S7_DATA_OUT0_DBG"},
+			[3] = {3, "I2S8_DATA_OUT0_DBG"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(73, "I2S3_DATA_OUT1"),
+		.functions = {
+			[0] = {0, "I2S3_DATA_OUT1"},
+			[1] = {1, "GPIO89"},
+			[2] = {2, "I2S7_DATA_OUT1_DBG"},
+			[3] = {3, "I2S8_DATA_OUT1_DBG"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(74, "GPIO90"),
+		.functions = {
+			[0] = {0, "GPIO90"},
+			[1] = {1, "I2S4_MCLK_LB"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(75, "GPIO91"),
+		.functions = {
+			[0] = {0, "GPIO91"},
+			[1] = {1, "I2S4_SCK_LB"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(76, "GPIO92"),
+		.functions = {
+			[0] = {0, "GPIO92"},
+			[1] = {1, "I2S4_WS_LB"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(77, "GPIO93"),
+		.functions = {
+			[0] = {0, "GPIO93"},
+			[1] = {1, "I2S4_DATA_IN_LB"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(78, "GPIO94"),
+		.functions = {
+			[0] = {0, "GPIO94"},
+			[1] = {1, "I2S4_DATA_OUT_LB"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(79, "UART0_TXD"),
+		.functions = {
+			[0] = {0, "UART0_TXD"},
+			[1] = {1, "PWM0"},
+			[2] = {2, "GPIO95"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(80, "UART0_RXD"),
+		.functions = {
+			[0] = {0, "UART0_RXD"},
+			[1] = {1, "PWM1"},
+			[2] = {2, "GPIO96"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(81, "UART0_CTS"),
+		.functions = {
+			[0] = {0, "UART0_CTS"},
+			[1] = {1, "FAN_OUT2"},
+			[2] = {2, "GPIO97"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(82, "UART0_RTS"),
+		.functions = {
+			[0] = {0, "UART0_CTS"},
+			[1] = {1, "FAN_TACH2"},
+			[2] = {2, "GPIO98"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(83, "UART1_TXD"),
+		.functions = {
+			[0] = {0, "UART0_CTS"},
+			[1] = {1, "FAN_OUT0"},
+			[2] = {2, "GPIO99"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(84, "UART1_RXD"),
+		.functions = {
+			[0] = {0, "UART0_CTS"},
+			[1] = {1, "FAN_TACH0"},
+			[2] = {2, "GPIO100"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(85, "UART1_CTS"),
+		.functions = {
+			[0] = {0, "UART1_CTS"},
+			[1] = {1, "FAN_OUT1"},
+			[2] = {2, "GPIO101"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(86, "UART1_RTS"),
+		.functions = {
+			[0] = {0, "UART1_RTS"},
+			[1] = {1, "FAN_TACH1"},
+			[2] = {2, "GPIO102"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(87, "UART2_TXD"),
+		.functions = {
+			[0] = {0, "UART2_TXD"},
+			[1] = {1, "GPIO103"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(88, "UART2_RXD"),
+		.functions = {
+			[0] = {0, "UART2_RXD"},
+			[1] = {1, "GPIO104"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(89, "UART3_TXD"),
+		.functions = {
+			[0] = {0, "UART3_TXD"},
+			[1] = {1, "GPIO105"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(90, "UART3_RXD"),
+		.functions = {
+			[0] = {0, "UART3_RXD"},
+			[1] = {1, "GPIO106"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(91, "UART3_CTS"),
+		.functions = {
+			[0] = {0, "UART3_CTS"},
+			[1] = {1, "GPIO107"},
+			[2] = {2, "TRIGIN0"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(92, "UART3_RTS"),
+		.functions = {
+			[0] = {0, "UART3_RTS"},
+			[1] = {1, "GPIO108"},
+			[2] = {2, "TRIGIN1"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(93, "UART4_CSU_PM_TXD"),
+		.functions = {
+			[0] = {0, "UART4_CSU_PM_TXD"},
+			[1] = {1, "GPIO109"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(94, "UART4_CSU_PM_RXD"),
+		.functions = {
+			[0] = {0, "UART4_CSU_PM_RXD"},
+			[1] = {1, "GPIO110"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(95, "UART5_CSU_SE_TXD"),
+		.functions = {
+			[0] = {0, "UART5_CSU_SE_TXD"},
+			[1] = {1, "GPIO111"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(96, "UART5_CSU_SE_RXD"),
+		.functions = {
+			[0] = {0, "UART5_CSU_SE_RXD"},
+			[1] = {1, "GPIO112"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(97, "UART6_CSU_SE_RXD"),
+		.functions = {
+			[0] = {0, "UART6_CSU_SE_RXD"},
+			[1] = {1, "GPIO113"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(98, "CLK_REQ0_L"),
+		.functions = {
+			[0] = {0, "CLK_REQ0_L"},
+			[1] = {1, "GPIO114"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(99, "CLK_REQ2_L"),
+		.functions = {
+			[0] = {0, "CLK_REQ2_L"},
+			[1] = {1, "GPIO115"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(100, "CLK_REQ4_L"),
+		.functions = {
+			[0] = {0, "CLK_REQ4_L"},
+			[1] = {1, "GPIO116"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(101, "CSI0_MCLK0"),
+		.functions = {
+			[0] = {0, "CSI0_MCLK0"},
+			[1] = {1, "GPIO117"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(102, "CSI0_MCLK1"),
+		.functions = {
+			[0] = {0, "CSI0_MCLK1"},
+			[1] = {1, "GPIO118"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(103, "CSI1_MCLK0"),
+		.functions = {
+			[0] = {0, "CSI1_MCLK0"},
+			[1] = {1, "GPIO119"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(104, "CSI1_MCLK1"),
+		.functions = {
+			[0] = {0, "CSI1_MCLK1"},
+			[1] = {1, "GPIO120"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(105, "GPIO121"),
+		.functions = {
+			[0] = {0, "GPIO121"},
+			[1] = {1, "GMAC0_REFCLK_25M"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(106, "GPIO122"),
+		.functions = {
+			[0] = {0, "GPIO122"},
+			[1] = {1, "GMAC0_TX_CTL"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(107, "GPIO123"),
+		.functions = {
+			[0] = {0, "GPIO123"},
+			[1] = {1, "GMAC0_TXD0"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(108, "GPIO124"),
+		.functions = {
+			[0] = {0, "GPIO124"},
+			[1] = {1, "GMAC0_TXD1"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(109, "GPIO125"),
+		.functions = {
+			[0] = {0, "GPIO125"},
+			[1] = {1, "GMAC0_TXD2"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(110, "GPIO126"),
+		.functions = {
+			[0] = {0, "GPIO126"},
+			[1] = {1, "GMAC0_TXD3"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(111, "GPIO127"),
+		.functions = {
+			[0] = {0, "GPIO127"},
+			[1] = {1, "GMAC0_TX_CLK"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(112, "GPIO128"),
+		.functions = {
+			[0] = {0, "GPIO128"},
+			[1] = {1, "GMAC0_RX_CTL"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(113, "GPIO129"),
+		.functions = {
+			[0] = {0, "GPIO129"},
+			[1] = {1, "GMAC0_RXD0"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(114, "GPIO130"),
+		.functions = {
+			[0] = {0, "GPIO130"},
+			[1] = {1, "GMAC0_RXD1"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(115, "GPIO131"),
+		.functions = {
+			[0] = {0, "GPIO131"},
+			[1] = {1, "GMAC0_RXD2"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(116, "GPIO132"),
+		.functions = {
+			[0] = {0, "GPIO132"},
+			[1] = {1, "GMAC0_RXD3"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(117, "GPIO133"),
+		.functions = {
+			[0] = {0, "GPIO133"},
+			[1] = {1, "GMAC0_RX_CLK"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(118, "GPIO134"),
+		.functions = {
+			[0] = {0, "GPIO134"},
+			[1] = {1, "GMAC0_MDC"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(119, "GPIO135"),
+		.functions = {
+			[0] = {0, "GPIO135"},
+			[1] = {1, "GMAC0_MDIO"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(120, "GPIO136"),
+		.functions = {
+			[0] = {0, "GPIO136"},
+			[1] = {1, "GMAC1_REFCLK_25M"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(121, "GPIO137"),
+		.functions = {
+			[0] = {0, "GPIO137"},
+			[1] = {1, "GMAC1_TX_CTL"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(122, "GPIO138"),
+		.functions = {
+			[0] = {0, "GPIO138"},
+			[1] = {1, "GMAC1_TXD0"},
+			[2] = {2, "SPI2_MISO"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(123, "GPIO139"),
+		.functions = {
+			[0] = {0, "GPIO139"},
+			[1] = {1, "GMAC1_TXD1"},
+			[2] = {2, "SPI2_CS0"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(124, "GPIO140"),
+		.functions = {
+			[0] = {0, "GPIO140"},
+			[1] = {1, "GMAC1_TXD2"},
+			[2] = {2, "SPI2_CS1"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(125, "GPIO141"),
+		.functions = {
+			[0] = {0, "GPIO141"},
+			[1] = {1, "GMAC1_TXD3"},
+			[2] = {2, "SPI2_MOSI"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(126, "GPIO142"),
+		.functions = {
+			[0] = {0, "GPIO142"},
+			[1] = {1, "GMAC1_TX_CLK"},
+			[2] = {2, "SPI2_CLK"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(127, "GPIO143"),
+		.functions = {
+			[0] = {0, "GPIO143"},
+			[1] = {1, "GMAC1_RX_CTL"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(128, "GPIO144"),
+		.functions = {
+			[0] = {0, "GPIO144"},
+			[1] = {1, "GMAC1_RXD0"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(129, "GPIO145"),
+		.functions = {
+			[0] = {0, "GPIO145"},
+			[1] = {1, "GMAC1_RXD1"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(130, "GPIO146"),
+		.functions = {
+			[0] = {0, "GPIO146"},
+			[1] = {1, "GMAC1_RXD2"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(131, "GPIO147"),
+		.functions = {
+			[0] = {0, "GPIO147"},
+			[1] = {1, "GMAC1_RXD3"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(132, "GPIO148"),
+		.functions = {
+			[0] = {0, "GPIO148"},
+			[1] = {1, "GMAC1_RX_CLK"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(133, "GPIO149"),
+		.functions = {
+			[0] = {0, "GPIO149"},
+			[1] = {1, "GMAC1_MDC"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(134, "GPIO150"),
+		.functions = {
+			[0] = {0, "GPIO150"},
+			[1] = {1, "GMAC1_MDIO"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(135, "GPIO151"),
+		.functions = {
+			[0] = {0, "GPIO151"},
+			[1] = {1, "PM_GPIO0"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(136, "GPIO152"),
+		.functions = {
+			[0] = {0, "GPIO152"},
+			[1] = {1, "PM_GPIO1"},
+		},
+	},
+	{
+		.pin = PINCTRL_PIN(137, "GPIO153"),
+		.functions = {
+			[0] = {0, "GPIO153"},
+			[1] = {1, "PM_GPIO2"},
+		},
+	},
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
index 000000000000..49890a4afbb7
--- /dev/null
+++ b/drivers/pinctrl/cix/pinctrl-sky1.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Author: Jerry Zhu <Jerry.Zhu@cixtech.com>
+ */
+
+#ifndef __DRIVERS_PINCTRL_SKY1_H
+#define __DRIVERS_PINCTRL_SKY1_H
+
+struct sky1_function_desc {
+	unsigned char muxval;
+	const char *name;
+};
+
+struct sky1_pinctrl_group {
+	const char *name;
+	unsigned long config;
+	unsigned int pin;
+};
+
+struct sky1_pin_desc {
+	const struct pinctrl_pin_desc pin;
+	const struct sky1_function_desc functions[4];
+};
+
+struct sky1_pinctrl_soc_info {
+	const struct sky1_pin_desc *pins;
+	unsigned int npins;
+};
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


