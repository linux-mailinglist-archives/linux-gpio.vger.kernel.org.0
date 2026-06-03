Return-Path: <linux-gpio+bounces-37866-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id httLLSHEH2qQpgAAu9opvQ
	(envelope-from <linux-gpio+bounces-37866-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 08:05:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E3C63480F
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 08:05:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37866-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37866-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=starfivetech.com (policy=quarantine);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 03DA9304A3B6
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2026 05:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 633213FC5C1;
	Wed,  3 Jun 2026 05:55:26 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2097.outbound.protection.partner.outlook.cn [139.219.17.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBE73F99F2;
	Wed,  3 Jun 2026 05:55:24 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780466126; cv=fail; b=lHVuDsLmjSyvtUqhqqq7FNChm5G2SHX8n1KeMqjHbU5MLkvA70IE901m+oCy0JFeO+gVu2XylJnsnW4bVcQ7CGbU606nI1YJQgzCJQKxua2JiuzrLWklTi1KNQ1lHI3cuRl/MTchtC08/V8Ea353vX+RaCR/moJ2qte2lANQ4fc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780466126; c=relaxed/simple;
	bh=DgE3Dj822UDDkWRh67SumjzTPpQmwGMJDC7EM3lJ2Q4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=muZSJCJRBQo1ikZGXzPBJfUYVhn6wazfpQ55LZqS36nSCkCkJIxix2lJESgXbOlSD5PEKPFEhSf02zkQnQbGh2aX6/EzhYWJg8kXvquUL2eQnA597nq5NS+DJgbZDbKWYGJbGGV0AilTkoHrmMZq0PH4LpDvipTwybtRpwoJ4Pc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aZihkTXk3dIh7xzZVd9rOqw5KvGtAN3JozpZBc9+fhp19XOcNuFZW6TN+i/tEqD1nUX6zWwv9w8+F2smBlHvklSIsMw7EhHeou13Adhbtqf/eJK/9StfNa6EYJmKAqRS7HSNW2JpbrX4a4GQWHRYZ3VcTHRiEuevsZMVj5UZwz8UjYJueeTjQ2wyXeQfRvGhVgObsJIm3EITX5iuWIozl5HjDfKFmrmKpw3ovkj6QAtp1dJrL9cVsYO5kEwkAB1CtR+zCWAMM1uTz9sNOMNfMnVEq7XStW6pNV24YLHqFlpSkguCYGx755HeOhqgJJxbZRdlcg1N7sU2Q3FrlyaaIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wyZFoJerrKrDS9WZo+9U4tRPcpB4JzhDYnvuS/rYGxQ=;
 b=kUlthLiLQAVZ8zNT6AIoZo3HMUcu4u7TTpw5JQAG2OzSmNmkpTNJoSkycyVPeYp2N1sIrhMosvXQagcAoZWed1O9BFWeOjyISo68PdVK5X7ublRbYuxx+GEuqn/GKvM8PM1+9lB6DAqWubjzNQoWUPdO9pJVHKmIyjSR0TG2fCoiAxI1Gdh8l5fvftWH7FwrrW+hDB420gNFTTg/5ZzlBdO5iX2bAb6wVrVBr1RXAZHexhel7YpBdl4zq8AytmP7CjfFfNO8UgtNhJBHAINR+spOyg36oPcvmGSIh+msqC0Cwd9o5wFPJri8qtQwNXobNmVssLVR6CLdG3214rLbfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1153.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 05:54:17 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.21.0092.006; Wed, 3 Jun 2026 05:54:17 +0000
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
Subject: [PATCH v3 13/21] dt-bindings: pinctrl: Add starfive,jhb100-per1-pinctrl
Date: Tue,  2 Jun 2026 22:53:39 -0700
Message-Id: <20260603055347.66845-14-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0154def9-f60b-4f61-278c-08dec1348c53
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|3023799007|22082099003|18002099003|6133799003|56012099006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	YjNklTE7AOkw5nbeEob3TsuD4ZxtnFDGEKR4opMqVMggel1Qy8VOnMl1GwTv1CRzgneg+SBjQsxIhxAFjWTT21zdaGqn8O8VK5LuHhmTBnwjhO9oVdAV4VgMx2C21fiu3LKvqR5uB3JD+y079yZ6zQUzI03Vl1WFUQX5hKBoUnQBr+0vNZ34S/8BhsrAA7/lnScQbyONmQi5VnkyEt0dUUOp60WxybRlfZbiTYav8SMnHSu28FOFWUKvOi6HyF/mosOV6++rLpTpIZhvy+P7k10S+hKIzQ9fl4xtpC/oJPeDMDi/3LEZnOd+eMFJNKk2TrZB0bC2CwTJUsAjBmmsZpRFvwj1SD3vYU2NlX7qcTD8oLg1K+vXdB99zZk2kkv1foWWgeMIuH7VMDKC/Ok0aSKu/KoWzfuCIsj8rXZiHjV+dSsqK7Svlv9iizaGyPr0S+9fWE58HszTTIGL4MTgv1TuVcYktQkW/QfRHkQ5WK55Zt5s5d/venpHjXdw0ifTAujF8izyqmE/it97e+AsOfe60Um8GHBOG1UuXwqnZ5noliEB417BToVcRHT3nhU8nLqVCgTb3/5evLnfVeMWYw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(3023799007)(22082099003)(18002099003)(6133799003)(56012099006)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vUwLIsyxmogfQ8JYzkCRfrfBb4ewldQxQrh8ZzXtu7p8O9HppKe3Ljz7VOvw?=
 =?us-ascii?Q?NHljB7q4m0ZP22wNGhrxppgLHT1h7XuvgFWxI14qGX4elxNB+e+pX5gO3qCi?=
 =?us-ascii?Q?wpujkcjbV2AVPcfM0PElWbJyaditImhpVMXYy+3ru5rhdos9MD71hJtlb44B?=
 =?us-ascii?Q?vcVl9hv8bJ/CHL461uPwAFSxPwxQDICYHcVIYEn2gT4gfVuKIKisib6l60kf?=
 =?us-ascii?Q?udM8NwdRj5iNk27Z9ytyQLU4PQ1P/JuNf/Yz2GVOcLclt7PCAAyh61q1fbr+?=
 =?us-ascii?Q?buNLBrcGbXZX/dFlQvMQikTPu3OwJdKi9F0ds9tvoo2nhiE8IzwjSe7vCXJn?=
 =?us-ascii?Q?KIUH0w2tGlWl+IN7I63AdRJGSD8RDulZPk7WxWIwHNZlZ0rkP0wNuQjhHieV?=
 =?us-ascii?Q?QGTuk8QH0k2WyyfcWJlFmmzSVz3wbrnpOLJuZ0NFCVDhzccB2MIoTBe5ms4J?=
 =?us-ascii?Q?WOaBYcX2OabGBI+5Ar0mhKuMeLUoeAj92AA7sHvxnxyirInFlk328beTr5JC?=
 =?us-ascii?Q?nQcp+6e81Sg0pQfhi+NGpi4ABVdyfmbZ3Mn8LE9y1ThsW6dVb/p1iP9W0Lj8?=
 =?us-ascii?Q?RXQWF/GnT2I1FvZHNtypPnIgMvUlfWA5KxTRuK8ziyuKwe598eGEco2x7BQ9?=
 =?us-ascii?Q?KqbQj4DWQo6LYZ7BAx4JEFoBwOAEZibDwg+C8t6JtkeVA/H0oWjAqAsgClgw?=
 =?us-ascii?Q?xjpVkWxWnVnkeTLCetBivFguxBg+84jSQ8Q2f2Zp/OxFwgv2yI4aMJ2awWhK?=
 =?us-ascii?Q?+zzuCzomp87CUWdf4fO4tjPOugPVgU+KnjiLBbo1/kjWFadxO5LZMrU+9ABk?=
 =?us-ascii?Q?IiqVQ5gp0csQcH9fJ9xdwhNx2udCaKy2rENZtnak0fy3y3qFYpOUZTUianY4?=
 =?us-ascii?Q?xXkJV3I+sBntvsalvptRRqx4wDFV1E6V3RPmhySuFoDIkjaV7XAgPGQQDnl8?=
 =?us-ascii?Q?3mZ0wSoI7msPV+vJ+/qUyin6F0Vn2GiCLOLV/rI4uV/BL9kvxNZ4TpiWm6/6?=
 =?us-ascii?Q?+xDUnvY3ICHZDzFr41/1R2UgiigBkpujVpKlyOqqEDjgF3ziMS9xAEWG3ugn?=
 =?us-ascii?Q?1ZTLTX5OBSCb/aRFYh9ApQ89Uhm5nobzCCo0fp2KR03q5zVxc019gTVTTlMB?=
 =?us-ascii?Q?SQm4HlMEIhfAS0EGff40NaDJOhswCvJDfKSANHlPFyA4y3DvwRE5e4tz+gdt?=
 =?us-ascii?Q?gjpo2ar1qnQlsgf3UOEDKkWGXJhHHqCJ5QSCIBhnpbB23+AoSlxXLALaRrvG?=
 =?us-ascii?Q?UUtMif+AUR4tMuxxs3o6dDkQ1PNgJkOnSmKxMFiVh4nWG3lpmW4j5ys/Xn5k?=
 =?us-ascii?Q?7x0SRcmtE1bvafcPMm+Ek8nkHmBOrDdkJOkCKvevSxPNHIQG5PCpZzxw7Hbq?=
 =?us-ascii?Q?ACMNc19t1+GAjzGlvmlB97giicw8VSyoazn7+jZY0e1VjsRg+wqMaBPum+JA?=
 =?us-ascii?Q?fBqYGFc0/akXQKFhB/js1PPIvTtu6X1Aib5M5pjlM9thZ3j3HNLZ3CCFjN0/?=
 =?us-ascii?Q?0+DJ2GdZw0X1Y27icVzbYW1V6JW+P2mXoKAyZpdvB9DqZ5WFtFqasQjYcG6Q?=
 =?us-ascii?Q?C2h2y5aAS0KynO+bPZDCBiX4W6pSocLK4gxu6mjTcJYZSlWpLleWuY9ZMDEI?=
 =?us-ascii?Q?FOdygRv/55NgSvx6XsBkDGesEdj/YZrRJ8NyQhN9VQFkJ13u0W66AdQZdUqq?=
 =?us-ascii?Q?G5BeanCmBWhuN9wGiZANLeZprTs9Are98qBdnPnuUzFywJFZSTUHTCJWH7G3?=
 =?us-ascii?Q?O87tX9uJVqrymUw43vW1ghZzuEHCeIOXXDTobV5IczbcQFR4pAWB?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0154def9-f60b-4f61-278c-08dec1348c53
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 05:54:17.0618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: swmeO0QrckxXbdQ6bnz8TDty8v+AAGigqGKrHO8zqFGzvVO+JhVl+tVAlrNF0AguCJo4CXaiaPlPmw37qBauLm9AwImK/2XlRaoCeFDJM4VX+in2Q7kJafR3lzC2Ux5t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1153
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
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
	TAGGED_FROM(0.00)[bounces-37866-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,starfivetech.com:mid,starfivetech.com:from_mime,starfivetech.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B7E3C63480F

Add pinctrl bindings for StarFive JHB100 SoC Peripheral-1(per1) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../pinctrl/starfive,jhb100-per1-pinctrl.yaml | 178 ++++++++++++++++++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  38 ++++
 2 files changed, 216 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per1-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per1-pinctrl.yaml
new file mode 100644
index 000000000000..a21bcc0a0391
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per1-pinctrl.yaml
@@ -0,0 +1,178 @@
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
+  pull-up/pull-down bias, drive strength, schmitt trigger, slew rate, input
+  debounce nanoseconds, power source and drive type (open-drain or push-pull).
+
+maintainers:
+  - Changhuang Liang <changhuang.liang@starfivetech.com>
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
index 4fc54b9990d3..54a900a624a3 100644
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
 /* power-source value */
 #define JHB100_PINVREF_3_3V				0
 #define JHB100_PINVREF_2_5V				1
-- 
2.25.1


