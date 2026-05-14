Return-Path: <linux-gpio+bounces-36835-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNsRMmmyBWqeZwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36835-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 13:30:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7515F541073
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 13:30:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4FDB73090A09
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 11:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01B2E3C1412;
	Thu, 14 May 2026 11:28:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2125.outbound.protection.partner.outlook.cn [139.219.146.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36CE3BB69F;
	Thu, 14 May 2026 11:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778758091; cv=fail; b=HnuvQC3v8NME/kBDxLgxTVfslU3Dj391+ElTva0vU2y+uqGfWS1vSfi4Ef9iwqb0w930NrZqrcsaOavT5DxCTsLl9ngGVGyQXwFjxxBvB8iGaYBRaISHpNxOXBJcvqUW18sEHgSWIcUm3E5hHUBpMEdPUR99rGwi/OZbCJqz08w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778758091; c=relaxed/simple;
	bh=md29tVv4vRLLBQsnYuOXar90il4HPZ+i/NrWElOuQWc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=orci2x4s5fHigirsqRIomwLGl2XYOeGaffhpkToJ17UJ5ieECgl8R0N/NZHapCM2fY0w2XGoSHtjwOrIPwDZ0OsO7BNKjrJnpdpmLUE/zpjpwIkLRnQQYUX/abYD4FxNSWl/NtskhC1uHd9l4H0QZDXNNBaeMFvDz006RctQ4m4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ly5gRABBrLLl3Xgdg+730nwjMjRBZ1w53oQ++nGwqB/XEkFUb4LaGU0CyAnu7ZpesTKhV6uq0KJs7SG880SiV/O4HsP4BDry/TNahUpU3p4Ac2BrvT7TG9XBFlN6aMK0H3UKzCcpAB2JzEfC7WFNXNtaKqSellIWlC8EekzX1kEINvUoPgklmfo3J/uO9SwZNboufuJWGfCqMfBYs5TBNLAS524YYb2u6fKNr1ZOBrtXoOpsAIxeqyNQk47J3LmK0odF4e3uH5Z3ye00RFwQpRnrGMslqu3y6Tdyi7bPKYtaV7t+4urloH7dy8HGml8/JblxP/YMJJW7GI6ujBFUEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=29ZgbLHy/2gAn69JEEWbm0PmDO9AP9/w56jCKRRe/Wc=;
 b=cybm6aFNJ7FMe0yCDp8ylxw7Q45pwnaXr5I6nWYMh7h+kMXPybnKysBvtfQsvFqIBUPAgurQOc7H86MMJB0cm+hwhel2z4Z0lYn8h1SW/CDSgTlhBczwkZ3c2FHP6oxfY460psr3zM2AdWb/UhYwGXr5C2ijSvDyHswL1tf8Z7uYDrjpF5oLK+eYA4+vgqYuiwM/Za2eYtTnr5r7id+D4VGNjWbcXpF11WLtqTMV4DL+GCshalNEuQHgZ7yssuTR207Jhj80S1TAnUZvsFTjoB0uFhcDOKYTg+R0rpv5AKlVC4Tmgn1fzkl6k/JE+CSpzVxQUJares6piW6dcm0KJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1267.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Thu, 14 May
 2026 11:12:40 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9913.009; Thu, 14 May 2026 11:12:40 +0000
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
Subject: [PATCH v2 07/22] pinctrl: starfive: Add StarFive JHB100 sys0h controller driver
Date: Thu, 14 May 2026 04:12:03 -0700
Message-Id: <20260514111218.94519-8-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 982bd526-5e2a-46ec-77e4-08deb1a9b641
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014|921020|18002099003|22082099003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	BdHCO4IxX5SrGRxEGlM+7kX7sGZvlQsT6nhvA9hiqPsfLpNj87L+dGC/RbSIhr8hyd8FmuZ3jT6w6h8jVtGQfIo/ott+Yu2z/2oCV+UA5FxabAbijziyVpo0VRpoM3K7FYk7zC2Dct5OCaMh3SWVKtBzURN58+MlXQfEJGuWzvBDA/QeccM42veZIXJ6aulTi6J2W1GG/zkyogbmTgeO/bx1qvrLXHva6xKLq7fQj/Rk5rs6rkbQn0n0TsLOr4VcQPB4E9Ybs5q9ABN55ZLZHlf8OkqjYi8anIxxjHtZH4toaURuK1nNwkeJUiECF7aEzwTIUwUF2qcnAMZUQvE3ebMB2V5AHTbiIc1hcDbT3bo39c6PHQCmoFwtn9nhXaemoiZ4aPahhgD5ZOE9FQQG1Yt98D0dH2KWW3jyjilI9vsMbUZbh+Kk7QHotpSGbkesNexpgMDsKDFyqUEVRZz8NAxJBS7vdDePh1/GYKjq0ohIOCI0XABLV2+8Wk1jmzL+A6LSek98q1OSMISXidXrrQL5JM6tvZpyhX+LRl1Z4ksn4Otp3TK6MS5o6o7JYvezOv3kcNmflYx5gFy7lwmKfg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014)(921020)(18002099003)(22082099003)(56012099003)(3023799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7fK1CP8Syz0d1e3DWlr4KSzKCYrIveIQO+Bdz7Sthg4c9Qf0nEdjURR6JP4m?=
 =?us-ascii?Q?RDvo0etXvbBMoCvu8ytBpwXzAmY/ycbIJPGPIJPxDQGAqWsMNHB8sdbR/rr0?=
 =?us-ascii?Q?I4CaNQx+liUwgLnBLjesI8D0tpTkg3FXg/TUgDBFR4vzbb6luJIdXvLMIFSn?=
 =?us-ascii?Q?pay7Q9WjVYtnZUFai/8txKD5oyaJspFU/UPSN+Wr1laYmFVvGFa9InATZ5j2?=
 =?us-ascii?Q?lKMGrZNmHKEoQwJxdAyZpVUbDi7qJQEXGDHwwCv+5s9E6cKcBYCkx0Nam36p?=
 =?us-ascii?Q?Pm2YMhBUSyzFkNUpwt6ah6GWyet2LhUcfavRzPhxNkbfjBfyet/+dpGWs48I?=
 =?us-ascii?Q?GI4swAo0IK9CBduVaTzFqkMfBJgb3OMOlm+Gms0l+Ya0N0cv3qKNzREcLbXZ?=
 =?us-ascii?Q?+JqAuEKQtQGSWToe4x7n5QaG83lPA35JSK/4NfFIpyMQ/lv0dhvuJ6nggx+m?=
 =?us-ascii?Q?jldD9LHzOgBGoORwuAaWRZXzix+D7Z5nSpQ+efUS4VxiE8D94pHIimxfLtOF?=
 =?us-ascii?Q?XMDPV6OJoQmVLBNRzHJU9oyt8TrkIMyzd/SuIrGPzp6RPl9BMQey5l3za2m7?=
 =?us-ascii?Q?oRu6ZbnyKwN9UXB6Ejws13zJa8yqzrpCao3RCdPmGxakItzBqtO6jxxSLDlI?=
 =?us-ascii?Q?MfTI9IzWFiduAtyAF819i/LZZ2IdYCbS90CKsijCkPUpYgbRdVSaBzNpyjM8?=
 =?us-ascii?Q?2hh/TduqpJI+t2kvNGswvhpCDHk6HiiZASdloncL4HHYbRPF6Q7OKxoX/f/k?=
 =?us-ascii?Q?kEqEfjliMBxE6DEbXY4u0C/Hox9N1Mbj/LclzjfLuYeY2UZnITIxUs28bB67?=
 =?us-ascii?Q?Nb+MDjyiQfuCRmtO+Nd4Lt1T3sqA3NS8mBXRs3RvUeWh/9dlhVSygW1ultHp?=
 =?us-ascii?Q?ZpRyfNbeejC1REy5QzEbGtk2JEK4QYUHPeuX7xGs8HkZj4jpgFXCk5b08lvl?=
 =?us-ascii?Q?ocs8GmtOH73J4blG4O2Xk6K+tfGr/Lmd4Dw6AuHvDKrTMeSkda4zUuoie9Xb?=
 =?us-ascii?Q?qgp8di9+h7mABiefCn6D0FClCg59BszKPx4rU0pFOmncKj0gOwInBJoJWqF0?=
 =?us-ascii?Q?b3/k55s0uiDCOPzHDcPi7TiYCB7lzxy0kIMydvbnL3btDd1fhKfHdz0PpSKm?=
 =?us-ascii?Q?aUzuy7RMisSOLrmmA7caYu2AOuiPxfQKD5G/MbAo9BmqELB0Ev3nA7MXg76h?=
 =?us-ascii?Q?NUpD/nq2KUzpvACHzsAGt1AahtSLGS6ysIDE/5BpdGkC+6Zxfndfqk6Ble1p?=
 =?us-ascii?Q?T6vY4lejLx00baEdYIvLWf392nRQohcHe31iAn+LU+NUC0avWa6xo1oaR0RT?=
 =?us-ascii?Q?TzhHNMVBo80Vp35XiGLuGIVXxnxt0207+n1l25IrNPe8Zrb9X8x7P5Po1IUF?=
 =?us-ascii?Q?M81NWJFmWaMF8JEUc1bLBXw6Zc/Acnfk1pw/Bb1chuEmIQXXes2xgC8xAySP?=
 =?us-ascii?Q?0TUt7Rq0gW463hRWAsSHF54Xk5fOJMuaTx9fiiovQWcak8rXFf0Ue3dBLYX4?=
 =?us-ascii?Q?ZO1uZAT6/SnbDvxSHIU1vymgpsq3ae0N+NEyTMKiXC207H4oRVo0+pQ6YUT6?=
 =?us-ascii?Q?qKhMW6oEgHb1OT4dgPrboSmzLVYyGOazoBoEF4aVt3qewwcoWRwMtL+Sso3L?=
 =?us-ascii?Q?BvfhHix1Kh5JQcQoqfKFb5Uqqb3+aLqotfDqOa1oF43wUOyBg/hSclLvkJER?=
 =?us-ascii?Q?4JG4g+EDd+MgVPmHQOb0K8KIV+wYphLNAF/C/yL+vrgYYbsQdlhuJ2gJtn8u?=
 =?us-ascii?Q?mZO7jbUa5qYmKEINOx63DIUfEjUAsjBjrrKavNOZLI893jqzX34K?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 982bd526-5e2a-46ec-77e4-08deb1a9b641
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 11:12:39.9729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xfikt30SbcQ7WxYpEjzBfoNLwPjgdOaZVzt8Ajh4hpJcz3XhyHtb3MewSLCNAa1bb1SvB95MJyFeD5BnqPiVy/TWasL+lRZqvLrvVAHRcNi5lz5yZTg0QWOLJ8KXh7lz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1267
X-Rspamd-Queue-Id: 7515F541073
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
	TAGGED_FROM(0.00)[bounces-36835-lists,linux-gpio=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.894];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,starfivetech.com:email,starfivetech.com:mid]
