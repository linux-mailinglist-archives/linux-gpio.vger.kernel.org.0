Return-Path: <linux-gpio+bounces-8530-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0FB945579
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Aug 2024 02:36:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66262286408
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Aug 2024 00:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53917B64E;
	Fri,  2 Aug 2024 00:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="eHHkFL8X"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10olkn2106.outbound.protection.outlook.com [40.92.40.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA04EC156;
	Fri,  2 Aug 2024 00:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.40.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722558960; cv=fail; b=BrAkk+huHzLrXXdxFeCpfd4REk7ku4hGMXSh5YHae35zYJiB1PsNwxjMGedesulVZ5ejfCyN6R155KyRciO2npj1nFfkRWWS5IA3iOnPdeh0LUOyvHUTYeSUh/Py1W7LvacRt6QTKEPY4YvKmhbnyz9LIfOPCB9Wz1aZ/GUmSTA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722558960; c=relaxed/simple;
	bh=H+o5MDAkYpghLAEM3NrbkZZ7dOhzteE6z5aswUsrGPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZJkk3p7BUqpQ/+Oyp2N3/XDXFouLDMha+H/iHIUS1Nk1evhzcR14RvhPh6kSomBuDxB9BG1i4k+e9Rt9Cjf7fIk8QtJTQl2YS+4jb8DAvwjlYeJroFfN+lPOmWWis6KDxf0UGUAf83/G0mbBTgwYJq6+H5mt/LdBafngKjTOEcA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=eHHkFL8X; arc=fail smtp.client-ip=40.92.40.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ihIn1O9IgXyNnPKIIGgO7yYKQv/cGHiJjwap2X1Die7hAR6LTOxMhU7U19J7VtCmQTqQ6CuwkQ1Icv6O7Zt7itUhzLyAvJ0KhW1KJH//3mJKMh4y6HtwZZTySpKdURRNYg3GaaLnJbZnwDRs3htM1oRFZMwcwCIJS+fK6ckpxvkjXvOygZx67ZNnUnPrPvLUI5AaBJaC9mHZm81G4ZEEqccE51tz2Qu0H0uLInFNzE/4RyJnfkXQxxu8kPgLDjev9O/jcwjIl4mtsYruj6RzJ+wagZzpzkd7vtj0ysJF+FFJPLvp0Dnwj3cHcQEtAbXl3iimOIqc8lIgewlFwftsXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wszzSdK++oKpFw28Hk46N+L13tyB6qvWJ23Lb3hIp1I=;
 b=eWi6/JY3/fFcAaKSuulutYQ54KuPtbAzOB66qpfruZ32zo1SAzp/bdXHCNlUz9qdrsMHORPbPpU+LQOG38s+GV8gU4bruxoHjpgo8PdXaV9sRimi2OwAYYN7Ssbx+6f1vFk1gfpmz735PBdyj7ULSgewPxfDfiWJeriFUJxWEUsaxvE88pB9BRy7/HVmI0QDJnyjtVnlqtdrwV+8wuiJwlNcmeoKvKz8UvafasZqICGRiSR7qnm5oPprYIUSLfj7yfBy1xi4YAB411oxLNeya6m+q81B4v41jfj/adZnDdGwCKCiuMjvMTIUTFg9KjftsnnjW0rd1GyH8pVMZxySMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wszzSdK++oKpFw28Hk46N+L13tyB6qvWJ23Lb3hIp1I=;
 b=eHHkFL8XGuTT8yD18+Lfdh+/yZznw3i3pV/ETyEMNQ5nE62lfdbgjmlkuIMW25/yILoliROSnZhcJCtGwRfN9Ve05hDOUwqUS+ZnVPMkdsgzOP9O0iS/AgKOncB2xhEb5+l/ALkj6EXsFVXHMQi54v4jLvClt8P1G9GeHcpwAONPdnuGjmRI7tXl0K68MftjfPLK6hsACbpdGO/qnHvDRHtgfbJ8QgQbm4zLpgTl34CvZnIuFOKw854pPvGE9GtvSnricl9Ly9TUxbPSkNh3onvhuj4dO/cj+kHW7J/jJKfMWqeBTJ5bBl5LCsaIgWMr1x7O/7OnQTxkhN4tAi7DmA==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by IA1PR20MB4954.namprd20.prod.outlook.com (2603:10b6:208:3ae::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Fri, 2 Aug
 2024 00:35:54 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%4]) with mapi id 15.20.7828.023; Fri, 2 Aug 2024
 00:35:54 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Drew Fustini <dfustini@baylibre.com>,
	Haylen Chu <heylenay@outlook.com>
Cc: Liu Gui <kenneth.liu@sophgo.com>,
	Yixun Lan <dlan@gentoo.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 1/7] dt-bindings: pinctrl: Add pinctrl for Sophgo CV1800 series SoC.
Date: Fri,  2 Aug 2024 08:35:16 +0800
Message-ID:
 <IA1PR20MB4953680DE7977CAD906DBDB4BBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <IA1PR20MB4953DC78BB0FE0C57EA94F91BBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953DC78BB0FE0C57EA94F91BBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [3R2hAtYpNrLOlZz/yIIgY8x0hIrYDw+NLYscMLcSa9g=]
X-ClientProxiedBy: SI2PR01CA0051.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::6) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID:
 <20240802003525.260055-1-inochiama@outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|IA1PR20MB4954:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c8b842b-abc4-4a64-5503-08dcb28b1134
