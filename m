Return-Path: <linux-gpio+bounces-36834-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IC0kL1uyBWqeZwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36834-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 13:30:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F280541064
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 13:30:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 607943045DFA
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 11:28:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2F7F3C09F2;
	Thu, 14 May 2026 11:28:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2101.outbound.protection.partner.outlook.cn [139.219.17.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4343BF68F;
	Thu, 14 May 2026 11:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778758090; cv=fail; b=NK4pJw2aC+LBfnk6fOLTGdEQHtvyzTozT9IMjWdmbMipJniRtrGWDxFMfA7XYVnwRowuK4jkNPQkJxuWjGx9iep8uM/EgXE8MjSl4VFWk4hQdduQG2moMXudER3uWsa6AtmJ+KBh4ZYeAMmmT4x/Z6nTocETXtkbxgE2FRij46c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778758090; c=relaxed/simple;
	bh=+YerRuu3dGxzHAq32Moch4tsbNQLMeeqREnxhZNFCK0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VW7WIkECZcREGMPFtpxDkAymcKUneKzVUThNfGVdjJ1g7ach0M4EAj/1/HmtGegbQDYqFo7ECtB0y9r/sHRH5vjnSnORbnirua4HUXrtGIGywYGtLqQ2jYJUupQngtvGxBXbbiHDO/x8oQsKBUeUqX+7nNfl8k1tOIdvxgkMNoo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m7lyuNrKUNGTZ/rCiFjt7yFtddfmlqnghfQ9EwSHxE5zlL/uZoVX4034xf0M3g8ru8Za26hf+NwAGsWhjbl5incTxy7OZyYBuTnfcMY0at4PFpLxccYtxIaS68w4ewWOeZ7ylMwk3h2B34KSbZTgJRUdzKxLqnUfDcT1Hd5uLYHM3ijQISTDjpOFOgbihrbuq0p0bpDEg2uH/sGAvUy7NesASd69gktUN2hc3EHPTKd5CQambl998w+ypbI4MfrIUUAL8t107VTRzcvwZ5FT7UVEVw62dSWxdq+qKogA3R+9p7aMDK1TKfiEVjK01Fnxk+wc9hS8q9WjTx63j5xBMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TpYcufGRsCgnPbicm0PrzUBN+cLX277dFFtVW3Tldgs=;
 b=I2JUY6Gy8Wndc6DHqlLYE3mM4eBfsCF82kyjMoIeueXCMs8qolkVojUDsFsltH80GGHi3QzUJd2fBc53Q6HHde/Ul7PSvFpaQzQbyPR1qG1ESqyP/6KrSfu4EbDx5j0Z2pMM/zbYr2AWLbh2ifTUm4B/K+sbBQOXO9sMr1BhRv/6wKPwU4SwHv3fpJqx+paYDXJqoov11WRZhQP6iqecAIBMrl0c6MiQtVvP79+77dRU8ehYwDE/7wtrPMEa7LRudMvAWnsnYA9FZECfVgUQgvH148dt7O7xcyMqeLklLbhiYL+PgQ/Z+RIWBVVALEz6cwADQj63phj+ZBk/AxUAmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1139.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.25; Thu, 14 May
 2026 11:12:43 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9913.009; Thu, 14 May 2026 11:12:43 +0000
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
Subject: [PATCH v2 10/22] dt-bindings: pinctrl: Add starfive,jhb100-sys2-pinctrl
Date: Thu, 14 May 2026 04:12:06 -0700
Message-Id: <20260514111218.94519-11-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: a9c89d04-e36b-45d9-102d-08deb1a9b831
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|921020|38350700014|3023799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	OC4n2cLhkqZ0RvS+cZAKrG3JEcknEj8SUyegC9vxGFoHUSoRIPhxt9baoUjZxXUtpEVmQIb5oZhdQtthJu8hRDIYyzq9wm16kQWRCIQEGozybATEegvKB8hEH1LTNw/L0eHHLhmSfDKIHnDGPKBdyKN53Z+5wsFcRQjmp2kXzl9rYinY9RTG0Roog3ZGTn4oFX8jfjYhQ5ogd9Aoob6r99uSXupnPZPSYeOJSo2Ea4joxevttk3BLe/ECyLIuMyXGodaG/NSryWmN/DP7QKclwUm/auLW05NdfOO6xAB7gTNh9R/B4jndel568Wf9puu1GUB3zjBWAl3oDAmdg/YK4wuVYmSd+YavrlDWkVIJ90KlGCyksC7GZsA0OaFEZ5gqgSlRfAjFLe5TLHnD0yHrtcEN9GChW5GEZ1DyM8sVVsdbhprrchHfIx+ZUMJ2HFV1S3rXsaItNnl7OKwZKqORhrVHjD8IJ6DmiSScXKS9Xk3GIkEgmzNl+bsJav4G3uG5jaiS21JIWsAA5RtJwPH/4tgTkH6KdWmpnd5i3/uGjl2SiivSBES/yzFKhzGY26veMd6EOPWSwKplpXCEP1PUQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(921020)(38350700014)(3023799003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?l2hIaj0YqQcTrZvcAm0vnQQ+Sl5iHrzBUpamN4cYiGxkMVz/JcM6JTm0JVCY?=
 =?us-ascii?Q?b6wGPaXwZy34fIA+zyP2g6aVN+lUhm6OE8ScWIkOpLyTieE/h7y8dtp2crjD?=
 =?us-ascii?Q?8nseIDtKHwF/9ZdvejLX+ULSlqOsJUBSLQIBPxDSiLmSVsLDEC4NrbAlZUXz?=
 =?us-ascii?Q?xE8GkJJCt1uDtpksiPi4XkzA4xHZPn7meOCEtJ9pgifwdJnvPVF7varXkIg+?=
 =?us-ascii?Q?9VK4GYfERY3VBBfNh1wIlEELxkeMCaVCb0Z0TZLRZi0MGiX4lrzrfNmvRg1c?=
 =?us-ascii?Q?nSOZYcePmliYUjPthiWvyXnVPWaljnBWsOby6GhI27EjbZYzFSo4svEBO9Dw?=
 =?us-ascii?Q?L8uXq7LBGIQyS/XoCnPSoQztEinAAYW5shS0RDdkuD40bn5dF5MQtM/f3OGG?=
 =?us-ascii?Q?J8eUnSOsPyqjtaxycFaeXn/o4j9vjfgxdvPGbuZayVEjaiPFrvMZhjxivvO3?=
 =?us-ascii?Q?TcVNJqFOh7guOu4gh7T0O/+/0qUQHk4ObuqDU/x0YmcIPEy4N2Vp/SQETn6w?=
 =?us-ascii?Q?4ByroNT3kTaEd7DQ5LmMI+QfoQHxjx+rqAGXJI/Bn2o1FYzF6o60aGoYojxa?=
 =?us-ascii?Q?dDsiF5pQhgyvNyQb38rR+d1gyeCF5VN+11SrX1cAHVIhKC+jzXerkykTWsVY?=
 =?us-ascii?Q?whu/dIl7NL8PD/W9vLU7QOqMOgzXzbGux7/UPpe5dhaoEdZtwHDjYm42Os0U?=
 =?us-ascii?Q?NpGFwVePfuFy/UC0Ioovo0Gnd6oWBTNJzY+a8zwj3cRUyFtCcjHWLnmd66aJ?=
 =?us-ascii?Q?CSktrmUZWe22KAbPKJg/MuCGJMCCSazX0BB+dADEesOqPs8+dH2es4l4/2qN?=
 =?us-ascii?Q?EUX95RwZZf2IC4y0r4UNQgIhepxHzUhm69QmTuzv60Dtptb7acXulD+pgMQv?=
 =?us-ascii?Q?5bBanK38vHzVpKDGka/N/HtE60IBDQ2JafHVHvQUBJF0hx6Q7cLvIDBcFr/7?=
 =?us-ascii?Q?XXKbiwvQTUWBOeo8L0vXz/YSQFI5pCU3wl5NYtzC2XrQ5G32/r0zy5i+aXSR?=
 =?us-ascii?Q?10d55P2mWWFEPBy24ibS/CARXKuXlRcfWzKH6vIQ7kwyw0CuDy8N+niz1DW4?=
 =?us-ascii?Q?Yubd5LaOZJulhiAebTJSdcUanOyCm3Qf6O9BPVD7m88uai9JUy/OoVWvYOH5?=
 =?us-ascii?Q?s0rnMOVpyb80FK/+SGIvE+/WpD1025C6FbdkENO2ZTHsloD6OCBoXr9gVp8k?=
 =?us-ascii?Q?uWu8UUw8wwAqf0I3rK75fivOtmHihmbI5Y8D2F42s6gWqrsx9S4Rm7unJC66?=
 =?us-ascii?Q?sHgTHIvcPvH+8KTYI/g0WCJ55vUakcazmyLs3ioihshg7/WZJ552GTIhUJFt?=
 =?us-ascii?Q?5fwUjgH66Tdf36Ss0AqDe1MSVQCpiJVcGPJsd6EmQ1hnzynFyzFUFICHtf/7?=
 =?us-ascii?Q?PMXKc837jF5z3aO14P/kheEIsGnodMuIlZFme/gYHrHLJbjKNtabfkQLEXEg?=
 =?us-ascii?Q?RKiWTl39+j8q/QqdObnN3jGcOFchGQlRxIdUI5yh+R0W4zTLfQzskn27uB7k?=
 =?us-ascii?Q?vrvFwyfBCvNiXw4zdETnvSrREwc/vMLF5/l+kJ0wk2LRXpn104H5Atreg0Kc?=
 =?us-ascii?Q?QWNNcRxgsy/OyiHtBmb4+HACwh35oFBFqXM+omZhjtcpU9ziAX9bCPsQNEPK?=
 =?us-ascii?Q?VEUp3iydVSMgzGmXolzlkCZz0jupuo8FmqhQC8up5+4lgHlCr7KVFL8AEKch?=
 =?us-ascii?Q?CQsWdGMG+orcDsstHHu6kblIAOQ1liF+RjkxWoaVC5tmqXkEBA/KpIK1c2Ui?=
 =?us-ascii?Q?5LK2X5bE3Kd5XCDSXEVNYeTXmi+tQIv1NJlTjKHI1LVxayBNitOC?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9c89d04-e36b-45d9-102d-08deb1a9b831
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 11:12:43.2278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uZAfw7Yer2KUH15mEcma9zVzmw+WQR0NMo/cLeriHI7fDXV5kPfSefNkZK9haehhVOr8D0IIGfsUn+4Mzz4IRtRQ8HoCkh4CYrFrikAnyU94FzmGnvqhpPhT22zVKosE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1139
X-Rspamd-Queue-Id: 0F280541064
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
	TAGGED_FROM(0.00)[bounces-36834-lists,linux-gpio=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.918];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[starfivetech.com:email,starfivetech.com:mid,0.199.157.144:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url]
X-Rspamd-Action: no action

Add pinctrl bindings for StarFive JHB100 SoC System-2(sys2) pinctrl
controller.

System-2 domain also supports configuring the pin group voltage.
Add relevant definitions for power-source configuration.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../pinctrl/starfive,jhb100-sys2-pinctrl.yaml | 173 ++++++++++++++++++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  44 +++++
 2 files changed, 217 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys2-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys2-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys2-pinctrl.yaml
new file mode 100644
index 000000000000..3281c9433281
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys2-pinctrl.yaml
@@ -0,0 +1,173 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-sys2-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 System-2 Pin Controller
+
+description: |
+  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
+
+  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
+  per2, per2pok, per3, adc0, adc1, emmc, and vga.
+  This document provides an overview of the "sys2" pinctrl domain.
+
+  The "sys2" domain has a pin controller which provides
+  - function selection for GPIO pads.
+  - GPIO pad configuration.
+  - GPIO interrupt handling.
+
+  In the SYS2 Pin Controller, there are 37 multi-function GPIO_PADs. Each of
+  them can be multiplexed to different hardware blocks through function
+  selection. Each iopad has a maximum of up to 4 functions - 0, 1, 2, and 3.
+  Function 0 is the default function which is the GPIO function.
+  Function 1, 2, and 3 are the alternate functions or peripheral signals that
+  can be routed to the iopad. The function selection can be carried out by
+  writing the function number to the iopad function select register.
+
+  Each iopad is configurable with parameters such as input-enable, internal
+  pull-up/pull-down bias, drive strength, schmitt trigger, slew rate,  input
+  debounce nanoseconds, power source and drive type  (open-drain or push-pull).
+
+maintainers:
+  - Alex Soo <yuklin.soo@starfivetech.com>
+
+properties:
+  compatible:
+    items:
+      - const: starfive,jhb100-sys2-pinctrl
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 3
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 3
+
+  gpio-ranges: true
+
+  gpio-line-names: true
+
+patternProperties:
+  '-grp$':
+    type: object
+    additionalProperties: false
+    patternProperties:
+      '-pins$':
+        type: object
+        description: |
+          A pinctrl node should contain at least one subnode representing the
+          pinctrl groups available in the domain. Each subnode will list the
+          pins it needs, and how they should be configured, with regard to
+          function selection, bias, input enable/disable, input schmitt
+          trigger enable/disable, slew-rate, input debounce nanoseconds,
+          drive-open-drain, drive-push-pull, power-source and drive-strength.
+        allOf:
+          - $ref: /schemas/pinctrl/pincfg-node.yaml
+          - $ref: /schemas/pinctrl/pinmux-node.yaml
+        unevaluatedProperties: false
+
+        properties:
+          pins:
+            description:
+              The list of IOs that properties in the pincfg node apply to.
+
+          function:
+            description:
+              A string containing the name of the function to mux for these
+              pins.
+            enum: [ gpio, host0_port80, host1_port80, jtag, smbalert, uart ]
+
+          bias-disable: true
+
+          bias-pull-down:
+            type: boolean
+
+          bias-pull-up:
+            oneOf:
+              - type: boolean
+              - enum: [ 600, 900, 1200, 2000 ]
+                description: Pull up RSEL type resistance values (in ohms)
+            description:
+              For normal pull up type there is no need to specify a resistance
+              value, hence this can be specified as a boolean property.
+              For RSEL pull up type a resistance value (in ohms) can be added.
+
+          drive-open-drain: true
+
+          drive-push-pull: true
+
+          drive-strength:
+            enum: [ 2, 4, 8, 12 ]
+
+          drive-strength-microamp:
+            enum: [ 2000, 4000, 8000, 12000 ]
+
+          input-debounce-nanoseconds:
+            minimum: 0
+            maximum: 4294967295
+
+          input-disable: true
+
+          input-enable: true
+
+          input-schmitt-enable: true
+
+          input-schmitt-disable: true
+
+          power-source:
+             enum: [ 0, 1, 2 ]
+
+          slew-rate:
+            enum: [ 0, 1 ]
+            default: 0
+            description: |
+                0: slow (half frequency)
+                1: fast
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - '#interrupt-cells'
+  - gpio-controller
+  - '#gpio-cells'
+  - gpio-ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pinctrl_sys2: pinctrl@13082000 {
+            compatible = "starfive,jhb100-sys2-pinctrl";
+            reg = <0x0 0x13082000 0x0 0x1000>;
+            interrupts = <59>;
+            interrupt-controller;
+            #interrupt-cells = <3>;
+            gpio-controller;
+            #gpio-cells = <3>;
+            gpio-ranges = <&pinctrl_sys2 0 0 0 32>,
+                          <&pinctrl_sys2 1 0 32 5>;
+        };
+    };
diff --git a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
index 30704a5a3418..89d344763540 100644
--- a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
+++ b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
@@ -38,4 +38,48 @@
 #define PADNUM_SYS1_GPIO_A22				6
 #define PADNUM_SYS1_GPIO_A23				7
 
+/* sys2 pad numbers */
+#define PADNUM_SYS2_GPIO_A24				0
+#define PADNUM_SYS2_GPIO_A25				1
+#define PADNUM_SYS2_GPIO_A26				2
+#define PADNUM_SYS2_GPIO_A27				3
+#define PADNUM_SYS2_GPIO_A28				4
+#define PADNUM_SYS2_GPIO_A29				5
+#define PADNUM_SYS2_GPIO_A30				6
+#define PADNUM_SYS2_GPIO_A31				7
+#define PADNUM_SYS2_GPIO_A32				8
+#define PADNUM_SYS2_GPIO_A33				9
+#define PADNUM_SYS2_GPIO_A34				10
+#define PADNUM_SYS2_GPIO_A35				11
+#define PADNUM_SYS2_GPIO_A36				12
+#define PADNUM_SYS2_GPIO_A37				13
+#define PADNUM_SYS2_GPIO_A38				14
+#define PADNUM_SYS2_GPIO_A39				15
+#define PADNUM_SYS2_GPIO_A40				16
+#define PADNUM_SYS2_GPIO_A41				17
+#define PADNUM_SYS2_GPIO_A42				18
+#define PADNUM_SYS2_GPIO_A43				19
+#define PADNUM_SYS2_GPIO_A44				20
+#define PADNUM_SYS2_GPIO_A45				21
+#define PADNUM_SYS2_GPIO_A46				22
+#define PADNUM_SYS2_GPIO_A47				23
+#define PADNUM_SYS2_GPIO_A48				24
+#define PADNUM_SYS2_GPIO_A49				25
+#define PADNUM_SYS2_GPIO_A50				26
+#define PADNUM_SYS2_GPIO_A51				27
+#define PADNUM_SYS2_GPIO_A52				28
+#define PADNUM_SYS2_GPIO_A53				29
+#define PADNUM_SYS2_GPIO_A54				30
+#define PADNUM_SYS2_GPIO_A55				31
+#define PADNUM_SYS2_GPIO_A56				32
+#define PADNUM_SYS2_GPIO_A57				33
+#define PADNUM_SYS2_GPIO_A58				34
+#define PADNUM_SYS2_GPIO_A59				35
+#define PADNUM_SYS2_GPIO_A60				36
+
+/* pinctrl hog power-source value */
+#define JHB100_PINVREF_3_3V				0
+#define JHB100_PINVREF_2_5V				1
+#define JHB100_PINVREF_1_8V				2
+
 #endif
-- 
2.25.1


