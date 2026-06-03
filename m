Return-Path: <linux-gpio+bounces-37872-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GXlDJtrFH2r7pgAAu9opvQ
	(envelope-from <linux-gpio+bounces-37872-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 08:12:42 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEB063491D
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 08:12:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37872-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37872-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=starfivetech.com (policy=quarantine);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9A66430E0383
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2026 06:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 556703F5BF8;
	Wed,  3 Jun 2026 06:09:05 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2094.outbound.protection.partner.outlook.cn [139.219.146.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100B0315D23;
	Wed,  3 Jun 2026 06:09:01 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780466945; cv=fail; b=rkIoPja2vB9Qb60AvNFb34VS98LNRQH2fyAllp556i4tYBG1W1t6wYZp9GB1/+yj/4DM78xwKqQutGrJY7UuhN5LDR396G9YtBEF+WaY2dvfRhm+/fCk7HfUdn07b8UFK9khh1wg4bNGR/KTjqq3dMpwZ4SvcmUuJHvyPz8s9yc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780466945; c=relaxed/simple;
	bh=cRDKADHFUT1Z2f+LtgBhQfq6L8gmwWbi3QNsbi9zRYA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=apWrLzqI6F4mVTNBDii71+X58MdeQIU2B/I0ryQ6jBEIjIKFvn56PBsGoOOAd89VVw1VqIZwYj5GNg74nd9J4voSTqDmnerKYkacJxX4CjyRJHOE9oqGhY0tASsjSURuImmtPFWN9XprlcvtIVQh/905VGN2fzQRlk9IlcM0SyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.94
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VRFONLOvDjX7JFMLK4wY12yG27F8bhoSdwawaxmA+wUyILWgZyctsaV4/kJaveUykpmeIUvk35hyBDnh9Izq+FZsKbuJaJUtEfcoRdHhXgkLXSgru6Z3+itFEStofeHBoDyO6jR49comfS2lYOqvsWK3BXByT7kS40m40kLAFtXyDVojt6CFb2aHD91TaNf52nnSpjrWn+Sb5YPJsi7e8tJzAIY7zsp4hxRFu0QS+f8fL1gDuNp6hSN2iy3d/cOKbNK9yaQaln4CGsTYVSYkcbmZMLHzNH40DpetnEBjTn5xFF+AQlHqdx3e38zqv90KFsS9bOCBSNkOMFNTM94R4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lhSgHoawOlF/NFwX+eqcg0/pJksA2qNkSzJoKK+06q0=;
 b=mETjYIWaNZY+1VeArtfMpxOfpoUOMjblhlW37t2jHY/V/AG3GVPrHOFIECuoVseuKwXQJ4OhGFN/QGnX7NxL4WRhR2V77NPFWuqUZKCdqIU7+E54Snk0ay7RjHoWzQfSkQ2KSb012faSBVioz44k3pAEHjihLSPovt+Rpubzu0nd1v3+6MbkIVwvz3MkcdEGGndyH1ftwEDMmABvemXvgCgMW26mF50SgnjKpnhHXPZe1xoEvvBNGntCXG3bcGddcj0sfZCRQaAp3AKAEh+/5MQhaxFLA2mcQMwl6jvDkuMPplEVN50SguMwzRNFFnXxl14DzcwyhErOzBKRRwrblw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1154.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 05:54:24 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.21.0092.006; Wed, 3 Jun 2026 05:54:24 +0000
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
Subject: [PATCH v3 19/21] dt-bindings: pinctrl: Add starfive,jhb100-per3-pinctrl
Date: Tue,  2 Jun 2026 22:53:45 -0700
Message-Id: <20260603055347.66845-20-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 23025358-a51d-4d56-24da-08dec13490e7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|3023799007|22082099003|18002099003|6133799003|56012099006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	Q6eQel+QUKr8MwHbk8Q4kCn0httX1t52DJG8mNheqC3TVLOOOfSY02yjc9cbRltcZZjMqitIY+/RACfo+lpii9KPwt7jerzmT+sqSRjtcV9S8a5Ov7ZpNnQtTkFGCa5hX76g8+WIU2KETIcqcGIPM2Nb5O0FisuGSZA5Fp2E6VS1O0j/lzZrVIgENG7GE0Og6Jc0jYS9vhAX2lP9QS5zngzCoJpAbWoDwD0s315LUp8kIpFVm0WDqBKYY3zjcvNhYlpTL1/GaOhcuGdjoTggQtdVeSaOwlBhAW+1IrBmpm5ArXNlM6z7KHmec71PqWmGAfZp84s93NKplZvVlxvWEqHE5nlmuX+TzyXyGR8nGBaBBizZVj71/KdrNgkwNiVJO/vrLm7Pzp9ZIay9EhloQ8DCn8kUUTNQRfbVOp+Ll80gmNNKpQl7f0EnKgA7ix+liJyXh8MJxOiTnVWoxYHzxfuh7AsR+QcrlsyJrJhZ0gokyRVxdFKkngVexuWXCQe/TedJR1uVUTgZN38DMtvzCZbYX7ThfMdYnyrH/eq7B9L3XULYj3Grj9XHxwmImYoGNdflArj70t9b25lH2hnWbA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(3023799007)(22082099003)(18002099003)(6133799003)(56012099006)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?r+6sk1fxdd4zCI3qPIMmqr7vmPjWByO7TLxUMFvrjTTgTmtNUvPlfq08kFzO?=
 =?us-ascii?Q?L536qJWnAlO7+6CWDVtkvQZd8WOYY2ad+2QtmgcmIDmygPuhBfwSRMEHJnf3?=
 =?us-ascii?Q?exjSWtPVMm5mq4sTCevR67TqZGEa5WATLNQ+qVWKr7lDM9C/8xnog0OdTj7H?=
 =?us-ascii?Q?tVnj7YgpQ46+9f15lNUrD8r434RpL70tgPBRf9DC9KlVb10oRbQDk9ujaz7V?=
 =?us-ascii?Q?gZRa1NJDPEFUuVVwIVdoeuww5bzw/988U1f5m4HLK9njsb2xRYSSkIqYwVtX?=
 =?us-ascii?Q?CYHKU1b3Kh4u9vAR/3gVhKHUq9uRrs7WiKNTQ8Uyw6kYVyJMPMLGbfk3aw+w?=
 =?us-ascii?Q?94QGe+vDPjSyAAZaSvTMzBSRgrqG+wOB99LiCgSwNVRula36X1BAbg0nlIfS?=
 =?us-ascii?Q?dNXyPJziuAhQ/nPUVKVTi7Wcjewn9BWe2E+ZePLkbUc1CkummSqZMXweXSHK?=
 =?us-ascii?Q?cv4F+k4Q4wq65+lbtbQ+iNR2wYn8fgsUrXFSyAh+H+csi1atuU/e2oT2hVkX?=
 =?us-ascii?Q?kzO/bprXxqpdpqxktSBqbNsELew+j3YcZLqyDN8lbFBbOl8kWCTVNv23brqm?=
 =?us-ascii?Q?iwPE70o0UOD7yYuu9z60mzPg1m2W483zR3cKgF3fVSxbPgDhGXEi6ZZSoQtC?=
 =?us-ascii?Q?VqB5xBOP5yqFktyPzrSBvU/V8i2PI8ONgs+AkYGgh/s5akpQdwIQ9fsA1VQU?=
 =?us-ascii?Q?wMZPiJ1d8V7kAdQPEOipVPppitkGaCEGjaoSHSWw6PndHhthB1/jmNdIdJgj?=
 =?us-ascii?Q?4yrS14rl9Jn4A37LZRau34xsbx3tUIfYNHpJZHp/YyL4CCy+lEVOLZFNvnDB?=
 =?us-ascii?Q?mqB4bXrY5QJ300Zq/9sl2i2RIT54x0lg2WVGSAzAdy8XgKvg12pbOq3XSpR8?=
 =?us-ascii?Q?XXNzz46/qnoTs3HAO+gnUQNABv/3nNMyq0kvtpAToKYwZ89u6sY3pKqBWkLR?=
 =?us-ascii?Q?sQVTu8xM9RmCCttvBUYA86iMJ9HqMiM3SqeEc+J0MdsKSTwZd0Hvcg4lVUPq?=
 =?us-ascii?Q?Krw/LylBLN0jB56xF+aKoQYuz54QkNLnu9ArsF2BGwR8xYB5xA8sc4hqnNzv?=
 =?us-ascii?Q?hdD2onNNWcSwktu/DqUoXhZru8QHTNKoIF0kN7EFPK7IfJWEmX3xjw5lvMfD?=
 =?us-ascii?Q?PU/ZsmO6d+ihSKFmDoW8ZyyvGAhA8cOsKsva6MWpvUiOjt4AJb6DHIpJ+RM8?=
 =?us-ascii?Q?lEoM8KcexKmKvSXFM+ErCv794uGP8xahyQzO3j1dCAvukHgLoTjVXE9KxkHr?=
 =?us-ascii?Q?Drjpuqo3qv+kdd9DnX00actsVYNUra/g2odebfkXtucYYh4F4OPN7HR+BD2e?=
 =?us-ascii?Q?06+vUEv9qawfMXUdkZKf1bIM/Y/lapTYOvnk5bq+kjxs2Mw6Mf5zd22DpdSL?=
 =?us-ascii?Q?WNJ2NNKss+nQG7xFXE0XYWNInNkIxQgKctWgUbY5jkxcWiZ1+2AZa2d/8Lxq?=
 =?us-ascii?Q?FyHOmLf0YvWnittFFOLxAHJvoLsxZmUBsfCFMa+SPrDnMbv59saVOZ+PSZwF?=
 =?us-ascii?Q?GCdtwpgs9wUGpvMH7ELSIbrGCS6YPA2y1ttcV13d/VGrsFYxvNSz+/SoN4A6?=
 =?us-ascii?Q?On82+dWA6hiXudkstKfQyVYYD6yB4CYXpBooSHxEjQLLECv7Yg1mFsY9ImI1?=
 =?us-ascii?Q?nnwK0vvfSgW5hH/FWmHk0sj21R1FW/fU5gzRi/CfOImAVkP+DWuHGD35NBjk?=
 =?us-ascii?Q?+nMCNSSKelU0zmZrGPQBjLnLJve19J67sHC38gd3qcL5jQ//HhmIwImtzcqV?=
 =?us-ascii?Q?NNF4amaSkbzglEicIPU9BRKvYy0RNX4KyRmpIYrL0MkDuAZHq13t?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23025358-a51d-4d56-24da-08dec13490e7
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 05:54:24.7409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rd9hETpT+SfekkDS/ml3TN+Yl8Ad1Xlucd5QcQ0+w+B2Etziud4UNS/c3E2wIUT6NvFGoY1Zpom4mk2TqekMCN2NqqONaaVPtwR3N9o8EodrAXBbqKz76RwklgyEa90H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1154
X-Rspamd-Action: no action
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
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kernel@esmil.dk,m:pjw@kernel.org,m:aou@eecs.berkeley.edu,m:palmer@dabbelt.com,m:alex@ghiti.fr,m:p.zabel@pengutronix.de,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:lianfeng.ouyang@starfivetech.com,m:changhuang.liang@starfivetech.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-37872-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[starfivetech.com:mid,starfivetech.com:from_mime,starfivetech.com:email,devicetree.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0EEB063491D

Add pinctrl bindings for StarFive JHB100 SoC Peripheral-3(per3) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../pinctrl/starfive,jhb100-per3-pinctrl.yaml | 165 ++++++++++++++++++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  14 ++
 2 files changed, 179 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per3-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per3-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per3-pinctrl.yaml
new file mode 100644
index 000000000000..26cdc9b48d8a
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per3-pinctrl.yaml
@@ -0,0 +1,165 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-per3-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 Peripheral-3 Pin Controller
+
+description: |
+  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
+
+  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
+  per2, per2pok, per3, adc0, adc1, emmc, and vga.
+  This document provides an overview of the "per3" pinctrl domain.
+
+  The "per3" domain has a pin controller which provides
+  - function selection for GPIO pads.
+  - GPIO interrupt handling.
+
+  In the Peripheral-3 Pin Controller, there are 11 multi-function GPIO_PADs.
+  Each of them can be multiplexed to several peripherals through function
+  selection. Each iopad has a maximum of up to 2 functions - 0 and 1.
+  Function 0 is the default function which is generally the GPIO function.
+  Function 1 is the alternate function or peripheral signal that can be
+  routed to an iopad. The function selection can be carried out by writing
+  the function number to the iopad function select register.
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
+      - const: starfive,jhb100-per3-pinctrl
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
+            enum: [ gmac_mdio, gmac_rmii, gpio ]
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
+        pinctrl_per3: pinctrl@11c42000 {
+            compatible = "starfive,jhb100-per3-pinctrl";
+            reg = <0x0 0x11c42000 0x0 0x1000>;
+            resets = <&per3crg 6>;
+            interrupts = <64>;
+            interrupt-controller;
+            #interrupt-cells = <3>;
+            gpio-controller;
+            #gpio-cells = <3>;
+            gpio-ranges = <&pinctrl_per3 0 0 0 11>;
+        };
+    };
diff --git a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
index 3ceaf9ceeecb..922b152b737c 100644
--- a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
+++ b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
@@ -230,6 +230,20 @@
 #define PADNUM_PER2POK_GPIO_D47				16
 #define PADNUM_PER2POK_GPIO_D48				17
 
+/* per3 pad numbers */
+#define PADNUM_PER3_GPIO_E0				0
+#define PADNUM_PER3_GPIO_E1				1
+#define PADNUM_PER3_GPIO_E2				2
+#define PADNUM_PER3_GPIO_E3				3
+#define PADNUM_PER3_GPIO_E4				4
+#define PADNUM_PER3_GPIO_E5				5
+#define PADNUM_PER3_GPIO_E6				6
+#define PADNUM_PER3_GPIO_E7				7
+#define PADNUM_PER3_GPIO_E8				8
+#define PADNUM_PER3_GPIO_E9				9
+#define PADNUM_PER3_GPIO_E10				10
+#define PADNUM_PER3_GPIO_E11				11
+
 /* power-source value */
 #define JHB100_PINVREF_3_3V				0
 #define JHB100_PINVREF_2_5V				1
-- 
2.25.1


