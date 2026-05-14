Return-Path: <linux-gpio+bounces-36831-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id K5LDKM6yBWrsZwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36831-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 13:32:30 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 560E85410D4
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 13:32:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CF93230158B5
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 11:27:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 219553BFE5D;
	Thu, 14 May 2026 11:27:20 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2122.outbound.protection.partner.outlook.cn [139.219.17.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD21E3AE197;
	Thu, 14 May 2026 11:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778758039; cv=fail; b=QR3LvwCxFUw5//RZ++ny+cPmcpf3q165Df11QAF3SeChkxJrLXE0IPD1GNqKT+ZG5ifAQ3Gqcx/+SOltENyjsNs9hDtBOuF+QT3FKtwslXAIEceP89DBkzTIr+MRuRh7GrNpSs/EIJwq93uJE/neUk+nURDfHFSjj35TTEBEg1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778758039; c=relaxed/simple;
	bh=0ZLoT1J7e+kJmAAkCdjgvMAjgZ7R8GJr+ekUOOZfllI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GuGa4IZgcSdd6mTcHmhCnNe2B4alKCojdBu/xM3u3VqKsF33hkThNaHOHWjM1VYq3HpOYVlF7dgswOUc+9G7qvd6QE0fzHhdzLXy47saX5Ip5dZMdd6QdbiZxlgLcU8W7lwUEgXTiqOTiDltKxeHufTCgzzgFfMnwmw5sdcHhwo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ncrOQulEkwI7OQFSq0CCumvp7Wh7zfz8XvBKHKNpRQoLWKGaYkUYRQINjIzq+8d5UCdbBIlRLoLCGwAuLb89FcNNQr4ije15MzSKqFjEB0QXKzX1nOJ9TfkVeMr/oMsQf4o/ZWlsMWItVkbDg1/L/KpfilZwRwpfiOxf94D8OArl4UsEHI6u52r8qNOZEzC9s5ZJOtggnN0mlEv8ILg9XnypoqG/zi4R1GUp1KKhHJH4kWHutVj41jRaDOV3k5a9rnu9IiQXXxvz3RGt5v1rI6diekh9/2NPQs96l/mbRY8FbmfJXLSYgFKaza/xuN55bTyz/wbZLtyYmgJI3FT9wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A4djdK8sd4BSo6unuq6a4V8+N/ZeB5VIFE/MpVC80Ts=;
 b=flBO5BnkVtj4x9WfIXFEwfs1WqP6tiJPfmMnerjXCeYTVB3/v/iNedK8MDIQgwMCHIdfZq0RwZNSCJIA5HPpB6RBMfOY8u50GHxWpsJnAZ/kEISuEz6aIhAyfldzOXzx1QRtr/XkSxnT97HnTAu7V7TmeNNEDz/bdv0xzT29XZsMdwkBvKLwPTo1vFIElFWkxzNKJmWwybmyg/oHWVnu1yrYtEnP+/3rg9X6zzzLqPXp7RhRG+lrSpQ+zOGAWrvoto1FgU3B91QrptIie5kMSlpz07cIhB2NlF07+BNHgVPO8th4lOeTg06M4PWbdV2eLWNKLRRcAcMUcwquZPvJrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1267.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Thu, 14 May
 2026 11:12:55 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9913.009; Thu, 14 May 2026 11:12:55 +0000
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
Subject: [PATCH v2 21/22] pinctrl: starfive: Add StarFive JHB100 per3 controller driver
Date: Thu, 14 May 2026 04:12:17 -0700
Message-Id: <20260514111218.94519-22-changhuang.liang@starfivetech.com>
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
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1267:EE_
X-MS-Office365-Filtering-Correlation-Id: f00795e6-4868-40c0-aa8d-08deb1a9bfc5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014|921020|18002099003|22082099003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	HXf4uJ06Tot6aekF6aKnau7qbecT4bNMfV39PTQUcgrUgLIdkQb82IxZT4xHI3HKXgHVz6KnrvE0uslgdOdAU6Xd/dzV2Tfjif2fyIAX/NN9tPTQ3+oZqjxy+KtZCnl75E0V/NdASDJHzW3TuNkstuwSLHvptxZVrSydLjIZT248rbtBu2rzTS9b/fTkxg5H7f2oC0b2LdBi3nr/iSlL1PM5YDX590FG0qkT6o0YQb41+AOaR4gNboIjzradSI16/0uhBI1Ad8BdkA0c0bWG5YOqorZ8KXH3Y1ZppjU2OxO/YWXz3fisBc1ei+jy4pVXMDrs5g6jkNqcpT0bBT3IWcxjasBGplmN4aR+ehcSjcmgVCAvypU7ko6gzWRn9kjCnD/IRYZOSYGYb8OdSJQDJMH0RQn0T83gllWsEO1NGf/TPJboNd/3vnd2IfWnxJuebvgcnR1xSBFqr0s0pxFHOry03YSblrHPRftLK+AgriiWyAer1E96u6B2WWy891EH4l0EmUpPAATMRVoCwTNMVaVi6R7G/20vdu+7jFHF0w4giSINrBwWGKnQYbQhW0spM7nx3xj4nk7NNnloZJaSXg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014)(921020)(18002099003)(22082099003)(56012099003)(3023799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pnk7QYjWIT5baVkFxsl8I65gJJRqL6UQxBI02/3vq03uTcqf0sHeNBWJjVxZ?=
 =?us-ascii?Q?9n9KdtA6jj5taEL8Sz20L12ZucoLkK4gni6OnRUrsBBvegXk+g+PlskOy3iH?=
 =?us-ascii?Q?1rZMZS+eI9xeowRVaYXFSy6ayZELMEmizTyRm/YTrm+HYkLbGNzUeK4ZIG+v?=
 =?us-ascii?Q?+be8hm4SmYbAlaNoBUTvVhTSuLETGuonPDPLLkLc7BfCLHWyfMNE6UaAu2zE?=
 =?us-ascii?Q?GCw7ha/muYraHeB8wu/rzJXy0EZdC+5KQ70o1CusD6V5VW6HS/bFq/1RLsBH?=
 =?us-ascii?Q?MCD7ECxQEp34Zl7k3kJ0iBKhAhm0RTQ8sJJJd35ONYI8/J/22iQdIdI7RzFI?=
 =?us-ascii?Q?EJ+nIX++Bx23kh9VAGqUPjJtX8vns6bvTyUlz77g3zu8111E2kBfAD9+o8mv?=
 =?us-ascii?Q?G5te35gja/vxrfBobrv4QYhAE3UsUEo6orWFUbRMvL98jt91FZo05eB8qoQp?=
 =?us-ascii?Q?KMzh/xJGcHXgMpdTDnv61iP663Jsgt/36EM9VFR/QQZFaHKyT/coyqIy6k58?=
 =?us-ascii?Q?slczJGrpdVvnOT6vhwIbHOaD3/mv+taWzc/rAp71yuQAHERc/RB/MZAWFw//?=
 =?us-ascii?Q?mZ2khh0czN7ORJw5Bwdm2Z1M78K7bEBoCs6okp9SM6ypokwi8kPNcnJMo3is?=
 =?us-ascii?Q?Sqobf+Qjb1Rz8+ygH78kRuZHc8oJyjwcolLBjQksDkeggr/Dy/P7ZrjLOYbl?=
 =?us-ascii?Q?DMtSN4BZBXPMSdn/2cdSG9MKVR4lTyTeqXE9ciufN0MyI2K3WJzQfMyu9DAt?=
 =?us-ascii?Q?TS0YCc9k7TssPCX0U/52W9cIe7VIG4+XBvoZieA1X60zlGGuLsl6Sl3jyBzA?=
 =?us-ascii?Q?R4GoPRKP8LAIHgHpsmkNX5CqoSHC/1Wu9c7NEjF443t+cGRTYqV9fmk6U2YY?=
 =?us-ascii?Q?GhwHIrKnRL5LE4zZGd+2QpHU+m2Yn0alopcYVGGtnAHpQ4rztAa74BdXOo51?=
 =?us-ascii?Q?EZLJQMmnxC0uXl8yZTRo9PejOX6UBmI7jiKcuKpms5NVoRPu2iyrGceIh8Hz?=
 =?us-ascii?Q?t05xZMMVbCtxYa/7IjEaTPxpVvUn2SYBGhoUbZZt7O+DsDWv5oTAvWFdBa++?=
 =?us-ascii?Q?xUiR5kv1iWrtYVsGL2hb4AdfIDNQyx5LKUgfwaUn53mlTWJaZ8vGcqJ5869p?=
 =?us-ascii?Q?+EpGn59lBAqobbtXsV9RVsXxeoBl5TB6jkgpFQrRQ4kO03qFoM/n8Oweqnls?=
 =?us-ascii?Q?imUBhAf8RhVx/3lv6gCYW5qbnU87Sq2FXD7UDu/M2TG2ZoHtUplzRC3CFZcJ?=
 =?us-ascii?Q?gn4AV4oREMU7ZPZ4axqqPBF61xHAfjoEVYkQR5VUOR8Y7mn0qNSk72lcgzkQ?=
 =?us-ascii?Q?mJYzccG3TyiYgKUYz5M+NnTE2AY8f/dCebyVPiVy50kGApcNsjZ61GpKaLCn?=
 =?us-ascii?Q?OXPTNboHvzS+PmEuhBsYv3+3CEh/2xPnkM/7qr3aZLJABOejBU5sQWPFw7zy?=
 =?us-ascii?Q?ZmMs5ue+t74We1RWXdfHJG24nz0o3UXJ3q1OWkB/37yFUunT/oRdRFnDiW9M?=
 =?us-ascii?Q?h1XJVAwAC15v44nIT7roXDJHLbLxkrnj0AJiis+cySdYz8algNLYwTtJH1fK?=
 =?us-ascii?Q?Nn3O1372ZV7St8AR8U2TZYvAuF6jNtVXmDepWDGRWFrcHgOfdKiT4Uu5QVoF?=
 =?us-ascii?Q?punnuV03ReYuFz2W2H55UgGRofd8h1HZl6QvMV5NOP7Zrv+hy+kRmcAKRvFM?=
 =?us-ascii?Q?U60cZOR3yD/CO7JvQ4xhmlAitan4HqpEYy4fr5LNwZVsZgp6tZBOd7dveqDr?=
 =?us-ascii?Q?FeEnWrViqi5/0ACqMwI2/W+Uczep6JfW/Z7XWNFMFEP35krT+rKw?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f00795e6-4868-40c0-aa8d-08deb1a9bfc5
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 11:12:55.9255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1jMYovL5q2UW0AC+wbyOHnH3cSby+wkTJ05DF1MyAR8WQCxw+RUBm0vZ7Z7GlMhFs65QhSNIKYIjkqGr5lB2Y8zWO8rZ7njRmWnjmn9/qs1jLL92/jU8P0BH4KnPocst
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1267
X-Rspamd-Queue-Id: 560E85410D4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36831-lists,linux-gpio=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.903];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[starfivetech.com:email,starfivetech.com:mid]
X-Rspamd-Action: no action

