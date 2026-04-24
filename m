Return-Path: <linux-gpio+bounces-35490-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBH0FWFY62nQLgAAu9opvQ
	(envelope-from <linux-gpio+bounces-35490-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 13:47:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E53BD45DFB2
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 13:47:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5C4053004D3E
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 11:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C15F3BF673;
	Fri, 24 Apr 2026 11:47:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2103.outbound.protection.partner.outlook.cn [139.219.17.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75E42DCF45;
	Fri, 24 Apr 2026 11:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777031260; cv=fail; b=IRNTNVabBgQL6GVFOSSTWAA+ADucIlMsCLE79MjSFH+hSPaKWHIDHlpbFVGNxt3zO4G8Lw3HO808SIDr4G/mJdhHgHYZ0mlXR+BXXB+DWV7AR5DqmJWU2QG0edFAqNihBHAeYXU44DcO7S7j8juGXO8L/Oly7uzD+EUL5Nt22QY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777031260; c=relaxed/simple;
	bh=TNSZ5Nb53sY7KYSVQb7oNOk2QJ49/YzeBk/evva3gCk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E7ZbdrDouBfdwfYrXjZVGSbI/wQr72AUuWxJsPs/EPT1ocmeDtwAAwhmxJPsdMd8dQnijqFe3t1qee0EX1aGhDL/gpooSid8cr4rLXyK0Kcw9w3J4Co5aRpLz0y93FHHI0KFN10ewE1DBY2pGsQcgqcms08HR9VAjVBR5Xydqrk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FjJxyGpwM9HhplwS5Hd9kJ8taiYSWzu7r7t+lj/+XSByoTzHYPRXw6qhTD/tGnhlk+RCqmlF2ZDt8bPwR0MJS/BtUVXftBOo9C4lZYohicEmlmYgOlBJsUVBjuWLl0A2bomFnXd37Mqr6Rde5L6yb2iXjL6FuRdmzeMP065dsYW8LuxiUdHmtb1emMYd8aq0ex0tNj6Jv+cvL+VMikATC86FheQU2CTUTAzJFaBKKHoS/K193U6UzWVTiYN349RDsvFShMUsC0JbbCTzIQ71T8mrhtkM87KaNdMMD1MXg6BptcIqMrCQKd9k9oG8tt672yhlGzIbJB/sjOTAJtXJwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/4ryp64mQut0iwNz/9RR9hgs/BmrRyg35emGWb74F9U=;
 b=MQ6URDBtfkXwZoq2AVbgk75sBgjKEtjH5FJ/bQTQQBQi958c/pime9vgQrL1FItl/tDWjzZ8PEYbCNvtXhJyG8bENmQK7g5sV052r7fsDUnNAGrci1qYxtG93dfkEejKMNlkqSej3svVXALPpw9jAVM3Ee+//0pKjSH/2LoKCOk3uvmOezMM+Zp6NqJyYYGzk/4tzRyL2Ns3rT8nk5czJMWofsap+COmMsDMF/p0sVJIBomJKeCC/J7zYjVhxxio1tN8V2w5/gYqvWGzDQBB4JguTVd/NHasxwbOvo9e/wVXkXNTOLTGNBR8Xen9SGP3ZmuiZe3RRKBBLBPM6eUAsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1299.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 11:13:42 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9846.021; Fri, 24 Apr 2026 11:13:42 +0000
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
Subject: [PATCH v1 03/20] dt-bindings: pinctrl: Add starfive,jhb100-sys0h-pinctrl
Date: Fri, 24 Apr 2026 04:13:13 -0700
Message-Id: <20260424111330.702272-4-changhuang.liang@starfivetech.com>
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
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1299:EE_
X-MS-Office365-Filtering-Correlation-Id: 3525af6a-4fb5-4e88-d7a0-08dea1f28b36
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|921020|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	QCk/H8d+8/tybPibDfMxcXUvMoYN45ig6mS+B2l0qIDPnNoI3YNx8R5bpuKpy0wZ0DOVGKWHZu9WbWfbyyjdlpkc9yrK9YpVjHm810zn81iKqOesS45QzXa3xI36OW7jA4hyppckWv0ds/gLvVlIn3Y1UwLUhkaFHnoHrbdWOPiqzdMm/ldCsBmU2jPnbF6ygrMIFeAKu6xkw1NYtBoxM5KvxwVtzsRHLlgBom/mrcm7H+eMXpYs7UwHw68F2352EZRO5kVSXbuRf6JPKK14kXALngWhzzAzMPgWTSylQNmdOyQ/A++gW29Ys4EG4PHt9Ooy3lkXGXSiIZ1zr7ESmy/Exv9rYfCbml//UzHSKMY6jIiTsinKoTxTcs7U/T6zvJT6a3FMwP3LKzvu7cBy4FEVyNt+qm56aBYvf3GCenRcjPzSzbbJJE2yJT9jRH0XDPZYc7GSaYaRUN9kVP5kk39i7GFoUpMpfu3WKY9kN9dwlLd/nb+MRxjkynbr6U/fdbP8cB1R3BsMTQU156VutLcQ2HHYhzffI6gPWMaJVfzkEJgCsLzoZMeringLf16cgBGnsIadA2e2/LNFIjyISo0mZEHEyV26KGjD8Dl1t6o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(921020)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?m1P5J/tKJIJIDQZHd367QEqGyUAf8fHFYG8bJUB3KohTQ8Edaj1arxYZ1RlL?=
 =?us-ascii?Q?uKTqH1NDqv4jMWhV0qgFaOUOeGNAq5V6z6e4FzL6ynSgM2T8x56XRYLszt/E?=
 =?us-ascii?Q?xwGqfmxrMNi/HWpjmR/SeR4P8IOAQEzLH7lASEBXWGV8fyqEzXWwhICaci+a?=
 =?us-ascii?Q?3A77kcytJHzAxCWrOlMP0b8z6eaAuV+MGKrOtKrT/960Zgq7pq0vTPNXZ3hu?=
 =?us-ascii?Q?lmsoOI+DoXC3ZNGl4PHVS/Ds/LKloQ4xoeky065R/s8jK0HopTt5FzjTRkjr?=
 =?us-ascii?Q?fMpCuBh+4VREF53L2NwuA7fgcCMudyxaKKlJDdq1Uygq5R2XIaPLSkxUCXJb?=
 =?us-ascii?Q?PPumpZmyFFVKHyV3MXiMJkxx8rUDI5jloEIB6junZadfXa2CROO/TiGhEqfS?=
 =?us-ascii?Q?yfgSwQKrIAQV3y6k9Z/9Bmi4DzBxA1pUjeoZnnn7MLqqmG8svIunEuRJoqKC?=
 =?us-ascii?Q?7mqREbiZA/Vg754qaGQK/yC0ynrWttMZNqn3RvIzzERckFCMC0nwTWwoxZQd?=
 =?us-ascii?Q?f65ioYACpCIJhqcuBD3cHm5HmUXel2JcEvlB2KE2TADSSIoBmPQI4RWcFGhh?=
 =?us-ascii?Q?2XduNb116GRciK94+eKn2a7CUHDaHvLBiG17MiXYsuKFaKFsiWvTELLiE6yP?=
 =?us-ascii?Q?cLqbbn/uMOEidYVgb5d8mmupb/B9R0iyZQAkR2jDN5uvo2A3TwTVgYQoMSDN?=
 =?us-ascii?Q?2MzmtXEwGnHhchaMc2tyKhDxGeiDFGjJW8qjg7ajvZhyG5SpPd8DBKz/EIbR?=
 =?us-ascii?Q?8uC0JbCK/587r+YSDipBWjASGrpF0Y3SQouO4QyDnaQNFeLcJzO1OGnnkNCe?=
 =?us-ascii?Q?CI9WaJ0ityL6W8N5APJZ5Fr9kPkNZRjPfOTYS1Kqk+3eXTHGaonRAlNYqsPG?=
 =?us-ascii?Q?i3BN/bz0ehLhR/VSAWOCo3t62TxGsYclOFOnN27rbnoepIhgUymto2D0Mmdi?=
 =?us-ascii?Q?4E5kwI8mT/In0mWrUVS++SKbtYgwEqNhIghHskosCx5fVnhJcFYf/fOom18Q?=
 =?us-ascii?Q?MhRtULfBgM3ePOFoDX4zKVRd/z0nfyje3qkv8xwE8dGBhaGrEdGrdzK4Ked0?=
 =?us-ascii?Q?6P8ZPwa3K7lBr+RFkw2WSZ8sPiHN7eFUOkJI7IZ6RD/ji/Yfbqm9Ts44YUDd?=
 =?us-ascii?Q?ovHJlMY9ESMHrwMNTqpUvGvpCLEFgJa0+8zs+El9S2fVtdY/PVEPTldgBaOE?=
 =?us-ascii?Q?eJxiWsFW63NLRI46BJ+C7zUECIWT1tSTzOu07C4KNIR/q5BUqFgnIB4ilnRm?=
 =?us-ascii?Q?gp0D9t1D77MmMYKu0av5wvu5EjM+aORYV9wvNrAhtxg20fBkfX2oH5TjAoRH?=
 =?us-ascii?Q?mdN0ryiSEPYZ3aR9zjA7wn6/7E/6MtMiOMmbQQt5bqWT7kS/brzVBZnB6Ncp?=
 =?us-ascii?Q?X2wSOkAKejJRsOu0QXG569eL24fgufIeEk35NY5V5q2rxdKGdGd+0tmuRvHe?=
 =?us-ascii?Q?rD+BSZKdG2BD4irk2DdxyaIeeh+FzpAkmcw3st/uEYCPzJEO8S4ggDfn6hfY?=
 =?us-ascii?Q?9b31F2eJngwyUtKu3dQdQspQs3b8U2AQx+3+S0OJHM3XCiZt9rgS4tryU/GI?=
 =?us-ascii?Q?P4ISFLwbva5/OVdIh6DPBbO1wVwx+dCb/SqKPZ+U1A9hq09+RZIStdgAAWlJ?=
 =?us-ascii?Q?0+4LzBO/GIzjJ83VSUqvqlE4Fa2T5EWKYf5uElo7LUUQgeTlDa7BNJZdtWj8?=
 =?us-ascii?Q?JP0JQIDFVaXRbhfK60tZo86Pol8aKvSllgBZ31N36tOLgMmM4iiG/h+3ZDnu?=
 =?us-ascii?Q?/+L6VsEKYXZOO9OSlm0xh/ccVfUaoIPWywsvouaGFt8pJKVhutuu?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3525af6a-4fb5-4e88-d7a0-08dea1f28b36
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 11:13:42.4169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZS/nlqEkDscGfbhzFFiTbW34NWyg41y6h2VBeJU2geAv/PN7jKOEw7x6UTThLZjSBA8FFUhneDO2F8lC4ebnkvHrbv6yIID3Ezb+bbdEECJanyFQjAR6V0wa2PsUMuiV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1299
X-Rspamd-Queue-Id: E53BD45DFB2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	GREYLIST(0.00)[pass,meta];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35490-lists,linux-gpio=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[starfivetech.com:mid,starfivetech.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,devicetree.org:url,0.199.152.224:email]

Add pinctrl bindings for StarFive JHB100 SoC System-0 host(sys0h) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../starfive,jhb100-sys0h-pinctrl.yaml        | 156 ++++++++++++++++++
 1 file changed, 156 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml
new file mode 100644
index 000000000000..fffaa8a0db0e
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml
@@ -0,0 +1,156 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 System-0 Host Pin Controller
+
+description: |
+  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
+
+  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
+  per2, per2pok, per3, adc0, adc1, emmc, and vga.
+  This document provides an overview of the "sys0h" pinctrl domain.
+
+  The "sys0h" domain has a pin controller which provides
+  - function selection for GPIO pads.
+  - GPIO pad configuration.
+  - GPIO interrupt handling.
+
+  In the SYS0H Pin Controller, there are 12 multi-function GPIO_PADs. Each of them can be
+  multiplexed to different hardware blocks through function selection. Each iopad has a maximum
+  of up to 3 functions - 0, 1, 2, and 3. Function 0 is the default function which is generally
+  the GPIO function (or occasionally, it can be a peripheral signal). Functions 1, 2, and 3 are
+  the alternate functions or peripheral signals that can be routed to the iopad.
+  The function selection can be carried out by writing the function number to the iopad function
+  select register.
+  Each iopad is configurable with parameters such as input-enable, internal pull-up/pull-down
+  bias, drive strength, schmitt trigger, slew rate, and debounce width.
+
+maintainers:
+  - Alex Soo <yuklin.soo@starfivetech.com>
+
+properties:
+  compatible:
+    items:
+      - const: starfive,jhb100-sys0h-pinctrl
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
+    const: 2
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  gpio-ranges:
+    maxItems: 1
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
+          trigger enable/disable, slew-rate and drive strength.
+        allOf:
+          - $ref: /schemas/pinctrl/pincfg-node.yaml
+          - $ref: /schemas/pinctrl/pinmux-node.yaml
+        unevaluatedProperties: false
+
+        properties:
+          pinmux:
+            description: |
+              The list of GPIOs and their function select.
+              The PINMUX macros are used to configure the
+              function selection.
+
+          bias-disable: true
+
+          bias-pull-up:
+            type: boolean
+
+          bias-pull-down:
+            type: boolean
+
+          drive-strength:
+            enum: [ 2, 4, 8, 12 ]
+
+          drive-strength-microamp:
+            enum: [ 2000, 4000, 8000, 12000 ]
+
+          input-enable: true
+
+          input-disable: true
+
+          input-schmitt-enable: true
+
+          input-schmitt-disable: true
+
+          slew-rate:
+            enum: [ 0, 1 ]
+            default: 0
+            description: |
+                0: slow (half frequency)
+                1: fast
+
+          starfive,debounce-width:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            default: 0
+            description:
+              Debounce width 0 = Disabled, Others = 80ns*N stages
+
+required:
+  - compatible
+  - reg
+  - resets
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
+        pinctrl_sys0h: pinctrl@13080800 {
+            compatible = "starfive,jhb100-sys0h-pinctrl";
+            reg = <0x0 0x13080800 0x0 0x800>;
+            resets = <&sys0crg 3>;
+            interrupts = <57>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-ranges = <&pinctrl_sys0h 0 0 12>;
+        };
+    };
-- 
2.25.1