X-MS-Exchange-SLBlob-MailProps:
	5R4zPSLKzf6spdwYdm+J9uUz2flLO9Wk1iT5jHbKfWPHk08aBg9zCd8mFcQGZCe+8krpFfWzXEt2RwE6XNJ2Azql+urnAvO0GbiOalj7QEKIW67z9C/1hGfIU7Oto09vjCTy1T2+jEdsTZJT5UsmZrYW8mV/BtKiVFQ45vkjp/M/gN4tLEOX+BoiCO/1Y0zml9v13W3qlKOwBrgCKLAuZ/dwE0WAjCfug3vFfpm/SXWQrebr0KYrqlqzlO/YULFUBrw29KckQQeb7dyPG6+JPiL+hzkhkD11BSJConZCKQx70ySYdM6M101R/Z+tiNiPJ4nhv/XBePvAhaRpSHHYwWWvXhH+cmsfdw3urOk4CoPWVmFeF+O98Pa/jZxBXsy/ZrA69mnMxiZMvyCmefXfNyaCXG92Bp3w2GYGxnb1vYRtCctMU+OqUO9XEVX/l1O7kTNYH7I/rL/gM4C9mFl2AV9092jpP3Pe30BRQfNIduAulPR3mkDBm6HjzCZ5Ao60qKs1eQwCiAT8NEhI79k6pxd8ykjGRh/N9pc/wFG/yYPo2lCckBPTMnsw9+Hp2V1CGEVuy5A351v5F8rWHeuSp8DUpTQp2xLGgo7uncbkmkJ7tp9AMFAEu1MTkcJ5iJOiTHSv0Zl9J8w+V0gue6yaIz38WXvc0p+hLLy8NOLUAzB6vsHeynTc8/PVBthPbOGUnkL+DOFyAw2uNqB8wPX43S6jbu6kqD16ToMIsY7xpAFUWxt1MUwXbqxIs/yQtu9J4KxAnHm+dZXvAbd5tX2lp8g/USlevQrLMH1gK+VfjOxN6QTY+dKJl/Tq1BwjzKKHA+PoS98lJsWZWEvo01oTo87f8wyvrNcr
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799003|5072599009|8060799006|461199028|1602099012|440099028|4302099013|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	8S0haj7UKWuVGbvhd05mvKz4HNc3CcsGwhdekTCASFuawatTgJ7GfjKOaToBxjWju+3UNAwAIpgdDEsvDj0yXdbNBxAWisE/LZhK5NQ6HIeD6xuQ7HaQZ503apzkOqJMOn4cE1jvlVPPOQY6iyaLKKnATyAbfG9gjYVAO/VLJUmUW2ONsgRaJPuIh7/zXIhn5iJQWCYdsi82pMEWAo4ICg6tx8LoFVuciHEdUaS2rrKPMQnsXXIA7/GxwiYH1stnGV56jk6bdwVRQgXn5KIoPz0lTOdghn8U9iPvdzxSNPpTXPfDMywCjsjYWcy7UhjrsUa6pYjFr+mBMNH7DwgA6I+8HaTAXtv7YtzmR4vZam9PRfsn+cVRpOxfGt0dfDdROz0Qeaeb8fhfpbPs5uVK+MNfDrXQdZd/bfcgClec0SNhrW7ttEVU2WKbvTlFuGroSH3wclC+qoIrtHm25KYdlNi+n0fuonuYayBc3smic+lKE4hhVsLtZUuS0oof35pjShzC2cFQkSExtrgWhB6rTyT260V5IR+g7N7bBChfm3g9hD+07sBWHpMdnqTyww5cxAwNCW8+smackwFB0RaKW5XriwmuCGOiyKBdcAS7vMYAZjE2bA9qgUUZTjh5Mzc23XcptwqI/8vCw5ejT57XBCx/Lk3Zs5eX1pVTjfl+jdT6kSl7hNRSE3NmmYoUkyXD2/LYgWi1hqdC+oKLshME1U+8E/JF8iwjL95OySVvBOdbX86Ojsdag9K4GD3lc4HZm8pmbfbet+S9ZGbomXOCTqhUHhv3njAcFYurXpithsYFwivt3PfFmRMTFoXZcPxSpV3l0Dd/1bRokIPzVho4HQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UIFRCelqarrZtUXUjiNbOp7zFcoXVKcNd5Jh4ZIWS1g3ddVa4XiPraf7jKRt?=
 =?us-ascii?Q?9x+nsOi/QJxqfHZ9wVtvICXe2gu+KBplp/g9ts1x2xNRCyCQt+ZMwIZdNDs0?=
 =?us-ascii?Q?j8RHNMavw1JQlOM5MVMavSD/hX2NLwAtThQg+QSsZf91EL2Wb0CeXlhqYvwZ?=
 =?us-ascii?Q?FstxCex+h8bYc2uOOUVHMdH91cgfmZiqH5fiF3NTp30XhURzHdLogknOCURB?=
 =?us-ascii?Q?9rDxb7VkSK/Gyis5f684i4KFLFVICYcehWCJDlOb5GbrbCl1MxIWeDUfRc0o?=
 =?us-ascii?Q?UWSTKvuFroGZpqmPZ6gEk2Okh8izaFDnjB/xSxjZLWRKXNrSRMNtVXZU+ZPL?=
 =?us-ascii?Q?S6InpftlN71vhYWehqj1/fjFWknrMF/je7LTmqGElS/PISZzytN2ud7oz3RI?=
 =?us-ascii?Q?6nzz9vW1S1aJ4Y3Sj/rNiUJAiVHdayJL6z47F8YpPFsP/h+51HuLIs2r7ZZS?=
 =?us-ascii?Q?wHTZHzgDKQ+54hRf9EEIe9YBpXfuHbAKQ5So3VNCTvLol7+57f5ijzS7od6p?=
 =?us-ascii?Q?o4+CU12H2sdOt19oJ9ENcXSDqstFtCqeeS0DP3exAPZAfUYKtXN+k0aNQJel?=
 =?us-ascii?Q?831FqBHIvFd7hdLcOk3FcqWJ1hp94muSKoy+3KbNmRP3TdvtC2Qm/W9NMU03?=
 =?us-ascii?Q?8DIZQgha4/xJWtvejYfb4rnxi2xSC1Q/hs/VFQUcU0DftECxnvpSd/DJRjbX?=
 =?us-ascii?Q?RXnW199zNmwfL3i20PnIH1HhqSrJGvUj0c/hQ4b2YzS7rOtgyeScNJrJc4I3?=
 =?us-ascii?Q?/hpa0kC+HJXqzhx7ixuCjD3M4UFJ5JPg4a7aZZGooKBaEJK67HL8N07Nww25?=
 =?us-ascii?Q?cRQly4sa+KHPrjwBroKKtNmBAm0tpir+CnghO+MhQUaE2taJmITcNMGSmz2k?=
 =?us-ascii?Q?2Z7Z3pw+KulVeHb9aVL6FTto3Yp3ZRiCeQBQP3tYMCt4eNGmvkWuImYoLn75?=
 =?us-ascii?Q?ozlQn2ePq2mkHnim+1RVR+oc2ozPByWUb4HOUzwnrZNC8zlOubKzH/BT6s60?=
 =?us-ascii?Q?EI+84xYWotupzDSBQeWmX6Kls4IQhApGobpmPdLIvgMXQBQrqw5o/38mIW4U?=
 =?us-ascii?Q?I07wV3cVmy3ZtALR40bV1gJesJunAiYJKkyJSijYus6PE1Zlsy3UchV8Jndf?=
 =?us-ascii?Q?L+i7sOYN7CYAH7ALpX8aO6HB8xYoyilMBJ23qfth0VNrWWQn7fDZZAfazf1M?=
 =?us-ascii?Q?JGjLxPi4aXmnERJ+Coj/fop1gNGsoRcEedBfxb312qjqAl4y4Q9UCOavoSLn?=
 =?us-ascii?Q?xmM6mz4+WC+lpYNapHWH?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c8b842b-abc4-4a64-5503-08dcb28b1134
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 00:35:54.3499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR20MB4954