Add pinctrl driver for StarFive JHB100 SoC Peripheral-3(per3) pinctrl
controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              |  12 ++
 drivers/pinctrl/starfive/Makefile             |   1 +
 .../starfive/pinctrl-starfive-jhb100-per3.c   | 121 ++++++++++++++++++
 3 files changed, 134 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per3.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index bf5915e0a5f2..da1dcdcc4140 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -103,6 +103,18 @@ config PINCTRL_STARFIVE_JHB100_PER2POK
 	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
 	  and interrupts on input changes.
 
+config PINCTRL_STARFIVE_JHB100_PER3
+	tristate "StarFive JHB100 SoC Peripheral-3 pinctrl and GPIO driver"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	depends on OF
+	select PINCTRL_STARFIVE_JHB100
+	default ARCH_STARFIVE
+	help
+	  Say yes here to support Peripheral-3 pin control on the StarFive JHB100 SoC.
+	  This also provides an interface to the GPIO pins not used by other
+	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
+	  and interrupts on input changes.
+
 config PINCTRL_STARFIVE_JHB100_SYS0
 	tristate "StarFive JHB100 SoC System-0 pinctrl and GPIO driver"
 	depends on ARCH_STARFIVE || COMPILE_TEST
diff --git a/drivers/pinctrl/starfive/Makefile b/drivers/pinctrl/starfive/Makefile
index 213002da9cdd..351fce524fec 100644
--- a/drivers/pinctrl/starfive/Makefile
+++ b/drivers/pinctrl/starfive/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER0)	+= pinctrl-starfive-jhb100-per0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER1)	+= pinctrl-starfive-jhb100-per1.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER2)	+= pinctrl-starfive-jhb100-per2.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER2POK)	+= pinctrl-starfive-jhb100-per2pok.o
+obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER3)	+= pinctrl-starfive-jhb100-per3.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0)	+= pinctrl-starfive-jhb100-sys0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0H)	+= pinctrl-starfive-jhb100-sys0h.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS1)	+= pinctrl-starfive-jhb100-sys1.o
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per3.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per3.c
new file mode 100644
index 000000000000..cacbed03a123
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per3.c
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC Peripheral-3 domain
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
+static const struct jhb100_pin_layout_desc jhb100_per3_pl_desc[] = {
+	{ .pin_start = 0, .pin_cnt = 11, .name = "gpio", .gpio_func_sel = 0 },
+	{ .pin_start = 11, .pin_cnt = 1, .name = "peci1_out", .gpio_func_sel = -1 },
+	{ .pin_start = 12, .pin_cnt = 1, .name = "peci2_out", .gpio_func_sel = -1 },
+	{ 0xff },
+};
+
+static struct config_reg_layout_desc jhb100_per3_pinctrl_rl_desc[] = {
+	{
+		.pin_start			= 0,
+		.pin_cnt			= 2,
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
+		.pin_start			= 2,
+		.pin_cnt			= 9,
+		.input_enable			= { .shift = 0, .width = 1 },
+		.slew_rate			= { .shift = 1, .width = 1 },
+		.vsel				= { .shift = 2, .width = 2 },
+		.reserved			= { .shift = 4, .width = 11 },
+		.debounce_width			= { .shift = 15, .width = 17 },
+	},
+	{ 0xff },
+};
+
+static const struct pinvref_desc pinvref_desc_per3[] = {
+	{
+		.name = "gpios",
+		.pin_grp = {
+			PADNUM_PER3_GPIO_E0,
+			PADNUM_PER3_GPIO_E1,
+			PADNUM_PER3_GPIO_E2,
+			PADNUM_PER3_GPIO_E3,
+			PADNUM_PER3_GPIO_E4,
+			PADNUM_PER3_GPIO_E5,
+			PADNUM_PER3_GPIO_E6,
+			PADNUM_PER3_GPIO_E7,
+			PADNUM_PER3_GPIO_E8,
+			PADNUM_PER3_GPIO_E9,
+			PADNUM_PER3_GPIO_E10
+		},
+		.num_pins = 11,
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
+	},
+	{ NULL },
+};
+
+struct starfive_pinctrl_regs jhb100_per3_pinctrl_regs = {
+	.vref			= { .reg = 0x00, .pv_desc = pinvref_desc_per3 },
+	.func_sel		= { .reg = 0x3c, .width_per_pin = 2 },
+	.config			= 0x04,
+	.output			= 0x30,
+	.output_en		= 0x34,
+	.gpio_status		= 0x38,
+	.irq_en			= 0x40,
+	.irq_status		= 0x44,
+	.irq_clr		= 0x48,
+	.irq_trigger		= 0x4c,
+	.irq_level		= 0x50,
+	.irq_both_edge		= 0x54,
+	.irq_edge		= 0x58,
+};
+
+static const struct jhb100_pinctrl_func_maps jhb100_func_maps_per3[] = {
+	{ .func = "gmac_mdio",		.val = 1 },
+	{ .func = "gmac_rmii",		.val = 1 },
+	{ .func = "gpio",		.val = 0 },
+};
+
+static const struct jhb100_pinctrl_domain_info jhb100_per3_pinctrl_info = {
+	.name			= "jhb100-per3",
+	.pl_desc		= jhb100_per3_pl_desc,
+	.crl_desc		= jhb100_per3_pinctrl_rl_desc,
+	.regs			= &jhb100_per3_pinctrl_regs,
+	.fmaps			= jhb100_func_maps_per3,
+	.num_maps		= ARRAY_SIZE(jhb100_func_maps_per3),
+};
+
+static const struct of_device_id jhb100_per3_pinctrl_of_match[] = {
+	{
+		.compatible = "starfive,jhb100-per3-pinctrl",
+		.data = &jhb100_per3_pinctrl_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jhb100_per3_pinctrl_of_match);
+
+static struct platform_driver jhb100_per3_pinctrl_driver = {
+	.probe = jhb100_pinctrl_probe,
+	.driver = {
+		.name = "starfive-jhb100-per3-pinctrl",
+		.of_match_table = jhb100_per3_pinctrl_of_match,
+	},
+};
+module_platform_driver(jhb100_per3_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for StarFive JHB100 SoC Peripheral-3 domain");
+MODULE_AUTHOR("Alex Soo <yuklin.soo@starfivetech.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1


