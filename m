Return-Path: <linux-gpio+bounces-36837-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIxYCbWyBWqeZwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36837-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 13:32:05 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B776D5410AF
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 13:32:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 444313052097
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 11:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD4643C0A05;
	Thu, 14 May 2026 11:28:51 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2096.outbound.protection.partner.outlook.cn [139.219.17.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9723BF69D;
	Thu, 14 May 2026 11:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778758131; cv=fail; b=pnCRdpliL9hDjuBUFs+di/dezLtxczFF18QWkjsf3SvhzU/9KD1KU3B2dvJL4bZ2It+0zeyeO2cCRXJQ+UD0K+MmRLOYiw8Zjb1UTC3ZacS6QtA2a+PD7kYhoMSoEHeKZ+MZXobnrxCx4uniiSKPLmYeBQUHhsGB55C6BgPitUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778758131; c=relaxed/simple;
	bh=q4QbNw8GD98e50vvHIDoLrXbx9nHWAu9o3/M+gtM23o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CtxhjiqF93K/oF/WLKRiyW1E0IjeHRTnCqotOqmI+MPjmIvOKKzB2YK+9XqthX0c464ZfWFMbabKpgPAQ2islznO8EeDY7ZjJNsRxagUAx1KXuDXt4TJ/1eljhpYJHmEqKvwXL80L5XT9CUczhPCo5XDmzq/KpMdjp+p/tT/p5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hRLlPQ5JVLeHprGJfy9CrJ5Rw48ie/YtQWBqpUmu6UvEWuFNTF3zsy2FV00VN2cQYAlFXylAG/iOVS/qq1AcD++mn0g+1NajUMbGY7U2mAlka9BEZykpB5RW0AUNViA8vJo7gDR/qIeaG/nUo0bBCPMCsC2LtWwJgror706zGneXYho+9bgCV4s0WegaMDSPLWs5lI91udiEbUzmlWsyBkbeKLdSX48y+x/W1SWEs7+hR2tE5IdIwyKvEAIaFdle8mUtv4RfmEH6vaX0rcsn0f3QnBjFMjpjZv9+xDVsG3ktX0CxFVmcvOMAd5l7uL0KYaY24hL3Db5X6pcCHg3pBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LNjZfvzTN9rWPtYcvGwqlDQAc0hM3DIewUD5L1sZ+Qk=;
 b=aR3/p95JpBO3sLnj6+bLpBk0CCDEAoXbbF1iQt99C33zSUrJ+LLLCm6VHv5hYDzNIjSXIPqk3CjErwE6C5zooNUZfkratUj5CvtrdA9YKmEiqEGX9+xowi6O4asdBAUKZIZEbFDXWAZ3UFqIPyGksQO0MHZ15FNk/3YvrDLa73yFGOu7Xf+DPtkDmjLR90niFacyWYypAqU61EYTktC1/0zl44WEFokkdqZBGlFuKxrq4/ylSeNcPXewoUcXQ1Paesim5HFxDM8twpxwNX8XBBHjywiMFCA/ZmMK/ldLLcWyKJ0pNGoQ7RXFiycXs3PinP7skfuMyeX7Tcf75cH9/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1139.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.25; Thu, 14 May
 2026 11:12:36 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9913.009; Thu, 14 May 2026 11:12:36 +0000
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
Subject: [PATCH v2 04/22] dt-bindings: pinctrl: Add starfive,jhb100-sys0-pinctrl
Date: Thu, 14 May 2026 04:12:00 -0700
Message-Id: <20260514111218.94519-5-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: c7e3034f-b89e-4a6f-cfdf-08deb1a9b42b
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|921020|38350700014|3023799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	rcyr7SWmLlaOxKj7y2cnwOJFvzBdS+iNGFAya80vpblWH3gwkvdyS3wtwlCnIRZTGu2u+kWsvkd+U21HpZtTE28xiR40T72U9N1uUXzdIOg1sJdZ9Ke2hFQGxBHhstZMpqo35MnqZLOHTXj6kicibRUWbU287MyB7ngYlHNxy96LxF15txRtETj6E7vFNqk5n/U4jr2b0G0KCc5IonoBf3iXGEc5fxo+BulwND1+nSnaLq0p7mrJexxEwtBUAz8lTgvfjAFfTCQ+ATf0SES5hiY4t79Z0Am5QYbiaDIxaZLOGkwdcVhfG1ftP3nR4xP9zrIaYCpbENTd75gk7n2nLIOH4TBxUTWdqgjndVWpRYjuwXee3hJRU4sVFPgooLcvJFkrwdpv8LSZQWe60G39xd8E7/ivmarpU5gFOh/oGkydRLRv6EKxMHvRGufAJ/De5ttXww+sxECw3AmXwHvlHN3fHLU0MJtJUds3IkYBc1BbSgraP6CV8jZ0Qsnfi063GOR379CarKPhK0Ndk56ipL/mPcE9QcUtuhsolqU2DHWzyStK9rpaOZ1luyqgDrgtgrdEIRaRlQ2XXUKZJjN9Bw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(921020)(38350700014)(3023799003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4u8b3D+H5h6xCJEizbkJ/ONLSSl5zTgMTlXXO5Mf5mv4PtS7IZR8XlQfiprh?=
 =?us-ascii?Q?IrvtduM31SlZ3L6t0fPKFlZBBOAK12bm0oS/13E0watXCCaQa4NtvYskh/o1?=
 =?us-ascii?Q?wN3Ek2bL0EXkqAXt9kthYTNFaX1fGUIJz//nyKFBZHl3/b1UMrYfEDxGNshi?=
 =?us-ascii?Q?ormEY016Ko1WWlSz0DO0YuA/fHmMwAZkwFh8dDztJknuUNHB2C2NFQrEgUOj?=
 =?us-ascii?Q?BSt0wrD1uBcfrEjtV78BWkDDUiq3eM0Lun6ZXEVTAtV2USV5UMRlNKmwNs5O?=
 =?us-ascii?Q?9TuhNyz3zF6aTvCkdXGqPV2Vi/GDERqpj2qUcpler1gC5EJ/McK0QCk3M1jC?=
 =?us-ascii?Q?VOUeURgXU0m83n0BdLuVcrLcqsJOqfpr7tqR1LgWNilE/3c/k3yRGYRE3EYr?=
 =?us-ascii?Q?am8TL80yeiitOunTvfJXS+YzmEZDsFBd/QJNHLmm8drJjkdVPrE3VXjVtcKc?=
 =?us-ascii?Q?H7AK3L8CifCbHw//n9C4yg7DOPGExNIc2fEGpvHk1L1as1RLY+9d69P1bdy+?=
 =?us-ascii?Q?QlIx4UoY76OblLL110yAiFD0oSDY3B/P09jAmxW4mGGnQG6duVtlRQmdFveh?=
 =?us-ascii?Q?Ntra3siBolCA/jBNQDBdVyKdcTqFHotz8Qy7uUmXRKZICIo3dQum3gt/y4zZ?=
 =?us-ascii?Q?4SoxOD/dER35jXk8LehT2GNBj+f1MqsCPXb9Inh3bE0O8HyDA/MyoORYAqUK?=
 =?us-ascii?Q?2Sl+t8F4dMvk/fbErScr3GKnQUaQc2YKZov0R620rQhut4POoPglRMOep1C2?=
 =?us-ascii?Q?Mhql5MbJNwg/l1elE0UyfeHNkAdO/tupE57SkrGsiPjiCXt9uW0oEVIehFpJ?=
 =?us-ascii?Q?/Je7RWQUvCXkJNhq/jghl3hdTuSda5ppEALSQSE10oXt4RbuU3Ut3mtCOcon?=
 =?us-ascii?Q?mQLPFmm30nUoe+buGxAmOZon1A2gn4zM067TxCqfHM/MYP24r/7H7hG9FzvP?=
 =?us-ascii?Q?vUZqDAS4DT6pGxYjBlGUH6V7V0XX6ZCafoIK5RZEJWPcriYwNLTTFphk+QjI?=
 =?us-ascii?Q?X1JmUjEMdN+NE0Zkkl4BNHnjcXAzLQr0Lfc44f8KjO/KvulMVnaiJGxMBwZ1?=
 =?us-ascii?Q?KV8WZf45PDtotSdHrnECVxfh1G3YOYfnhxRkw3QO0qsLmZUj+MfHBAZL4mx9?=
 =?us-ascii?Q?n3KPyztzVsqRMwNeVGRlEBMMjeeIkaBzHsbsm0sRyruKaHwxAmrqkJsHLxBm?=
 =?us-ascii?Q?3ziGTDtQiuEuTaC6R0qcLPk4z8++OX6Pt0nxHMraLCSzS0Q9wN78ubltXg/Y?=
 =?us-ascii?Q?Fgku4RwfsvbYaU+iM1BBdPBDn56t8BXpzM1F4eodZ+XocYj/IYhwCpq1ubLG?=
 =?us-ascii?Q?t2pDltz208VKV7qZLBq8bQcC0CdpVPbrqrGkCuEgp80IP3os2w6/of8pOw4l?=
 =?us-ascii?Q?TKE9amGvrM8+t8wIQef22VT7hpiveyM3nEdmBc8jIY1KPHjEOEXKn7agOVG1?=
 =?us-ascii?Q?CmER4Nuu8nBLGCbH2BExJDEvyYY+Mx88q64OU5zIp1nbMNb9pXE/FOx17MqV?=
 =?us-ascii?Q?YexR/HePmuSMjSVpLXkAjdLIT4RmKs8Kq/4cJ7HkgHDECbO9JyxgPk+bIyzz?=
 =?us-ascii?Q?0NKObz/qgsKaT800hc33In8KW4ZRmOd8DBO8UVa40oEQWXuc/RYycZoWRMeA?=
 =?us-ascii?Q?JqcBHR6oQys/F4OIsQArrsxQESqJCybAkQBHRtigPGrELv4gJuFQSKO1xWiC?=
 =?us-ascii?Q?DgWvyHFw82wjfzh+D96GHQuVUWTRXkz1R6Eh7ZKOfNhKQEg/OcpMlhD+hMTe?=
 =?us-ascii?Q?6cAWnWKiMjlf4VRJo7XtRsyWMRIaWA5uu/x2UYM/5ufnvd3Peixb?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7e3034f-b89e-4a6f-cfdf-08deb1a9b42b
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 11:12:36.4697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c21vHba/K59TNC++u7gWEbCvR/Sickhq0Q2TjPbUWxvUOwkIZDC9toWSr/0b+h/FYNUsJ3EG2aUpvgO9hXz5nmHu53ms4EngvbWjDSaFHvbv6sHTihG4qY1jMbhM7Ky3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1139
X-Rspamd-Queue-Id: B776D5410AF
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
	TAGGED_FROM(0.00)[bounces-36837-lists,linux-gpio=lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.902];
	DBL_PROHIBIT(0.00)[0.199.149.192:email];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[starfivetech.com:email,starfivetech.com:mid,devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Add pinctrl bindings for StarFive JHB100 SoC System-0(sys0) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../pinctrl/starfive,jhb100-sys0-pinctrl.yaml | 175 ++++++++++++++++++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  17 ++
 2 files changed, 192 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl.yaml
 create mode 100644 include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl.yaml
new file mode 100644
index 000000000000..21d3693587fd
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl.yaml
@@ -0,0 +1,175 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-sys0-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 System-0 Pin Controller
+
+description: |
+  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
+
+  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
+  per2, per2pok, per3, adc0, adc1, emmc, and vga.
+  This document provides an overview of the "sys0" pinctrl domain.
+
+  The "sys0" domain has a pin controller which provides
+  - function selection for GPIO pads.
+  - GPIO pad configuration.
+  - GPIO interrupt handling.
+
+  In the SYS0 Pin Controller, there are 4 multi-function GPIO_PADs. Each of
+  them can be multiplexed to different hardware blocks through function
+  selection and each iopad has a maximum of up to 2 functions - 0 and 1.
+  Function 0 is the default function which is generally the GPIO function
+  (or occasionally, it can be a peripheral signal).
+  Function 1 is the alternate function or peripheral signal that can be
+  routed to the iopad. The function selection is carried out by writing
+  the function number to the iopad function select register.
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
+      - const: starfive,jhb100-sys0-pinctrl
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
+            enum: [ auxpwrgood, gpio, hbled, pe2rst_out ]
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
+        pinctrl_sys0: pinctrl@13080000 {
+            compatible = "starfive,jhb100-sys0-pinctrl";
+            reg = <0x0 0x13080000 0x0 0x800>;
+            resets = <&sys0crg 2>;
+            interrupts = <56>;
+            interrupt-controller;
+            #interrupt-cells = <3>;
+            gpio-controller;
+            #gpio-cells = <3>;
+            gpio-ranges = <&pinctrl_sys0 0 0 0 4>;
+        };
+    };
diff --git a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
new file mode 100644
index 000000000000..6d8f5516a178
--- /dev/null
+++ b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/*
+ * Copyright (C) 2022 StarFive Technology Co., Ltd.
+ *
+ * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
+ */
+
+#ifndef __DT_BINDINGS_PINCTRL_STARFIVE_JHB100_H__
+#define __DT_BINDINGS_PINCTRL_STARFIVE_JHB100_H__
+
+/* sys0 pad numbers */
+#define PADNUM_SYS0_GPIO_A0				0
+#define PADNUM_SYS0_GPIO_A1				1
+#define PADNUM_SYS0_GPIO_A2				2
+#define PADNUM_SYS0_GPIO_A3				3
+
+#endif
-- 
2.25.1


