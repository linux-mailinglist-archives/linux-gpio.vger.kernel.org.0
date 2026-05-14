Return-Path: <linux-gpio+bounces-36828-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHoiC3OxBWqeZwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36828-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 13:26:43 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECC8540FC8
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 13:26:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D01D230E3B96
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 11:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E2273C09FA;
	Thu, 14 May 2026 11:13:09 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2094.outbound.protection.partner.outlook.cn [139.219.146.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECD23C09E3;
	Thu, 14 May 2026 11:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778757189; cv=fail; b=tkRrJibWbAVj3+LGyenIuFF0Nn7WwOwo9Ae9eyeXV1BbgJ2IQ0PJRxsFAQu7TVkZ2AyUzVjlxX7ejZLkOXOtlUIC/eYxMx16tps52MKqECNR0yVmkpIl9ylQbUy0sBOd/lwedCCTVdyT24Z92mlSZK2AuOjndaWl0DfS3q0UtqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778757189; c=relaxed/simple;
	bh=VhMjsyauWsWta9QHsGBm9/U40FDRow5CvXV2Fo3MenQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JQ3pERKvJS2NNxBe77+Natonmq7WJJ3hnKANuckZGNYTV8V7OpP4+1fRLLE2kYlgpRZcbEE71cMsm9gAIT+dw4nIeFtB7ZmB2Cl9HweDfuF7CTHBg5Tb1c9gkKHJP3sgePnZrY54t6xUXzVrBOjolGBCUBAyr+KOYuZ7cMqgt5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gVRulTr9ml8XfJEcx63A4mTgfC8Wc8TN+lugV4Br/7CdHlp64ekrjgtQnYj+Z2P/M8zyPjkgUsDr5OAJYQ8+S599loX1/qHAxxCDCrUwbRHnJMJ/qaLp2V5s2fEjiW7Hav1p5lLDFLMFyEjpC6v+mHjhUI2SDyUbts1RAWOkk6Vz5vicOpjVCJy/25yMbDh0PvAsDxiothP+dmI/izJQB4/SpsWhd7DR4GEipqpPP6K9t1Xeu2ngfRZzx3+we16TKXs4+/2Qgyq/aaCj2cc7NPosixC4hxIR9LbnMG2OkA13ohG0hvHUJcI24LHOBtB8/BhjVYTxbPXr0L7BpSF8Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+y664snwcNOdRJMs9N6HdldGQYkJVBWduxyJc3itTuM=;
 b=RqBMv+iksHcujpN2YIBn9jdkUFGYI+EjdEQkE3b1j7y31YrWzGaRNF6ed0c6Ax43u65rASsCb6LJilCqIeg0We059MfIrLw2KrGFWIReBS8YjL20lIoVzWvo9U9wDYBfNGFgLCpTR8qRXllI18JwO1j8g2tEny98M0XvOnZopLBQQ6aDtTFaz6YflqCj54bMJoVURsJGU8SR0AjPjsMbIwmC8bLVkZ7vlT8J8dNpu4WShBqOQ1Vqr9eMU498bmOTMycI/fFegCgljcCeV3pKtsZPcH1nERKn9CeWBwtXSXpS8DjJeIV/eHNuT3oKDd7KY7Yv2Wf6OECRVoO1LVGcvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1139.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.25; Thu, 14 May
 2026 11:12:53 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9913.009; Thu, 14 May 2026 11:12:53 +0000
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
Subject: [PATCH v2 19/22] pinctrl: starfive: Add StarFive JHB100 per2pok controller driver
Date: Thu, 14 May 2026 04:12:15 -0700
Message-Id: <20260514111218.94519-20-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: be14a0b7-5046-4cb8-adbb-08deb1a9be7e
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|921020|38350700014|3023799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	s8GejrVabmgJtLbSlUshlrakeyl+MrIgxbmjCb2Wy3gD80+6+RlhZOKsRbFBp9csqZYCQ7bGS1OkvDIz4BGud7AfI3zI3ezpaPku9Jbbns2puYNjR6XvU9t89N7tG8KQcAMob9S0U7zxHTL0+4MxVu1srR1dBrDsQF2xW7R4qZGxzRQnEpZ7xbUZL9Wp69T100M+hbg4W9OdVdROKizpeqnSbo0m/E4d6koa3HhSn2oJKFKqgq6Bf871KtxSYnQkGPBtspnM01xw8dkztqEhEs0QyeQXzTQqouWl0tCxILiDQhuybQqRtSBZGIODQ+xhRjE83TQklZlWy/8McK765ifPYK1B8L26AfrRVf59u9FeJa3nuVPhQ4A960zcImapNXMMb4NRc0jnuuDp65K8Hn9bmEiKpS4tH52zr2ueonwwmxsm1slI4C8NmNdlDho81VAOZD4uilMfFJMZC7AaWEsbMBX6ZguC6/hIZYzTyLAFLNwQsX4Xisy69TxM6kqqK8wXyf2PAr+EMiq0FVClQ0emSw4o/oLtitJeOa0pocOX3cVHfBumaQOi7hW/Npp09aNMPKKtM+4PhZXE62kVPA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(921020)(38350700014)(3023799003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o0Au2PBjzpWug/Az+KQOhwlWWLzuyyYu7ogIGqsLRdJJKsfi4thXS5o47u/l?=
 =?us-ascii?Q?XPJgk9JjsfB+ScRbgHXt3Q5mLI6d6Fl8FJGOBt3muSVupMrO1cOs6emW034d?=
 =?us-ascii?Q?Uq7hM7n3mnrQ8WRp5utHGRCx6tQRLBLgoIXvevMmPSrY34rMDV9IvvT+Fz4c?=
 =?us-ascii?Q?de0t8bRe46To2jFV8hU/fcTZt6BgKeh2Et1jgkWhmsPpF1TAMrju0VAssfqZ?=
 =?us-ascii?Q?LmPOfNs6Fby4QQS5uULZXcBOc8M/jHtDD9EyHFjGG3hhS6ajOLyTuZf7aCqi?=
 =?us-ascii?Q?FxRYpvRXRFUsIpCmXnpaqgPf3mLlGmQ0OmOgrpN4sQedOkQFbH8G5qxmYdcY?=
 =?us-ascii?Q?HyjVpAkofmYfoT/8jDm4DG6CGaU1lgYTqRYd+WdzZClzcog4fMTR34NGkB97?=
 =?us-ascii?Q?P0ok9T8HffkMeRY0wfktdJLkBbF64vbm4WtvaA3GjdEgFLOKzV1/Cyq/3Gr+?=
 =?us-ascii?Q?PZfCVJFcZQvk28gXRH/ocDX41ZDzIGzoy91Ow9VQxQb4WNblpZxkAUGzmBKG?=
 =?us-ascii?Q?odmYYFeBrMG3XPUcuYDwgN3tsvKAVXSt5ih5mXdBsE9G6nZw68OgK1XjinOq?=
 =?us-ascii?Q?9ubgTqg2TBlD9JUNRDTDzW2j8fW/MyFL/+6GkYFXnAF3XgLe1BhB7x0nSpDX?=
 =?us-ascii?Q?3a4j7xURW77/WQpEV/EQEppFYm17sxq/ha7tKkS1OwU7CPmaPThocyXvH31l?=
 =?us-ascii?Q?YI6x2oUooeg5KVBXF3KDDU2gsl4oTVxfTsOainQ9b2eHdyYmJSeRBxgd0XTN?=
 =?us-ascii?Q?pjkfsKTE8ZRMZhx0Fm+KfANk8Q6bHQf5331WM2bzft4iovEJOwzF1LaKTsug?=
 =?us-ascii?Q?xP4i7ejU8elAkuIudQwtBtfPKdHMRj8J4W6UeUIywkzV4WxfnW1sZ73A8VU7?=
 =?us-ascii?Q?7D6zWRG055Ae04v28+ksMh3yRKqKTYz69u783CaC/lms4obMdnLVudQfKDL4?=
 =?us-ascii?Q?p0rAqYzBUAShNyN8aXoRZKfVOvoHRz+TQzyKzJjfiOiy4pZcNkYr51te0pHq?=
 =?us-ascii?Q?jFS90djGZoSAVFxr0DB3+ztlkqbhVHnyqo/9443HyjEdRWOufizqYoh6w8r9?=
 =?us-ascii?Q?bFxOuLGcgrdm1Ad4swLyfQpaHCH0sij90S0UMW+ltzEGIGoiaKt3JMKuAAdY?=
 =?us-ascii?Q?k2Ai82G0KqAsn63d2f5LvRJJcYvwxY4VyMHNyaFgQUWU06gvXLUJMNC3y/zy?=
 =?us-ascii?Q?z1Zi8N5DLdc3y9juT6PvoMDnFjjQy17NDqsh6yvAyHcs95JppViK/4KEe5KO?=
 =?us-ascii?Q?OfFmzTIUN21OUgkFRyo3gUrXDVgR8WqF6TRnXEJtFmwv1P0VUfcGdLZev8dR?=
 =?us-ascii?Q?Ly7X6P11F2vODWqpQPEdM1m/y+W+sCRXivaadvyLqh1fj6vvP5R4C0ez1Mc/?=
 =?us-ascii?Q?wQXcPX+HnM10J+mK+CG3XfG4UctXadIFwQAzfAVmkjtqo1qGkk0Z6Vx6ZhQc?=
 =?us-ascii?Q?8i1Gx2vSIKwNR69H5ohFeaSdMsl+6TBshnQgigYlsWP73FU6ylwltlr4MVLX?=
 =?us-ascii?Q?4X/KmWeNG57PNQjfECrcjWNQqWYP/b47PkIcaARH7dJcRewdFpLja96dHIXi?=
 =?us-ascii?Q?XA1yD07OvyTetWom+qwzJ3YAtb0xANKPhFTq+YOujyIvgs/AZUEo8v6iz4vI?=
 =?us-ascii?Q?9ty82BIt1Ht7hPzp4PCZgd7SfDHEDVNRPpF3l44er97UVGvjkyKz84/hK1SZ?=
 =?us-ascii?Q?/mPVUFD3uN3+MLfzMUFrIrrSBA2kwal8SP+/OM/cIhM3QsHJO0Jpfo2gIubz?=
 =?us-ascii?Q?s6e5H2qB+3KmcGSsFLLEOSFf47rpxepR62WeAUecf1/CXS5Yyr5Q?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be14a0b7-5046-4cb8-adbb-08deb1a9be7e
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 11:12:53.7919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gCN5rqDPY3emxhh34yUQ3Z2qNwVV3EjoYRRmm0+dbToqVgZJpl3VmEz/YnkOj7Zz/7q7TMmYJHolEbMruqZ7POR2NAmeOdrtPHkF/ewcYjOrduMdRkYM2H9p9ZU9ZzCJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1139
X-Rspamd-Queue-Id: 8ECC8540FC8
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
	TAGGED_FROM(0.00)[bounces-36828-lists,linux-gpio=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.896];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,starfivetech.com:email,starfivetech.com:mid]
X-Rspamd-Action: no action

Add pinctrl driver for StarFive JHB100 SoC Peripheral-2 Power OK
(per2pok) pinctrl controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              | 12 +++
 drivers/pinctrl/starfive/Makefile             |  1 +
 .../pinctrl-starfive-jhb100-per2pok.c         | 97 +++++++++++++++++++
 3 files changed, 110 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2pok.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index edc3b6d9c8d7..bf5915e0a5f2 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -91,6 +91,18 @@ config PINCTRL_STARFIVE_JHB100_PER2
 	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
 	  and interrupts on input changes.
 
+config PINCTRL_STARFIVE_JHB100_PER2POK
+	tristate "StarFive JHB100 SoC Peripheral-2 Power OK pinctrl and GPIO driver"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	depends on OF
+	select PINCTRL_STARFIVE_JHB100
+	default ARCH_STARFIVE
+	help
+	  Say yes here to support Peripheral-2 Power OK pin control on the StarFive JHB100 SoC.
+	  This also provides an interface to the GPIO pins not used by other
+	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
+	  and interrupts on input changes.
+
 config PINCTRL_STARFIVE_JHB100_SYS0
 	tristate "StarFive JHB100 SoC System-0 pinctrl and GPIO driver"
 	depends on ARCH_STARFIVE || COMPILE_TEST
diff --git a/drivers/pinctrl/starfive/Makefile b/drivers/pinctrl/starfive/Makefile
index 33213bd1919f..213002da9cdd 100644
--- a/drivers/pinctrl/starfive/Makefile
+++ b/drivers/pinctrl/starfive/Makefile
@@ -10,6 +10,7 @@ obj-$(CONFIG_PINCTRL_STARFIVE_JHB100)		+= pinctrl-starfive-jhb100.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER0)	+= pinctrl-starfive-jhb100-per0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER1)	+= pinctrl-starfive-jhb100-per1.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER2)	+= pinctrl-starfive-jhb100-per2.o
+obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER2POK)	+= pinctrl-starfive-jhb100-per2pok.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0)	+= pinctrl-starfive-jhb100-sys0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0H)	+= pinctrl-starfive-jhb100-sys0h.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS1)	+= pinctrl-starfive-jhb100-sys1.o
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2pok.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2pok.c
new file mode 100644
index 000000000000..abeeee2e7a00
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2pok.c
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC Peripheral-2 Power OK domain
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
+static const struct jhb100_pin_layout_desc jhb100_per2pok_pl_desc[] = {
+	{ .pin_start = 0, .pin_cnt = 10, .name = "gpio", .gpio_func_sel = 0 },
+	{ .pin_start = 10, .pin_cnt = 8, .name = "pwm_channel", .gpio_func_sel = 1 },
+	{ 0xff },
+};
+
+static struct config_reg_layout_desc jhb100_per2pok_pinctrl_rl_desc[] = {
+	{
+		.pin_start			= 0,
+		.pin_cnt			= 18,
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
+struct starfive_pinctrl_regs jhb100_per2pok_pinctrl_regs = {
+	.func_sel		= { .reg = 0x58, .width_per_pin = 2 },
+	.config			= 0x04,
+	.output			= 0x4c,
+	.output_en		= 0x50,
+	.gpio_status		= 0x54,
+	.irq_en			= 0x60,
+	.irq_status		= 0x64,
+	.irq_clr		= 0x68,
+	.irq_trigger		= 0x6c,
+	.irq_level		= 0x70,
+	.irq_both_edge		= 0x74,
+	.irq_edge		= 0x78,
+};
+
+static const struct jhb100_pinctrl_func_maps jhb100_func_maps_per2pok[] = {
+	{ .func = "can",		.val = 1 },
+	{ .func = "gpio",		.val = 0,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_PER2POK_GPIO_D40) },
+	{ .func = "gpio",		.val = 1,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_PER2POK_GPIO_D48) },
+	{ .func = "host0_port80",	.val = 2 },
+	{ .func = "host1_port80",	.val = 3 },
+	{ .func = "passthru",		.val = 2,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_PER2POK_GPIO_D36) },
+	{ .func = "passthru",		.val = 1,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_PER2POK_GPIO_D40) },
+	{ .func = "pwm",		.val = 0 },
+};
+
+static const struct jhb100_pinctrl_domain_info jhb100_per2pok_pinctrl_info = {
+	.name			= "jhb100-per2pok",
+	.pl_desc		= jhb100_per2pok_pl_desc,
+	.crl_desc		= jhb100_per2pok_pinctrl_rl_desc,
+	.regs			= &jhb100_per2pok_pinctrl_regs,
+	.fmaps			= jhb100_func_maps_per2pok,
+	.num_maps		= ARRAY_SIZE(jhb100_func_maps_per2pok),
+};
+
+static const struct of_device_id jhb100_per2pok_pinctrl_of_match[] = {
+	{
+		.compatible = "starfive,jhb100-per2pok-pinctrl",
+		.data = &jhb100_per2pok_pinctrl_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jhb100_per2pok_pinctrl_of_match);
+
+static struct platform_driver jhb100_per2pok_pinctrl_driver = {
+	.probe = jhb100_pinctrl_probe,
+	.driver = {
+		.name = "starfive-jhb100-per2pok-pinctrl",
+		.of_match_table = jhb100_per2pok_pinctrl_of_match,
+	},
+};
+module_platform_driver(jhb100_per2pok_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for StarFive JHB100 SoC Peripheral-2 Power OK domain");
+MODULE_AUTHOR("Alex Soo <yuklin.soo@starfivetech.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1


