Return-Path: <linux-gpio+bounces-36825-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ld5LDnOxBWq0ZwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36825-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 13:26:43 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B753D540FCA
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 13:26:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC89230BD71C
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 11:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B1523C13FE;
	Thu, 14 May 2026 11:13:05 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2134.outbound.protection.partner.outlook.cn [139.219.146.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB083C09F1;
	Thu, 14 May 2026 11:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778757185; cv=fail; b=HTbhFt6nEubdtsnN9NYg3DKKdgpH4eAmGLhwo2JViItFKm6aADBhCT1Sw6PhtoW3SjFFSI55Uzy1yfGM4ZI0olXZ2KH4gtZo2T7/K8nlC1SaFoIgaW/lijUGnlYT8uNpb1hfdfSPmoNSUwrhGWzKOUcMhc+LGvyCJMBSreY4kow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778757185; c=relaxed/simple;
	bh=S7UDaeG3c+aIcvqyAWCTXVVzpxQV9HVysBwrUH6pI0k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qaj2S+5zZdtxEPlIyXzY1AyEGv5CofSX0JX+HFzKLAyL1W+woyeDcsYft+Oe4cu1vwjnrqch+tcxfoSJNdjE1rWhK4rzENv4ctDN3Qc0zPvuKKv4tZySiWd5uZwrPiGNkb7yeDcPJPpt5nqe8/GjEkJeWsUBXbiziHeKuPHQKCA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JJn4DXsyg0sQwhEF57jjYSFFQ3w+/HV2GEj9yf1gNt0br+qdrWj2/jPPMTjYu4YrOJ6ghsaKXPjaRCpoHuxJwZnmHiCchVfDkj1GmYfWHuZBcgPqWnWoaG/DX6v3SxNyP95pnYH0D59uC8eiXgsnCH6FNn/JuJ8078xUUAjTmBzrRB642W1qfLt4e5B3zfMJW66YBlMuwq/1ew+/LdQCYLtYQLXhr9JK157RacGis2VLH9+8Y3CKt3BTHNAO79tt8s6qolmdtBSMV1iLe/SyNhqTsvq+JuBVg0HacWiOCyly7jYDUvRWWXxDczjOEwA1+Mgir45/CDiWyVmFKb5qpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RlVmeUZKZDC0rCXbkPoaPhZMg3lS/RfNoNBkJaeFSls=;
 b=UaW7Xs1++41JUcKKTOZKG03CjRwIYQOa72yAFpc5jvkRAuPIgz0EXUu4kwt0U8JWgFaKGIQ5+xKYh03skrqte5PH+iTGCo7GBjl+EnulWGV+mrtXWQjT8XJbEoZvdacAE5y1KOya94Iahkm7fsmDmQsLbqBbY4nd438Rad295LTLEN3wAB6My1195F3I3e5itCTFNx9/icCrZsGMRMRskzcEJJ+wvgf0C/ToDvKqXj8J3ovuUplkHYiVwwWsbwr/ogXmtw5l8eisEpPtpelcLv+/yKuln8UG7FpHLFVfkm5/V6mDw/UNYQU5fNcjG7EiH+QQYqxcG/COhkZvicaOOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1139.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.25; Thu, 14 May
 2026 11:12:46 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9913.009; Thu, 14 May 2026 11:12:46 +0000
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
Subject: [PATCH v2 13/22] pinctrl: starfive: Add StarFive JHB100 per0 controller driver
Date: Thu, 14 May 2026 04:12:09 -0700
Message-Id: <20260514111218.94519-14-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260514111218.94519-1-changhuang.liang@starfivetech.com>
References: <20260514111218.94519-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0028.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:2::18) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1139:EE_
X-MS-Office365-Filtering-Correlation-Id: 35ee8ad4-beca-4495-16b3-08deb1a9ba61
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|921020|38350700014|3023799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Kbrba0mgznH3Oh8RjU0j1Z4v9sKU9ad6C95ZTEPGmnkFZgO0Jirik5hG/eeyFDfPAaf/B6K3FLJgq47tt3aMJM64fh6a9gWC7rAyC5JYDEnRi379Bc7XDpG5E0xo82D8cCA6aEMWqTnusjJlwU313enbg9SbXlX1WUV0j8FlrNGdNpFg/RyhiLffU69ClOqdevD8Ewgz17h+ZrJT+Zsf2+wnm7RMNbeMfD2c/jLYmDVpCfU68upItG+R1rfyM+Z6JY8goSfyBtsjZWasQ9MIYm3uhAQEEloe3s/A6veMNq0u7QtRWNFYDCshlEBGkocGIDtgxbAlIVFQX/0//wb9IbE1U/fnUU58tYfUT5T6upTUChBKIqhurr7bblbghjDTi5tBNQc69PNBdZWYiBAmBn+f0XBjBnoYQp13Ao8FPrmJADKOLQlWwRVgZFysF83+azuVvSMD+UTVNhXEZBl1xpIE+5Ot1iN6UbX+xrmxb8trvnMbmIJdV/vs2oOJ2IvjSK7F06HnjUiPgCvK1fOYgBQU5S0iKJdBmMFJh7QpN/0JQnhQrKsHXupSSyXJgk6Dk3aGdnkS4pYt0YzDtvk7fA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(921020)(38350700014)(3023799003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tvQ7RBhR/XEshMrwYCM4stfCfoGUMow0qJS02KzXj2xPPjJMB5aNalpYUtFH?=
 =?us-ascii?Q?hTq/J/tDzuE6jKwWT8/TB5TWmYL0meZlyVGAzbJ6YOn/7nwRijX87UVanGh8?=
 =?us-ascii?Q?zl1biJeWnhfFTzl68Zom6EVXi7oRkdWhDBOyo9tnutX2hnCa4xrMRZl+glT1?=
 =?us-ascii?Q?8YOvT2LT7ltej+PDFmgmrD3NdXyCXMwup8rQwlnGVZx4csvDW4RsRgDv2PQ6?=
 =?us-ascii?Q?9XWr9wS5JDsuNCmoI8C9LjwgFTM7SxCJ63NMhmYNZ5w3vYHFdbDgGOJKe+nk?=
 =?us-ascii?Q?qArc3TbAEXeVKp4bqHD9ciXi6L7UZEtoSGjg4lPx+/quVSsB/VikPERybCUK?=
 =?us-ascii?Q?5pDc3Tc7gNwCDcV/D9cioLw4/nKCBQnYz46Hc13UBT9ECXD2ufDjQCWBuCd8?=
 =?us-ascii?Q?wrla6JCHDgKIv/gmAwSZG7q17TY0gxzQqqLFh/qU1BK9iQgYUtNXYqTCsx0P?=
 =?us-ascii?Q?UdS5hkIFjBk0bGApS2xd6YCZNUKhbnWuzc5NuOzA/kYlmsJob3/+jt10waLB?=
 =?us-ascii?Q?XydzmQ72aLmHN1/FNCOTwhe5tL6/vlMi6HS1qLex/9lMX+ZDZu+p58bpNt1x?=
 =?us-ascii?Q?+IGlvXfFui3HHu6mGk1Cl6rEl3A6jAo8Yifx7k2dXe2bxBR4Bw3fKwMyKFL9?=
 =?us-ascii?Q?lOvcBelNRob5pBzP/hZmgg2KOMh3aS/gaUsOi6Jdx1RMgRc7gzOhMgg14Q2x?=
 =?us-ascii?Q?AEdClypWpwuJ0e/w9LfsdxI/0lqlFwK87g64LpELm/mu2rALR9MCZ47YrPt/?=
 =?us-ascii?Q?iD3zff1XrTSWMpyQpwTd7DG85aAILMbjOAkkbEklqDpJbnMxAC+845H+j1Qu?=
 =?us-ascii?Q?3q1B6bvTkMA5BTIBF7tGfXXvGV1Av6MMHLWDz5EKrfQ2DJbd5qD4nY3f31yV?=
 =?us-ascii?Q?mGwNBMnerwTAABnFhYLSidnph0UrNggY9calPWQ8f2d0PdW24Yzvf5ivRiPQ?=
 =?us-ascii?Q?pjGKOMKDIqqgiwmrLwtLZP7/QnFLzIe4fpkrvovddW0NpCGA0hu7Anf2Z1Zb?=
 =?us-ascii?Q?6wwXw7yc0/iOwUOSoQQy5TrpW0yF7XpY//ETZXf6BM0QesLdQYMrgBHgW28a?=
 =?us-ascii?Q?98VEooJwQNGQDT1ftIP2AxwUJciBTgDXiYRqGUWrrnSUJX1biSPQn0KN79Es?=
 =?us-ascii?Q?a8atE3+iAtI3J7HvpQs4rNsRXMV3fljAwUtjtr3gD3p1SiHfcsPwgh+3Dzkk?=
 =?us-ascii?Q?54Kx+XV+6Viae1Rn4PEq7xZbzCOMxRHl1V8VcxD/zwTp8Kkmh/TGGXWZyg2K?=
 =?us-ascii?Q?VtLyqkEFdpi/XcW6Q33JLQ29Gfni3tKeAy2pb8Oy9QzCC85SPCK1btsJs5lo?=
 =?us-ascii?Q?SDx9uIBSE+actFT+2VKJdITl6q4Nz6UMM+AKq/sVoyDYsG+PjGmX90SnkSI3?=
 =?us-ascii?Q?1rbK1SVa6NBOhQYuKNQicAzosD5neFcfP6Zq5sfYU5b5aAeNePDa4nfq3/IZ?=
 =?us-ascii?Q?m4ilIlQWBcMBwjmYFXMxHpvrFsfxma/4nO2dMP4U0YVDH9t/2quoT4Pg+dub?=
 =?us-ascii?Q?J2j84aRmydh7LeBCckpu3+g0JfOhknncs3CZTvmdt91kAm5fsfhYUPZdO/LK?=
 =?us-ascii?Q?4nvNGd36qgXH3LMcxuLH2/h8OHpLDoP8gNqU9U6vbv36yMyJ6b34voaARZ6p?=
 =?us-ascii?Q?vPmqEA0Poo6FcXp4rd2n4vZoxX347/7Z+VHhas8m0Lr0ic9c4Hdaek1ZhdAH?=
 =?us-ascii?Q?2OZ3ELp9Pp1PGOuaIJOwFpjkuA3XL0wm0UtX4aH33wmU+XPEsOotCRiuOHiF?=
 =?us-ascii?Q?dSkiCogcBT7eGtr4kbp5BrqW54P3xsMmc8O6GMvTLKrs7PZe0R1b?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35ee8ad4-beca-4495-16b3-08deb1a9ba61
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 11:12:46.8720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xu/ePF8pmKNfDpqEBi0a8XqUR6pMHz7GxqPTfWVLdWMYZ/2K8qx1pxlrzDSx0TcqYzo+o5aqCRPiMpZJazvcvZ9aVICPIRHZcuaoI9mIrZS2LJO3rRCLc2G5oXpxROId
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1139
X-Rspamd-Queue-Id: B753D540FCA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36825-lists,linux-gpio=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.907];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,starfivetech.com:email,starfivetech.com:mid]
X-Rspamd-Action: no action

