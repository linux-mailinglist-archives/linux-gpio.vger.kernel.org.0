Return-Path: <linux-gpio+bounces-37861-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XxUKKafDH2p7pgAAu9opvQ
	(envelope-from <linux-gpio+bounces-37861-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 08:03:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1836347E1
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 08:03:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37861-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37861-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=starfivetech.com (policy=quarantine);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2BFD430B1E22
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2026 05:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 663FA3F4DD3;
	Wed,  3 Jun 2026 05:55:20 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2132.outbound.protection.partner.outlook.cn [139.219.17.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E76380FC5;
	Wed,  3 Jun 2026 05:55:17 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780466120; cv=fail; b=a4iGUqMVuymQDh8SPY6oZycUEiNVZOl2xdPLOwUnOzjvA8e/jxdz/v+xD9wlWJVHSfT07eSgDPTGjYVuKmSFP4qN3X+pXoBYJ8tWb/yrRg6klbqqr6BdSzL1dJstCIOCyTieIughVrnV3I5RfOHeNFuGwlBxqThfUBDa/VIwB4g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780466120; c=relaxed/simple;
	bh=UcbNpd0ufCQTOOZevm/DgMaGiURh/LdXFe6zgMnPKjU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cZe9LHzFVsvrZbavMvzuG4ROc0LOrgBmWkcnQTabzGNGdNWpRBHsYuPtXbhA64CcGpfNywH+tw6GBnqAcXLDgQNzhPdmNdbY5r6rHHhDbk6FhuwxryQ6FB2qlVr1U1EOScPfDdgt+z1QcEzJq2qN75mWBzb0WKxcrEgYIk0OOFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.132
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OQJ6VyjEirlWjP0YAZkq6k0ALEJJBQEk53QLEP91XwYoGrFBE+lgtLx6/oUeIDzDHSc32lT508F2xmu8agr3b9M7WOXdHAzrJdc4TOvXMl7m6dyIFvKPzq0nOYZJwWQFMLLBagc/1EwTYAaDc/Ks5SzsxVtLIfWfoQMEy8u4w0Ru6HeiWYcLjA96TyzV+748J/B6yUs1x7eHx1cg/ycow0OG1/ObpV8qtrqhJ6mwKyUbW3fu+fgSzGyJo4QHQRDGN9sFgGoR0HmciiJWYmgkFFBEKzciQiqCogFuENt6wvlTjnr3MCqc3JHJ5dR9kDIeaDwXJUePGHaeKkxNrJBFZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0cYHrF9pKJPZJL5rgWDQPJmpqhdHwBwLl49Vt01Ntug=;
 b=XFVyWkcj3cilm5SLaKfzuryb7o1qTJvUXigcfNclfVVjekdnXDxW/3OFXj+j0Q1EFj8vZyjXwMGm5ZfD9MvEgRE8fFSetF4zxKus4ATAVcdI7GdzFqC7YRhqJf7VA+B2iJJVleSE85iip1rAb39pEndKx8nSFDZtBS75EoiA32h+i/779Ap95XLZY7FtY3UAJ1rjeZk4KJrraErzPdG8kAlLVRXZ2OI9j8OlF4vBJNaVvOQBH/G5R+NPwzzk8wmSXxk/uNih97EOij439gMWonue8HvLIKQ8eeqVLTB7V0Z5ofrAkWhLRKZ+qgPIHu8W5uodpvXss1WEQybETEvkeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1153.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 05:54:12 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.21.0092.006; Wed, 3 Jun 2026 05:54:12 +0000
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
Subject: [PATCH v3 09/21] dt-bindings: pinctrl: Add starfive,jhb100-sys2-pinctrl
Date: Tue,  2 Jun 2026 22:53:35 -0700
Message-Id: <20260603055347.66845-10-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 45ecab0e-ce03-4ffe-92bf-08dec1348944
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|3023799007|22082099003|18002099003|6133799003|56012099006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	RyB0wflfhpcPo63hi4zOC6TgmRPusn6jAc7fayi8q6OQdEIkyUM2Nqz2w/GGiQ1KEQ7aB0HA2Ez03aix31Q0TZ8rH2ok1Lxu/919n4DlW3f6XzCucGsIDJPuuv6dP7VyfmofOH2ELqXZU+jAjGFFj8+UIfkAvxhUI2h8QXk9uAtTYcCJeLA8OXwUb2Utk8UjYykvvutvhQKNb/GNZw/85PPsL2jGDrkRHHftnSyjpKX2K15UBkggqzf3eQQFIAVGWCgbrzHm1jQVEOqSikbc+lBrZPoU1cDqoW6DSRss76PPECzYb3ewBve2dvKrX2km/2St27AD8FCbZtNK3pdeyIOtJYrcpt/l5556aV+GOV2zSlXoIbQn5nmPldrLWxWWdO+4ZqySRHmSy5VO05QRJr8Ik2vOUBXGM26cSHAx23epPXL4SKgd5+xKOB45V9SDbMbNxbGYQDid9OXfdu+yZ94MmEEiXKzuFiZzasONlNF8y8NAsg1afeZMrkpybPedK9OpeNqZL/guQxv85OdcKiUOmKzUHwakRI4O0CDpK1di1cpjDGyV7RMjeIz/3SGT8OrNlISK5ExrbRfM6QpGPA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(3023799007)(22082099003)(18002099003)(6133799003)(56012099006)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zMTeXBcf8wop9Jl7w5SBBubQUCXGOp163czV9X4bNwJQECaXF6Ts1qFMlORE?=
 =?us-ascii?Q?nIoX9NVbCJt4Cdtt+xDwFStVUuOaL7qeJMDUAw3bQxf97d54C3838LM1M3Ch?=
 =?us-ascii?Q?jVi1In/TSgi6DuYy8A0wifaUzr3rfQZnHBWRLOVNmjcXhrP5ulN6guCg2XoI?=
 =?us-ascii?Q?ob4hLr0j5nTdMiwbCnFduWZgq4uEhKRZzWgHvGXHujNuMPPUzEdKdp63+FKl?=
 =?us-ascii?Q?tpQFJMwafWN+/kOTzIPDSvnKrn6+DZOBkBAxyMImq+phPAZserggIl+MpBTI?=
 =?us-ascii?Q?faYen+mqx6k115XDo3yh+ED3tQRR6/wtkJHsikshKIYx03lPhShqI12gnKYz?=
 =?us-ascii?Q?DkwXlcxfYKOapOykp2UqEUWZBRSB4K/n+VeGRnB1IqXAibCiZIHUt/PnsUqn?=
 =?us-ascii?Q?MriYij8ThFE2KRMs0cp0s/pXdQpKRmWw6qEDZ9bwoWYQDhYJ4IQk83PBzdEq?=
 =?us-ascii?Q?i/cB2ISU6Ho0cM6jvePerYmfTz9P67LxdzZjfPvYJLNmUx5dx+3je3HFQMPR?=
 =?us-ascii?Q?OwOvPP71dRv3+NmskQ1nssgrSk3gvjNSCMGk6k2AhkCwEqZj/YnMcME5iZTZ?=
 =?us-ascii?Q?Pn6IcVSTy1Vj2FzKUJy75mBKmE5Ymkc4BDEJJCDlZrvxcK8oWeMoSMZdnW63?=
 =?us-ascii?Q?K6VJgZI0UFM8hBSy4pRKJg5KIkG2iovV3agylrc+4UQYco7e1ZBr4z6vWKik?=
 =?us-ascii?Q?O2oZ0EJpjlaTZfsoeqBFIzqXZFm8zT/w1eanQ33Ghx0q2bwQjj+atczg01Ha?=
 =?us-ascii?Q?brBqfBmEclPZDykGNDc+AC03W3/IM5IWw7vOzjCsXxrY+wvEJn28hgssHOOq?=
 =?us-ascii?Q?sj12pFt+e7R0Vg/vE9ZUcPPMjW5aYzCj//6nEdsggYVwofDMloq6OVD1lLgW?=
 =?us-ascii?Q?k4wKCSscLveCskG/cO2h6us6Xb//GSyeCJnNOmYt4LkcsGvQ2SiU0s58eUNM?=
 =?us-ascii?Q?artrvJyhl6e9pJ05O13phJY0pHjyJkkmyh4iERZOmHNAzouTGIm7xclRjsHi?=
 =?us-ascii?Q?CVZZAcUBia3BuTO0B9Mkjwp8YLrOSAUbkOoXN7KfGMbqm7PsIKAFofHTXADy?=
 =?us-ascii?Q?GL7XIf6EKlBSmUhX09dOMW2aKAbianV5BWgMX9d+G9Wht7O3asE1scB4Hcym?=
 =?us-ascii?Q?ctDCqxqnl1xhepKhvr9UKIpZlER16RVUeyXKVcrLYXw41WCnShJp6yiurJ36?=
 =?us-ascii?Q?1CacnwOaxT90T6BHPL2JWPldeSvYG1062I9+OCFTJvUOl6fAu8PRdo/wt5Bz?=
 =?us-ascii?Q?BGt4Pq9VRUDVQCPjIAnjJEDgyqCzhbpbwY/ycep20TGv8gPlOPPPsjINeyEY?=
 =?us-ascii?Q?/cX0jGAzOg5muTxzvq9ONSHATs18bS5K5oOum6aQSJX2eNR69Ba4kIXfpjTZ?=
 =?us-ascii?Q?zv4F8gSbWPGNb8m5746XINDZyFDotaRAdJsWq8djlLg56vEyy82rpzfNLy59?=
 =?us-ascii?Q?54JsAkJrnYhzvl/Oy9dQLM1R+J4UB2bPl6cElL5X7nmUSTWORoP1U57/CSJS?=
 =?us-ascii?Q?RDpYuhuIVy0RTQ9HSCrWrhumdvbSRUg4wLg595o0b7MZ2D+f8aGKSSyCYDBc?=
 =?us-ascii?Q?fFUkaFWYG+f5mPk/RFZ7LuDUksy11bPjzmqzYeNrh8CMdDtgsVvx36LXLti+?=
 =?us-ascii?Q?2LRVSKuYl9dQaNh5gv6pPfcRQV8PgdX3wrqjEW0Q++2EJ7zvT9K9dpoNHoFr?=
 =?us-ascii?Q?pjzPDPxyq0W/j05jzLLQlEASQljtDFlIsa0UJ0N07S7Fu9lt9GS+rhHdq7JO?=
 =?us-ascii?Q?U50yEhH9iNiVcjXO4RUkeoQkE9GuRcMCqEYOQg7adHXJZK2lSMi1?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45ecab0e-ce03-4ffe-92bf-08dec1348944
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 05:54:11.9387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QFESfV9F6u2y2JlAd1aVmIYA+OnCeCQDzIjyRcRdOt8UPk7dwaORB4GNV/LL4buqRWoGhEC2L8Xfhjf5TngtMxozZ4DVtorJEpBC1oqJGwFQu6Kt36P7yD/5qeAZ7mKP
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
	TAGGED_FROM(0.00)[bounces-37861-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,starfivetech.com:mid,starfivetech.com:from_mime,starfivetech.com:email,devicetree.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1B1836347E1

Add pinctrl bindings for StarFive JHB100 SoC System-2(sys2) pinctrl
controller.

System-2 domain also supports configuring the pin voltage. Add relevant
definitions for power-source configuration.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../pinctrl/starfive,jhb100-sys2-pinctrl.yaml | 169 ++++++++++++++++++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  44 +++++
 2 files changed, 213 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys2-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys2-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys2-pinctrl.yaml
new file mode 100644
index 000000000000..e29d8c01b3c4
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys2-pinctrl.yaml
@@ -0,0 +1,169 @@
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
+  In the SYS2 Pin Controller, there are 37 multi-function GPIO_PADs. Each of
+  them can be multiplexed to different hardware blocks through function
+  selection. Each iopad has a maximum of up to 4 functions - 0, 1, 2, and 3.
+  Function 0 is the default function which is the GPIO function.
+  Function 1, 2, and 3 are the alternate functions or peripheral signals that
+  can be routed to the iopad. The function selection can be carried out by
+  writing the function number to the iopad function select register.
+
+  Each iopad is configurable with parameters such as input-enable, internal
+  pull-up/pull-down bias, drive strength, schmitt trigger, slew rate, input
+  debounce nanoseconds, power source.
+
+maintainers:
+  - Changhuang Liang <changhuang.liang@starfivetech.com>
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
+          power-source and drive-strength.
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
+            enum: [ gpio, host0_port80, host1_port80, jtag, smbalert, uart ]
+
+          bias-disable: true
+
+          bias-pull-down:
+            type: boolean
+
+          bias-pull-up:
+            type: boolean
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
+          power-source:
+            enum: [ 0, 2 ]
+            description: |
+                0: power supply of 3.3V
+                2: power supply of 1.8V
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
+            #interrupt-cells = <3>;
+            gpio-controller;
+            #gpio-cells = <3>;
+            gpio-ranges = <&pinctrl_sys2 0 0 0 32>,
+                          <&pinctrl_sys2 1 0 32 5>;
+        };
+    };
diff --git a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
index 30704a5a3418..e1c6bc8960b7 100644
--- a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
+++ b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
@@ -38,4 +38,48 @@
 #define PADNUM_SYS1_GPIO_A22				6
 #define PADNUM_SYS1_GPIO_A23				7
 
+/* sys2 pad numbers */
+#define PADNUM_SYS2_GPIO_A24				0
+#define PADNUM_SYS2_GPIO_A25				1
+#define PADNUM_SYS2_GPIO_A26				2
+#define PADNUM_SYS2_GPIO_A27				3
+#define PADNUM_SYS2_GPIO_A28				4
+#define PADNUM_SYS2_GPIO_A29				5
+#define PADNUM_SYS2_GPIO_A30				6
+#define PADNUM_SYS2_GPIO_A31				7
+#define PADNUM_SYS2_GPIO_A32				8
+#define PADNUM_SYS2_GPIO_A33				9
+#define PADNUM_SYS2_GPIO_A34				10
+#define PADNUM_SYS2_GPIO_A35				11
+#define PADNUM_SYS2_GPIO_A36				12
+#define PADNUM_SYS2_GPIO_A37				13
+#define PADNUM_SYS2_GPIO_A38				14
+#define PADNUM_SYS2_GPIO_A39				15
+#define PADNUM_SYS2_GPIO_A40				16
+#define PADNUM_SYS2_GPIO_A41				17
+#define PADNUM_SYS2_GPIO_A42				18
+#define PADNUM_SYS2_GPIO_A43				19
+#define PADNUM_SYS2_GPIO_A44				20
+#define PADNUM_SYS2_GPIO_A45				21
+#define PADNUM_SYS2_GPIO_A46				22
+#define PADNUM_SYS2_GPIO_A47				23
+#define PADNUM_SYS2_GPIO_A48				24
+#define PADNUM_SYS2_GPIO_A49				25
+#define PADNUM_SYS2_GPIO_A50				26
+#define PADNUM_SYS2_GPIO_A51				27
+#define PADNUM_SYS2_GPIO_A52				28
+#define PADNUM_SYS2_GPIO_A53				29
+#define PADNUM_SYS2_GPIO_A54				30
+#define PADNUM_SYS2_GPIO_A55				31
+#define PADNUM_SYS2_GPIO_A56				32
+#define PADNUM_SYS2_GPIO_A57				33
+#define PADNUM_SYS2_GPIO_A58				34
+#define PADNUM_SYS2_GPIO_A59				35
+#define PADNUM_SYS2_GPIO_A60				36
+
+/* power-source value */
+#define JHB100_PINVREF_3_3V				0
+#define JHB100_PINVREF_2_5V				1
+#define JHB100_PINVREF_1_8V				2
+
 #endif
-- 
2.25.1


