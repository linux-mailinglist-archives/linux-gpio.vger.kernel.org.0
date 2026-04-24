Return-Path: <linux-gpio+bounces-35478-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cME3AKVW62nkKwAAu9opvQ
	(envelope-from <linux-gpio+bounces-35478-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 13:40:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CB545DE68
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 13:40:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A5DF03022FB2
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 11:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED0D83B19D5;
	Fri, 24 Apr 2026 11:28:44 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2106.outbound.protection.partner.outlook.cn [139.219.17.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD973B19B1;
	Fri, 24 Apr 2026 11:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777030124; cv=fail; b=gTikcSIMPYxWmf0JhlKbh2f0sdn3PX/u4hF3plBuaXyrDo4j+2ngz562o4oxGCsD5FqQM4f46mSAXKoosa4jpFYhuO6LhgR9ia2B26zoUH5h2ttZMV17NZ0ZNN1nff8KwMIykvdSRbYsjdeygbPeKEPZsu2gk7iR4jgy+2BGlTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777030124; c=relaxed/simple;
	bh=C5SjGydeOwOgwKMSmYFcSUBZJyk1qrAhS2i1v3D9lWE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lqh335Hw9x1r6S8g4NJQfLp32NBx7iQFA5hE85pWhz+QrppmQebqYdGZSz8vq2Hp9FWp0pyHgEjTm/CgtsUubePyHXZ83ZyV9JdUm6zzUL7kkkRKDkiNz1LLTmqP1lFz2+xwKTU+VY9L9WMHPwWmdr7gbsdRU5X+ykV3mUfy+o0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F5sO7zkyPCivRqWg+nMOePCMhKzQe0CvW9KYWChrXzWJgDcUhQYdPEyNka9OceBUBsvvD6+Tf2XnXTdwQJz/jI6RtFvk76qcAG2jSpdcUtr9bPpSvBxm+VlcTmE4hqCBAzR8ZiYGJhdK6REKdHYEJ9gamKk0Kd8HRq6THeXITJ92J/92H+7Pd3xKg0h8rNHQmHV2mCzgsKaCayqrEUbw7guybgwORoyQxs5YcsmJgQ81cCQzqnvjr/2YMEtvYKagn6xVUm7vdbpXS6s0RbRlxBROUc4K3fyShRcxFYuPwYOsUQORJQjwrmXU30f+fbErYQu0CPyIij05l96hNAlW3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OOBX12V8enuCa1I9hEOa7LRD+1VdvxIZ8tOYbTGJeZY=;
 b=CZMdR6hj3rVVcupUbFCn5oJb8d4mlCvvHC+nFsEGqLgLfG6ZUbd2p4wUGqXRBA6ppkoHNXqku9JwwmIrW7J/ZIq+ZjR14nDFRrAsZxTISmw9fMfFRAoxVKSJRF+hjz/im0grTM6NpmGCOp58ZwHDVXynYJk/FNX1pjyXyk5RmRUrtMKFR/Fy2w3U3PTXKV0YtWPGUBoJ8EjxSheJnVk0ruRuzY8et2UOz2s04Q12Qz01J/uSYDT3p7qwg7mZ99H4Qquh3aUpF4Fw3q5Oyrc2+JmFOHuejLv20iiIqbOM/CkS4WA0bgngrgPDviGunW1wj/fD9/FdFdTwlQdY56LjOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1156.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 11:13:47 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9846.021; Fri, 24 Apr 2026 11:13:47 +0000
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
Subject: [PATCH v1 07/20] dt-bindings: pinctrl: Add starfive,jhb100-sys2-pinctrl
Date: Fri, 24 Apr 2026 04:13:17 -0700
Message-Id: <20260424111330.702272-8-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 057d7012-39b0-401e-2ac1-08dea1f28e72
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	oBLRJ+4cP+cFSxsEThkg3QvlqhTji1G7ESSLJk4PaQCS2BeagOx+nMAfMykBjtvEvzeQg6XWZrraHXpGxGNrwFQYO2RElmFF7mpdVIctGeAhsLcD9l39F+6y5XxDCIGkr8x+nDVAvw4NRpKtHHhpIooQ8jrWxaQp8B18OlGabQR8bo8I4K9C9sbGASr8NkzgqEw6yhzqMi2wDXoHyghhUfjzNxt1vQBGKC2PhLC4Gqf4Udb8awlhd5Nyaavha67dtHmokrKECqvIAA5lZBN+Cc7AWbiqURu8stZYaD7IgJFDlVQv7AjoxEvqgbADcWOnJ7wqZUT0TXBTum1Ku8wW8DxtYplQk82/WobKK0IwzMbbWEjccgS6sv4K15P55ozbnqcDDFMgZbbbMm0furGLj6PuG5W+3ImTsE7Yl6d9yCo21IWzY0t391zhmBJCfrDZOtYR1pTml6W7iOM0gcqHo4Wkv/OopwBDm/ot3hGhipBRxNi7gR4zTsUn1iogrM5kl9svqOoVcm033SFAYyskDcWkHIaBMpXMK8G/0+MFiQ/Loz6bsVWku2lePvAqM21aIU6y3A3UVzPGzmpsKcehjzed5kRtylpKOjKfcXlVsYo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1doMiu+KbBMWZYyYag9pxEaAlJzdyVFXVZJaQEZrYRx2qSIHW0otjZfpN9km?=
 =?us-ascii?Q?lCd4KHeBfKi2MiQkmBg19TzIuwqCY5Y7vwjcDwoQID9bwBgkzWdikOUJKm7M?=
 =?us-ascii?Q?yODe8uOjxT97qBdS3LJJXFuhX4xFQlZ++iUFc9U1sleCOtba3SIEgxZuYU2c?=
 =?us-ascii?Q?gyeYtBeW9nK4spP/uKl4gzSm8nk1aEq5JR6fbGb2Px4m0Q+o1OkuVS0DZ2a/?=
 =?us-ascii?Q?syHh6pL5B0x9OjnjxLItyZ+VWuTTx4f1Ij5txtXUwPr1/K18W6iwA+EcnkUP?=
 =?us-ascii?Q?z/qvCwpmUkrLt7Qnk9p142aBRtU/+6w2wKHxKfwfsUshnODNq2jc6kyyaYhE?=
 =?us-ascii?Q?Mj/zf6rUnH0uICzJx1ks07AW0OhqUUiZtB1SskXQOpJ/MSiQK5C0tDfW5XVO?=
 =?us-ascii?Q?luYFHG2gfAVMeYayG4qM41El5gMQ+g5MkMpIlSEF7qrQgR8elH14dJixLkO5?=
 =?us-ascii?Q?rYIo1mLMoEh+W9Uk9TYfQLFvyTijcj/iHEa5tG+joO1Awca3UZCp+4oPBzAI?=
 =?us-ascii?Q?GDhv3wEZqVhy6XTbVzI43l6Axyesdu224KZWJeXpIlgOu5Fz0Cuu9/d9TDQq?=
 =?us-ascii?Q?FvEQhgfpYqFfWX9oWkAifAw9CkAi/GA61ZiDZIaQ9tgcWU0qL0DU4vQkihXp?=
 =?us-ascii?Q?LIRRWPLH56YmiEWOaqct0r2icTuxX57LHqsZ3zEEL9tZ0h8eTfti67no+fmH?=
 =?us-ascii?Q?vVTlFfuKHtJoodfbpPMX8bcnOqbr6MdJU3o1EYFvkS9XISWDPnKk7dXDPoRJ?=
 =?us-ascii?Q?NDZNR1RTnqRyoS2EkJ2jr3xueMXGludG4suELm5GeYOWGYfrgigRL5bK2QUf?=
 =?us-ascii?Q?KqJl55oQXUfKxuvIt1mT1U3F9J0aVRPP8RAelAT9WmNl6QKsSOUs50e1u7sF?=
 =?us-ascii?Q?lpDBj3i+BzKZm1Vr40A1uKjWNchKKSrzoQ/D3oYD3BIYjLYilsgMPFJXfkhL?=
 =?us-ascii?Q?FnkHct8nPZcv1MoCCd6Xg9ECYNf73fZ/qgYHnSRYJLPjxW8gB1iklMaTV/mS?=
 =?us-ascii?Q?eEBmHXkf3Yfd4blJtmWx9D2EUThZbdLdOj4lM6dPnrIvjsVKNASq9DT/sm57?=
 =?us-ascii?Q?SBFph3DqDTeJDi71q2C0HylOsLlpkDxSsagVnuvOTWjusnL1nw4gst7GIA8v?=
 =?us-ascii?Q?lTdSJ22qqcZyMbYV611d0QaZDpQ1bOMmrTlV0NWekPDdXQ8+GscFOvrkWEGA?=
 =?us-ascii?Q?/wI9+wJ7PLcJtNdJ/8HjC48Cxgjj0fpbOOOSCtVK/tL2sok7/cLHFHMvwINe?=
 =?us-ascii?Q?rMFblcnLZpDCr0JdRXmebyjg/ye91pBjK/X2ucBIDc2bzWsos1NlCSnqvyIF?=
 =?us-ascii?Q?vbudZDpm9J0nnCKAOXq/cxhByu6s3i+lfE+SjUmXJOY7ug3TFZ3ekD+iQbJe?=
 =?us-ascii?Q?stlRO+EuFTxbJt/z7iZkin6oo3G/5pNN/2eTUp4njF0uUy5LBYhUmaPy3O0t?=
 =?us-ascii?Q?G+geDZSTCIX3/21Hy0GlyxjtQFtOADGEqMRJUKVcj2EfjgNPWwQVxY3HrquB?=
 =?us-ascii?Q?L7GDY4wedTQpt9VHpPPKdMiUvKwGYhR72EHBVourJipktmltmTDrpan4FdLO?=
 =?us-ascii?Q?IABQufnRkmLsJ4KREzpjfcQ7CI7zi0rwVeZt2dlyf/RGBuMbH9C4IR1dDIrO?=
 =?us-ascii?Q?x2RpgwztbSS3+CmsBsKL9Eoaf7GFvu6RQCnOFu+pewJC7yZCWjAZKFySd3tw?=
 =?us-ascii?Q?LmZ4QKa4O9gepGb/fsUQOJIrQhKL/Yy41JWDUfDf2wWca0IocP8QUisS5GKE?=
 =?us-ascii?Q?6dTmFY4ALVAgRBCwE59I6Avr6JI/hK6n8cZGukW4xDKKEo+61AAK?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 057d7012-39b0-401e-2ac1-08dea1f28e72
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 11:13:47.8073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RrwGLIb2W7wCYIWHjcw0q8eYuhfWO3U1udoBd3sSyacuGQZOtk7K2e9bjEoLjXE6somufrKjiw6cwaTmK5fYeEfgIjY/1M7f7Jojld6cfoQLI4nkD6j+MAWzQBXE8Y4V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1156
X-Rspamd-Queue-Id: 57CB545DE68
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
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35478-lists,linux-gpio=lfdr.de];
	GREYLIST(0.00)[pass,body];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.992];
	DBL_PROHIBIT(0.00)[0.199.157.144:email];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,starfivetech.com:mid,starfivetech.com:email,devicetree.org:url]

