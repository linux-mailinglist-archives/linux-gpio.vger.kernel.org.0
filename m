Return-Path: <linux-gpio+bounces-35486-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCkyDIVW62n2LQAAu9opvQ
	(envelope-from <linux-gpio+bounces-35486-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 13:39:49 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B98D645DE2A
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 13:39:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8C18830160D3
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 11:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC4C23BC680;
	Fri, 24 Apr 2026 11:31:45 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2130.outbound.protection.partner.outlook.cn [139.219.17.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995B93BBA0E;
	Fri, 24 Apr 2026 11:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777030305; cv=fail; b=bMFA2taKGmRfEao3fhmh+5NZ4QhBsjqNaH3PDvzLmSYyMGVTaonwVuSfDodXez82tDUE2UK4ZEYaeHB/y5UhKl6P2DHHK9R0AkYJK5ItSdYt5JfI8kPMV64WYFyQm5ECrzy/xVbuVwSKAt2BaL/1LafhUNbEb5YVgTPuAIBoLNw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777030305; c=relaxed/simple;
	bh=bch7aFdXnT56RZA1OxnXIGIuguYN3HXRc1lcM3/KvrU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=f+6dZZIjy+qjwEPwavpNb2gz1LsZJl4U12+8AlTz3fdbiD5GYp6xX/053RISvOvD8zM49pLMbZsf96aEt8d+zRNsp8OuI3Pg1M6YTkXh/+K5VfIEUBPGCFcmFHvJMPGZMy7DKwZF7EEe05xjeelns3erP3UHxNnu0pXDU1dhGR0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wb6v88isB4pvsLpIns1FswfEhJLBYKPpV4QTRHgI0W25fZglV3nhNP2kFAne06D0ZOqXFLcgrKH/LgD1dKlhS1NKNRkIKqis8CPop0BfLcfo/iAWnlHegDeIlcvizBcD+aDD3fQpbEklFHlpPwEwLejBWttTb9U6b/NJGiuOxb49ldSN0EI53eCzeK0DGkkkk0PE+c+htgY3YItvkQm6Kyg5IBsEWrzvWwffmIGriZO3o+Zfn4JVkPUnCpt1fVmbqeVy3qqp4Uu4JJbIIMBTnmxzEnCK+IbcrCN9EjkW4vURVpwqgv6JcuPZWFGAym2Y8lPQeP1l2PkN9vx9MNP1BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YC8lx0BzhRCgcWfxHNOcgMq2aWddUo0w/BU+riqFECk=;
 b=dvd2/w/xQCqKl/d/trlUZE6h6AgR8Ns9ed48pz8v4jt+y1el4+u9A+4Ll/tygRqn2RsFlVuYHjtNRfT0z7cn/erGyxkOb04Nj0j/VD/2ghsjREpYOgTjB3Oh/58hxy4wCxaO0NNjOow+krMf9Rtz3zv0Po/cmlE8+SKj01nZy/sUC3l8v7qDx/jRFKhoW/TTP2UrEYvHCL8GuPOSTZygkscunof0liPLlRmn0KJZrf736If3njkornFjPquikLEQ6v//tvKveyk73FmUgbFwLFMDGbEgqRpcgwClO3GSRFZOK3cr3Me6TSpZlZOfbwsQy93YdVhfpsuqMlxcSjZtQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1156.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 11:13:58 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9846.021; Fri, 24 Apr 2026 11:13:58 +0000
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
Subject: [PATCH v1 15/20] dt-bindings: pinctrl: Add starfive,jhb100-per2pok-pinctrl
Date: Fri, 24 Apr 2026 04:13:25 -0700
Message-Id: <20260424111330.702272-16-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0e782074-fac4-4c43-9c4e-08dea1f294d6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	DoWAd0mU4xMqSKusNC5l+DzDgNXtHxJ9+RUnx/4Yd+8sLCKucBFqVrq292dm0i9oF59iaehI+WIWICVhbANwF2m0EULBmQTh7TqmqZYTrgGcl2YLD6iC51KSAbluZmObC35Rc93T4ZvWd5ZgbbDwIT9F7nvfv1AvMU256scCphBULsmQ2FI2ZuZbaK0H19zk1EPog2Lgj1VJYNbe8RiFI5KhABg1rwteU/zayVzWnrQJ3cngEDPB2P4lpym+UuBAOK8MiQ7F76yWBfaNZIGpQ+ZKcy/dGBUYqN/onQmmDC/TFUrg7YRpS8MknzEOaXgrGXvpWD5CF4dzDyg2IqadGIbaIsqA/X1PE/o6312w2MZjE2uF8zZgr81yUJL9rkxLRWMPldqHwgjdZFvjDD7fG2tiuQ+kPnr6R9s3QYXPpAslp3TuQ04ofgdgNgmaT5sMv2t5suuDN0BYCqguBRqm+B5T5Vxoujlc4MnXoZMj4T1wBULypnsLCkSYJVBL5pjU7NB5bXgklCYnXRi+6GT/WuKWXUpqwR1VxMhMnKivLnyEv2LfS41vgEQKyY440s/0w7Hf/zCa7FN1mlRimwBE8ypYPdmcg9JtDdot0IUtXzI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JhaU5p7ZO1zckfJbLXa2A09c2HC0eNs/ImOYUHjG5A6Sz3dsBDaZRdoBOkMD?=
 =?us-ascii?Q?U9keCDJfrcVjJW3zKHtMgw2eSoSmy9PlWtzw4gOCrUgXuxXlORocJnQWvCLZ?=
 =?us-ascii?Q?5T+N4j3EhyqhwSgac7idqe//LRINUkVx3xcxjs3SOeoG9WrYIV8CoFhNuHHp?=
 =?us-ascii?Q?EnAdFSSDA+7z3cnXw/z02VCDdta2ooPyfRh9IVzyF1/IQXoi9WFj6+u9sh23?=
 =?us-ascii?Q?wvDweW0uXDh8dCmgGazUp1VBLDqptOwwaI82lGO/wUlvnj+UhIx4qLGP6luF?=
 =?us-ascii?Q?iY0HtTWykKbLskMXuNH2EH/XJrRHmfdL1Md5WdoheoI57zNMa9AkBAwbbaJS?=
 =?us-ascii?Q?o+z3bE5GUomGH1JulvxdleLsuasS0CicKDBrrnFgr5HGTU7GV7RwQKJmtfYW?=
 =?us-ascii?Q?Rflgi4pCGc6NksXl7DE4sPmpjqLJzhfxfl+QiyAn0wKCH+YPgQ/P2aNdOKXG?=
 =?us-ascii?Q?reSAfB7j0X/pzNleMkwok/V8xFjSV6n5f6gydCUYAo7PGl402cvzZjN9uiIf?=
 =?us-ascii?Q?DpIT1psfbhr/WlqOUhJHAgf/XjX78kANznZEiy7GCxSvJrulk7y+9uxlKvoJ?=
 =?us-ascii?Q?QUPZ3yY7R9JG/dl7M6yDhTBaObRKoAXQCWzcSqaQzw2GhlHhm2X2JvOsb+yI?=
 =?us-ascii?Q?YMU8wb36q4I1wOZqbBFKPjF40JmURzuuL7oaG443R9pNK9epWV0xZR53TryD?=
 =?us-ascii?Q?VHZiEyFxgmZa09rsZsbVSDFRR0zzi32BqZqyz9HXtLE2tNS571ZwqHc+TWF1?=
 =?us-ascii?Q?NL1SglhYD3WIlPGXFdjypLKCSBYG3yS4zoBUe7o5x0A7v9KGvT0qvtHejYy+?=
 =?us-ascii?Q?1oA9E+49cR0I24sxwmkPwVZ74qLzQBHt0r88RikrIR2CNMxM59TmwWT01vK8?=
 =?us-ascii?Q?NWSdxxX6De/imno7FJU8Sk3lL5HEGDNRfmjTTMXGwA8dDUAyPYF8qIjLCdYu?=
 =?us-ascii?Q?PIfMmZTMpvvx83Mh8wxKc4289KWcp/WLY0ft7C0IsE1xAlXEYgt4htna1yuB?=
 =?us-ascii?Q?HKNgA++kfoios6EgeSFq/iYWgpuqyaR8uOAoo7ZEVm5f0o4Zwr2ZoNA3OpxE?=
 =?us-ascii?Q?+Ft3lkrs9CpB9hTa3PI9f6Pn21UFN6UEg2eFW1Y3sKZdXpYzLs61hvMLiYpO?=
 =?us-ascii?Q?7xT/ADdLR0Jb5el5sloWhQ6xOUChypdcY0k0nNBQlxSLEpsttjLcqaMyhofx?=
 =?us-ascii?Q?LzdBdy/eLLKcOG1knp7TZVuB4WHNVpoJmGjjPbMqUOqNuArdlUD8mX/P3JEJ?=
 =?us-ascii?Q?YhI1KH0/ahYnMkQdaJmQY/LUCTa+sIvpk8qzHqaTiAjKJHsRckLuz/Wbb0Su?=
 =?us-ascii?Q?dcGJxMxgTKn3ytnHlsvYnl03Hf+IBD3yQIRbOkqvcI+SPEN6ahhyBOGZyvfA?=
 =?us-ascii?Q?mTsdtHYhrLdSclWXBe8Ga8ZU2kUl1eSCpZPBBONxB7JhEUFNdgN/YN8Qlnsv?=
 =?us-ascii?Q?pgnU5d5rPT5GF6I4RS51TpxM5l8rZq7vR9TonrWdrrztusRK9AKkskhz1du4?=
 =?us-ascii?Q?8qz+iTTWk+IhLoRHFC0ZtkF5k10WGuVFBm6BqCt0HAGr6wANEkTEsE6SWSd6?=
 =?us-ascii?Q?SPvxKBrEyEyKXAMehuJbSsXTHLk2/U3OhCjgXmMyJffoGQ7ghDXSyQK/oGgX?=
 =?us-ascii?Q?RHdM5Ir4411Jbu1NoIYM250gQGzzmixW0t42w0BkwUqp41/FtGhy3P/gwDxG?=
 =?us-ascii?Q?U2Zt+UnXzbgjiO8v8b7LT+62JWz8kH7F7E8a5l2t9OCYTEgjSkHkDdcJRM6r?=
 =?us-ascii?Q?D2lhY93/s1CWUF5QkCAbar2W769oY8rISQuP9O5ujMNRc2COcr82?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e782074-fac4-4c43-9c4e-08dea1f294d6
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 11:13:58.5409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z42sQINyUDrkeBZue8XcDqt7gXUCpCEjUmEtt/cC2xw9y35HidzhIvOBqDU3TzCYuEPOg3n+wERnTMeaLwWliXacWT91WUFnuLRVVEBoyCP72yfDp6P3U184PGnwCD+A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1156
X-Rspamd-Queue-Id: B98D645DE2A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35486-lists,linux-gpio=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,starfivetech.com:mid,starfivetech.com:email,11bc2400:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Add pinctrl bindings for StarFive JHB100 SoC Peripheral-2 Power OK
(per2pok) pinctrl controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../starfive,jhb100-per2pok-pinctrl.yaml      | 154 ++++++++++++++++++
 1 file changed, 154 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2pok-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2pok-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2pok-pinctrl.yaml
new file mode 100644
index 000000000000..339123082f15
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2pok-pinctrl.yaml
@@ -0,0 +1,154 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-per2pok-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 Peripheral-2 Power OK Pin Controller
+
+description: |
+  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
+
+  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
+  per2, per2pok, per3, adc0, adc1, emmc, and vga.
+  This document provides an overview of the "bper2pok" pinctrl domain.
+
+  The "per2pok" domain has a pin controller which provides
+  - function selection for GPIO pads.
+  - GPIO interrupt handling.
+
+  In the Peripheral-2 Power OK Pin Controller, there are 18 multi-function GPIO_PADs. Each can be
+  multiplexed to several peripherals through function selection. Each iopad has a maximum
+  of up to 4 functions - 0, 1, 2, and 3. Function 0 is the default function or generally the
+  GPIO function. Function 1, 2, and 3 are alternate functions or peripheral signals that can
+  routed to an iopad. The function selection can be carried out by writing the function
+  number to the iopad function select register.
+  Each iopad is configurable with parameters such as input-enable, internal pull-up/pull-down
+  bias, drive strength, schmitt trigger, slew rate, and debounce width.
+
+maintainers:
+  - Alex Soo <yuklin.soo@starfivetech.com>
+
+properties:
+  compatible:
+    items:
+      - const: starfive,jhb100-per2pok-pinctrl
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
+        pinctrl_per2pok: pinctrl@11bc2400 {
+            compatible = "starfive,jhb100-per2pok-pinctrl";
+            reg = <0x0 0x11bc2400 0x0 0x400>;
+            resets = <&per2crg 1>;
+            interrupts = <63>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-ranges = <&pinctrl_per2pok 0 0 18>;
+        };
+    };
-- 
2.25.1


