Return-Path: <linux-gpio+bounces-37864-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DDqME4jFH2rnpgAAu9opvQ
	(envelope-from <linux-gpio+bounces-37864-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 08:11:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EB86348E7
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 08:11:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37864-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37864-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=starfivetech.com (policy=quarantine);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B9B8530E1464
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2026 05:55:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18FCA3FA5F9;
	Wed,  3 Jun 2026 05:55:24 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2097.outbound.protection.partner.outlook.cn [139.219.17.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8937F3F5BD1;
	Wed,  3 Jun 2026 05:55:21 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780466123; cv=fail; b=VBn9awYBT2tiXxuPve5Ba+Wq6RDDMri1k0FbZWMfCNdfutMw6Z9Wdotxc7hbxd4PbnwzaMz8CBxWaVNBvs8cm8J+fbLI/FMl+GWz2r7myV2KpSf2tBre4C4OziiVxopVL5GJhM2jXodek4xHzHN8Is6wYFsEOvVfmBKFFzfbbvk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780466123; c=relaxed/simple;
	bh=WcaeBVZ+anQdNVRJvzRgJY0Mos+n656WVnBU0YbKTEY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=J+Mu6DKAtbrThIG5rGPiRbDjXN/jvIqX58keksAPODikB0Vmk2rxWDLacGtqLJr7E8mQ1ZqmPjSmFGb3KvuKRTtuBHMukYBu52T4Y2yDyfEYk++zjgotuin4CVZMWycWCOvl4wWfR7YLkK3pfqOhXb4usyypLekcmSXdI/eRx8k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ap18XXOlBcNwLRgFBRmlaV31K8xGXb6yPPyXHuDvTi7C9XRCMf/FOOKWwJaMzKNtyclWWvF/eUvk5ZrQsFjQbF28YDSRTMef0+zecxpRLgMnhGBo5Qtb+NaHw02QvdYt0hDIZz8L6YJf8w0AIaFXW2Zef18r88QJUG/4/FsMDzb/Vh+6+YUrfGaDXGnkZlrY3FFRlz7zlDGSfkyKqTL44cDSrKU37VdqWV6OTQ348B7R/HFaW/0q8qMIzljkt3xZoL7PYldbDE2MDm/06fbZ0dHIrd/sflluQSDuZm2nBQoomXwIfrcvcX6qNAe35piJxTvmIT9VpRQyn6fAxCVbeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P5Vz/tqPBf7eBDlhCEzjV9yQK6baBKgeG2863hMfo14=;
 b=P/IsSnyWnWCXGMBnw2vpL7LIz0Qb+TYthGzb9hKQvV0+0HSXtmf3eJLn+lL5FYGaeeew8tcEezX65uNyfPFY4S8R02zpAtNlZlfc15X9hEcndVqTly+OuKSaeYsCaJ9pr47t67+yngShSO9y9fPxORPzbdzuB+iQdC5+UYhcU46Ua7+xLkI4YJ5yXPoEZQ6xuWUbLe4C33Lm1Ucn9yRW8IQc7O5Ob/ObelgkEWCjYlC0muLd9pwB8jcl3pIHzkKAKT7M0Pb9xGVXIFHm+ShoKrQhiI0571kKmLk5dYzxVvkCs/gV1LjOMViMB4DCSKCGkDgZYSbLGlr2CQfqp0xhvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1153.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 05:54:09 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.21.0092.006; Wed, 3 Jun 2026 05:54:09 +0000
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
Subject: [PATCH v3 07/21] dt-bindings: pinctrl: Add starfive,jhb100-sys1-pinctrl
Date: Tue,  2 Jun 2026 22:53:33 -0700
Message-Id: <20260603055347.66845-8-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260603055347.66845-1-changhuang.liang@starfivetech.com>
References: <20260603055347.66845-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SH0PR01CA0002.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:5::14) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1153:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c23c643-1bac-40e8-3546-08dec13487b8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|3023799007|22082099003|18002099003|6133799003|56012099006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	kQ2ri6br/3h/K8+MoP7DksCM7QXNE9QNXQ/A4NVCU7egDKhy1GdvHWvRgQj52nMBUE7C6uIZaguPjeXE0zy5vfVdp9aRqtO2Fb5C8rMA5DhnrVFAvF36MMyZ/AH2B8pgcLlAB6mA4i9oMZUTL88SvSVOfvGkaIo2ibGj26hn5gZazcymGq/bvGQ4R40V3rCrjwwwaTklneuVKo6dEhxIMV6MrrOpXMSH94JXe+PVx5u2HAZBfuqwiGtEYXOrAipZfsPAMmo+34uBApPV0DyVHAkKmzuS5bMMciumL9q7hX65RHXdSVTiPkn7s/jJAevjvlKG9JmhJowUGpxeG/ulDktGg2LTjXx0u+2z/dAifMDSraKTa+UD1gwvQqiT2I5IEuUDdg5pN5AH5FT79Ppbyr1KgvqUSr17gHx6ks+6e5PWuTKjjMQOlChiZLXi2qeNbvyEmW54jcUW6Uv+uguF2tw9UpG6MJpzP5V+qzI+HfnmFmoU8ujVGXXlb55WbuXjJBuwifz9H7cbjLhBHhAUamEbBnZpLEsOyaQISwbI7Mwvtk9QlWUBPjh2eq2hwPpWgubgjiA5Ucb/u36KT/avBg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(3023799007)(22082099003)(18002099003)(6133799003)(56012099006)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9Ue4k4guNG8dEb85fEE7gO0S6uV49kkaIYB67ZzlrLeaiuM0X/5oZtZVjWrY?=
 =?us-ascii?Q?Lc90eaqmBjfrbtycIpJ9WPHSJKlOuyolrJLk4HXyhfjLxnYYuHH+OhHjFj1p?=
 =?us-ascii?Q?C02+QFcpi5fzq3salw5pr0VMkWm+alorP3+kZV7FisDbA5QIAFc3Yl3kwDec?=
 =?us-ascii?Q?uvPh/fq/14KOWr/Ksn9QYAZ/CnnV8zahHLaZ8ZvwsyXsLOzYldsXCnOl78AS?=
 =?us-ascii?Q?Hp5mEnDLONfunf+74ACWpawI79duI8iJyAU4AAjG+mgGCLcsC40qJyybiMsm?=
 =?us-ascii?Q?UZJep20K5UPFgA6XJ0rhhaQ39NlP0PtyA4dkaN3Vn3KSve4ExzNbs+ypoJCx?=
 =?us-ascii?Q?mwxrDpB7+ft6CQ/FvbngVrbQR9Qa2cXjdq0lZTnJqcFzqWmQd1KkwAbS2wNh?=
 =?us-ascii?Q?2R6YBjFRed0qI1Ml6nsfL8iSV4165EmWlLvcVkinCk3roUXym3eulGSxYzhe?=
 =?us-ascii?Q?jRR+wkCF6WYbIyW+02XoZLSWpAlGM+xh5RcDBwBxGInSdKcO9xzmmJZrcVBO?=
 =?us-ascii?Q?CBatGY8/tmC3hXwvEeaDPJF900gKnG7G2qMeeWUfl+FZFqZeoCqH78m04MZJ?=
 =?us-ascii?Q?dpOzKN4JnFTOFAFwiA8d660X0o2YCt5WUfZuUZiu3/YlJkFG05bqZBDk49xs?=
 =?us-ascii?Q?9L9CWUvttzznFmOvHB+P4HZ6AT5dvGO27LSeCk1Rbt6ilmgEjPTXGWmjC79O?=
 =?us-ascii?Q?YCrFRk5fRdp1gJXby3Hq6gF5L9G58/gruab+kVGU0ek/8z14coLQzDrDp2ql?=
 =?us-ascii?Q?uuk7HnYGC0u8Z8lZI5z43hJhI4n2idD8mQINRk+puogoPHm/2YFZ9cXqNNYo?=
 =?us-ascii?Q?ayl2E02ox3PJbzunb4T79CxCeMY0YzfvayPhveFM8AvWDJtLBXNCY3Tw5Gqe?=
 =?us-ascii?Q?qAzdUY0AcQIgZike4Ac6QQfLCJnAg3NbR+0bfaVobk3jixad4697nv4iOv0P?=
 =?us-ascii?Q?M2YbRcyni3Qd9hPcUmJ6ZxQmlphurvYbeVQ7MpoYbeHaE6+E8lYfcaHKP00A?=
 =?us-ascii?Q?Vf4qXO1gHznzwDMkhN1DNktXAE16pFnY9cdBOo3N6W5uYaTMYwdTpvRKNhS2?=
 =?us-ascii?Q?LvJ5KF1Y8mThgjvynd/lty9lr2tjUl4jSNJ4E1YHhs2qzhvCkeMihYVqj/pR?=
 =?us-ascii?Q?b8D0QR6DWl+HwJm815Hx1d8UteYv+QwKaZYg9OCXozMRE+4PlFlCbuypcMum?=
 =?us-ascii?Q?pDmuQK37RAW2xp2WuM4M2WwafkIkR6FzLqz5dIKuM5I66VPytEtv+4WT3uiV?=
 =?us-ascii?Q?sjpwCIJm2lH1YFzcUNgivnPqfNwqszUUxjoTFnk9S2D/llAjFi1aol8NJ+iu?=
 =?us-ascii?Q?bKNpe1lfzsKtmPHwYqThafgPBdmlZ/aOFZyD6/zbH3MDpw4W6WDfYfTT/rEM?=
 =?us-ascii?Q?b6dE7vjfwElZgejYmJO/j8U3bvUtNvKuKWGPeZqmwrRC8MGT/Pz+N5t9mc9U?=
 =?us-ascii?Q?MUwhEwtYaVSLRv0vOGd28SKS/pTVvh3a1JZnkXuDsrLQ1FmgVTMaVWA+qkQ4?=
 =?us-ascii?Q?ed4mw2bzOcxjXJH4kM/eAA8bcfV6xseTzeAIkOCO0GYcLlN/2uZW2GBYZLRY?=
 =?us-ascii?Q?rQwyfFdGTxxXHGuCkzqS3QdNNIZdpYSPQ02Wzy+uM9g3omeMgrIQe3f9bwxe?=
 =?us-ascii?Q?2o5m8EXAvuB0ijYu++mW2WkfQjlbhOV8PGeXhJFKI9RMHyVGmGfVmJJgglFu?=
 =?us-ascii?Q?Ln0A7QKAe+lwz1128rpbKZZ9e+FI2y256mqOVynzp5rmGrqeP9T+Ls8Zm8G2?=
 =?us-ascii?Q?E0VIDLv4oscUXxm+HnRQrFRFShpskjx8iFG3kg139ma1TBppuYW2?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c23c643-1bac-40e8-3546-08dec13487b8
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 05:54:09.3534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SLzJor+PhP6zDIBjf9Yk4BMMKN8NGk9kL0Di8Mu1LCGzMx6JTJQzk/F+BYBAucWBEq+ZTc9x8Bt2TLxK8t5JNFVT4DBmfn840B5rhg/7gl7MdP4HOIVWQ+BGMES7u/Kg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1153
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	GREYLIST(0.00)[pass,body];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kernel@esmil.dk,m:pjw@kernel.org,m:aou@eecs.berkeley.edu,m:palmer@dabbelt.com,m:alex@ghiti.fr,m:p.zabel@pengutronix.de,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:lianfeng.ouyang@starfivetech.com,m:changhuang.liang@starfivetech.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-37864-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,devicetree.org:url,starfivetech.com:mid,starfivetech.com:from_mime,starfivetech.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D5EB86348E7

Add pinctrl bindings for StarFive JHB100 SoC System-1(sys1) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../pinctrl/starfive,jhb100-sys1-pinctrl.yaml | 161 ++++++++++++++++++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  10 ++
 2 files changed, 171 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys1-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys1-pinctrl.yaml
new file mode 100644
index 000000000000..54e7f4b795bc
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys1-pinctrl.yaml
@@ -0,0 +1,161 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-sys1-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 System-1 Pin Controller
+
+description: |
+  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
+
+  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
+  per2, per2pok, per3, adc0, adc1, emmc, and vga.
+  This document provides an overview of the "sys1" pinctrl domain.
+
+  The "sys1" domain has a pin controller which provides
+  - function selection for GPIO pads.
+  - GPIO pad configuration.
+  - GPIO interrupt handling.
+
+  In the SYS1 Pin Controller, there are 8 multi-function GPIO_PADs. Each of
+  them can be multiplexed to different hardware blocks through function
+  selection. Each iopad has a maximum of up to 4 functions - 0, 1, 2, and 3.
+  Function 0 is the default function which is generally the GPIO function
+  (or occasionally, it can be a peripheral signal).
+  Function 1, 2, and 3 are the alternate functions or peripheral signals that
+  can be routed to the iopad. The function selection can be carried out by
+  writing the function number to the iopad function select register.
+
+  Each iopad is configurable with parameters such as input-enable, internal
+  pull-up/pull-down bias, drive strength, schmitt trigger, slew rate, input
+  debounce nanoseconds.
+
+maintainers:
+  - Changhuang Liang <changhuang.liang@starfivetech.com>
+
+properties:
+  compatible:
+    items:
+      - const: starfive,jhb100-sys1-pinctrl
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
+          trigger enable/disable, slew-rate, input debounce nanoseconds
+          and drive-strength.
+        allOf:
+          - $ref: /schemas/pinctrl/pincfg-node.yaml
+          - $ref: /schemas/pinctrl/pinmux-node.yaml
+        additionalProperties: false
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
+            enum: [ espi, espi_reset, gpio, host0_port80, host1_port80 ]
+
+          bias-disable: true
+
+          bias-pull-down:
+            type: boolean
+
+          bias-pull-up:
+            type: boolean
+
+          drive-strength:
+            enum: [ 2, 4, 8, 12 ]
+
+          drive-strength-microamp:
+            enum: [ 2000, 4000, 8000, 12000 ]
+
+          input-debounce-ns:
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
+        pinctrl_sys1: pinctrl@13081000 {
+            compatible = "starfive,jhb100-sys1-pinctrl";
+            reg = <0x0 0x13081000 0x0 0x1000>;
+            resets = <&sys1crg 2>;
+            interrupts = <58>;
+            interrupt-controller;
+            #interrupt-cells = <3>;
+            gpio-controller;
+            #gpio-cells = <3>;
+            gpio-ranges = <&pinctrl_sys1 0 0 0 8>;
+        };
+    };
diff --git a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
index 38d5a94e92e3..30704a5a3418 100644
--- a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
+++ b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
@@ -28,4 +28,14 @@
 #define PADNUM_SYS0H_GPIO_A14				10
 #define PADNUM_SYS0H_GPIO_A15				11
 
+/* sys1 pad numbers */
+#define PADNUM_SYS1_GPIO_A16				0
+#define PADNUM_SYS1_GPIO_A17				1
+#define PADNUM_SYS1_GPIO_A18				2
+#define PADNUM_SYS1_GPIO_A19				3
+#define PADNUM_SYS1_GPIO_A20				4
+#define PADNUM_SYS1_GPIO_A21				5
+#define PADNUM_SYS1_GPIO_A22				6
+#define PADNUM_SYS1_GPIO_A23				7
+
 #endif
-- 
2.25.1


