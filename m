Return-Path: <linux-gpio+bounces-36826-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNSXEXOxBWqeZwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36826-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 13:26:43 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F255540FC9
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 13:26:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D6FF730398A4
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 11:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 041E33C1F46;
	Thu, 14 May 2026 11:13:06 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2094.outbound.protection.partner.outlook.cn [139.219.146.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EC33C09FE;
	Thu, 14 May 2026 11:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778757185; cv=fail; b=c8sjPwEw63SNFNJVN5yL5c2ytdVxyjUCfav0cUk/7SAs9ZOUYXekNOEpz+rPlxk4hKSeQp9lUTydEBOcGrhjPYGbTOJJrn59FiNV7JaDwqm3fS6ji9QYfUH3+GJyzmvP6sNhw8OJMd3MK9m2nrtipUeXv3NU6t24bkiyEw6GD7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778757185; c=relaxed/simple;
	bh=iFa/EKg/B/IxIEEDsOrnoElvEwk3lU526HXeilpEJ3c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uFyhxUk23UpiWPbPf12H/1KSM6EbpSO6hYzWYhL9D2sGVZgsKC+bKA0Dm47dQhyTGhwkg7vTGEMjX5F2c544OM0OCS7np+Fb8A6R5gpThejQMKm1ykcfLIJtiV7zYDTxX8AteJpyNQvtdT10CEunLeM2QxkdTinYolGRWfOa2D0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jGyGJQnL0pIVjtinV8CqoPs8knTk3t4lK+Q7Z2S1/OsiC8Jja9X+GsYYV3TTPTO1zU5A67yJp8aYK82S4ORCEyDr3fxqrAK0hAsZ0mVOkCdoIXS1/8FDr8/UjZDRjqm2E2yQ6IcFQQ0NIxs78gxTd6G6gpM+sUwywzCn4z+svw1xUPEtt6bpWR+TjriFeGLGfe91ioGT6217DSBLHB8ahZooYKECmUS8YT/HPYpH62GO+qRubvX2fNj6nYRRPpDSGb+YikUuX9xHH7M9wQ5DovaAa/JMbnJzXXHlI/okAmp+0Y/2uqQE8bJOcmeyb239tomPeyWX8b5nMTVdkJgbrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cf2pCUKCilvbHZSy/c+I745lu/8BpsCgOttaCzH2c0Q=;
 b=KmD9YY1CGlLV+QyxPjZib10Rsu681BSDKxJgrtDQquMOfUalsAISBQ02s49yg8D8vnbjVJDzdvJH6CzGgEFie9gn95NtHYs83CJEvNz1youyMgE3JyEH5xoisktkA0OcMRo/Z9kO3L/SRsxAiU2ARGFh72dJEQzBikJS4ZFhMBQbzuHHHCGFZHGm5gfXzea2UgwFDmbz9U0F/7DAJ4WDquANSn+JsgAAR14WtqDOiBBv/ibPyniM9AlnKmRT/iefyfbU+0JUTs4deseTKNFYk19E1p0usYXK4PvxXcOTGgWhLIkyqbpkcpnTgvtqwMKh0f/Pgh2cDKACZC+EfL2WEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1139.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.25; Thu, 14 May
 2026 11:12:47 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9913.009; Thu, 14 May 2026 11:12:47 +0000
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
Subject: [PATCH v2 14/22] dt-bindings: pinctrl: Add starfive,jhb100-per1-pinctrl
Date: Thu, 14 May 2026 04:12:10 -0700
Message-Id: <20260514111218.94519-15-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3896c4f2-3f7c-4d9c-67a6-08deb1a9bb01
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|921020|38350700014|3023799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	wI1cgr9eSuQjNFEwH5IXEk/UH4Qj10BwIpnYRc529sCX6qXz41aw9Iu/e4CSBhFFjN/QmxBzWQx52KeOGSLQRY3UjzyY25Z+CftoLXioyVs4PnMcQOFjTAJTg2HPS8p90c2cT4kowSckoGrKSgbx84HsewayLWn8YyDt5IVcpA7Tkj63rktGZe/C5zVsDum9qTXI/htAqW2F+b8dnJpRM22SYjlNyhZQogXyiMV1rlxvRYSvDBQkpAZUnq7t3ha3DJ1cFQIlThbGpRjay0oUNYLAcyM+JETzklZC5rFsqa0eTotpTYRVjJ93fglcXeJu3PAoHhAHLbeSDg8XZlePUMo/WTK+oWEiI3z+tspk/Lqf0Z/TSJgUJ+vJ2TafHaziQ6sMdDYQAI2Wu8EwQaMaeXaUzd1mc6Q94+Qco6HS1C2h/Z7YeOmvvUbnaROdYbWilwKM62skxoXzm9DZRrIC3x8wCpXxrMkqMIamTGT9lH4h+H46EJ9ht187ELqpIf6mLejcxbD1jgRGycSDL7LFMyn81R5Rkh1+0m9ccIVyKvp5b6kURuwDcipB29AHOz2UWAp9e5niUZ9lSg9yDs6knQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(921020)(38350700014)(3023799003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L8JWrP4jvx5GQwBRQgccsp9asU5qpOFquI7+TWscqLLfKOXPeZr0q67KK3Jn?=
 =?us-ascii?Q?rMRdfrMToNQ4XKHN9LinccjHulipFww+TVDhQJjNiEevE1yNGhjZCkdmXYRY?=
 =?us-ascii?Q?ytOqUdsgSB7zcA2xgua+wpvIVAU0AbnGkz5NYPigVdU+KIss/5oC+GdR0Y5C?=
 =?us-ascii?Q?OvSgKC2FCERLhxgnz59yNX3nXEa5lTuF8O/A0qknfmg+uqWeOMmmD0TviukX?=
 =?us-ascii?Q?nhiZ0IrtiiU+3lwq4PZFQBtFKSkw35YOlHXKbu0FtB7N1QChhbrzeULP+qUb?=
 =?us-ascii?Q?quT+LV9vBzBOpaKysIU93VkjDIjJczI0GZOYrbZLuv2V0yiGtLFxMwYET2IZ?=
 =?us-ascii?Q?tmL7mRdl0j3D0chqTEsMmwOCcLODOIbqttwp72MswAoAt4shRZCWP0wUOqLu?=
 =?us-ascii?Q?5l85KREEkPb4mFUBgdP0m02ObDuD214Z7Z/oEXVZT64afs3tzgUlARtlXEs0?=
 =?us-ascii?Q?xWmy8Qw/lCU6C4QfKzltT+mvdSapDC/teigdjAD9c5/MQ7y6IzF8IE1tflPU?=
 =?us-ascii?Q?V58ENK2f+7RW+pLlHu8URMYTIEo1Pd4fuThpw+rHB9+fsvhQP576WEXqlZUp?=
 =?us-ascii?Q?62jmJ2dE0Vxcyj1dXJjoVkX+oqG6lezqgGVyT6CRvIv+U9wHDtHos9hqtaIf?=
 =?us-ascii?Q?/kiZph+yZsBQ/yqEQoNRi1r5IqvOu4P1En3T8oAvOXtxq39Bs27MHXcV1OBC?=
 =?us-ascii?Q?BABCIFQ18FXZyFRz0mBWGQAHfXDmNYVuf9sUPrfYpwwCs6HufFfPBTC83X+D?=
 =?us-ascii?Q?5b0lzpdsIV5f6/iQ5RFtiIGQrhQHeTHLKpInF3kCJKPooja/WcJkW3/zk1lf?=
 =?us-ascii?Q?MMxhd0nnvAeiao3gK+zuua/rHBXUMNr1BMl82MuQMgIMf3VLzcncFn1sPpJP?=
 =?us-ascii?Q?gDSXy47ROaTmK2RkOPOXgfRriLDg8l1i/4wBW9t9Vp5chTAYoT7C6NZBP3Z1?=
 =?us-ascii?Q?JSOQaFWi+VS4ibX4CvdYOZfnSsidKBtJ4FAn5kJLcRlHtWKccDxrDmOdzQFW?=
 =?us-ascii?Q?262gOjP741PJslAfkHrT1xGaOizjGDP2quBm8I6SokW8aHjujDGAEhxkJ7Yq?=
 =?us-ascii?Q?59Qx1luLeKmNcRDBOWs9TJJ6J1QXljk3gtystPOmCDXm+lxlWoKfjODKG3P9?=
 =?us-ascii?Q?2YOQKPCwxTkEwrGVCy1dE5CA7LgKcs/wsWXq4lwmA5vzibm/mhVHwgv5mC9d?=
 =?us-ascii?Q?jnnKC5SdWstomykwAMunGWyffvRazwtXTvs0d3LJX4ag1fsyY7LuOVIgwmRU?=
 =?us-ascii?Q?lXA28GPa5AJ21/Xk0mInNWeSkHacFQWvf6EzEkTkqaOA5bKBXDseVQ6IvCwZ?=
 =?us-ascii?Q?xuYXKS8WX9D1VdU/+BDcgCvqh6sQKeAi7/v3tzEqJPdWxkgkrlO2FeOK8u2Y?=
 =?us-ascii?Q?hra/kJvBjXe17LyXOfFmajsmZqTEe+P+oSVWAZnEVxkEJiZ3GZkr6cf+6d/D?=
 =?us-ascii?Q?+MKJyLWxYNnkpjpRhxiw3dBSXiT01QY3QOplnCWpst8TdYUplyLg0v2jml7C?=
 =?us-ascii?Q?s59Rcycq8z+wodptSa2g/XYL5qLsO/zCm1GncIVbw0pAQvI2ENYTmtn+rVvh?=
 =?us-ascii?Q?8Rl/A72VLg+xbqaVdH2UsnBG+zFTeaTnjQRPxFMSMYNOaII30tmQtvY0ZeDm?=
 =?us-ascii?Q?QGQqgfGciCYFxUCtqGmlN5LJDcCtYD5SRNSoZT2MdpOYe+fY3LgGg8sBPHJZ?=
 =?us-ascii?Q?jrgRsZlgt0CLpqSBcx+aqgpqIdUVqRTJTiQ4J5fUrwFacykDIR6vGYDjUq7v?=
 =?us-ascii?Q?wCpuu+MaUzLnxlgQZBP2NSiy+/6sfaBs7KRIbvBsVxnB8bf+vPYH?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3896c4f2-3f7c-4d9c-67a6-08deb1a9bb01
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 11:12:47.9334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jW65BDTm+N5HIWRFv0Mif56sac6Q4+5XJjW64N5MmWbuaW3Ldjy1+KiuZmzw8I3Ladi8NPCd+PCQZUw2dZKsQ7kZSjpvswQH+fa3I5uPAQX9gjvfl9/B9OYyYwMIP72Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1139
X-Rspamd-Queue-Id: 8F255540FC9
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
	TAGGED_FROM(0.00)[bounces-36826-lists,linux-gpio=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.911];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[starfivetech.com:email,starfivetech.com:mid,devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,11b42000:email]
X-Rspamd-Action: no action

Add pinctrl bindings for StarFive JHB100 SoC Peripheral-1(per1) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../pinctrl/starfive,jhb100-per1-pinctrl.yaml | 175 ++++++++++++++++++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  38 ++++
 2 files changed, 213 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per1-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per1-pinctrl.yaml
new file mode 100644
index 000000000000..c97dbf674975
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per1-pinctrl.yaml
@@ -0,0 +1,175 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-per1-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 Peripheral-1 Pin Controller
+
+description: |
+  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
+
+  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
+  per2, per2pok, per3, adc0, adc1, emmc, and vga.
+  This document provides an overview of the "per1" pinctrl domain.
+
+  The "per1" domain has a pin controller which provides
+  - function selection for GPIO pads.
+  - GPIO pad configuration.
+  - GPIO interrupt handling.
+
+  In the Peripheral-1 Pin Controller, there are 36 multi-function GPIO_PADs.
+  Each of them can be multiplexed to several peripherals through function
+  selection. Each iopad has a maximum of up to 3 functions - 0, 1, and 2.
+  Function 0 is the default function which is generally the GPIO function.
+  Function 1 and 2 are the alternate functions or peripheral signals that
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
+      - const: starfive,jhb100-per1-pinctrl
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
+            enum: [ gpio, i2c, sfc, sgpio, spi ]
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
+        pinctrl_per1: pinctrl@11b42000 {
+            compatible = "starfive,jhb100-per1-pinctrl";
+            reg = <0x0 0x11b42000 0x0 0x800>;
+            resets = <&per1crg 0>;
+            interrupts = <61>;
+            interrupt-controller;
+            #interrupt-cells = <3>;
+            gpio-controller;
+            #gpio-cells = <3>;
+            gpio-ranges = <&pinctrl_per1 0 0 0 32>,
+                          <&pinctrl_per1 1 0 32 4>;
+        };
+    };
diff --git a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
index 0a8494b577e0..ab3b678dfd4b 100644
--- a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
+++ b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
@@ -139,6 +139,44 @@
 #define PADNUM_PER0_GPIO_B58				58
 #define PADNUM_PER0_GPIO_B59				59
 
+/* per1 pad numbers */
+#define PADNUM_PER1_GPIO_C0				0
+#define PADNUM_PER1_GPIO_C1				1
+#define PADNUM_PER1_GPIO_C2				2
+#define PADNUM_PER1_GPIO_C3				3
+#define PADNUM_PER1_GPIO_C4				4
+#define PADNUM_PER1_GPIO_C5				5
+#define PADNUM_PER1_GPIO_C6				6
+#define PADNUM_PER1_GPIO_C7				7
+#define PADNUM_PER1_GPIO_C8				8
+#define PADNUM_PER1_GPIO_C9				9
+#define PADNUM_PER1_GPIO_C10				10
+#define PADNUM_PER1_GPIO_C11				11
+#define PADNUM_PER1_GPIO_C12				12
+#define PADNUM_PER1_GPIO_C13				13
+#define PADNUM_PER1_GPIO_C14				14
+#define PADNUM_PER1_GPIO_C15				15
+#define PADNUM_PER1_GPIO_C16				16
+#define PADNUM_PER1_GPIO_C17				17
+#define PADNUM_PER1_GPIO_C18				18
+#define PADNUM_PER1_GPIO_C19				19
+#define PADNUM_PER1_GPIO_C20				20
+#define PADNUM_PER1_GPIO_C21				21
+#define PADNUM_PER1_GPIO_C22				22
+#define PADNUM_PER1_GPIO_C23				23
+#define PADNUM_PER1_GPIO_C24				24
+#define PADNUM_PER1_GPIO_C25				25
+#define PADNUM_PER1_GPIO_C26				26
+#define PADNUM_PER1_GPIO_C27				27
+#define PADNUM_PER1_GPIO_C28				28
+#define PADNUM_PER1_GPIO_C29				29
+#define PADNUM_PER1_GPIO_C30				30
+#define PADNUM_PER1_GPIO_C31				31
+#define PADNUM_PER1_GPIO_C32				32
+#define PADNUM_PER1_GPIO_C33				33
+#define PADNUM_PER1_GPIO_C34				34
+#define PADNUM_PER1_GPIO_C35				35
+
 /* pinctrl hog power-source value */
 #define JHB100_PINVREF_3_3V				0
 #define JHB100_PINVREF_2_5V				1
-- 
2.25.1