Add pinctrl bindings for StarFive JHB100 SoC System-2(sys2) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../pinctrl/starfive,jhb100-sys2-pinctrl.yaml | 178 ++++++++++++++++++
 1 file changed, 178 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys2-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys2-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys2-pinctrl.yaml
new file mode 100644
index 000000000000..9decffaf0b72
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys2-pinctrl.yaml
@@ -0,0 +1,178 @@
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
+  In the SYS2 Pin Controller, there are 37 multi-function GPIO_PADs. Each of them can be
+  multiplexed to different hardware blocks through function selection. Each iopad has a maximum
+  of up to 4 functions - 0, 1, 2, and 3. Function 0 is the default function which is the GPIO
+  function. Function 1, 2, and 3 are the alternate functions or peripheral signals that can be
+  routed to the iopad. The function selection can be carried out by writing the function number
+  to the iopad function select register.
+  Each iopad is configurable with parameters such as input-enable, internal pull-up/pull-down
+  bias, drive strength, schmitt trigger, slew rate, and debounce width.
+
+  This domain contains an IO group which support voltage levels 1.8V and 3.3V
+  1. gpiow - comprises PAD_GPIO_A36 through PAD_GPIO_A39.
+  2. gpiow-inner - comprises PAD_GPIO_A40 through PAD_GPIO_A43.
+
+  This IO group must be configured with a voltage setting that matches the external voltage level
+  provided to the IO group.
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
+  gpiow-vref:
+    default: 0
+    description: |
+        Voltage reference value for the IO group "gpiow"
+        0: voltage reference value for 3.3V
+        2: voltage reference value for 1.8V
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 2]
+
+  gpiow-inner-vref:
+    default: 0
+    description: |
+        Voltage reference value for the IO group "gpiow-inner"
+        0: voltage reference value for 3.3V
+        2: voltage reference value for 1.8V
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 2]
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
+            #interrupt-cells = <2>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-ranges = <&pinctrl_sys2 0 0 37>;
+        };
+    };
-- 
2.25.1


