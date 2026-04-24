Return-Path: <linux-gpio+bounces-35489-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJXMEJhY62nQLgAAu9opvQ
	(envelope-from <linux-gpio+bounces-35489-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 13:48:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E24CF45E01D
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 13:48:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E5E83013A8E
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 11:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FF773BED11;
	Fri, 24 Apr 2026 11:47:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2109.outbound.protection.partner.outlook.cn [139.219.146.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C142846F;
	Fri, 24 Apr 2026 11:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777031223; cv=fail; b=CEuC5lLgGwbJXtI6QlJjI3+rA4cRF7Cew3AUR/EsfydyxKzwcHlzl2M6M05tCLTL9u0puLqevBluwyZTBdPOlp4PtkPVxk3ZPZHMHkSR6UlwSTYVCj4dyj6uFrTRLJpRgqDnpt0b5I5nktYAc84YHqqXkagYPhuWMcgF4n+tY38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777031223; c=relaxed/simple;
	bh=vVw3N5j8H5r3X/hb0D6cfkTr+kn7wRC5heS7Ml9C79I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ggU1Ws0At/GL5/i+nVPoGZM/9+5iJK0HFydqEL1Z8bJMjl3mJaJGE8e+usMvM4Ik/sefDcpCR0e193QuF5H9jVpvMeDVY+t3x8/OAHxGfUk+38zMeXFMrRJzNTGqN7DHZ2qFt04KDDB7IvEjY727nC0nqxRrzkC+NxF8y07T4Ao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gac3U7BOvM43gyMJ7WKomt1XxRe3YdzGamDsUnkCkbmbmq+Y7BYAZ4eLLEN2IuW6pdpdR+MI6rMGvvh/HXPmhNeq0LMIhetIRTVpMzRrEd3YUse9ji66XpnzhpWM8CaLwa0fFrk9pO50Tg1dxN58vlm/e3AEXk14olcI/DDYWgq1aKWugbxqu+dluRtLzHNqLteMaWOW/3P3HHmwv5eKGLMCUyLyvlqXUjJcyCJ8z7nPlHwaJS89Lw7Q3dEcueNTWrUYoiVfvDoJ2BDcAGaEJLLBl2nMcJ0xiRaKzAid6Dl5drzOJfMzr4D6QDtmId8hENBZZuyTQk319kddAjMkeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IMfIzaQiXsUyAG2SwBV9Jws6VDm/DrLCUjJOv/1Z5jQ=;
 b=G+j7B4zTsiGPJZExLgjnU9gD/8VY2jorSjA3e2hnp/hFqbgUn5rG+AZCcUOw0MfW+gKSe7v2tan8/F2Cemp/UyKrR9fxdszcgYs1aVblWOXdf5NZXeFSrfzNAfyLJA/W37lEdorWhnVpcz9vJz8X5vGfahrv44sBk9dYrFfIwYeDMxaqAy0/cWOVX8P60z37943IrK6F/dH/RDJ8gQQRkhrdUqDVbvO+ZFGRRF0Gz+bb98tRwdepGvFFuPRyFjsedhHQwmNabZBB8X9aQObNSINZF52aEuiZH+6iMXxeGzMXhyzO1TCYbxnB9m2a3RNvprpu7fqUmxLMn7sGbQmLTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1156.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 11:13:49 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9846.021; Fri, 24 Apr 2026 11:13:49 +0000
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
Subject: [PATCH v1 08/20] pinctrl: starfive: Add StarFive JHB100 sys2 controller driver
Date: Fri, 24 Apr 2026 04:13:18 -0700
Message-Id: <20260424111330.702272-9-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 5ac7e5f8-a264-4afa-b6ac-08dea1f28f40
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	6MKMRmqaZnpbjc+Fa/PGh2gv4vCwRpUaVzqbs0Q8lgl5XXfw64uqzpe1A/oBmq461FGVzeuAX7IOQYV+0ZYKBPyYy/C+L1YKD+1Ik6O7DXOAyPpycNfI/M22HNYt6n0g5g0aJ0kp5BSNmXfeV0tNwtH9ClgV/l+0xs50/muLyeOFVWPFT4I8PctcwnuXY5G96hj911LCUVGrzydQ8C+W/jyoIgW7T8PEC1KPYNHOSHpi2RqqMwuc+a+MburQm6lpOcFH4YVrJavXVAtj+vKWHmjpXXfYE23F0CT1k56iz1hlHbECzZTappbdiBcRLICFPp5UUoPWnfS5cXcPE1LQ2yxOZhoEEUhRlMy/JU/Kj5LHwHZCSBrbVN4vNrqWTPEJnI1P1XPr5r/lRgHPrrzG1OJV9uR80LYGxjNJenzOtSS6nIUm1e7kT5p8zsEmAMKv/6BNnha12qQtqubgetBVT0Z4ACDtnzbs8nUkiBa1cy4DiGquQ4055j1d8T6OqIqLfbtkrxKDeCvFJFz1IDImUeq7SFGTngGMAwhtMSOQO/sLwWh8bpgCeBNwPePVflOtomDTrd9H8Ov2SvQG+neHduXC3gtavqJX6vMgpYtrG/0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5qfmiECERQBmGxxRYnydtHxMs9YCapGDQfiNMnBPe/4Vnaydtn56devs1PCY?=
 =?us-ascii?Q?5vrKsw+cqYMOJa7UxLuRFhaDF6FXEIt4UrvdowkHYrWs6QEbdKMMzt37S9x8?=
 =?us-ascii?Q?+2/Zr2nW4a4Q78+DhSfG8ygZAlyFHb3Az/zXHGji6CYjsL9pR4me+JlcAc8K?=
 =?us-ascii?Q?q2r3w5c1wzkDXt9yTsdrzgUTEsSqaI+0v4qRUgAvUAN/pShU7HE9dI3SEVm+?=
 =?us-ascii?Q?+ERJ85DCzxOzoVZmV+o+oaprMTBSiUG3pJf1gnEi1dfKUYGvW2pP6BaEdJVZ?=
 =?us-ascii?Q?Gjs4h6vVruAP+RhRpTw+5dyAQ0Taw9AL/YqLBNws2rmU7IVimaTiDrPe+heG?=
 =?us-ascii?Q?CmfJJYOXWAO9tFke22+mHSxqDlqdzahvTHLVoFbYGikLbI5ZlUXtuw09d0nK?=
 =?us-ascii?Q?/90Rc4fc9uDx99utV8sYQyQbsBjb70lu4GycDCsMFBNgit9Yzw5NAY/313tA?=
 =?us-ascii?Q?NPquUUsb34QjJb/kcf17Y0ZlirbQqVPNPtAp1M+HD9XoNAp7tnHLsI6dmmaJ?=
 =?us-ascii?Q?9YAGCn1rAmeGJIigdqUt/2hrNrOCL9I+CRP6RrQWg9g5WqVaSM62OP6bLXEs?=
 =?us-ascii?Q?WAIjRMVWaJlpp6wyMu6ITOpG4d70RAwDsbQ56HhKHoElqVi/KPe3IqNtec70?=
 =?us-ascii?Q?DWacMOqN2yxwjgOtJEuzaXMSnziPyNxxihfoz2qOUq7TL7GXMOD2IhehyU9j?=
 =?us-ascii?Q?P/PaOxVbMDefrg3QxtcANK/+QgX+ScOsDj5VNxwK6iCLZu5Oy/KxgzFQpzXi?=
 =?us-ascii?Q?1vHxdjtQqmFh5FBbnFkhSwfambbrl1vatyJgQ3tdh5W1PnXt0RXpG7EDjz0C?=
 =?us-ascii?Q?tLTV4uzOq7RNlsXNgfE0LVpAwwU9nV1bdT8ft6/1u8yrwWEBq6QQbd0Mlgmc?=
 =?us-ascii?Q?qe/6riHBRMUl6BTdFGfcQu8WteMmRiWlNfYLDUyrizHT0A4CfkvVK+vmyz8E?=
 =?us-ascii?Q?Uop5+WjFEGjk8SLFXRzysKfYM8uoOHsRhsEv11uEqfVG1+4075sO+SM6Z7X1?=
 =?us-ascii?Q?MpjdLNWIIjUxjlZex2NHQdNliC+89DIOvd0lK62R6GJlqmlWX4inXnenMqms?=
 =?us-ascii?Q?FSnCYycGsxeYz/BbsgLTwBiFV4CtPZA4KdVjHXoOP67lVH0jYtofJhcTOxdl?=
 =?us-ascii?Q?QnbxfvbZAD6wnMIjfHgSDb4+32IrRLZg5zjt95KlIseT5pEXY0H3LluQOIAq?=
 =?us-ascii?Q?IJ5XYNo3L47vsqCS6kOBX4GjK3diRAqigCo7rRVhxFp9vMmwHURAT9HdVV+c?=
 =?us-ascii?Q?KYdAvFkRdL9TnXKr3jG2CUXrbLkvq6udirDOc1wTrGRjITCdNO32IrjOWR4t?=
 =?us-ascii?Q?ChdlSzXH0JJ+Fc1USKFMDtMSZdBDhWQpUUmF7KkjwtjfZJkHOJ3cJ1CMfBiv?=
 =?us-ascii?Q?TaI1rZidqdWC0L+NTOVE5tGKYgCB0Rm/0A/WUBCg3fidzCcYCoYpLcbZOfKM?=
 =?us-ascii?Q?CEUEJNb5cVYj5qq5oQIVRAPy4fuDCtId1bBtKKlXJUmlVW2QSgT/RYhSrgt+?=
 =?us-ascii?Q?Kfeu9LuygoR57yM7BTNeALyyqlCfOueBGXadMN5GQ+dRoRjDqFFCEcxHXgqT?=
 =?us-ascii?Q?q6y/f2kYe4UqAoQ5txGmMUd4KFEuP1EXXfgIZNN7EY4Z0/iuPtcguPtB692Q?=
 =?us-ascii?Q?oWKmNctCk1UtPSeJNNdbZx7G2i5aQlG0ixc/bT6B7TkiC6vYcXFZ0NuCOyQ+?=
 =?us-ascii?Q?O0zcyeAapKi6Y0gpCxvkXbAN5nKv6/txgUo4+z3ZlscKbxLOAJa1MUnnp7mX?=
 =?us-ascii?Q?i4/dWRJgPlA7aqU6mE4+i3yJUJQOwdvQZFJGPoaoM6nktbm+8nXY?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ac7e5f8-a264-4afa-b6ac-08dea1f28f40
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 11:13:49.1830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fkduVAw2nCW0p7pXBp8CYKc4DxQxBaii0K4v7wffGzOsxuPXkAM4lUrqdIrcFEUFWSwn2yabzMYRnXIwUYRK71mmFggBUiN2qczry/clHlEtKW3Uoyf2Og454nq7bQZM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1156
X-Rspamd-Queue-Id: E24CF45E01D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	GREYLIST(0.00)[pass,meta];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35489-lists,linux-gpio=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[starfivetech.com:mid,starfivetech.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Add pinctrl driver for StarFive JHB100 SoC System-2(sys2) pinctrl
controller.

Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              |  12 ++
 drivers/pinctrl/starfive/Makefile             |   1 +
 .../starfive/pinctrl-starfive-jhb100-sys2.c   | 109 ++++++++++++++++++
 3 files changed, 122 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys2.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index fb1d4991800b..7d68cf6ebd90 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -94,3 +94,15 @@ config PINCTRL_STARFIVE_JHB100_SYS1
 	  This also provides an interface to the GPIO pins not used by other
 	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
 	  and interrupts on input changes.
+
+config PINCTRL_STARFIVE_JHB100_SYS2
+	tristate "StarFive JHB100 SoC System-2 pinctrl and GPIO driver"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	depends on OF
+	select PINCTRL_STARFIVE_JHB100
+	default ARCH_STARFIVE
+	help
+	  Say yes here to support System-2 pin control on the StarFive JHB100 SoC.
+	  This also provides an interface to the GPIO pins not used by other
+	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
+	  and interrupts on input changes.
diff --git a/drivers/pinctrl/starfive/Makefile b/drivers/pinctrl/starfive/Makefile
index 8d96cf80d377..b817ad93b91d 100644
--- a/drivers/pinctrl/starfive/Makefile
+++ b/drivers/pinctrl/starfive/Makefile
@@ -10,3 +10,4 @@ obj-$(CONFIG_PINCTRL_STARFIVE_JHB100)		+= pinctrl-starfive-jhb100.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0)	+= pinctrl-starfive-jhb100-sys0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0H)	+= pinctrl-starfive-jhb100-sys0h.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS1)	+= pinctrl-starfive-jhb100-sys1.o
+obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS2)	+= pinctrl-starfive-jhb100-sys2.o
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys2.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys2.c
new file mode 100644
index 000000000000..7b2c7c30e29f
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys2.c
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC System-2 domain
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
+static const struct jhb100_pin_layout_desc jhb100_sys2_pl_desc[] = {
+	{ .pin_start = 0, .pin_cnt = 37, .name = "gpio", .gpio_func_sel = 0 },
+	{ .pin_start = 37, .pin_cnt = 1, .name = "jtag_tck", .gpio_func_sel = -1 },
+	{ .pin_start = 38, .pin_cnt = 1, .name = "jtag_tresetn", .gpio_func_sel = -1 },
+	{ .pin_start = 39, .pin_cnt = 1, .name = "jtag_tmc", .gpio_func_sel = -1 },
+	{ .pin_start = 40, .pin_cnt = 1, .name = "jtag_tdi", .gpio_func_sel = -1 },
+	{ .pin_start = 41, .pin_cnt = 1, .name = "jtag_tdo", .gpio_func_sel = -1 },
+	{ .pin_start = 42, .pin_cnt = 1, .name = "jtag_hpd", .gpio_func_sel = -1 },
+	{ 0xff },
+};
+
+static struct config_reg_layout_desc jhb100_sys2_pinctrl_rl_desc[] = {
+	{
+		.pin_start			= 0,
+		.pin_cnt			= 37,
+		.drive_strength_2bit		= { .shift = 0, .width = 2 },
+		.input_enable			= { .shift = 2, .width = 1 },
+		.pull_down			= { .shift = 3, .width = 1 },
+		.pull_up			= { .shift = 4, .width = 1 },
+		.slew_rate			= { .shift = 5, .width = 1 },
+		.schmitt_trigger_select		= { .shift = 6, .width = 1 },
+		.reserved			= { .shift = 7, .width = 8 },
+		.debounce_width			= { .shift = 15, .width = 17 },
+	},
+	{
+		.pin_start			= 37,
+		.pin_cnt			= 5,
+		.drive_strength_2bit		= { .shift = 0, .width = 2 },
+		.input_enable			= { .shift = 2, .width = 1 },
+		.pull_down			= { .shift = 3, .width = 1 },
+		.pull_up			= { .shift = 4, .width = 1 },
+		.slew_rate			= { .shift = 5, .width = 1 },
+		.schmitt_trigger_select		= { .shift = 6, .width = 1 },
+		.reserved			= { .shift = 7, .width = 25 },
+	},
+	{ 0xff },
+};
+
+static const struct pinvref_desc pinvref_desc_sys2[] = {
+	{
+		.name = "gpiow",
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
+	},
+	{
+		.name = "gpiow-inner",
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
+	},
+	{ NULL },
+};
+
+struct starfive_pinctrl_regs jhb100_sys2_pinctrl_regs = {
+	.vref			= { .reg = 0x000, .pv_desc = pinvref_desc_sys2 },
+	.config			= { .reg = 0x010, .width_per_pin = 1 },
+	.output			= { .reg = 0x0bc, .width_per_pin = 1 },
+	.output_en		= { .reg = 0x0c4, .width_per_pin = 1 },
+	.gpio_status		= { .reg = 0x0cc, .width_per_pin = 1 },
+	.func_sel		= { .reg = 0x0d4, .width_per_pin = 2 },
+	.irq_en			= { .reg = 0x0e0, .width_per_pin = 1 },
+	.irq_status		= { .reg = 0x0e8, .width_per_pin = 1 },
+	.irq_clr		= { .reg = 0x0f0, .width_per_pin = 1 },
+	.irq_trigger		= { .reg = 0x0f8, .width_per_pin = 1 },
+	.irq_level		= { .reg = 0x100, .width_per_pin = 1 },
+	.irq_both_edge		= { .reg = 0x108, .width_per_pin = 1 },
+	.irq_edge		= { .reg = 0x110, .width_per_pin = 1 },
+};
+
+static const struct jhb100_pinctrl_domain_info jhb100_sys2_pinctrl_info = {
+	.name			= "jhb100-sys2",
+	.gc_base		= -1,
+	.pl_desc		= jhb100_sys2_pl_desc,
+	.crl_desc		= jhb100_sys2_pinctrl_rl_desc,
+	.regs			= &jhb100_sys2_pinctrl_regs,
+};
+
+static const struct of_device_id jhb100_sys2_pinctrl_of_match[] = {
+	{
+		.compatible = "starfive,jhb100-sys2-pinctrl",
+		.data = &jhb100_sys2_pinctrl_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jhb100_sys2_pinctrl_of_match);
+
+static struct platform_driver jhb100_sys2_pinctrl_driver = {
+	.probe = jhb100_pinctrl_probe,
+	.driver = {
+		.name = "starfive-jhb100-sys2-pinctrl",
+		.of_match_table = jhb100_sys2_pinctrl_of_match,
+	},
+};
+module_platform_driver(jhb100_sys2_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for StarFive JHB100 SoC System-2 domain");
+MODULE_AUTHOR("Alex Soo <yuklin.soo@starfivetech.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1


