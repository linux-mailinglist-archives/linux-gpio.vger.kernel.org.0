Return-Path: <linux-gpio+bounces-36824-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGBsLJKwBWppZwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36824-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 13:22:58 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 398BC540F5C
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 13:22:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC66F30A4B7E
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 11:13:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 604983C09FA;
	Thu, 14 May 2026 11:13:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2094.outbound.protection.partner.outlook.cn [139.219.146.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B313BFAEB;
	Thu, 14 May 2026 11:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778757183; cv=fail; b=AWwjUZIxFi1q1rn8bRRnSs/9DMk7MGUVX5vdBcxeSsyDlmB3Gg3V7ukG7MvquL7/y65j06JZQeARO74rANsqTDUkHOkRJkp2cIkPJl70W9I+QE/RliROBbCzqcT092g0QKO2NO4s2jGDyrv4aOXbcnZSf+yDvUOftH4nmmQn0Ho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778757183; c=relaxed/simple;
	bh=4SxkxRGtAbdVLVCQggM9s2y2TyUIOQa0cL6y+kbNj14=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NSiP4B2miszUBcGQKmNKFulEn461hjUUQ02i7ysYUeJPnk9QF3XPePOMrdwdi1GtPwW9wcv6wS1x/tvF9bFoPGt34ZpnP6o5NLZ+pQQ34U2K7r0LXWIjJWVkk3u0sPw35ThEm6EQuqsJauvRSmZiNxZgn+Weodv+DqUB2WYaj9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NkGB3rA+eNn+IJ/saix6i/RukcrGqVpVT+GCq5AqoWUB7Ci5ZwzzzNaR6qmwUzuPWRw1w6jgU4gFfAqYbyC7UYvwFZMwNrW/2Xi5SB628DblEqV7kCnCIjw765bd+dwidTkzotrOpku0UALdxoriNeITZ8HF8IyqE52zLD6YWdgi6dflmH1J/krQG/iTo3if7gW/FPkkiYlkNF1AXhNTtmXKMESDGBcQEWlGE0GLV0kBTc2dRQmMMZD9HtwAk4H3vaEmkyibRirMkd6lm/ZXwwj8AW2nPRyEFL9WswxaT4mHVIvv6it8m1yUH/5eGhOgIhbJRY1w+okwXk/bxsOYNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OdXSi17cp/7j6yCBKlD0XbhBPl1ZGVvv60Zpk7B0H4A=;
 b=QeDooa5Fqmf5hBRc55rnqTB43a079h3w5bdLnhWi/Q6TyuM+LVfh5fkWKynVRvg9gCMv7s/vu9wkpljhWf1YcenK5eSss6VP3REujxpbGQg+apSpTWhGaUVkLR6BboAGXTM6dLSj/xt5JFHXzTzSs7DqeWCxkjmyMWMC5lpmlxBQZJ8bI2Nt8DtFsH5R53C54mWs70V55RjUTiOm0V7h90Dh5xb0Z7/zyDp5l5aICiJRJGVyUX7MTypXIBJPg87tM7Z2cag5tgYfGc33+lzja8IQpRJSW3y1SEVEBDYJ9TjYh8kVOqqEUpFDAUhEq/ZMCs76OTrIS6mY0J1xp6C+LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1139.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.25; Thu, 14 May
 2026 11:12:45 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9913.009; Thu, 14 May 2026 11:12:45 +0000
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
Subject: [PATCH v2 12/22] dt-bindings: pinctrl: Add starfive,jhb100-per0-pinctrl
Date: Thu, 14 May 2026 04:12:08 -0700
Message-Id: <20260514111218.94519-13-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: a6ddb197-d708-41bb-12c9-08deb1a9b9aa
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|921020|38350700014|3023799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Qft4KA4y9GJdA2Ndw2fwt8PZbEiZciFGC1i9imbmS+b0T6Xb977m+QXP1q7ZI+NJSUtJUgDilizSmo4a5y2VMW9G459xYRKrepWwpar8jJdIWaCmLFadZ0oyFJzl/7bGlBBw2pV1IVrEK7s1RyRddqH2j9rs5R8+DnpyZSa2sQvguA8lyw4lXaELRI6YzDQ+LYEzDXSkMRliof0Ksfjel8Ttlufy8F0nQfy69t2qWx48eNJA5Ix3DeT5lkKOwoYL/alnAD2FqzNsgukJmaAZrkWGrizJlhTxOkswNceDnLIRctprqKeTW9M7XGRnO7bBQ2C2vG/va+qpd6TAlbdWC73nWyPMrhuYa4lIiu3UMEhK559q5aJXIquZnzFaMFBI/kbv/UudbRbpxmG5CK8vuat9aAz26oRHIEJi4ysyKZXY4u2LP6BKCnpwf7SrIxmk1jm8s1MdJuaUbTFjCkeKcvofgd2Q065hQn6asQLwqv5B+a4nytHe6kst9ol37X1fkuRHf2lywoZDu1/b33kC1xZg1QwckEmELp04+lDQEO2xheY99yiiNHCeWNSlTaz9L5DU8xgCWWxouty7nmopXw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(921020)(38350700014)(3023799003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5d7jw7VT0mmH7fwCEH/wrjdj200xhokpF4R2WvBKUFGZbmpzF7UJhYmDgGyR?=
 =?us-ascii?Q?x7qk3oWyFZHiP7dcZeusAIWDct4aBWiMnafopEvdh6M5U7LquIeNsh3bG4bF?=
 =?us-ascii?Q?PhoXsN5x41+Z2lQNalQYrLeINHjN/HlczAryvwJRnYqge6fZS9A6V96O0vNG?=
 =?us-ascii?Q?17oidxf+UwF1qwc+4yoCDGorGlwRz8ZuuM+N1SqP1NRxb42Wg48ghsRfOxf9?=
 =?us-ascii?Q?6snh83urh1ojh8yvpNGQWNGVTSCqpas/rPnsZXMxL/eyjA3i2tIyDkuKIH7v?=
 =?us-ascii?Q?9oQD9j+Jb9AEsPyeCmAUgsKz0JkB3L7hvJsXiykeXUigdLmDBjXLRmcKTYG4?=
 =?us-ascii?Q?SC7l+tFO0RhVPRhoB3OwHq58mtU3fI2mqwy91UKJiiG95gB/tQkeQ4mI66WC?=
 =?us-ascii?Q?JDfkU4uOHfy7lSoPJKoKojTYp3+cjKZTWZRgWbIb/cmJr4mfveHeyH73a5/S?=
 =?us-ascii?Q?fkpZv3c36PmdpbFOaoxacHKj9N/NkFONDdftdORVs6rQm0ZS+8ElBFX7XEBb?=
 =?us-ascii?Q?6tTkSF+MvabpPg+PezDeewC+s6UKXFYZmd4txQqINa2mCtUlKvRZQ7IeHfKN?=
 =?us-ascii?Q?3etGbC1ypyqxNuLCv5cwCswSn8wGzdt8+5PQPStX1Ad2ACqSf+FsD4KuQyEl?=
 =?us-ascii?Q?FTwnaCtxNQJRQI35f6JIke1Q1LDGBqX9UQYiS7RcEBVzt5jjP17gbpGYqLFN?=
 =?us-ascii?Q?dn6qIPDKh+Zyzv9cebTITYUhcjVdD+X1dOQXVO1Yv9zK6hakA9+ToY8fLyiB?=
 =?us-ascii?Q?y2mj0AOjtOD+edb1chmghdbCUWxd4qs3JTis5iinpMp/yA+pZvGf10FNzejA?=
 =?us-ascii?Q?quker9e3x1EZQsCvQwNIu9/w78pi3yoKLZBnCeXnrA/qEgXJBRyRPHWu3lxG?=
 =?us-ascii?Q?fTk4YfFjMYeIWYlhvF3fLCKwgLxZRQMCxvJoqAW+YbqKVLH49v38aIHgEgdV?=
 =?us-ascii?Q?mPl2ylzRfA4K7XQWh4XSzwrR4dCFXzJI4lXvjrNtoFTWOfqXKYkZf6BnMWrq?=
 =?us-ascii?Q?oCekSr3itJB3hh9DPdo1xOiukrQHBBC1gnwc2AUWHCjc+nqLOE5o+gR/FftN?=
 =?us-ascii?Q?9PA/mvWVInEqm3wSqHC65ss5QPK9cPBf6bsHqpflH83cxLlgMLy3fyDUL5HU?=
 =?us-ascii?Q?tYnQhe4p9p574m3hS8anYTwsmpqDwWuLx/EQwK+TWZb/MA5uCDAV137JpwMZ?=
 =?us-ascii?Q?EuFByxtm1qB82cgdeGUGi5/R+QHp7pIyOKx7hK4Le9lO+7Sr2Zz76RqyJ7to?=
 =?us-ascii?Q?fHtfE1VotlMBEMjH319GwJJG6jTFtDFj0x+76nzCMLxeKtQKzkmI5fSicEBH?=
 =?us-ascii?Q?ENRGDKdGUeHJ4qh6cjkIXAu8EzyO01JbNs5me4S4ByvM7lnncbJJsbJ9svV5?=
 =?us-ascii?Q?GdrnFXeMnZRR+3VbqYcprm/ldI5b2a9b700RS8jKvZR2DJe/elFjuKXTDq8J?=
 =?us-ascii?Q?KG6uidKRQeXLYDlWupxyihwJE6ww0TYzwRJggOEpmIWIxbWPPP0iIKOMJi3X?=
 =?us-ascii?Q?fabiF3DIba9Fe04cP5AQSNE/rRVvjDUL2zx8f29xVkLPvz8r69WGtEZox5Gq?=
 =?us-ascii?Q?vaxM39pCv8HnZSqaPYUHu+jRcsoG+J2X/th3N1pR86S8pvLjtSr5QC0gbnV1?=
 =?us-ascii?Q?V48Swc1h++kNf/e7CdSDrN1KD3G8ciiSZ4DnfehPiA1cgwJ4IFCt7oiNNvH6?=
 =?us-ascii?Q?yXpuRFjAVfPDW87PU31pkbq/229JWvcIVPq8jsVxP7dvEI+QR5WDZyCotKvG?=
 =?us-ascii?Q?zvv0KM/a2bh5mgnvyRWaxGZR+V9RkYm2S89tb+HoFnmnQjI5El4Y?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6ddb197-d708-41bb-12c9-08deb1a9b9aa
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 11:12:45.6785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EkZ4kbEgMQjsLWpVVnXE4DRIUBEwByr4Y+vPtyE8R8K/s3KvJQ50MeZKCisHLYvBKzmytQdZDt8lpEW8IMrPGKzqY4JGtLn475ewmDqATO1AFpzgkIooK9Eex9dUJbqA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1139
X-Rspamd-Queue-Id: 398BC540F5C
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
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36824-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[starfivetech.com:email,starfivetech.com:mid,devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,11a0a000:email]
X-Rspamd-Action: no action

Add pinctrl bindings for StarFive JHB100 SoC Peripheral-0(per0) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../pinctrl/starfive,jhb100-per0-pinctrl.yaml | 176 ++++++++++++++++++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  62 ++++++
 2 files changed, 238 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per0-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per0-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per0-pinctrl.yaml
new file mode 100644
index 000000000000..9f2144c55844
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per0-pinctrl.yaml
@@ -0,0 +1,176 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-per0-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 Peripheral-0 Pin Controller
+
+description: |
+  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
+
+  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
+  per2, per2pok, per3, adc0, adc1, emmc, and vga.
+  This document provides an overview of the "per0" pinctrl domain.
+
+  The "per0" domain has a pin controller which provides
+  - function selection for GPIO pads.
+  - GPIO pad configuration.
+  - GPIO interrupt handling.
+
+  In the Peripheral-0  Pin Controller, there are 60 multi-function GPIO_PADs.
+  Each of them can be multiplexed to several hardware blocks through function
+  selection. Each iopad has a maximum of up to 3 functions - 0, 1, and 2.
+  Function 0 is the default function which is generally the GPIO function.
+  Function 1 and 2 are the alternate function or signal of an iopad.  The
+  function 1 and function 2 are other optional functions or peripheral
+  signals that can be routed to an iopad. The function selection can be carried
+  out by writing the function number to the iopad function select register.
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
+      - const: starfive,jhb100-per0-pinctrl
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
+            enum: [ gmac_mdio, gpio, i2c, i3c, smbalert, wdt ]
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
+        pinctrl_per0: pinctrl@11a0a000 {
+            compatible = "starfive,jhb100-per0-pinctrl";
+            reg = <0x0 0x11a0a000 0x0 0x1000>;
+            resets = <&per0crg 0>;
+            interrupts = <60>;
+            interrupt-controller;
+            #interrupt-cells = <3>;
+            gpio-controller;
+            #gpio-cells = <3>;
+            gpio-ranges = <&pinctrl_per0 0 0 0 32>,
+                          <&pinctrl_per0 1 0 32 28>;
+        };
+    };
diff --git a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
index 89d344763540..0a8494b577e0 100644
--- a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
+++ b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
@@ -77,6 +77,68 @@
 #define PADNUM_SYS2_GPIO_A59				35
 #define PADNUM_SYS2_GPIO_A60				36
 
+/* per0 pad numbers */
+#define PADNUM_PER0_GPIO_B0				0
+#define PADNUM_PER0_GPIO_B1				1
+#define PADNUM_PER0_GPIO_B2				2
+#define PADNUM_PER0_GPIO_B3				3
+#define PADNUM_PER0_GPIO_B4				4
+#define PADNUM_PER0_GPIO_B5				5
+#define PADNUM_PER0_GPIO_B6				6
+#define PADNUM_PER0_GPIO_B7				7
+#define PADNUM_PER0_GPIO_B8				8
+#define PADNUM_PER0_GPIO_B9				9
+#define PADNUM_PER0_GPIO_B10				10
+#define PADNUM_PER0_GPIO_B11				11
+#define PADNUM_PER0_GPIO_B12				12
+#define PADNUM_PER0_GPIO_B13				13
+#define PADNUM_PER0_GPIO_B14				14
+#define PADNUM_PER0_GPIO_B15				15
+#define PADNUM_PER0_GPIO_B16				16
+#define PADNUM_PER0_GPIO_B17				17
+#define PADNUM_PER0_GPIO_B18				18
+#define PADNUM_PER0_GPIO_B19				19
+#define PADNUM_PER0_GPIO_B20				20
+#define PADNUM_PER0_GPIO_B21				21
+#define PADNUM_PER0_GPIO_B22				22
+#define PADNUM_PER0_GPIO_B23				23
+#define PADNUM_PER0_GPIO_B24				24
+#define PADNUM_PER0_GPIO_B25				25
+#define PADNUM_PER0_GPIO_B26				26
+#define PADNUM_PER0_GPIO_B27				27
+#define PADNUM_PER0_GPIO_B28				28
+#define PADNUM_PER0_GPIO_B29				29
+#define PADNUM_PER0_GPIO_B30				30
+#define PADNUM_PER0_GPIO_B31				31
+#define PADNUM_PER0_GPIO_B32				32
+#define PADNUM_PER0_GPIO_B33				33
+#define PADNUM_PER0_GPIO_B34				34
+#define PADNUM_PER0_GPIO_B35				35
+#define PADNUM_PER0_GPIO_B36				36
+#define PADNUM_PER0_GPIO_B37				37
+#define PADNUM_PER0_GPIO_B38				38
+#define PADNUM_PER0_GPIO_B39				39
+#define PADNUM_PER0_GPIO_B40				40
+#define PADNUM_PER0_GPIO_B41				41
+#define PADNUM_PER0_GPIO_B42				42
+#define PADNUM_PER0_GPIO_B43				43
+#define PADNUM_PER0_GPIO_B44				44
+#define PADNUM_PER0_GPIO_B45				45
+#define PADNUM_PER0_GPIO_B46				46
+#define PADNUM_PER0_GPIO_B47				47
+#define PADNUM_PER0_GPIO_B48				48
+#define PADNUM_PER0_GPIO_B49				49
+#define PADNUM_PER0_GPIO_B50				50
+#define PADNUM_PER0_GPIO_B51				51
+#define PADNUM_PER0_GPIO_B52				52
+#define PADNUM_PER0_GPIO_B53				53
+#define PADNUM_PER0_GPIO_B54				54
+#define PADNUM_PER0_GPIO_B55				55
+#define PADNUM_PER0_GPIO_B56				56
+#define PADNUM_PER0_GPIO_B57				57
+#define PADNUM_PER0_GPIO_B58				58
+#define PADNUM_PER0_GPIO_B59				59
+
 /* pinctrl hog power-source value */
 #define JHB100_PINVREF_3_3V				0
 #define JHB100_PINVREF_2_5V				1
-- 
2.25.1


