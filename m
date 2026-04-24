Return-Path: <linux-gpio+bounces-35477-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SH0tDetS62nkKwAAu9opvQ
	(envelope-from <linux-gpio+bounces-35477-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 13:24:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CD145DAC1
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 13:24:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CDD9C301983C
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 11:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 609BC3A6F04;
	Fri, 24 Apr 2026 11:14:08 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2126.outbound.protection.partner.outlook.cn [139.219.17.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4FF3A4535;
	Fri, 24 Apr 2026 11:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777029248; cv=fail; b=Nd4vUKMTnlvGW6I2zBbjbYllHng6D4e1X8/+HlxgOkq7eWHd2h2WB/z7/zzhXKh8n7xrXVX+hara/eumb9+4gdNIk9AvduZDbztvcXDX93tuwPe+jeE7rhVIa+GTiqy1N3erUqLDAoZVJReeVpXTd/4RBsz9kGUT6HxzkSaDVQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777029248; c=relaxed/simple;
	bh=KO6L2u81LnlJCK4R9UPzOSe20WJpTFpcmTLAUG1bj6Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IQlyskn6L20Vv7yyw0uiivyyNWmteJ4c2sh1Xz96ek+y1PL+6oXk+20lmr+1NI9mqwmklS8tIvgo2bw8Rakl8jZy9oqN1imS5XGDt0n0WEtTiFviep5R56csm9ioqvjDL4HORvbsKtiOw8aavSdUjdMBdJpZbis5MthFi90SOCg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hl7fbieDmM4Uk5/MtUfnC+vG6jsaTvZMhWaLdZYDKplWElR/3TftR6adlh6ViFnoQtJWrkvf74v/P+uBSwqQbfnV67HfY+2sQOitUSe/WP+pyC549H0edRhganpo/6t75AwL9ZaxjyywdqRwBeKQwV25MSeMwjlh1yIaucJKhatqLcYoDxUiPfZZOFYfzOXsg9RoQ67FRioP974IJDElZlbDMGzaeYjVWat38GeRw3ts/xVP6IdkiSemeLnUt9TFXN9VBSYTisGeLweU+PEOllzCKm+JSpr0Xc7QxjLSrntxogLIG3s7Q7FOaJEAj5S3WGsQrbOspq4gNXWwrFFGQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y354y2Ja22p2D0BENOacadp07lcirzFKu+XrU7Cyv5E=;
 b=XQKqvQ8mm3YC/np58cSMmD6OP/uaYwXiWrr1SsCCP5TKFHu/O5cdEhKjWCS0vBx8LwzjSJxTMI5LNOfcwlfiaE+RhvkfO0rTiiCukon07c5DVnXp/NJxLKFObB3KfOIr6pnpaCAHEC7InZb55ENajICWGCKMI/u/llPQ1VQZNoF8ZFgcbHJmL8j0mCIDxcR5zYtNG3SHpFCfGOJSynCcBtrqDrzjNnkgnQd8FrUMml2QDhd8gya7eLHHDrOwEA2a20kxTw/A3s7H3Qg6BYhHE3EE5r1RYRVU7oEngbn1bEjAqGxt5p/N75VG2/oQFWWl1L+HiIYp52w4DY9hnJcPow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1156.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 11:13:46 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9846.021; Fri, 24 Apr 2026 11:13:46 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v1 06/20] pinctrl: starfive: Add StarFive JHB100 sys1 controller driver
Date: Fri, 24 Apr 2026 04:13:16 -0700
Message-Id: <20260424111330.702272-7-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260424111330.702272-1-changhuang.liang@starfivetech.com>
References: <20260424111330.702272-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHXPR01CA0025.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::34) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1156:EE_
X-MS-Office365-Filtering-Correlation-Id: 28be3ef9-176d-4e1b-0ca8-08dea1f28d96
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	zSZC9b4hlnqKiNbg4SFcr9xLEPekgceb+8B6nG1XId7IA5TL/vf9Mc8hI3HFEJnn/q3hMpzArpQWxfXcr14tBUsOtjBZ1Tlc4lySwI8Az83xW+T9yWpV04ZRUMGZpUmrBi1ka+niZiNzHMgsPBvJpKNB1qc6xlMKWLWmApGMstaDBAvgWCI/9lFgk+KHUgaKFdVPX2zQsrMrCaiuSf5mgj1CTjqmsxkot7axQr8EeqKKHxdfrdU/fhpGX5ahxAv7GfKgcRFnWRVpd8ONRTeCGqlBwb4LEkzCaJs8dHAOPYuVlAEh81gLw2BV5eFbh3d2WhZoI9IO2q2ewgJIY4S+wRO1953MEOnrMdJ+tHI42zSV9w3OVtqwSEqQWN/j/MnYiu8glnUmLPSaHVhqAgTXZ+23NN7t6ypXlVlEzhHor8B8+NUCoxJFVklVghXlkXTmYAmz3zToDi0ZmttSO1Rnj3kNQuWj+tSdsWUQnJT4k0NGH88VRfeKHGKnnxxnKqFqSwAIrVB1SPCBoPxX65UdTH3i5jQmZbTY+EaScWSSxW0+NWvp5+mntfYY4/l0RCoK6jXpzljmp4YnTUT/8a/1onYgbvHiMdcNLKb4VmBMSWc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+vQTCjU/TFd0HT/9M7dcebtUtDaghAAGhLy8XIS7zqCKvfyhz2N7/GGYljTB?=
 =?us-ascii?Q?h1ff5vol+WPDfYNp0zApA6HU8k36njojZpF1eYPtybdsCRc6cJOsBdbE6SsB?=
 =?us-ascii?Q?QwcNWlXhtesRSnqobn8GaG5aAH6uvvXGGf+yti66gv9kVJjBXdWvqNZMbfsb?=
 =?us-ascii?Q?wdyoKcnrSdxFvnocl7oFpNf3j9Q8DOo7CpFtDShk3PbICsex4IzvPYNCMQnU?=
 =?us-ascii?Q?vPx6NH4yi2qYJwj+6CeN5Nz8mbg9pS5golZyFv2bLuECtcRdZdQlkn5dOXgz?=
 =?us-ascii?Q?az3fHfWWw3MswkHc/AWSW00jzbOI+uJkQ4Q4cyenmvt55G//E4bjtuhSP10U?=
 =?us-ascii?Q?JXeDS0DNd4TcHw3zf9wVI6A7uKn//XnS2lv9eM1Z6a7oosKvMN9XSjJENoJK?=
 =?us-ascii?Q?QL3lcXudMwbK91cnu3SMZNvHPNj+9Fl8YfjRKE7BTtvXqImY29sSs1Fkb+km?=
 =?us-ascii?Q?KmKo2HGIQRNxaJNSEP4ontkt3ni4lo+NZFAMtedvGbJI/uiP2RylS3Y0SwOy?=
 =?us-ascii?Q?bTBjcYybcDw1/6WczqhErgXqh3HWVOYzP1RdoMKoXt/m08zDSNKiQPR+joDB?=
 =?us-ascii?Q?YutDRJH4WFX4X4Y+Ly4e042QID7noML8e0Jwld9WFY2M62vbfojqT09dXe0K?=
 =?us-ascii?Q?X8bsUhZWeXMkzzNhMUA0XcPQl6woMqULmYzzneqfN1NK0BdhCx48PvJqR1vb?=
 =?us-ascii?Q?6WJ1ID/SBJvSgy0imShN9V0QDaSwQ67fkVLKFt6UaKww5cP/DcARlkyu5MVZ?=
 =?us-ascii?Q?ACPw0QI45sxWNyR5zffmauGZ8+GpUaFSPBTSOVx6Im1N4WEQ7ZrrQulzzei9?=
 =?us-ascii?Q?ILcuAQhdXfQvobxSADcK8ItMEXsvNX59+nOGOaG7GTbNtIKCARK0rOaviFo5?=
 =?us-ascii?Q?HX16Xt5XGjdiaWWUWt6R41chrRAT+vT46Q5K38Ud79Sl2FlfoJHw9zfgrDeq?=
 =?us-ascii?Q?/52EhrJ2V7e/wl5Bz7phDLZ9/MB3R/GNq4oCrRWbmaL1GNmP5Iqg5diNF/eN?=
 =?us-ascii?Q?DxHrDFqveH42NemZp2cBfsnVXsFY7NMc1TzdV+2L9SVNIl1fJcjYGfBi8s16?=
 =?us-ascii?Q?oxoR8+/0siuU2q84qyxBBQqtjUoWpkA1s71nuiyC32HBDoowbgE6jGU/ZSW7?=
 =?us-ascii?Q?hE4Xg4TWK5SXYTo49332V1YKg1wrMWQqxCwgprxvPPUAAb2mvaYfSJ6T/FuL?=
 =?us-ascii?Q?Nxmgo8XE7rLBMpVaxUxTWKslREOYazPw9+ouVcMbPxScKJ3SwAcUNnGwRzFv?=
 =?us-ascii?Q?qZOD2L0KrFxX+oXDo0EMB8HsCQpZBbbA4gAzK4U4ZEh3EI33uTrEIX5e1W9b?=
 =?us-ascii?Q?Ev29vMt1CtdxfapLLte+JKg1z1NkpfsZJ1WM6oxVOgoX32j45EdYVAD2vxzx?=
 =?us-ascii?Q?HLr7/AehQoc8ZirT25VcnwvKlv/DGNrihvnRkX/GHTHfsdkHzC90ZaR+XIOt?=
 =?us-ascii?Q?OB9nwF8i/wAPgSJdfIG12YyLdJOdbM3cGD56IkXuu5SuPaMhMwnz/024TcTY?=
 =?us-ascii?Q?cqFTlO8L4ZodKy6JAvzxoRRVhRaljq639PYiXkUbDbLEOHDGnUv8vpLDlZZU?=
 =?us-ascii?Q?OOnxe0g+ztl1gbfzFpXNGmV2zPbf2WSLnWrNwY/m0lI5JIljuDI6QXZmzXOj?=
 =?us-ascii?Q?9ieJMAcjItXgiVorgmX7mJdjhtk7ZBa6pLFmxTzn8TbEzqFQvso2C11HS+v0?=
 =?us-ascii?Q?p5Z2juc4/GiAIPSdWqDp7SKQDg6EHi051wknnoshD5NsSFqYhdAFW1KpUibp?=
 =?us-ascii?Q?vIMetMhlXcKvoTwwvz3gT2PnpaaJk5RTcHEniazcIg0yP+C2767O?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28be3ef9-176d-4e1b-0ca8-08dea1f28d96
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 11:13:46.4165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +qimhmTKg0REbgsy1/i8bI/3OiDIeqmggVzGcATG4xm4aJytbgiLpUCV7HcZ/OWeW1wjXrgxsBNdgIpla+iQvMqkGWtA12hmObJmr/LNrwjboYuKpIMf7BfKivNJ+vWn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1156
X-Rspamd-Queue-Id: B1CD145DAC1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35477-lists,linux-gpio=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[starfivetech.com:mid,starfivetech.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Add pinctrl driver for StarFive JHB100 SoC System-1(sys1) pinctrl
controller.

Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              | 12 +++
 drivers/pinctrl/starfive/Makefile             |  1 +
 .../starfive/pinctrl-starfive-jhb100-sys1.c   | 80 +++++++++++++++++++
 3 files changed, 93 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys1.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index 8739ed1ca350..fb1d4991800b 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -82,3 +82,15 @@ config PINCTRL_STARFIVE_JHB100_SYS0H
           This also provides an interface to the GPIO pins not used by other
           peripherals supporting inputs, outputs, configuring pull-up/pull-down
           and interrupts on input changes.
+
+config PINCTRL_STARFIVE_JHB100_SYS1
+	tristate "StarFive JHB100 SoC System-1 pinctrl and GPIO driver"
+	depends on ARCH_STARFIVE  || COMPILE_TEST
+	depends on OF
+	select PINCTRL_STARFIVE_JHB100
+	default ARCH_STARFIVE
+	help
+	  Say yes here to support System-1 pin control on the StarFive JHB100 SoC.
+	  This also provides an interface to the GPIO pins not used by other
+	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
+	  and interrupts on input changes.
diff --git a/drivers/pinctrl/starfive/Makefile b/drivers/pinctrl/starfive/Makefile
index b26156a6d0eb..8d96cf80d377 100644
--- a/drivers/pinctrl/starfive/Makefile
+++ b/drivers/pinctrl/starfive/Makefile
@@ -9,3 +9,4 @@ obj-$(CONFIG_PINCTRL_STARFIVE_JH7110_AON)	+= pinctrl-starfive-jh7110-aon.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100)		+= pinctrl-starfive-jhb100.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0)	+= pinctrl-starfive-jhb100-sys0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0H)	+= pinctrl-starfive-jhb100-sys0h.o
+obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS1)	+= pinctrl-starfive-jhb100-sys1.o
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys1.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys1.c
new file mode 100644
index 000000000000..1b24691eaa8b
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys1.c
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC System-1 domain
+ *
+ * Copyright (C) 2024 StarFive Technology Co., Ltd.
+ * Author: Alex Soo <yuklin.soo@starfivetech.com>
+ *
+ */
+
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+
+#include "pinctrl-starfive-jhb100.h"
+
+static const struct jhb100_pin_layout_desc jhb100_sys1_pl_desc[] = {
+	{ .pin_start = 0, .pin_cnt = 7, .name = "gpio", .gpio_func_sel = 0 },
+	{ .pin_start = 7, .pin_cnt = 1, .name = "espi1_reset", .gpio_func_sel = 1 },
+	{ 0xff },
+};
+
+static struct config_reg_layout_desc jhb100_sys1_pinctrl_rl_desc[] = {
+	{
+		.pin_start			= 0,
+		.pin_cnt			= 8,
+		.drive_strength_2bit		= { .shift = 0, .width = 2 },
+		.input_enable			= { .shift = 2, .width = 1 },
+		.pull_down			= { .shift = 3, .width = 1 },
+		.pull_up			= { .shift = 4, .width = 1 },
+		.slew_rate			= { .shift = 5, .width = 1 },
+		.schmitt_trigger_select		= { .shift = 6, .width = 1 },
+		.reserved			= { .shift = 7, .width = 8 },
+		.debounce_width			= { .shift = 15, .width = 17 },
+	},
+	{ 0xff },
+};
+
+struct starfive_pinctrl_regs jhb100_sys1_pinctrl_regs = {
+	.config			= { .reg = 0x04, .width_per_pin = 1 },
+	.output			= { .reg = 0x24, .width_per_pin = 1 },
+	.output_en		= { .reg = 0x28, .width_per_pin = 1 },
+	.gpio_status		= { .reg = 0x2c, .width_per_pin = 1 },
+	.func_sel		= { .reg = 0x30, .width_per_pin = 2 },
+	.irq_en			= { .reg = 0x34, .width_per_pin = 1 },
+	.irq_status		= { .reg = 0x38, .width_per_pin = 1 },
+	.irq_clr		= { .reg = 0x3c, .width_per_pin = 1 },
+	.irq_trigger		= { .reg = 0x40, .width_per_pin = 1 },
+	.irq_level		= { .reg = 0x44, .width_per_pin = 1 },
+	.irq_both_edge		= { .reg = 0x48, .width_per_pin = 1 },
+	.irq_edge		= { .reg = 0x4c, .width_per_pin = 1 },
+};
+
+static const struct jhb100_pinctrl_domain_info jhb100_sys1_pinctrl_info = {
+	.name			= "jhb100-sys1",
+	.gc_base		= -1,
+	.pl_desc		= jhb100_sys1_pl_desc,
+	.crl_desc		= jhb100_sys1_pinctrl_rl_desc,
+	.regs			= &jhb100_sys1_pinctrl_regs,
+};
+
+static const struct of_device_id jhb100_sys1_pinctrl_of_match[] = {
+	{
+		.compatible = "starfive,jhb100-sys1-pinctrl",
+		.data = &jhb100_sys1_pinctrl_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jhb100_sys1_pinctrl_of_match);
+
+static struct platform_driver jhb100_sys1_pinctrl_driver = {
+	.probe = jhb100_pinctrl_probe,
+	.driver = {
+		.name = "starfive-jhb100-sys1-pinctrl",
+		.of_match_table = jhb100_sys1_pinctrl_of_match,
+	},
+};
+module_platform_driver(jhb100_sys1_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for StarFive JHB100 SoC System-1 domain");
+MODULE_AUTHOR("Alex Soo <yuklin.soo@starfivetech.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1


