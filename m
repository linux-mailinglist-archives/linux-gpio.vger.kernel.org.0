Return-Path: <linux-gpio+bounces-37862-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dHWLETbEH2qbpgAAu9opvQ
	(envelope-from <linux-gpio+bounces-37862-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 08:05:42 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB05634820
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 08:05:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37862-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37862-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=starfivetech.com (policy=quarantine);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C4DAF3031A0E
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2026 05:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 772F53F5BCB;
	Wed,  3 Jun 2026 05:55:21 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2097.outbound.protection.partner.outlook.cn [139.219.17.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1353F0ABE;
	Wed,  3 Jun 2026 05:55:19 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780466121; cv=fail; b=TT7hBQIW5cfNSkCJ04Q6v+tY2REFP5jbDnsJffEfTyY5exL7zixd6XBaIm3fTrVZR3USHBICXNDF/IfYDNJ2RUI4KWb0qF96btaQhWaUdgxW4nIPTSH3Ob7MzaA1eeRFGKMiqh6rcE8mSsO8hDKgRJ+hfSksJOX20X35RwOQfrA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780466121; c=relaxed/simple;
	bh=v95grIL32ptvjKD7NQlgLENkFZRq3KU1Z/vfHLtUHfA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=R0s/pM9hJqDlq95r55gIGNofoAgoI92kkV+vFMaOVuJUVZWwBQZf49No7ZYX8+w8kEFQfdrw1Bn+UdxBVOPGnyo7230DKCgG/Sz+kdDL1FrC388BchmXCPhBMSLKWLm1A1hHxPzVgeyUWxzl9wn3gLrJLPzmZlUH5PdgGEiVZXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L60mn26DIgDkQ7y7yHp7RZbVspKiWf8upJOFV6arrtqeg+TpUNobehCd2QTbgua99Tw66q2nAu9o1/Mwiqx1v447SJVvY63YDE2C4216gbGBVoHmYXTLKvufpY36I9lkX3J5Txl64D7EYfA4RMA4j28hvoMBeRRiaGpYILEuCPTk4du2SuZmggUyf1++D/ipTO+edjeIz/p0hZpnX3C/bBkn0QBntAb6uXq/JyxGOze3mKBjydhSNTp6V5d5kn2sBwhDRbjwtRXHL5ifCY4exl9cfRyrQ/x6E/XjEXHxJKdxGLSz/ew/mh8j1Qu+B3WkNZEq5afWyFGMudzyO1SPxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a3v0W3BrfASvrZ/lpRmCLFnBiX8GOzNfG/n37cNjMVQ=;
 b=IE8hfTFYKUG5XCYru/qbyhXksAsjzAt55Xucx8AbeYmKxCRlrS8GmjnPpPi25TftGvtbqqYXx5f8OV2R/RiKjfHPElDqPvH8FMA4xlsbVqKSJzaEHzzxoNwkulZoDH3hdpCLk47GvdsTSjJtjj+pab5kB0YggWDUWLgtOcSVy7vHIZrmm+jIntn4e7W69E776zYWEGWysPnDgW3fsEsoNcJ8HHwnHK+cYG1QBiRE/zrx+eNEtyNa/VIhs8hd3cUs1FGpk5SmpMZtNDrfNObxdD1fCS/m/0NJZRpCkMBxSp0Pxz42VVYljYBxkmC/pOHLz7EYlV4cQP+UycHfq4bVfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1153.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 05:54:14 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.21.0092.006; Wed, 3 Jun 2026 05:54:14 +0000
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
Subject: [PATCH v3 11/21] dt-bindings: pinctrl: Add starfive,jhb100-per0-pinctrl
Date: Tue,  2 Jun 2026 22:53:37 -0700
Message-Id: <20260603055347.66845-12-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: c072c046-3709-434f-0cf8-08dec1348ada
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|3023799007|22082099003|18002099003|6133799003|56012099006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	J1+aDyPwpqZchUiO0+GhECGo0d0fqSJA5TtUHXyYCl82YSKrt6rhnkU3BvEW75uGgVeZYr9nVUFQky3IfI+5051JSmKi1JFap6faGr4klNcuO9Ue6Xidfv3Rr+gHjPO8zhAVdSuEAyLWhVlqcJeH3aL1lEbUp7JwnQmoxqN5OREYaB5UuPdAQIZZBvwHPeIvnCm+ZxmxGrpR24lJYof37NSsPKLZOx83OA5GTXgMPeXr/RgTFYPYAY8EeuWMdg9L5QXdGh3A0IL1uiBouCgZPfWExTRpbn3bgV2lVWxFapX7BspSONuplZ6K7SoBz6seVT9OSXw53NrgDwMcK0Ok2PB1NAlB0Z/2LwsOZf8NVgVFVcJiKZV+JvE5wSolIg0xewXwInsILy0hwZNe65ZF4E1a3YTtzMDn5jhLLh5KI8AY6RDCYKF2DnNhV//la5Rt1soC2NnTVcEbKoNJwPyri/DWLYPzh0vY7KDknZrTl8KzY4h6w1uRh0rINiYN0e9b+sj4BRiY1y+SjOMM0vc/VwVzveKVDbi3K1fxc14hiKaai91F5cFBCoPqbzwk9SM+XKwDaE4pQkWNPHehhcRJkA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(3023799007)(22082099003)(18002099003)(6133799003)(56012099006)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?D2sV9F2FfumHSIu1BRrNT/h7cWnoRqRachbuVPIQEjiS+pC0vDk+9qi0gUdg?=
 =?us-ascii?Q?Fb7InVr6YU0VnZGgkeCCOByNoQIc2lTe5zjiwDHE35iqF6Zb0t5chjb7fDJb?=
 =?us-ascii?Q?+cmB5ciPdrD4V0Fg5LVbT70ukecSG6WKrAQWUFL/Ohp1vKh1UQ+MuAU2TaoU?=
 =?us-ascii?Q?RmEhZXWv7x/FEf1I5ZeaCyLulNHfPsCBNFn7Z2tKpwydoNc+BM9QFnWdMQJB?=
 =?us-ascii?Q?yzCrFMUsxL89CvU6iuMRsAJXesqpVBjVk9Mt08v9LJCnLy/J2jOBWTWkoLhv?=
 =?us-ascii?Q?gqIqMkLaLBhogsy3lituyTfZSVXEXoSeUDhehaQRvcKUVqEvOMWhUjdDT27n?=
 =?us-ascii?Q?B8KSvQ0Mngh+bJmQXyBbbou509pUHsjj0FSPtIhnxlZhfLLcIxuLcybziMgP?=
 =?us-ascii?Q?5Q5nToBiyp5dIVmJ7AGb5rvoda/w9kJ59SQVKsORZjjZYhX0Ag3OsQEXgx0G?=
 =?us-ascii?Q?VaSAMQ5NToxh1Rt3K8HRKaKKmXbpikaU8xCQ2vgN7AS7UvSaOSBrT59UYMr5?=
 =?us-ascii?Q?dfx7/3HjMDuujy+7YIlxqkIeNlfXRcQzpJzO9nWRbnKTbcjxMxFTV4Nb2TnQ?=
 =?us-ascii?Q?nmnJI/WKIRnUApXNaTzfU2CpUQI1zXx8XFnYyfWle37ogCzjSwKjI9JR6fKA?=
 =?us-ascii?Q?QtX174kuQCkMEQccQ1lCWwhKonEj09+DzUQowO3G4AkgEnfNhTCFVV7G2vD6?=
 =?us-ascii?Q?5FGgtvqf5UxC13NHz/RaACbi6wMqVzNVJJZtHNXynr+8NWyQPwv/A4HNEQhY?=
 =?us-ascii?Q?XdqM6b/+qSkpHefYMmeKmOYcj2IzQdpgMRDQRboH7jj5KLh4m1WCfgNpw6AP?=
 =?us-ascii?Q?5S9hxrHkfIRNaHdRNUEKWbAAdbNluWMj0kwQjdkRe6FzCLL2AybolUce01Ik?=
 =?us-ascii?Q?k4IsRWqaigSBSpbFhcf4Uk8JSR2u6ENzVdzqFHA8GupPWq8BOaYB3hVv+t6w?=
 =?us-ascii?Q?A/G6p+D9H7L1f+CvDeXz3siOnxH5PA4CcBHFhyBCSIEG13HInfTMqLcP94ET?=
 =?us-ascii?Q?aX8rZHwuEaNbai+cZPcU1aUxOOsCKZP3G5a/RQZLDcCl4z5xs+xtZkBx4XQT?=
 =?us-ascii?Q?2uUFok+RUAqzITdyDiBv6tyR2BWP1zehSoDsbdTsun0xe2yEdlulINukh/17?=
 =?us-ascii?Q?J09B7DOVgplxjQJzo475pTnfCcX2wOkdXmd4aGtzZPuWKtKFAEGCbTI8dzSD?=
 =?us-ascii?Q?Wc1aWy15dREW/Yxf+hVMf4GL2yCzdPiPjWAMBJ4FybfQ0jaziYlBMA+kxgwO?=
 =?us-ascii?Q?Ybo0QdRrK3WQNx85VgmtXdrYBosnar3iTSh0B4rF3FvZ4j0dPuVywJvKVLSn?=
 =?us-ascii?Q?x/9ae0W86w0JF2zhbvRvoeMFqydvdg/ezEaLBCtm8altbybPGYJoncAwh+Ki?=
 =?us-ascii?Q?g35Td2lO+w46ptePH0b+P/Aw8pS21YZBLHdmv0QIXiuE6v0vQA0IGpuboEEv?=
 =?us-ascii?Q?c8EbwTM6b9r7AaOZnwetNbZbPlexwKdk9BLdmWzvJ37J7+ttZWjH4doJ9YEk?=
 =?us-ascii?Q?0HO+msMxaT3YAuTiHG+c29w4seFdeHL2CnIAgx5untPVKw0u9I7usGaWf/6S?=
 =?us-ascii?Q?H1PO7gExGrHV+okLU2Jb22M1uj9je8naZRkXQIhJYRV5spcdq8k8UwHQIU1U?=
 =?us-ascii?Q?Z/3cTnKUGwxSvTPgS4a2apyCe97PDarS1eHnZ5Fz9CzKwkKYSxRyw984hiuV?=
 =?us-ascii?Q?VjuwLe6waM3V5iQJrJgR5BqUtPHfCiFIusJEIISjLN1ym/9ejykfm9X4N7ng?=
 =?us-ascii?Q?aeJPV9gl9DrOjow63qylzu7pOXsRhp6vvwvc06yH82LUxuM3JViO?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c072c046-3709-434f-0cf8-08dec1348ada
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 05:54:14.5989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pzHfEjqZLE/oGcdIA0YPZfMw/9Br6ihEIE0i7oCc1PAZx/j6qAnRjqCpoBfrBRZIgIniN/4r8fMnJsRIbbf2Mq0iAywUxg+Cwv6ONUqwSSSYc+VcAfvd14PCxBIP1DSU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1153
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
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
	TAGGED_FROM(0.00)[bounces-37862-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,starfivetech.com:mid,starfivetech.com:from_mime,starfivetech.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6AB05634820

Add pinctrl bindings for StarFive JHB100 SoC Peripheral-0(per0) pinctrl
controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../pinctrl/starfive,jhb100-per0-pinctrl.yaml | 179 ++++++++++++++++++
 .../pinctrl/starfive,jhb100-pinctrl.h         |  62 ++++++
 2 files changed, 241 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per0-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per0-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per0-pinctrl.yaml
new file mode 100644
index 000000000000..f83801325348
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per0-pinctrl.yaml
@@ -0,0 +1,179 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-per0-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 Peripheral-0 Pin Controller
+
+description: |
+  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
+
+  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
+  per2, per2pok, per3, adc0, adc1, emmc, and vga.
+  This document provides an overview of the "per0" pinctrl domain.
+
+  The "per0" domain has a pin controller which provides
+  - function selection for GPIO pads.
+  - GPIO pad configuration.
+  - GPIO interrupt handling.
+
+  In the Peripheral-0  Pin Controller, there are 60 multi-function GPIO_PADs.
+  Each of them can be multiplexed to several hardware blocks through function
+  selection. Each iopad has a maximum of up to 3 functions - 0, 1, and 2.
+  Function 0 is the default function which is generally the GPIO function.
+  Function 1 and 2 are the alternate function or signal of an iopad.  The
+  function 1 and function 2 are other optional functions or peripheral
+  signals that can be routed to an iopad. The function selection can be carried
+  out by writing the function number to the iopad function select register.
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
+      - const: starfive,jhb100-per0-pinctrl
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
+            enum: [ gmac_mdio, gpio, i2c, i3c, smbalert, wdt ]
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
+        pinctrl_per0: pinctrl@11a0a000 {
+            compatible = "starfive,jhb100-per0-pinctrl";
+            reg = <0x0 0x11a0a000 0x0 0x1000>;
+            resets = <&per0crg 0>;
+            interrupts = <60>;
+            interrupt-controller;
+            #interrupt-cells = <3>;
+            gpio-controller;
+            #gpio-cells = <3>;
+            gpio-ranges = <&pinctrl_per0 0 0 0 32>,
+                          <&pinctrl_per0 1 0 32 28>;
+        };
+    };
diff --git a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
index e1c6bc8960b7..4fc54b9990d3 100644
--- a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
+++ b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
@@ -77,6 +77,68 @@
 #define PADNUM_SYS2_GPIO_A59				35
 #define PADNUM_SYS2_GPIO_A60				36
 
+/* per0 pad numbers */
+#define PADNUM_PER0_GPIO_B0				0
+#define PADNUM_PER0_GPIO_B1				1
+#define PADNUM_PER0_GPIO_B2				2
+#define PADNUM_PER0_GPIO_B3				3
+#define PADNUM_PER0_GPIO_B4				4
+#define PADNUM_PER0_GPIO_B5				5
+#define PADNUM_PER0_GPIO_B6				6
+#define PADNUM_PER0_GPIO_B7				7
+#define PADNUM_PER0_GPIO_B8				8
+#define PADNUM_PER0_GPIO_B9				9
+#define PADNUM_PER0_GPIO_B10				10
+#define PADNUM_PER0_GPIO_B11				11
+#define PADNUM_PER0_GPIO_B12				12
+#define PADNUM_PER0_GPIO_B13				13
+#define PADNUM_PER0_GPIO_B14				14
+#define PADNUM_PER0_GPIO_B15				15
+#define PADNUM_PER0_GPIO_B16				16
+#define PADNUM_PER0_GPIO_B17				17
+#define PADNUM_PER0_GPIO_B18				18
+#define PADNUM_PER0_GPIO_B19				19
+#define PADNUM_PER0_GPIO_B20				20
+#define PADNUM_PER0_GPIO_B21				21
+#define PADNUM_PER0_GPIO_B22				22
+#define PADNUM_PER0_GPIO_B23				23
+#define PADNUM_PER0_GPIO_B24				24
+#define PADNUM_PER0_GPIO_B25				25
+#define PADNUM_PER0_GPIO_B26				26
+#define PADNUM_PER0_GPIO_B27				27
+#define PADNUM_PER0_GPIO_B28				28
+#define PADNUM_PER0_GPIO_B29				29
+#define PADNUM_PER0_GPIO_B30				30
+#define PADNUM_PER0_GPIO_B31				31
+#define PADNUM_PER0_GPIO_B32				32
+#define PADNUM_PER0_GPIO_B33				33
+#define PADNUM_PER0_GPIO_B34				34
+#define PADNUM_PER0_GPIO_B35				35
+#define PADNUM_PER0_GPIO_B36				36
+#define PADNUM_PER0_GPIO_B37				37
+#define PADNUM_PER0_GPIO_B38				38
+#define PADNUM_PER0_GPIO_B39				39
+#define PADNUM_PER0_GPIO_B40				40
+#define PADNUM_PER0_GPIO_B41				41
+#define PADNUM_PER0_GPIO_B42				42
+#define PADNUM_PER0_GPIO_B43				43
+#define PADNUM_PER0_GPIO_B44				44
+#define PADNUM_PER0_GPIO_B45				45
+#define PADNUM_PER0_GPIO_B46				46
+#define PADNUM_PER0_GPIO_B47				47
+#define PADNUM_PER0_GPIO_B48				48
+#define PADNUM_PER0_GPIO_B49				49
+#define PADNUM_PER0_GPIO_B50				50
+#define PADNUM_PER0_GPIO_B51				51
+#define PADNUM_PER0_GPIO_B52				52
+#define PADNUM_PER0_GPIO_B53				53
+#define PADNUM_PER0_GPIO_B54				54
+#define PADNUM_PER0_GPIO_B55				55
+#define PADNUM_PER0_GPIO_B56				56
+#define PADNUM_PER0_GPIO_B57				57
+#define PADNUM_PER0_GPIO_B58				58
+#define PADNUM_PER0_GPIO_B59				59
+
 /* power-source value */
 #define JHB100_PINVREF_3_3V				0
 #define JHB100_PINVREF_2_5V				1
-- 
2.25.1