X-Rspamd-Action: no action

Add pinctrl driver for StarFive JHB100 SoC System-0 Host(sys0h) pinctrl
controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              | 12 +++
 drivers/pinctrl/starfive/Makefile             |  1 +
 .../starfive/pinctrl-starfive-jhb100-sys0h.c  | 97 +++++++++++++++++++
 3 files changed, 110 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0h.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index 548a1b133f81..1c87f64830ed 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -66,3 +66,15 @@ config PINCTRL_STARFIVE_JHB100_SYS0
 	  This also provides an interface to the GPIO pins not used by other
 	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
 	  and interrupts on input changes.
+
+config PINCTRL_STARFIVE_JHB100_SYS0H
+        tristate "StarFive JHB100 SoC System-0 Host pinctrl and GPIO driver"
+        depends on ARCH_STARFIVE  || COMPILE_TEST
+        depends on OF
+        select PINCTRL_STARFIVE_JHB100
+        default ARCH_STARFIVE
+        help
+          Say yes here to support System-0 Host pin control on the StarFive JHB100 SoC.
+          This also provides an interface to the GPIO pins not used by other
+          peripherals supporting inputs, outputs, configuring pull-up/pull-down
+          and interrupts on input changes.
diff --git a/drivers/pinctrl/starfive/Makefile b/drivers/pinctrl/starfive/Makefile
index c0d368f413bc..b26156a6d0eb 100644
--- a/drivers/pinctrl/starfive/Makefile
+++ b/drivers/pinctrl/starfive/Makefile
@@ -8,3 +8,4 @@ obj-$(CONFIG_PINCTRL_STARFIVE_JH7110_AON)	+= pinctrl-starfive-jh7110-aon.o
 
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100)		+= pinctrl-starfive-jhb100.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0)	+= pinctrl-starfive-jhb100-sys0.o
+obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0H)	+= pinctrl-starfive-jhb100-sys0h.o
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0h.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0h.c
new file mode 100644
index 000000000000..80dc35321a95
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0h.c
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC System-0 host domain
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
+static const struct jhb100_pin_layout_desc jhb100_sys0h_pl_desc[] = {
+	{ .pin_start = 0, .pin_cnt = 7, .name = "gpio", .gpio_func_sel = 0 },
+	{ .pin_start = 7, .pin_cnt = 1, .name = "espi0_reset", .gpio_func_sel = 1 },
+	{ .pin_start = 8, .pin_cnt = 4, .name = "gpio", .gpio_func_sel = 0 },
+	{ 0xff },
+};
+
+static struct config_reg_layout_desc jhb100_sys0h_pinctrl_rl_desc[] = {
+	{
+		.pin_start			= 0,
+		.pin_cnt			= 12,
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
+struct starfive_pinctrl_regs jhb100_sys0h_pinctrl_regs = {
+	.func_sel		= { .reg = 0x40, .width_per_pin = 2 },
+	.config			= 0x04,
+	.output			= 0x34,
+	.output_en		= 0x38,
+	.gpio_status		= 0x3c,
+	.irq_en			= 0x44,
+	.irq_status		= 0x48,
+	.irq_clr		= 0x4c,
+	.irq_trigger		= 0x50,
+	.irq_level		= 0x54,
+	.irq_both_edge		= 0x58,
+	.irq_edge		= 0x5c,
+};
+
+static const struct jhb100_pinctrl_func_maps jhb100_func_maps_sys0h[] = {
+	{ .func = "espi",		.val = 1 },
+	{ .func = "espi_reset",		.val = 0 },
+	{ .func = "espi0_vw",		.val = 1 },
+	{ .func = "espi1_vw",		.val = 2 },
+	{ .func = "gpio",		.val = 0,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_SYS0H_GPIO_A10) },
+	{ .func = "gpio",		.val = 1,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_SYS0H_GPIO_A11) },
+	{ .func = "gpio",		.val = 0,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_SYS0H_GPIO_A15) },
+	{ .func = "scap_trigger",	.val = 3 },
+};
+
+static struct jhb100_pinctrl_domain_info jhb100_sys0h_pinctrl_info = {
+	.name			= "jhb100-sys0h",
+	.pl_desc		= jhb100_sys0h_pl_desc,
+	.crl_desc		= jhb100_sys0h_pinctrl_rl_desc,
+	.regs			= &jhb100_sys0h_pinctrl_regs,
+	.fmaps			= jhb100_func_maps_sys0h,
+	.num_maps		= ARRAY_SIZE(jhb100_func_maps_sys0h),
+};
+
+static const struct of_device_id jhb100_sys0h_pinctrl_of_match[] = {
+	{
+		.compatible = "starfive,jhb100-sys0h-pinctrl",
+		.data = &jhb100_sys0h_pinctrl_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jhb100_sys0h_pinctrl_of_match);
+
+static struct platform_driver jhb100_sys0h_pinctrl_driver = {
+	.probe = jhb100_pinctrl_probe,
+	.driver = {
+		.name = "starfive-jhb100-sys0h-pinctrl",
+		.of_match_table = jhb100_sys0h_pinctrl_of_match,
+	},
+};
+module_platform_driver(jhb100_sys0h_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for StarFive JHB100 SoC System-0 host domain");
+MODULE_AUTHOR("Alex Soo <yuklin.soo@starfivetech.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1


