Return-Path: <linux-gpio+bounces-37880-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id d2m+BGXdH2qNrQAAu9opvQ
	(envelope-from <linux-gpio+bounces-37880-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 09:53:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5B763566E
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 09:53:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37880-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37880-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=starfivetech.com (policy=quarantine);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7AA98319F47B
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2026 07:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A8B8410D2C;
	Wed,  3 Jun 2026 07:28:57 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2113.outbound.protection.partner.outlook.cn [139.219.146.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FE0405C4D;
	Wed,  3 Jun 2026 07:28:53 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780471737; cv=fail; b=in7B0R2GKuJm8fRaVhjPgIqTITJ5hDb4J3SqwgjyOix4C//dSNT4RKJyUXXXmFmEE4C2BYH2SNbyE9amZmREtb4D//PLesJ2LhchkRPmEayZVdH/ljwH3jPk6uiboCI5dAzttG6PrPpEibrTvKinJSr59hjB5Ohc3HcwHXM6xzU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780471737; c=relaxed/simple;
	bh=g089WVG/H6bHChT3XVH06+rdFGj0+eBr0SKLyYUE8Rg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dZUBHvMrV14KGpGkjok9leBWyRO1eIK8Oy7mZP3/pAMOL0Qsmg7nmObmNKiaRyQpqVZnuThS54ojaroTmtHo70X1run2KqEoRCZHJrEr5x/Z+sDEMq8HkZ/3fDuHCX8UmKDtEgZQcv5EtMsFjaxf/TqTGsdjuxZ5UL8QTxZ+pXg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.113
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZH4IDK7ZmTSs/iJjmbqWhEUuTDzf8VYOcaNuXkDhQJf1ZiWJpw4+4f9zCLstMTaMY1nMMoERUCVGqcfK1zwSWoTrBNPGnG+KniWeqI+KGWUtfcG0tyJLFKPnUY9P8v4Q+gvc0XIgTE8rY5T2g25oaVCMxNh54MOd/9IKSEznh48viiKllOCcsl2EPk+eak7EDWwjFl1MPtgO9+dg6S8n/m1J5vZbQC3e/RGpeu6iZc1ch+idtekVqAyZJ5hkFEpi+7L1c1X9MbE9nntS3SPWwiphS0P2KshTsSv4qkr6wJK09PA/LuzXAzYF7ExaWzhak6dWo8h3i89azc8hm2MBJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EbpH24S6JnKA2n2j4h0lxigZQmHNlyZ9NnJEi7LmxvI=;
 b=OuRkyqAMGzj4o3ajUt10ofV5HBbNf/6H+FjkPm9jbhToEzGFzFeljKrv1niK7jDns1S2jKmar0PnDhr4HTQbdeP/PvjFBdVElDFtp2KNWwdCAnMUKyZaLaoczC4gqzu4LEqMv8iLHsnXjz7prXdaAZ4jrb/WhRlUhXrd0jeeogrXIskI1/+hzZ+w9ODzGKGxptGVnhHLwnh7vEKBjj78SoGupQAGaCsRipNFsqi9RmrKnrQ3NU486aUWV+ZAzkmCLGZPqj+LySuapA/JgcddBY3RNcu4UqIUgQpowCH+ANQDcXZTOOq8Tp/e73b4tJ+W3lANRD/bmdQ92WkBmb9Mvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1154.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 05:54:22 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.21.0092.006; Wed, 3 Jun 2026 05:54:22 +0000
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
Subject: [PATCH v3 17/21] dt-bindings: pinctrl: Add starfive,jhb100-per2pok-pinctrl
Date: Tue,  2 Jun 2026 22:53:43 -0700
Message-Id: <20260603055347.66845-18-changhuang.liang@starfivetech.com>
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
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1154:EE_
X-MS-Office365-Filtering-Correlation-Id: e1b22fbe-75ac-447c-40d5-08dec1348f62
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|3023799007|22082099003|18002099003|6133799003|56012099006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	e57siLUARJXkW+0my8TA7j630qfLhn4jNbSzCLZ0gke/Cz/rMesEPZCdFaBuzYcCZQIzaPkhSqldkue7N0wV8Ritmkhl+TazMawcylfHWJSAUhAWOLObJd84OOQbjZ3QGA/XlnPCJeYl3oqXeLoYJXJnLTx/Gdw9vt2rxCk0GLSeEFj4e87LdCjZRUzn89akwqNdwXsJYs4kYfVg/Yy6dU1D6TTmQMkv9sX4siHJlxNi6zXqQvIXOqSHGv5Xus5piWw6WhB5oQ2UwB8L5Q+Ntbaqc9OOmz5j+3a3SyFeeElJBc3IrXkuwV+W8ZoYwlmZHB2zUqPIMgc3uG8zsh8il/TT3EdzM42Pn14ZIaDUEAhL6nCZeRyuy5oE3mdYh865L1dfVxxUk3PdyVdWsf0ADq7qIpoevdojmPoLM4y0Jgc5Of99CaEJXjq814gWDqpbJN6E5zvLIZ/Z8bH6IcQUAngIMsSwWih8qMzMtfa9NQE95JUGhikqbGQeq/SMOGrQk5sbnkL5guKMuxHJkFO7we1ep0a/75IUmf/HyEDLKv6N3AtdNbgUYv93AIBKKgxG/GdreMmFd1VR6j6LMAV0LQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(3023799007)(22082099003)(18002099003)(6133799003)(56012099006)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fX33GvXxI2a7UHTSH5C4dKYltv+wrqxXBityTq6vfi1xHVbGyq0uph6r/vNF?=
 =?us-ascii?Q?hwek25iUrFv495QJaI/O8pBVikAN/1cND+WBy8O2o0tBrgbYUvUuJGnaewJh?=
 =?us-ascii?Q?mk01DNele7ADWbLrOnnwogJkwYBuvBH1dLFrYk56HvgcXhyODxWm6kNaPC4g?=
 =?us-ascii?Q?zwpN/uPUeQ5ANi5bP7I204pXqMw+bcXYlAe7nHDSr/6hfLi4PE0zLaWveoZm?=
 =?us-ascii?Q?qs0lBrWwFxRe0qoMhr5DZb0P7nAjXCIv+x/if/0P2TcBIwr5ZBGA/GDVyIsY?=
 =?us-ascii?Q?EIjn4Y7u7DBZv5dG8L9lIoOa/7SvkvbSNC8VyM90Rjbc/rBZnhRjEPGeZeKX?=
 =?us-ascii?Q?0UEEoOMgBSAb/0I28FKAMEW01jiI/E4KJxr4Zz3q/5FQiNChNatpq7fMNdEO?=
 =?us-ascii?Q?tunGKhiSZkNSz7s8+WyPCqNTHmw7pHGFzT4+nmfsa/ZNrcrPtnHr6GLhQEut?=
 =?us-ascii?Q?P5SshXqretmWH6YFQ0+kkqY5MrpZV24y1z1TeLDf54zvbZGujq6zx/1qtEWz?=
 =?us-ascii?Q?rien1RORDTZ85Wo3kII9kqafXj7guSrowqoFRz+5YNwkhYqmv2i9CN8gwIRL?=
 =?us-ascii?Q?HQJAhb3bYknH9GWiDQTgxnyKThbVbfqLZDzHaoc4myiMrWycfuz9NnrVa94V?=
 =?us-ascii?Q?xIXWGPuOw6jXeoCulf7g6nFqzmRxRYpm5kKLp91f0/CZLj84xWYFPc+pcDHi?=
 =?us-ascii?Q?QRrSbgLAjp6ENsg4W/Bn/scLPdXhfkI8vcT7s8OOPiSm5P0C+Djh/187qrpF?=
 =?us-ascii?Q?3xC5C/GeKVQk/iVF/qQNt/nlYGDIPEurVfrDDVAbL3GMVbuPzcKD6F+EsKdz?=
 =?us-ascii?Q?g7y6t12sXVSqKgflOilbIMWBCnlupfSaBMX3/jPStNvrAADb1DrAtLlKW2v+?=
 =?us-ascii?Q?CEOCp+u6QcnY5cIQRm4FtYA+SaQALz1D/bNIi2+EL8gMXpFybz1cx7qcWrs/?=
 =?us-ascii?Q?86EG7nnu8MDfHHRfXasRdoigwEeXFPIQrInNSl+2OcIYicq3bF4Vod4MaYsH?=
 =?us-ascii?Q?ippfh2Pq8OOoC0Bvvv3Hmu91N5C8Jv11GKsBaP/IkK/J9Z/ACW6GelDRmKjB?=
 =?us-ascii?Q?F4gdVzp5DfaJ34vXWsuqBswnE1ofBDcaA9eVNJkDhIBBg3NiHaJNCdjSuGBD?=
 =?us-ascii?Q?Wa1MtH4m6uQ3vadWD/SvmhgJctPxDLnXxpJFRTAgbubh7+hYq7/jTT/jtjpq?=
 =?us-ascii?Q?kP81cY2I92ixGiLuMMsS1RAPH0nPNN9ZARy6m+LDDClGb+YnvJNX0jlm7qBy?=
 =?us-ascii?Q?tShZOZ6darOVIml/lInXaBAMWNVKQGNMPtePQiRe9vebFAet1dqQBOSxBqJT?=
 =?us-ascii?Q?Ny1Zl4lT33pka4QfPQog6wmzbA3LlDH7VhD0njBGI+2Yf+xpotYLCl8Jblpf?=
 =?us-ascii?Q?wQUEuRgmYtTSUfi9k3HXLF/LCdRuhRaOgj62nc1oBGWwrwGjQQRO9PRNEcFs?=
 =?us-ascii?Q?JGc0ORSQYheKGi1ggNucdbXEap5h0QAPd2sGies8Dhw8s/+CuInDMwJP/YLw?=
 =?us-ascii?Q?XH+A2IVgvClnnQpLxb1V+ZijsZIgNBCGFFimKsCUczRjjFDaA9H0EH2UZkft?=
 =?us-ascii?Q?z/83+zAnBXfAKOXwEbdPzvxKCUnyEqNYMKPEK565f+ZHhsL1q/47bMv7L6QA?=
 =?us-ascii?Q?k99sdbfYPXnxsV4H1OiPUPEv6oedrCPxsTYHgUkHe50KvI/yILzpajb05GIB?=
 =?us-ascii?Q?lZs7Wl2q0IcaSvpWsVjTYoFKLbiKb9pZDRg1BN4rmO5IjXJ0tB8t4JQRQRhE?=
 =?us-ascii?Q?vw0HojsGlRTqCdARJFcdBWkl3bOyGjfSOoNJ48u85+M2hju95fS4?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1b22fbe-75ac-447c-40d5-08dec1348f62
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 05:54:22.2041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6bbq98jfi5yd/4jdgAK7qzxaNBi3wc/R+LBYSzMldExYxaMhJGCTs2QAOReVxRVC93G6RlV0SYGU9X46sB05mmQdA30cMFLyejRVBJCuduzSBwGteXfUY20ZfZW/G2GL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1154
X-Rspamd-Action: no action
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
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kernel@esmil.dk,m:pjw@kernel.org,m:aou@eecs.berkeley.edu,m:palmer@dabbelt.com,m:alex@ghiti.fr,m:p.zabel@pengutronix.de,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:lianfeng.ouyang@starfivetech.com,m:changhuang.liang@starfivetech.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-37880-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url,starfivetech.com:mid,starfivetech.com:from_mime,starfivetech.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1A5B763566E

Add pinctrl bindings for StarFive JHB100 SoC Peripheral-2 Power OK
(per2pok) pinctrl controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../starfive,jhb100-per2pok-pinctrl.yaml      | 159 ++++++++++++++++++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  20 +++
 2 files changed, 179 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2pok-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2pok-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2pok-pinctrl.yaml
new file mode 100644
index 000000000000..0a6cd9b7fb5e
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2pok-pinctrl.yaml
@@ -0,0 +1,159 @@
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
+  In the Peripheral-2 Power OK Pin Controller, there are 18 multi-function
+  GPIO_PADs. Each can be multiplexed to several peripherals through function
+  selection. Each iopad has a maximum of up to 4 functions - 0, 1, 2, and 3.
+  Function 0 is the default function or generally the GPIO function.
+  Function 1, 2, and 3 are alternate functions or peripheral signals that can
+  routed to an iopad. The function selection can be carried out by writing
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
+            enum: [ can, gpio, host0_port80, host1_port80, passthru, pwm ]
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
+        pinctrl_per2pok: pinctrl@11bc2400 {
+            compatible = "starfive,jhb100-per2pok-pinctrl";
+            reg = <0x0 0x11bc2400 0x0 0x400>;
+            resets = <&per2crg 1>;
+            interrupts = <63>;
+            interrupt-controller;
+            #interrupt-cells = <3>;
+            gpio-controller;
+            #gpio-cells = <3>;
+            gpio-ranges = <&pinctrl_per2pok 0 0 0 18>;
+        };
+    };
diff --git a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
index 7aeebcf72b8f..3ceaf9ceeecb 100644
--- a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
+++ b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
@@ -210,6 +210,26 @@
 #define PADNUM_PER2_GPIO_D29				29
 #define PADNUM_PER2_GPIO_D30				30
 
+/* per2pok pad numbers */
+#define PADNUM_PER2POK_GPIO_D31				0
+#define PADNUM_PER2POK_GPIO_D32				1
+#define PADNUM_PER2POK_GPIO_D33				2
+#define PADNUM_PER2POK_GPIO_D34				3
+#define PADNUM_PER2POK_GPIO_D35				4
+#define PADNUM_PER2POK_GPIO_D36				5
+#define PADNUM_PER2POK_GPIO_D37				6
+#define PADNUM_PER2POK_GPIO_D38				7
+#define PADNUM_PER2POK_GPIO_D39				8
+#define PADNUM_PER2POK_GPIO_D40				9
+#define PADNUM_PER2POK_GPIO_D41				10
+#define PADNUM_PER2POK_GPIO_D42				11
+#define PADNUM_PER2POK_GPIO_D43				12
+#define PADNUM_PER2POK_GPIO_D44				13
+#define PADNUM_PER2POK_GPIO_D45				14
+#define PADNUM_PER2POK_GPIO_D46				15
+#define PADNUM_PER2POK_GPIO_D47				16
+#define PADNUM_PER2POK_GPIO_D48				17
+
 /* power-source value */
 #define JHB100_PINVREF_3_3V				0
 #define JHB100_PINVREF_2_5V				1
-- 
2.25.1


