Return-Path: <linux-gpio+bounces-37859-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vzDoCKzFH2r0pgAAu9opvQ
	(envelope-from <linux-gpio+bounces-37859-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 08:11:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 910C863490A
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 08:11:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37859-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37859-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=starfivetech.com (policy=quarantine);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA2DD3118F33
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2026 05:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3123C3F58E0;
	Wed,  3 Jun 2026 05:54:20 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2097.outbound.protection.partner.outlook.cn [139.219.17.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5863EFD29;
	Wed,  3 Jun 2026 05:54:18 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780466060; cv=fail; b=a1VRri14K9u41sTA2h00CK8jrSWax9pVNFeMxJTKWRnqg1bOLnuDpEegerWjg9LPP0oxmE1OR+F0BXyBxyf+TJZ/uGG0nsjOv/awA5uza4R8a+IFogEkb1HkDc22Fugu0MlAn41akvFcV0vwTwvbr26U/mQyps+msTjWRsBksNk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780466060; c=relaxed/simple;
	bh=aFvylQfSN2d945+IqOx1otwN60uv1I8Go1pA+HqD6Po=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FuiVCUQ9H02OYfsJeM19VxyFqk4FcVm6lOnhvmu1qDCeMUR/K8gQzXfPNqiGWUsCrqj5hQlXW/HOy/HVh9EeXgSBOrj7gB7KFenlqG4T7enP4608yokheRoby2LIFLRwsGNcCsKseXEa2Ut3yrkhqnPtioSivS+5g2YEXA4MkjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XDmCY1Stuv2p6uUuHhk3hI90xBy1gI4IFzjBwKJ7JBLCzQUgZ/Nxv/362dxhYKuEfs8MJqNgkaUTJ5fBMlj/fl19YoWQTcDb1f83KVLfIghbiHOL5K9qwk1x37FsnQIx2H7Ee3sLIoA5gCzrRAYT3RZdBbLl9RhxShles06l1VGLzF7VOLWUYhCHKRLZNrvH9ij80zP5bzN03ngEwud+By4Wu9JQuOwegsbtAMc4nDIz7V60amESAH+AqPh/VsA3xPXqjn3gvkoJ+jlutqIoXj6ea3FwXcnPohF3uwi/1OL7DPyPrIOPSqXL+DeNYjkKniZCd5BFRGOvglrRokpENA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2UBY/+KmzO6oc8d/rYlrh0pCQE4xi0rd7odwlX6hchU=;
 b=k4hM1UkgElZfuu4QFFAMzWTnO6DIIirolnkv64THs9I3O4nkH/3Fsrbv3M1VG/DgFbupg4UIZarWBI9xGRwht1CeYLX8vd8NTwdd3+bd50E6HQ1TC3+Sw7nYrjsIb0/0HXVQEKuFXKr4Gt8CcfIy2pj8StgHOuWwQ77xXVr/rycTFydpBk4f18QYIJ4jgSg52l8JAPnA1j6ynmWqBJoeaODn3K35/XcnYYzPoPwyvrHVveWGDLpOprVPyULE2tNZZWlvZGVPe+LF7ZS3QRFTvNFf2+1QghfZQ7ViG2rt7BNzPZzvGrULglKlyhjC4DwKxirAxRURMq+ytLiAFlwogw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1153.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 05:54:04 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.21.0092.006; Wed, 3 Jun 2026 05:54:04 +0000
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
Subject: [PATCH v3 03/21] dt-bindings: pinctrl: Add starfive,jhb100-sys0-pinctrl
Date: Tue,  2 Jun 2026 22:53:29 -0700
Message-Id: <20260603055347.66845-4-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: b830942c-9331-4bf8-e7ef-08dec134848e
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|3023799007|22082099003|18002099003|6133799003|56012099006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	ghoGWDpIOuKjK7xGGvis1qQ3h9xAZlHy5lbrFaIj3bJ2P42D94JDwbYVvSzGE0GZCEyrL1hPLKyc8Zess9iSXMc+bvhKXgsfaHr51itJMV5f8+lUn8cCxFcue9IcVKczKpdP7Czmc48b9hBWMtkGvCeMekmi5DpBBYchHFFA5lvdo8ynEEoYCrN6RAgeyA/wN62I2OtRT39c5RSb3LEoGiYo2IBDVjnm/PvPDXNpq5t/5yBahJVfBS5nL1w3kmrztqqWV3t/obButi40iFSGqCcuDfLojHrv8EQXGNSgzFZYPEjLVrE6IYnXnLoXmOZTJxdVmL6t54nAUfnKe5Q8ACoXM7Ot6Sfx0EmYWa+GaGDKVHUDbFAGTWZc8oBBDngYfMR8FyI605XZaZfv1antC8bb4AINObm88UUT0VwGVIOq19igy9x/FEnEjxEgO7pArHrLkT9diVw5h9TXeCJ9BQE97eGEBBUwk830OsI/sSVlWaoVnXrOiq0qAwVW2sBTVajjesI0YKr2Pkwf9vQH54Znq3Ghh5J/Kd2WM0tXJHPFtEDsVvHWOn6BNouS5xe2bca75KSg7a1c7aFYVt9npw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(3023799007)(22082099003)(18002099003)(6133799003)(56012099006)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zhJriAx+xPWt5FUsOP4/Iw/TBJ1+Wl9i+HXBPzxi67kbeR2/Iu6SFP0k285q?=
 =?us-ascii?Q?fKd/A8JmbJzpMKgANc8uW/ikUYBLiaBHYtPcBUN2Ag6oCQVsM+VEBjyBew7j?=
 =?us-ascii?Q?a9Wuwc9etCYNvZlpfn4PzsNXfb3J6iSOMjMP4TWNetAuc7uGnRJOb/37wII0?=
 =?us-ascii?Q?s9SLtis+WWNZShfDULFXk40SZnVTnNxVhG3iIt8yZJdBNOpruApmB9uQhLRC?=
 =?us-ascii?Q?OCbATVCJaa+5e+u7rHX6jM96K5nF7x0Hi6GWKD9x4UnDhwzzGw5WIr0HNkez?=
 =?us-ascii?Q?mb8Je2XlRReLDDBltYhv94x5b+I0WJYd++yjNxBbO2K5YF5lmXena1wPaxdW?=
 =?us-ascii?Q?l4bHATSzvsOkTlaoKabNVwythWPodnTrCKpDV/F0LbKGSrLUqdgn+wmxFpCW?=
 =?us-ascii?Q?CSGaYgDAclXkFDY026DOUFyDqDxJc+NZ1guhgTj+I4QxOE9RHSdDdpzYMvlM?=
 =?us-ascii?Q?G3lufXH23Hb7ozrhFhYRFpXhpkjahzbZxTIbNEaC9UZpC9eB1+kJnVzT4Oy6?=
 =?us-ascii?Q?6lieXC5olgMFZw3RVNK3gnVJege3u9YNyUrwbCLZ8AbkhJFoJdxlEVj21VHl?=
 =?us-ascii?Q?+aOLoVh1C7X+vs4jLqaDie9L2qp/5M0rTPWmn67JEFj56brgbPa/Ntk8lUfS?=
 =?us-ascii?Q?bnVz7fWuglD1BpRgcCLrGc2cIDdFIDfTlTBnTCqIf1jIhStwvBdkBNYNHKQg?=
 =?us-ascii?Q?jNE2XV1weJq972B38EvAM4Ag07JlFD6+eStLIEykz1bhGjmjPHl5OhNhLZkO?=
 =?us-ascii?Q?zj6zsFri808AuqZ2XoSBpYG1tYh5ysiWuqfo4tjkj04DBB5DmX5zUW6brq3D?=
 =?us-ascii?Q?DnY95NxHtib/XDfGr+wbD9wnOQZSG0sDoew1Fu7MCWu6OUiX0KJ4gQsTRSaZ?=
 =?us-ascii?Q?iPdMzKukaeGLVtiwp+1nOOarKgFakAtJAd8D3sotoRLJrNJwat8FczRKhQvs?=
 =?us-ascii?Q?BSXxGWd6SKjvMGOko7p0LXJKUanwWby7sgKm7wFToeDeUBUkVuLzQe5OcOgE?=
 =?us-ascii?Q?QIVNjHyQlISf9DIgVBlH7BGKk8yPH9mSTo7pcgXIyapoiQ43sF7ao3eoSgeg?=
 =?us-ascii?Q?m6Ezm1rFuRIb3a904Orgbwozu07FS6rW7Y1DTxMVpg8OVy2Hmz+1KA11dshk?=
 =?us-ascii?Q?REeG3hEjJ4dUYogu7NU8pN83Kt5W9C8d/lHtND+pATI5I0jXaumIvFlGeDWD?=
 =?us-ascii?Q?RwyuBlB/b/tIDcw90TdgmNyh6IEG7w5vdDxMK+NN6n4WS5PYjGsRu9x9RTw0?=
 =?us-ascii?Q?T6P7R9NMJcZC1d9M5YS44l541Z4+PTykt3cX3WBy3InUzk8QeLAxzjrR1DBJ?=
 =?us-ascii?Q?ARFvhZBoc79S8ut3wpVm87HTTr1FO3wyNv7a51niih5EgkkmDqQKaXDX9SiO?=
 =?us-ascii?Q?62NsaLM/dM28iohx0cx56FwXvYPh/S6DkHk7gp2J9vigN7bPtCeMsDNSgowr?=
 =?us-ascii?Q?LPxvpOZnFwl3bAnuop2YJZwvGvKam7wZeb8jp7rE2Ala8fOY6Xv2+gWutinA?=
 =?us-ascii?Q?hGJt8ukf/4Khi/jzfo+fukXB/eX7fyV/29gJQFMS5Al+QyG4zE6IvHwh7IPM?=
 =?us-ascii?Q?tJj00jvhFK382P1AReaQmwgL+F7uwI3H0CDPbWob9kB5OyLeyphFiocugeE4?=
 =?us-ascii?Q?iKQjM3d5HuLXkmIWdfKQUPIcZFq7aXEzOJhUWkSWuUglJLVx4qs3W1tRQhOt?=
 =?us-ascii?Q?0Sfh2U8YkN7iOrpUMG9lx4ApI1eUr2i5k1nKgxjXIppX8iIr1rLB2MUxxqGi?=
 =?us-ascii?Q?oYlKy5Q/bZO7dQetQF5CZcbEMDwhG24Hz3gXA7xv6warRXz3va67?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b830942c-9331-4bf8-e7ef-08dec134848e
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 05:54:04.1090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YvsLdoLWnApivzo6ZKHyZt9DAdncd/t9cOSsHKxhfULPLmw2/D3f6ethDrwVxCDr/LDsR8Yb5vhk1j5lAf7r7D7lfUh1kOdFqNkfYpOVOCcmSsmIdlXl7R8W5gpFPKBs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1153
X-Rspamd-Action: no action
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
	GREYLIST(0.00)[pass,body];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kernel@esmil.dk,m:pjw@kernel.org,m:aou@eecs.berkeley.edu,m:palmer@dabbelt.com,m:alex@ghiti.fr,m:p.zabel@pengutronix.de,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:lianfeng.ouyang@starfivetech.com,m:changhuang.liang@starfivetech.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-37859-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[starfivetech.com:mid,starfivetech.com:from_mime,starfivetech.com:email,devicetree.org:url,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 910C863490A

Add pinctrl bindings for StarFive JHB100 SoC System-0(sys0) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../pinctrl/starfive,jhb100-sys0-pinctrl.yaml | 161 ++++++++++++++++++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  17 ++
 2 files changed, 178 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl.yaml
 create mode 100644 include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl.yaml
new file mode 100644
index 000000000000..1baaeefdd090
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl.yaml
@@ -0,0 +1,161 @@
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
+  pull-up/pull-down bias, drive strength, schmitt trigger, slew rate, input
+  debounce nanoseconds.
+
+maintainers:
+  - Changhuang Liang <changhuang.liang@starfivetech.com>
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
+          trigger enable/disable, slew-rate, input debounce and
+          drive-strength.
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
+            enum: [ auxpwrgood, gpio, hbled, pe2rst_out ]
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