Add pinctrl driver for StarFive JHB100 SoC Peripheral-0(per0) pinctrl
controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              |  12 ++
 drivers/pinctrl/starfive/Makefile             |   1 +
 .../starfive/pinctrl-starfive-jhb100-per0.c   | 154 ++++++++++++++++++
 3 files changed, 167 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per0.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index da11d486779a..1e1bfdf87c31 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -55,6 +55,18 @@ config PINCTRL_STARFIVE_JHB100
 	select GPIOLIB_IRQCHIP
 	select OF_GPIO
 
+config PINCTRL_STARFIVE_JHB100_PER0
+	tristate "StarFive JHB100 SoC Peripheral-0 pinctrl and GPIO driver"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	depends on OF
+	select PINCTRL_STARFIVE_JHB100
+	default ARCH_STARFIVE
+	help
+	  Say yes here to support Peripheral-0 pin control on the StarFive JHB100 SoC.
+	  This also provides an interface to the GPIO pins not used by other
+	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
+	  and interrupts on input changes.
+
 config PINCTRL_STARFIVE_JHB100_SYS0
 	tristate "StarFive JHB100 SoC System-0 pinctrl and GPIO driver"
 	depends on ARCH_STARFIVE || COMPILE_TEST
diff --git a/drivers/pinctrl/starfive/Makefile b/drivers/pinctrl/starfive/Makefile
index b817ad93b91d..f2bb0c35a2a0 100644
--- a/drivers/pinctrl/starfive/Makefile
+++ b/drivers/pinctrl/starfive/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_PINCTRL_STARFIVE_JH7110_SYS)	+= pinctrl-starfive-jh7110-sys.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JH7110_AON)	+= pinctrl-starfive-jh7110-aon.o
 
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100)		+= pinctrl-starfive-jhb100.o
+obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER0)	+= pinctrl-starfive-jhb100-per0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0)	+= pinctrl-starfive-jhb100-sys0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0H)	+= pinctrl-starfive-jhb100-sys0h.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS1)	+= pinctrl-starfive-jhb100-sys1.o
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per0.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per0.c
new file mode 100644
index 000000000000..3d8fe612b1bf
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per0.c
@@ -0,0 +1,154 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC Peripheral-0 domain
+ *
+ * Copyright (C) 2024 StarFive Technology Co., Ltd.
+ * Author: Alex Soo <yuklin.soo@starfivetech.com>
+ *
+ */
+
+#include <dt-bindings/pinctrl/starfive,jhb100-pinctrl.h>
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+
+#include "pinctrl-starfive-jhb100.h"
+
+static const struct jhb100_pin_layout_desc jhb100_per0_pl_desc[] = {
+	{ .pin_start = 0, .pin_cnt = 60, .name = "gpio", .gpio_func_sel = 0 },
+	{ 0xff },
+};
+
+static struct config_reg_layout_desc jhb100_per0_pinctrl_rl_desc[] = {
+	{
+		.pin_start			= 0,
+		.pin_cnt			= 60,
+		.input_enable			= { .shift = 0, .width = 1 },
+		.mode_select			= { .shift = 1, .width = 2 },
+		.pull_down			= { .shift = 3, .width = 1 },
+		.pull_up			= { .shift = 4, .width = 1 },
+		.open_drain_pull_up_sel		= { .shift = 5, .width = 2 },
+		.schmitt_trigger_select		= { .shift = 7, .width = 1 },
+		.reserved			= { .shift = 8, .width = 7 },
+		.debounce_width			= { .shift = 15, .width = 17 },
+	},
+	{ 0xff },
+};
+
+static const struct pinvref_desc pinvref_desc_per0[] = {
+	{
+		.name = "gpioe-i3c0",
+		.pin_grp = {
+			PADNUM_PER0_GPIO_B8,
+			PADNUM_PER0_GPIO_B9,
+			PADNUM_PER0_GPIO_B10,
+			PADNUM_PER0_GPIO_B11,
+			PADNUM_PER0_GPIO_B32,
+			PADNUM_PER0_GPIO_B33
+		},
+		.num_pins = 6,
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
+	},
+	{
+		.name = "gpioe-i3c1",
+		.pin_grp = {
+			PADNUM_PER0_GPIO_B12,
+			PADNUM_PER0_GPIO_B13,
+			PADNUM_PER0_GPIO_B14,
+			PADNUM_PER0_GPIO_B15,
+			PADNUM_PER0_GPIO_B34,
+			PADNUM_PER0_GPIO_B35
+		},
+		.num_pins = 6,
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
+	},
+	{
+		.name = "gpioe-i3c2",
+		.pin_grp = {
+			PADNUM_PER0_GPIO_B16,
+			PADNUM_PER0_GPIO_B17,
+			PADNUM_PER0_GPIO_B18,
+			PADNUM_PER0_GPIO_B19,
+			PADNUM_PER0_GPIO_B20,
+			PADNUM_PER0_GPIO_B21,
+			PADNUM_PER0_GPIO_B22,
+			PADNUM_PER0_GPIO_B23
+		},
+		.num_pins = 8,
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
+	},
+	{
+		.name = "gpioe-i3c4",
+		.pin_grp = {
+			PADNUM_PER0_GPIO_B36,
+			PADNUM_PER0_GPIO_B37,
+			PADNUM_PER0_GPIO_B38,
+			PADNUM_PER0_GPIO_B39,
+			PADNUM_PER0_GPIO_B40,
+			PADNUM_PER0_GPIO_B41,
+			PADNUM_PER0_GPIO_B42,
+			PADNUM_PER0_GPIO_B43
+		},
+		.num_pins = 8,
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
+	},
+	{ NULL },
+};
+
+struct starfive_pinctrl_regs jhb100_per0_pinctrl_regs = {
+	.vref			= { .reg = 0x004, .pv_desc = pinvref_desc_per0 },
+	.func_sel		= { .reg = 0x11c, .width_per_pin = 2 },
+	.config			= 0x014,
+	.output			= 0x104,
+	.output_en		= 0x10c,
+	.gpio_status		= 0x114,
+	.irq_en			= 0x12c,
+	.irq_status		= 0x134,
+	.irq_clr		= 0x13c,
+	.irq_trigger		= 0x144,
+	.irq_level		= 0x14c,
+	.irq_both_edge		= 0x154,
+	.irq_edge		= 0x15c,
+};
+
+static const struct jhb100_pinctrl_func_maps jhb100_func_maps_per0[] = {
+	{ .func = "gmac_mdio",		.val = 2 },
+	{ .func = "gpio",		.val = 0 },
+	{ .func = "i2c",		.val = 1 },
+	{ .func = "i3c",		.val = 2,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_PER0_GPIO_B23) },
+	{ .func = "i3c",		.val = 1,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_PER0_GPIO_B59) },
+	{ .func = "smbalert",		.val = 1 },
+	{ .func = "wdt",		.val = 2 },
+};
+
+static const struct jhb100_pinctrl_domain_info jhb100_per0_pinctrl_info = {
+	.name			= "jhb100-per0",
+	.pl_desc		= jhb100_per0_pl_desc,
+	.crl_desc		= jhb100_per0_pinctrl_rl_desc,
+	.regs			= &jhb100_per0_pinctrl_regs,
+	.fmaps			= jhb100_func_maps_per0,
+	.num_maps		= ARRAY_SIZE(jhb100_func_maps_per0),
+};
+
+static const struct of_device_id jhb100_per0_pinctrl_of_match[] = {
+	{
+		.compatible = "starfive,jhb100-per0-pinctrl",
+		.data = &jhb100_per0_pinctrl_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jhb100_per0_pinctrl_of_match);
+
+static struct platform_driver jhb100_per0_pinctrl_driver = {
+	.probe = jhb100_pinctrl_probe,
+	.driver = {
+		.name = "starfive-jhb100-per0-pinctrl",
+		.of_match_table = jhb100_per0_pinctrl_of_match,
+	},
+};
+module_platform_driver(jhb100_per0_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for StarFive JHB100 SoC Peripheral-0 domain");
+MODULE_AUTHOR("Alex Soo <yuklin.soo@starfivetech.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1