Add pinctrl support for Sophgo CV1800 series SoC.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 .../pinctrl/sophgo,cv1800-pinctrl.yaml        | 122 +++++++++++++++++
 include/dt-bindings/pinctrl/pinctrl-cv1800b.h |  63 +++++++++
 include/dt-bindings/pinctrl/pinctrl-cv1812h.h | 127 ++++++++++++++++++
 include/dt-bindings/pinctrl/pinctrl-cv18xx.h  |  19 +++
 include/dt-bindings/pinctrl/pinctrl-sg2000.h  | 127 ++++++++++++++++++
 include/dt-bindings/pinctrl/pinctrl-sg2002.h  |  79 +++++++++++
 6 files changed, 537 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-cv1800b.h
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-cv1812h.h
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-cv18xx.h
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-sg2000.h
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-sg2002.h

diff --git a/Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml
new file mode 100644
index 000000000000..1e6a55afe26a
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/sophgo,cv1800-pinctrl.yaml
@@ -0,0 +1,122 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/sophgo,cv1800-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CV1800 Pin Controller
+
+maintainers:
+  - Inochi Amaoto <inochiama@outlook.com>
+
+properties:
+  compatible:
+    enum:
+      - sophgo,cv1800b-pinctrl
+      - sophgo,cv1812h-pinctrl
+      - sophgo,sg2000-pinctrl
+      - sophgo,sg2002-pinctrl
+
+  reg:
+    items:
+      - description: pinctrl for system domain
+      - description: pinctrl for rtc domain
+
+  reg-names:
+    items:
+      - const: sys
+      - const: rtc
+
+  resets:
+    maxItems: 1
+
+patternProperties:
+  '-cfg$':
+    type: object
+    description:
+      A pinctrl node should contain at least one subnode representing the
+      pinctrl groups available on the machine.
+
+    additionalProperties: false
+
+    patternProperties:
+      '-pins$':
+        type: object
+        description: |
+          Each subnode will list the pins it needs, and how they should
+          be configured, with regard to muxer configuration, bias, input
+          enable/disable, input schmitt trigger, slew-rate, drive strength
+          and bus hold state. In addition, all pins in the same subnode
+          should have the same power domain. For configuration detail,
+          refer to https://github.com/sophgo/sophgo-doc/.
+
+        allOf:
+          - $ref: pincfg-node.yaml#
+          - $ref: pinmux-node.yaml#
+
+        properties:
+          pinmux:
+            description: |
+              The list of GPIOs and their mux settings that properties in the
+              node apply to. This should be set using the GPIOMUX or GPIOMUX2
+              macro.
+
+          bias-pull-up:
+            type: boolean
+
+          bias-pull-down:
+            type: boolean
+
+          drive-strength-microamp:
+            description: typical current when output high level.
+
+          input-schmitt-microvolt:
+            description: typical threshold for schmitt trigger.
+
+          power-source:
+            description: power supplies at X mV.
+            enum: [ 1800, 3300 ]
+
+          slew-rate:
+            description: slew rate for output buffer (0 is fast, 1 is slow)
+            enum: [ 0, 1 ]
+
+          bias-bus-hold: true
+
+        required:
+          - pinmux
+          - power-source
+
+        additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - reg-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/pinctrl/pinctrl-cv1800b.h>
+
+    pinctrl@3001000 {
+        compatible = "sophgo,cv1800b-pinctrl";
+        reg = <0x03001000 0x1000>,
+              <0x05027000 0x1000>;
+        reg-names = "sys", "rtc";
+
+        uart0_cfg: uart0-cfg {
+            uart0-pins {
+                pinmux = <PINMUX(PIN_UART0_TX, 0)>,
+                         <PINMUX(PIN_UART0_RX, 0)>;
+                bias-pull-up;
+                drive-strength-microamp = <10800>;
+                input-schmitt-microvolt = <0>;
+                power-source = <3300>;
+                slew-rate = <0>;
+            };
+        };
+    };
+
+...
diff --git a/include/dt-bindings/pinctrl/pinctrl-cv1800b.h b/include/dt-bindings/pinctrl/pinctrl-cv1800b.h
new file mode 100644
index 000000000000..0593fc33d470
--- /dev/null
+++ b/include/dt-bindings/pinctrl/pinctrl-cv1800b.h
@@ -0,0 +1,63 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright (C) 2024 Inochi Amaoto <inochiama@outlook.com>
+ *
+ * This file is generated from vendor pinout definition.
+ */
+
+#ifndef _DT_BINDINGS_PINCTRL_CV1800B_H
+#define _DT_BINDINGS_PINCTRL_CV1800B_H
+
+#include <dt-bindings/pinctrl/pinctrl-cv18xx.h>
+
+#define PIN_AUD_AOUTR			1
+#define PIN_SD0_CLK			3
+#define PIN_SD0_CMD			4
+#define PIN_SD0_D0			5
+#define PIN_SD0_D1			7
+#define PIN_SD0_D2			8
+#define PIN_SD0_D3			9
+#define PIN_SD0_CD			11
+#define PIN_SD0_PWR_EN			12
+#define PIN_SPK_EN			14
+#define PIN_UART0_TX			15
+#define PIN_UART0_RX			16
+#define PIN_SPINOR_HOLD_X		17
+#define PIN_SPINOR_SCK			18
+#define PIN_SPINOR_MOSI			19
+#define PIN_SPINOR_WP_X			20
+#define PIN_SPINOR_MISO			21
+#define PIN_SPINOR_CS_X			22
+#define PIN_IIC0_SCL			23
+#define PIN_IIC0_SDA			24
+#define PIN_AUX0			25
+#define PIN_PWR_VBAT_DET		30
+#define PIN_PWR_SEQ2			31
+#define PIN_XTAL_XIN			33
+#define PIN_SD1_GPIO0			35
+#define PIN_SD1_GPIO1			36
+#define PIN_SD1_D3			38
+#define PIN_SD1_D2			39
+#define PIN_SD1_D1			40
+#define PIN_SD1_D0			41
+#define PIN_SD1_CMD			42
+#define PIN_SD1_CLK			43
+#define PIN_ADC1			44
+#define PIN_USB_VBUS_DET		45
+#define PIN_ETH_TXP			47
+#define PIN_ETH_TXM			48
+#define PIN_ETH_RXP			49
+#define PIN_ETH_RXM			50
+#define PIN_MIPIRX4N			56
+#define PIN_MIPIRX4P			57
+#define PIN_MIPIRX3N			58
+#define PIN_MIPIRX3P			59
+#define PIN_MIPIRX2N			60
+#define PIN_MIPIRX2P			61
+#define PIN_MIPIRX1N			62
+#define PIN_MIPIRX1P			63
+#define PIN_MIPIRX0N			64
+#define PIN_MIPIRX0P			65
+#define PIN_AUD_AINL_MIC		67
+
+#endif /* _DT_BINDINGS_PINCTRL_CV1800B_H */
diff --git a/include/dt-bindings/pinctrl/pinctrl-cv1812h.h b/include/dt-bindings/pinctrl/pinctrl-cv1812h.h
new file mode 100644
index 000000000000..2908de347919
--- /dev/null
+++ b/include/dt-bindings/pinctrl/pinctrl-cv1812h.h
@@ -0,0 +1,127 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright (C) 2024 Inochi Amaoto <inochiama@outlook.com>
+ *
+ * This file is generated from vendor pinout definition.
+ */
+
+#ifndef _DT_BINDINGS_PINCTRL_CV1812H_H
+#define _DT_BINDINGS_PINCTRL_CV1812H_H
+
+#include <dt-bindings/pinctrl/pinctrl-cv18xx.h>
+
+#define PINPOS(row, col)			\
+	((((row) - 'A' + 1) << 8) + ((col) - 1))
+
+#define PIN_MIPI_TXM4			PINPOS('A', 2)
+#define PIN_MIPIRX0N			PINPOS('A', 4)
+#define PIN_MIPIRX3P			PINPOS('A', 6)
+#define PIN_MIPIRX4P			PINPOS('A', 7)
+#define PIN_VIVO_D2			PINPOS('A', 9)
+#define PIN_VIVO_D3			PINPOS('A', 10)
+#define PIN_VIVO_D10			PINPOS('A', 12)
+#define PIN_USB_VBUS_DET		PINPOS('A', 13)
+#define PIN_MIPI_TXP3			PINPOS('B', 1)
+#define PIN_MIPI_TXM3			PINPOS('B', 2)
+#define PIN_MIPI_TXP4			PINPOS('B', 3)
+#define PIN_MIPIRX0P			PINPOS('B', 4)
+#define PIN_MIPIRX1N			PINPOS('B', 5)
+#define PIN_MIPIRX2N			PINPOS('B', 6)
+#define PIN_MIPIRX4N			PINPOS('B', 7)
+#define PIN_MIPIRX5N			PINPOS('B', 8)
+#define PIN_VIVO_D1			PINPOS('B', 9)
+#define PIN_VIVO_D5			PINPOS('B', 10)
+#define PIN_VIVO_D7			PINPOS('B', 11)
+#define PIN_VIVO_D9			PINPOS('B', 12)
+#define PIN_USB_ID			PINPOS('B', 13)
+#define PIN_ETH_RXM			PINPOS('B', 15)
+#define PIN_MIPI_TXP2			PINPOS('C', 1)
+#define PIN_MIPI_TXM2			PINPOS('C', 2)
+#define PIN_CAM_PD0			PINPOS('C', 3)
+#define PIN_CAM_MCLK0			PINPOS('C', 4)
+#define PIN_MIPIRX1P			PINPOS('C', 5)
+#define PIN_MIPIRX2P			PINPOS('C', 6)
+#define PIN_MIPIRX3N			PINPOS('C', 7)
+#define PIN_MIPIRX5P			PINPOS('C', 8)
+#define PIN_VIVO_CLK			PINPOS('C', 9)
+#define PIN_VIVO_D6			PINPOS('C', 10)
+#define PIN_VIVO_D8			PINPOS('C', 11)
+#define PIN_USB_VBUS_EN			PINPOS('C', 12)
+#define PIN_ETH_RXP			PINPOS('C', 14)
+#define PIN_GPIO_RTX			PINPOS('C', 15)
+#define PIN_MIPI_TXP1			PINPOS('D', 1)
+#define PIN_MIPI_TXM1			PINPOS('D', 2)
+#define PIN_CAM_MCLK1			PINPOS('D', 3)
+#define PIN_IIC3_SCL			PINPOS('D', 4)
+#define PIN_VIVO_D4			PINPOS('D', 10)
+#define PIN_ETH_TXM			PINPOS('D', 14)
+#define PIN_ETH_TXP			PINPOS('D', 15)
+#define PIN_MIPI_TXP0			PINPOS('E', 1)
+#define PIN_MIPI_TXM0			PINPOS('E', 2)
+#define PIN_CAM_PD1			PINPOS('E', 4)
+#define PIN_CAM_RST0			PINPOS('E', 5)
+#define PIN_VIVO_D0			PINPOS('E', 10)
+#define PIN_ADC1			PINPOS('E', 13)
+#define PIN_ADC2			PINPOS('E', 14)
+#define PIN_ADC3			PINPOS('E', 15)
+#define PIN_AUD_AOUTL			PINPOS('F', 2)
+#define PIN_IIC3_SDA			PINPOS('F', 4)
+#define PIN_SD1_D2			PINPOS('F', 14)
+#define PIN_AUD_AOUTR			PINPOS('G', 2)
+#define PIN_SD1_D3			PINPOS('G', 13)
+#define PIN_SD1_CLK			PINPOS('G', 14)
+#define PIN_SD1_CMD			PINPOS('G', 15)
+#define PIN_AUD_AINL_MIC		PINPOS('H', 1)
+#define PIN_RSTN			PINPOS('H', 12)
+#define PIN_PWM0_BUCK			PINPOS('H', 13)
+#define PIN_SD1_D1			PINPOS('H', 14)
+#define PIN_SD1_D0			PINPOS('H', 15)
+#define PIN_AUD_AINR_MIC		PINPOS('J', 1)
+#define PIN_IIC2_SCL			PINPOS('J', 13)
+#define PIN_IIC2_SDA			PINPOS('J', 14)
+#define PIN_SD0_CD			PINPOS('K', 2)
+#define PIN_SD0_D1			PINPOS('K', 3)
+#define PIN_UART2_RX			PINPOS('K', 13)
+#define PIN_UART2_CTS			PINPOS('K', 14)
+#define PIN_UART2_TX			PINPOS('K', 15)
+#define PIN_SD0_CLK			PINPOS('L', 1)
+#define PIN_SD0_D0			PINPOS('L', 2)
+#define PIN_SD0_CMD			PINPOS('L', 3)
+#define PIN_CLK32K			PINPOS('L', 14)
+#define PIN_UART2_RTS			PINPOS('L', 15)
+#define PIN_SD0_D3			PINPOS('M', 1)
+#define PIN_SD0_D2			PINPOS('M', 2)
+#define PIN_UART0_RX			PINPOS('M', 4)
+#define PIN_UART0_TX			PINPOS('M', 5)
+#define PIN_JTAG_CPU_TRST		PINPOS('M', 6)
+#define PIN_PWR_ON			PINPOS('M', 11)
+#define PIN_PWR_GPIO2			PINPOS('M', 12)
+#define PIN_PWR_GPIO0			PINPOS('M', 13)
+#define PIN_CLK25M			PINPOS('M', 14)
+#define PIN_SD0_PWR_EN			PINPOS('N', 1)
+#define PIN_SPK_EN			PINPOS('N', 3)
+#define PIN_JTAG_CPU_TCK		PINPOS('N', 4)
+#define PIN_JTAG_CPU_TMS		PINPOS('N', 6)
+#define PIN_PWR_WAKEUP1			PINPOS('N', 11)
+#define PIN_PWR_WAKEUP0			PINPOS('N', 12)
+#define PIN_PWR_GPIO1			PINPOS('N', 13)
+#define PIN_EMMC_DAT3			PINPOS('P', 1)
+#define PIN_EMMC_DAT0			PINPOS('P', 2)
+#define PIN_EMMC_DAT2			PINPOS('P', 3)
+#define PIN_EMMC_RSTN			PINPOS('P', 4)
+#define PIN_AUX0			PINPOS('P', 5)
+#define PIN_IIC0_SDA			PINPOS('P', 6)
+#define PIN_PWR_SEQ3			PINPOS('P', 10)
+#define PIN_PWR_VBAT_DET		PINPOS('P', 11)
+#define PIN_PWR_SEQ1			PINPOS('P', 12)
+#define PIN_PWR_BUTTON1			PINPOS('P', 13)
+#define PIN_EMMC_DAT1			PINPOS('R', 2)
+#define PIN_EMMC_CMD			PINPOS('R', 3)
+#define PIN_EMMC_CLK			PINPOS('R', 4)
+#define PIN_IIC0_SCL			PINPOS('R', 6)
+#define PIN_GPIO_ZQ			PINPOS('R', 10)
+#define PIN_PWR_RSTN			PINPOS('R', 11)
+#define PIN_PWR_SEQ2			PINPOS('R', 12)
+#define PIN_XTAL_XIN			PINPOS('R', 13)
+
+#endif /* _DT_BINDINGS_PINCTRL_CV1812H_H */
diff --git a/include/dt-bindings/pinctrl/pinctrl-cv18xx.h b/include/dt-bindings/pinctrl/pinctrl-cv18xx.h
new file mode 100644
index 000000000000..bc92ad1067ec
--- /dev/null
+++ b/include/dt-bindings/pinctrl/pinctrl-cv18xx.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright (C) 2023 Sophgo Ltd.
+ *
+ * Author: Inochi Amaoto <inochiama@outlook.com>
+ */
+
+#ifndef _DT_BINDINGS_PINCTRL_CV18XX_H
+#define _DT_BINDINGS_PINCTRL_CV18XX_H
+
+#define PIN_MUX_INVALD				0xff
+
+#define PINMUX2(pin, mux, mux2)	\
+	(((pin) & 0xffff) | (((mux) & 0xff) << 16) | (((mux2) & 0xff) << 24))
+
+#define PINMUX(pin, mux) \
+	PINMUX2(pin, mux, PIN_MUX_INVALD)
+
+#endif /* _DT_BINDINGS_PINCTRL_CV18XX_H */
diff --git a/include/dt-bindings/pinctrl/pinctrl-sg2000.h b/include/dt-bindings/pinctrl/pinctrl-sg2000.h
new file mode 100644
index 000000000000..4871f9a7c6c1
--- /dev/null
+++ b/include/dt-bindings/pinctrl/pinctrl-sg2000.h
@@ -0,0 +1,127 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright (C) 2024 Inochi Amaoto <inochiama@outlook.com>
+ *
+ * This file is generated from vendor pinout definition.
+ */
+
+#ifndef _DT_BINDINGS_PINCTRL_SG2000_H
+#define _DT_BINDINGS_PINCTRL_SG2000_H
+
+#include <dt-bindings/pinctrl/pinctrl-cv18xx.h>
+
+#define PINPOS(row, col)			\
+	((((row) - 'A' + 1) << 8) + ((col) - 1))
+
+#define PIN_MIPI_TXM4			PINPOS('A', 2)
+#define PIN_MIPIRX0N			PINPOS('A', 4)
+#define PIN_MIPIRX3P			PINPOS('A', 6)
+#define PIN_MIPIRX4P			PINPOS('A', 7)
+#define PIN_VIVO_D2			PINPOS('A', 9)
+#define PIN_VIVO_D3			PINPOS('A', 10)
+#define PIN_VIVO_D10			PINPOS('A', 12)
+#define PIN_USB_VBUS_DET		PINPOS('A', 13)
+#define PIN_MIPI_TXP3			PINPOS('B', 1)
+#define PIN_MIPI_TXM3			PINPOS('B', 2)
+#define PIN_MIPI_TXP4			PINPOS('B', 3)
+#define PIN_MIPIRX0P			PINPOS('B', 4)
+#define PIN_MIPIRX1N			PINPOS('B', 5)
+#define PIN_MIPIRX2N			PINPOS('B', 6)
+#define PIN_MIPIRX4N			PINPOS('B', 7)
+#define PIN_MIPIRX5N			PINPOS('B', 8)
+#define PIN_VIVO_D1			PINPOS('B', 9)
+#define PIN_VIVO_D5			PINPOS('B', 10)
+#define PIN_VIVO_D7			PINPOS('B', 11)
+#define PIN_VIVO_D9			PINPOS('B', 12)
+#define PIN_USB_ID			PINPOS('B', 13)
+#define PIN_ETH_RXM			PINPOS('B', 15)
+#define PIN_MIPI_TXP2			PINPOS('C', 1)
+#define PIN_MIPI_TXM2			PINPOS('C', 2)
+#define PIN_CAM_PD0			PINPOS('C', 3)
+#define PIN_CAM_MCLK0			PINPOS('C', 4)
+#define PIN_MIPIRX1P			PINPOS('C', 5)
+#define PIN_MIPIRX2P			PINPOS('C', 6)
+#define PIN_MIPIRX3N			PINPOS('C', 7)
+#define PIN_MIPIRX5P			PINPOS('C', 8)
+#define PIN_VIVO_CLK			PINPOS('C', 9)
+#define PIN_VIVO_D6			PINPOS('C', 10)
+#define PIN_VIVO_D8			PINPOS('C', 11)
+#define PIN_USB_VBUS_EN			PINPOS('C', 12)
+#define PIN_ETH_RXP			PINPOS('C', 14)
+#define PIN_GPIO_RTX			PINPOS('C', 15)
+#define PIN_MIPI_TXP1			PINPOS('D', 1)
+#define PIN_MIPI_TXM1			PINPOS('D', 2)
+#define PIN_CAM_MCLK1			PINPOS('D', 3)
+#define PIN_IIC3_SCL			PINPOS('D', 4)
+#define PIN_VIVO_D4			PINPOS('D', 10)
+#define PIN_ETH_TXM			PINPOS('D', 14)
+#define PIN_ETH_TXP			PINPOS('D', 15)
+#define PIN_MIPI_TXP0			PINPOS('E', 1)
+#define PIN_MIPI_TXM0			PINPOS('E', 2)
+#define PIN_CAM_PD1			PINPOS('E', 4)
+#define PIN_CAM_RST0			PINPOS('E', 5)
+#define PIN_VIVO_D0			PINPOS('E', 10)
+#define PIN_ADC1			PINPOS('E', 13)
+#define PIN_ADC2			PINPOS('E', 14)
+#define PIN_ADC3			PINPOS('E', 15)
+#define PIN_AUD_AOUTL			PINPOS('F', 2)
+#define PIN_IIC3_SDA			PINPOS('F', 4)
+#define PIN_SD1_D2			PINPOS('F', 14)
+#define PIN_AUD_AOUTR			PINPOS('G', 2)
+#define PIN_SD1_D3			PINPOS('G', 13)
+#define PIN_SD1_CLK			PINPOS('G', 14)
+#define PIN_SD1_CMD			PINPOS('G', 15)
+#define PIN_AUD_AINL_MIC		PINPOS('H', 1)
+#define PIN_RSTN			PINPOS('H', 12)
+#define PIN_PWM0_BUCK			PINPOS('H', 13)
+#define PIN_SD1_D1			PINPOS('H', 14)
+#define PIN_SD1_D0			PINPOS('H', 15)
+#define PIN_AUD_AINR_MIC		PINPOS('J', 1)
+#define PIN_IIC2_SCL			PINPOS('J', 13)
+#define PIN_IIC2_SDA			PINPOS('J', 14)
+#define PIN_SD0_CD			PINPOS('K', 2)
+#define PIN_SD0_D1			PINPOS('K', 3)
+#define PIN_UART2_RX			PINPOS('K', 13)
+#define PIN_UART2_CTS			PINPOS('K', 14)
+#define PIN_UART2_TX			PINPOS('K', 15)
+#define PIN_SD0_CLK			PINPOS('L', 1)
+#define PIN_SD0_D0			PINPOS('L', 2)
+#define PIN_SD0_CMD			PINPOS('L', 3)
+#define PIN_CLK32K			PINPOS('L', 14)
+#define PIN_UART2_RTS			PINPOS('L', 15)
+#define PIN_SD0_D3			PINPOS('M', 1)
+#define PIN_SD0_D2			PINPOS('M', 2)
+#define PIN_UART0_RX			PINPOS('M', 4)
+#define PIN_UART0_TX			PINPOS('M', 5)
+#define PIN_JTAG_CPU_TRST		PINPOS('M', 6)
+#define PIN_PWR_ON			PINPOS('M', 11)
+#define PIN_PWR_GPIO2			PINPOS('M', 12)
+#define PIN_PWR_GPIO0			PINPOS('M', 13)
+#define PIN_CLK25M			PINPOS('M', 14)
+#define PIN_SD0_PWR_EN			PINPOS('N', 1)
+#define PIN_SPK_EN			PINPOS('N', 3)
+#define PIN_JTAG_CPU_TCK		PINPOS('N', 4)
+#define PIN_JTAG_CPU_TMS		PINPOS('N', 6)
+#define PIN_PWR_WAKEUP1			PINPOS('N', 11)
+#define PIN_PWR_WAKEUP0			PINPOS('N', 12)
+#define PIN_PWR_GPIO1			PINPOS('N', 13)
+#define PIN_EMMC_DAT3			PINPOS('P', 1)
+#define PIN_EMMC_DAT0			PINPOS('P', 2)
+#define PIN_EMMC_DAT2			PINPOS('P', 3)
+#define PIN_EMMC_RSTN			PINPOS('P', 4)
+#define PIN_AUX0			PINPOS('P', 5)
+#define PIN_IIC0_SDA			PINPOS('P', 6)
+#define PIN_PWR_SEQ3			PINPOS('P', 10)
+#define PIN_PWR_VBAT_DET		PINPOS('P', 11)
+#define PIN_PWR_SEQ1			PINPOS('P', 12)
+#define PIN_PWR_BUTTON1			PINPOS('P', 13)
+#define PIN_EMMC_DAT1			PINPOS('R', 2)
+#define PIN_EMMC_CMD			PINPOS('R', 3)
+#define PIN_EMMC_CLK			PINPOS('R', 4)
+#define PIN_IIC0_SCL			PINPOS('R', 6)
+#define PIN_GPIO_ZQ			PINPOS('R', 10)
+#define PIN_PWR_RSTN			PINPOS('R', 11)
+#define PIN_PWR_SEQ2			PINPOS('R', 12)
+#define PIN_XTAL_XIN			PINPOS('R', 13)
+
+#endif /* _DT_BINDINGS_PINCTRL_SG2000_H */
diff --git a/include/dt-bindings/pinctrl/pinctrl-sg2002.h b/include/dt-bindings/pinctrl/pinctrl-sg2002.h
new file mode 100644
index 000000000000..3c36cfa0a550
--- /dev/null
+++ b/include/dt-bindings/pinctrl/pinctrl-sg2002.h
@@ -0,0 +1,79 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright (C) 2024 Inochi Amaoto <inochiama@outlook.com>
+ *
+ * This file is generated from vendor pinout definition.
+ */
+
+#ifndef _DT_BINDINGS_PINCTRL_SG2002_H
+#define _DT_BINDINGS_PINCTRL_SG2002_H
+
+#include <dt-bindings/pinctrl/pinctrl-cv18xx.h>
+
+#define PIN_AUD_AINL_MIC		2
+#define PIN_AUD_AOUTR			4
+#define PIN_SD0_CLK			6
+#define PIN_SD0_CMD			7
+#define PIN_SD0_D0			8
+#define PIN_SD0_D1			10
+#define PIN_SD0_D2			11
+#define PIN_SD0_D3			12
+#define PIN_SD0_CD			14
+#define PIN_SD0_PWR_EN			15
+#define PIN_SPK_EN			17
+#define PIN_UART0_TX			18
+#define PIN_UART0_RX			19
+#define PIN_EMMC_DAT2			20
+#define PIN_EMMC_CLK			21
+#define PIN_EMMC_DAT0			22
+#define PIN_EMMC_DAT3			23
+#define PIN_EMMC_CMD			24
+#define PIN_EMMC_DAT1			25
+#define PIN_JTAG_CPU_TMS		26
+#define PIN_JTAG_CPU_TCK		27
+#define PIN_IIC0_SCL			28
+#define PIN_IIC0_SDA			29
+#define PIN_AUX0			30
+#define PIN_GPIO_ZQ			35
+#define PIN_PWR_VBAT_DET		38
+#define PIN_PWR_RSTN			39
+#define PIN_PWR_SEQ1			40
+#define PIN_PWR_SEQ2			41
+#define PIN_PWR_WAKEUP0			43
+#define PIN_PWR_BUTTON1			44
+#define PIN_XTAL_XIN			45
+#define PIN_PWR_GPIO0			47
+#define PIN_PWR_GPIO1			48
+#define PIN_PWR_GPIO2			49
+#define PIN_SD1_D3			51
+#define PIN_SD1_D2			52
+#define PIN_SD1_D1			53
+#define PIN_SD1_D0			54
+#define PIN_SD1_CMD			55
+#define PIN_SD1_CLK			56
+#define PIN_PWM0_BUCK			58
+#define PIN_ADC1			59
+#define PIN_USB_VBUS_DET		60
+#define PIN_ETH_TXP			62
+#define PIN_ETH_TXM			63
+#define PIN_ETH_RXP			64
+#define PIN_ETH_RXM			65
+#define PIN_GPIO_RTX			67
+#define PIN_MIPIRX4N			72
+#define PIN_MIPIRX4P			73
+#define PIN_MIPIRX3N			74
+#define PIN_MIPIRX3P			75
+#define PIN_MIPIRX2N			76
+#define PIN_MIPIRX2P			77
+#define PIN_MIPIRX1N			78
+#define PIN_MIPIRX1P			79
+#define PIN_MIPIRX0N			80
+#define PIN_MIPIRX0P			81
+#define PIN_MIPI_TXM2			83
+#define PIN_MIPI_TXP2			84
+#define PIN_MIPI_TXM1			85
+#define PIN_MIPI_TXP1			86
+#define PIN_MIPI_TXM0			87
+#define PIN_MIPI_TXP0			88
+
+#endif /* _DT_BINDINGS_PINCTRL_SG2002_H */
--
2.46.0


