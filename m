Return-Path: <linux-gpio+bounces-35493-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LQZK5NZ62nkKwAAu9opvQ
	(envelope-from <linux-gpio+bounces-35493-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 13:52:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5969B45E0B5
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 13:52:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E78293013A88
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 11:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86B303BF677;
	Fri, 24 Apr 2026 11:50:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2112.outbound.protection.partner.outlook.cn [139.219.17.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2ED13845DD;
	Fri, 24 Apr 2026 11:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777031456; cv=fail; b=ZzwmhLeNnNIjwFVbjVcMugzgsNKr4HE3/pAH0c9KAmM13gRrBrAM9BU7zWqRW5bvtYlz/RRhxmVvaQ473lLBi5h4rSVUPXA8b0600df06e5Kq0KroK/9PasERgKZzpkAaWRf1cfTGr9nWkltUeOlFXFzcrTWk/3+Jj4SDE3AYJ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777031456; c=relaxed/simple;
	bh=4cKAeoK5P9DcTB5YEOiPhqGQa025OzUl2JBd8HWc7/Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JXV+u7GdeduInarjMvN2VwWwGVs/szDarp9UVRsFbRI/6PfZYyYN0BKNmP1AAmi0xjZoAgE00TuF2RIn2Abk0vVBgNGMxogZLPdOwSK0kLUDNFVCb/ABr48Cdp4gG178F18xzWtAka0awVZo3CCgJ1rBLXKtXgjNaIhz2sh8QgQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K7tWrVnTzzk6l5jsN/xrIVB6itMbH1HnpW0Sl0pDfQ6zHskLYOkveDCr5xOZ3hhydDyx30GWCCvHUONGasSEvuhPd4jXPS+/4ui8WsYnAwhxVm24U/DaAZLWTGL1pmLzNCyVypwf3LYQvyTA19t2MySKeYhSGObz0cuURzdl2l9gtB/svUY7WNivpZcLFzVZSYkxKHy0NxETOGJl59T27VLw+Ajiou9yXjZ3Vg2tZDq5eOX1kMssVE6pBWNiU9LrbGIzxMUrNL2ciOn5XBFboSQc5ExrxzdyoSND5iFXQxIiGwy4cNgAv30wle6lMnYkqcpOKIf4gUEoIJ0fmvuVyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ARMDIOIsG5YVoRlmCy3Cm3NM4iFuF8khjRrUo4YyN1E=;
 b=TNVCTdBvSj0XbGUl7e+vuskJyMZrfLgopjsZYz8PX9uqgzuziTDvgYQdzuIPe7U7A4u5L+FtqIbf6iShyPUnNj5o9+aWB4Rru0Fhukvt0Q+0JQFiTHsiRaZ8htR+3cPr1Y9lWyMNnnXyI8pse9YOV1tb07RG0VgyHgjGKNA4LERdoQEjtvj8Pl7LAz7JqX4xHbWc8Gm8Smk/ZK7o99gSMtLs11TNgQCd3gP8JIHyJ3pRaGbFCKqXTnkHq/2fD8PylqNDk5evwRIMC4kaD7Oacj04QduID6+IM1szNuZwRF+362pDOPB8OEbkL+VIR7DISg9f4r40a2LR0xL2heoH4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1156.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 11:14:01 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9846.021; Fri, 24 Apr 2026 11:14:01 +0000
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
Subject: [PATCH v1 17/20] dt-bindings: pinctrl: Add starfive,jhb100-per3-pinctrl
Date: Fri, 24 Apr 2026 04:13:27 -0700
Message-Id: <20260424111330.702272-18-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 33bba334-af17-49da-3c11-08dea1f2967f
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	UwALSHsVz22I089mO4M4Wubn7TWclvQs1MwDtE2u5mOs0b4/pmlReeAWqm2nYkU+Z1eEzxuQ9yHK3yG+XVkOUD4Y+C8JILq+qM/J0FJoLe8i4pwxNGytdJI3LI2LlQvJ2mx/TTQFiff3CMcJqjZdkDwD1YbK7+iYEmEwgjEuOHBy2gjQpNHIPstIULc+kNhJK1sUSIk4/3o3RXj2bZyDnMWNggWE4tBIUbMMYmlfZFeOjiRLKUuGP4vO669ycHsm87TxIqsJjLzSA2TS5KIYxYyG+KZ1tebat6yxrD9T8lPeNvUnUcvzhoot5c7iiz/cCn9U37902BkM20Oerq4VxFk7Oe6MtNghskuVgPB0PUwTziXjBSGWF2Xf5i2ske/DCnmFVxBNL0YjHgSl5wa0cRhI74cwC+QNye7A8+3pwXc7SWnzGGge0w/CFb/b1KqSAlMFoqraVOK3Buoz6kAFsOvW9SVO6RV4rbB24iO+96ku/CHH4HFTd6ipwZlPLnG/ugcVnC5mDaX5CY2ZepHX9rwgZpUfr4PuDc1hyu0xHsejogQmEutq+H+DtkXmHFtl0+S4geK4tA0AAEREQzTswYWoy+J/FGSrJ2JSOgWGz8o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?h5wdeuMZFmowckefSBD3HHb9mJ+ZP2HPf7LrQ6vft/qX9uLq+ZEK7oP4ZT7O?=
 =?us-ascii?Q?x792X9DCodEdn+Wv2hvZ5kh9GhgfnsIstFbHNodiHL7FSosRi2IHDW/pnjxo?=
 =?us-ascii?Q?m7agKiwYF/EpLkoGxrlmb0mfnko6ConITksx5QVlF+YmbrZqrm3CaMBU0pMg?=
 =?us-ascii?Q?1f5CmlEJLTLpUf915PNORHfWIRxIRDFuNTu/dLV8B0fVCWV+EoWz2ciNQko6?=
 =?us-ascii?Q?ElgYOt/8D/Jtj/lTHGmbW3eV0Ml6X3ut4TUVB1k9Uz3WjXfiEQKvhk7GNxKV?=
 =?us-ascii?Q?o3lEWxFghFm++Baj0+V2Qzc6KamLXLwIlUNZ9IqX9UQt19OKORI8g0uIxhel?=
 =?us-ascii?Q?N3czRIbjERK8tMYI/jSPMn41k5OM8dDT75TEn5eRcZI6bCZxKgBSYIKDhWxH?=
 =?us-ascii?Q?3aMJGYcF5JcU3I6KpS311rpok4u2dPbMnKkwSq0JghdsGd4BWUHqCWsESU6C?=
 =?us-ascii?Q?UiTmler5bh7t0cxib6/kkn6xND9EDNWzYoyi3MvtbKY1VsiIUxU07QJRJJdi?=
 =?us-ascii?Q?gxYIc1RGtY5t7ITBvEcilyRURjp4EaBPAKg1Qm0nSlkSKlH2SVqjEK3hOOs6?=
 =?us-ascii?Q?umRJtRimC3KZL2QaaQ6wYOCpchoMybgVQSRt2AYfBJ/mnMUfaZ86l9lO4MDS?=
 =?us-ascii?Q?y+j5nBgKyHzIBxa1+2tzPt+RraqKWfCY9TjFM4/u2ZQwMi++bO02+TqM3woO?=
 =?us-ascii?Q?Po8nBD+I+FihNPNFxaZBoT06Gb1Ifa5BUMkhaVHkpv6JbQPKEnGiyq4siBG2?=
 =?us-ascii?Q?vgtEYbmwddNkDBn/sBNB6EdhHUn/PuXAukFmWuxV8zBgegPi73DJnxa0D1pj?=
 =?us-ascii?Q?CVnH6PgCvXYAVOM+7XuGnFIm4DqxiPGqmLwRXdNlUVdBdMnH7I3X8LSZtvqI?=
 =?us-ascii?Q?gWa/eAoQyvOj58ESdXmEJXUrrZQLlY48yOQgdxJgDJflrJ0A5fBu8XFATYdZ?=
 =?us-ascii?Q?0M2wAZDGPLOEGpE5U6mcSkShbVBE9aqLcM88YDjmiDyReDAyYqs8XAXhKAqy?=
 =?us-ascii?Q?KVwZJOr6dDNpykozU4FwBFoBur6FhKSiTlyk8SeTqBRofk6pyAvvAWcT83oo?=
 =?us-ascii?Q?jjDSTdh2Lds80C6QW2sUk8w+i2n6PBZDXRjNSP1vES90CF8ZRU/xq9Ys61ZQ?=
 =?us-ascii?Q?nTNO+F6ZPMIwKdCf/f5SWrK2rRncEXvKQNH9JC+2ugd6ygBZar3P3UZMKlNh?=
 =?us-ascii?Q?792LmLXh5IeK//tQYJKg7Gu1/g2aRhy2mvWfOshSaM+3vsO4DAzZFEQ2K5MO?=
 =?us-ascii?Q?s4IATRkY7kw1BMjFqvq3+gIh7X/rsUjHMT7Hc6QLtKFQJzaWt5dUBjpx3unu?=
 =?us-ascii?Q?zP7OiR/CIY0lLtXgWqeBWiks4kbHobk/TTRQlE7LqM2sNSMCTVRYhCvKS/Lz?=
 =?us-ascii?Q?6jMJAsborpKhaJBdIropJP6hZugRl2aeyM5lPHdEix31BOsyJGBZsSans6U6?=
 =?us-ascii?Q?/U8otPDgTevgxzq0NSQ4aVMteS4hkx6jUnTm7a68saIB2MFnTa3PKSKGSBc3?=
 =?us-ascii?Q?ePOs+gkwIu5S+XqMWkdSkmM4Dho3i4KpIAeVKA/j48YpXJbqcYYndDhqKs6M?=
 =?us-ascii?Q?gw9dDVeODTbxkebGYowKuV5N3bFeLNJFyWb/5WLYYS08D5YMkfw8j21Yv3lE?=
 =?us-ascii?Q?eMMrYNrazGMwehE2Sy45VAQnfuPmiqe8l++p+gvZX4vq4OWmgDCo3O+QL650?=
 =?us-ascii?Q?xjXMHMOfvGfkOE1YqeC3XkRccxtyQBV8Z+01XZN4r4Xtk3R95+FMQvECl93k?=
 =?us-ascii?Q?ytnRv/hUe6focufb9ddCROx8BnzGK9MryVkaxQnj6ilh0giWzqvI?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33bba334-af17-49da-3c11-08dea1f2967f
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 11:14:01.3286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P7g2lea13EHSsXTBgnBhCqTofhcw/lgEvEkQ3I+qSv4uathHYB3xQnx9X25MrL0mxpa2ije1WB2J/iRY8tss+OcVtR1yla5w18piDN9CCIz4zk37HA9AiWBvQGAVNff3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1156
X-Rspamd-Queue-Id: 5969B45E0B5
X-Rspamd-Action: no action
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
	GREYLIST(0.00)[pass,meta];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35493-lists,linux-gpio=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[11c42000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url,starfivetech.com:mid,starfivetech.com:email]

Add pinctrl bindings for StarFive JHB100 SoC Peripheral-3(per3) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../pinctrl/starfive,jhb100-per3-pinctrl.yaml | 177 ++++++++++++++++++
 1 file changed, 177 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per3-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per3-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per3-pinctrl.yaml
new file mode 100644
index 000000000000..263392a5774c
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per3-pinctrl.yaml
@@ -0,0 +1,177 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-per3-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 Peripheral-3 Pin Controller
+
+description: |
+  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
+
+  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
+  per2, per2pok, per3, adc0, adc1, emmc, and vga.
+  This document provides an overview of the "per3" pinctrl domain.
+
+  The "per3" domain has a pin controller which provides
+  - function selection for GPIO pads.
+  - GPIO interrupt handling.
+
+  In the Peripheral-3 Pin Controller, there are 11 multi-function GPIO_PADs. Each of them
+  can be multiplexed to several peripherals through function selection. Each iopad has a
+  maximum of up to 2 functions - 0 and 1. Function 0 is the default function which is
+  generally the GPIO function. Function 1 is the alternate function or peripheral signal
+  that can be routed to an iopad. The function selection can be carried out by writing
+  the function number to the iopad function select register.
+  Each iopad is configurable with parameters such as input-enable, internal pull-up/pull-down
+  bias, drive strength, schmitt trigger, slew rate, and debounce width.
+
+  This domain contains an IO group which support voltage levels 1.8V, 2.5V, and 3.3V
+  1. gpios - comprises PAD_GPIO_E0 through PAD_GPIO_E10.
+
+  Each of the above IO groups must be configured with a voltage setting that matches the external
+  voltage level provided to the IO group.
+
+maintainers:
+  - Alex Soo <yuklin.soo@starfivetech.com>
+
+properties:
+  compatible:
+    items:
+      - const: starfive,jhb100-per3-pinctrl
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
+  gpios-vref:
+    default: 0
+    description: |
+        Voltage reference value for the IO group "gpios"
+        0: voltage reference value for 3.3V
+        1: voltage reference value for 2.5V
+        2: voltage reference value for 1.8V
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2]
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
+          starfive,gmac-vsel:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            default: 0
+            description:
+              RGMII mode voltage select 0 = 1.8V/3.3V, 1 = 2.5V
+            enum: [0, 1]
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
+        pinctrl_per3: pinctrl@11c42000 {
+            compatible = "starfive,jhb100-per3-pinctrl";
+            reg = <0x0 0x11c42000 0x0 0x1000>;
+            resets = <&per3crg 6>;
+            interrupts = <64>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-ranges = <&pinctrl_per3 0 0 11>;
+        };
+    };
-- 
2.25.1


