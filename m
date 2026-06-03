Return-Path: <linux-gpio+bounces-37871-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vKKnJk7FH2rbpgAAu9opvQ
	(envelope-from <linux-gpio+bounces-37871-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 08:10:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D43B6348C2
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 08:10:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37871-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37871-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=starfivetech.com (policy=quarantine);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EB828305AAA9
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2026 05:56:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB3C93F9F5D;
	Wed,  3 Jun 2026 05:55:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2105.outbound.protection.partner.outlook.cn [139.219.17.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221903F8EC2;
	Wed,  3 Jun 2026 05:55:40 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780466141; cv=fail; b=lKkmLmYhkDCBSxt3urIr76g4DvQcv4JKdceiYA1NdIiIJqwmlQ9BVexnmkiPqDrAJDloxl9DOyF/gbwfmSn27Iq+hawAZMMtl4pOpoUouXHJmSq+Q7i3M/idJsypGxiwvfPyuHWsIAWEMEvrMEtTV/Zoquu4d94pGtzgdxA48xI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780466141; c=relaxed/simple;
	bh=6pWRsCWbJDlED32ExP7kFEY5RclA+iEA8hEo6bpmdg4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EeAIVKYHULhOGmPFBaD2StCpO6/izxH55rEfNxPCCt68oIVBEbVjKgv1CIYW1lmgaIfwoix3pzAsPav9WK32dENb4WBjthUmSwkLasPaBTwVCfL+9aTlJ48OmIipUw0rMogGL+g02kmjhPWLKDkg+G7sIvElM+xIpcQfHPjgHeM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.105
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MwMBasDWA9eKmakN7OQCQj0IhIMJm3hwychlN7liHiQCmsjLSnPlmv4NVHh3n10xsMtOZLouNky0p8c81dpHkkTRhVtPXLIt8p4SHC0SNCAWLT3/FGv/MYXSuBI0XIejWywyjoxpp+3RW1iewuTS9STMOJN1hbg39CgGG9PBi6gVn3nxhc/brb9Ls6UEySFy9qqNiRzVCoDUQLOoc4P9CzsKLdPkaAlXwN7/s+Q6okN1eD1M9COcUqSMcL9kLv54sxll/hb4rMKtYkEPujSCazArVCjfXV8QRmnpBCESh5Thx4q6Hr9oyTfqkpGxPNg8ZydZBDgE4oXOR+vJDUFYeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YA7Nzo5z2sMG7Q+oDuElsZaNB++kqRi1wcj18uba+8E=;
 b=e2KAkKzFas8qf0jz2gzAT+H6b1GJgNFguBXdwQ3MENBddGItZypE+WkzfPFkfTbnCI5GbbZJavJaVCP2BzMl7BZb3vzfcrLdFq3cBCWT/EL0KHHRpg1N6WITtB5PMqzXLjcB9MT2T1DIDW7ek5jTFZ0vx8Stcr4eJNXb92mJZXXYGpVewTR5cNZBFLaVI691N4OOIzlBKzAliV7lJlG15cx3E3DSEXFw6BwhC4jC9RuzyfQZ0j1n1M2MbNtakqyBf03SYtfNTVqpDI4GD9IgZvlZj2SaMLF8J/rkdV76biJOSaCnAYHE2csIyviFEmFiiz4RjaZQ8tBw0A/Y50OE+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1154.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 05:54:27 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.21.0092.006; Wed, 3 Jun 2026 05:54:27 +0000
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
Subject: [PATCH v3 21/21] riscv: dts: starfive: jhb100: Add pinctrl nodes
Date: Tue,  2 Jun 2026 22:53:47 -0700
Message-Id: <20260603055347.66845-22-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 400d55fe-d236-4074-9f0a-08dec1349262
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|22082099003|18002099003|56012099006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	WMyVJ/Njo7v3gZ8NKuefB7adp9X+Mm72dINKntHk4+2wTjCyuMOPTkOGkqynQEkDVMToPmuuYIim+dryEpjtw2ENhLKXnr2M8ZLcB6qR2NHZqIXGqKumavWh4CHTTbj7/qjWZjNxpuHRh9f895vU+rj9kFhhSfB6phQVVhFcdwW/DyuAUr8UTebvQnZFrd6Dps+dSunEuAC6QyIHqLwirWRDevVUtkh4QRZedcWx8e3zAPntc7mRCBlFYLUt0HqtDl1wIrY23qLYMSt5wK5KMUAlrfWgvPH44MgWM9j02XNufDg1fY7uI4jHtg6e9c9khW23KgLwhyQbm0UPn+7GdB9ong/d27Keu1iFOgP2IVdbjJwKzC6O0tSwQehknfRIPgsowO83y8WNQvoSJ99tVZDeMISNe4rpeGRkb7vzfuKRFiDY0R3L/HVdrrz+WLSZ0Q8kAN7GtAek7cRpbs4x1bpoWfWRL0U8Wokm88p0H0vaoJMo/axey/e2zMMDtwQceG5ARAfUMFazsIJiXcRobBq3LdJ80YW77NvQe5U7qSj4EAYjhJV4UshK6AhmQ4KXnWcEAQr7kO/TddC628AYAw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(22082099003)(18002099003)(56012099006)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CMYBxmglo+oBTf8reMufq2tTZeexZP/VbX6Rgva52Y19u/zVlgy4qPVXM15X?=
 =?us-ascii?Q?BuKpml74GhQV8BMKpUKqq+MKKOJiRZGl9AytFKysbZKUmbVebLVslKNJwuwB?=
 =?us-ascii?Q?Or1ko47Mr7RpwIEaJZPHaXGR1NvaIKgpl0OPVAx5Y3SDlxorxcSRJB4XrI+x?=
 =?us-ascii?Q?f6qJFPZB5Kc4SCu477oicWcYKFTDUp9H6DoMaCYx12sWemGqBNX1Oei1nivt?=
 =?us-ascii?Q?hk6ZjCIO0oC73wB1Y6/4DId7e5H28MalkZX/x7ZU6dkz5AsYiQ5H8NaTmL7q?=
 =?us-ascii?Q?dmQmrVq1j9m8AfcsBltHsuH5sWsybKkYc48xlJ+sgatbLCVylTiHFtlRL+Xw?=
 =?us-ascii?Q?awNVxu2O76Kh1YoPfPpT1H5dhSRhoyH9fVPuqaxc16Q8NppNiFzeU8o5SJeg?=
 =?us-ascii?Q?CiQyG/R0rD009pHpQtspmljJpJpA5BIxQ3pwTC1svI6jeD+wosHrIt8Tknj9?=
 =?us-ascii?Q?KWBafm9jjxTalHQyycsq1QjhscUlINd1+tbY7AlkK4qlWK0zD5HjGULfZkDx?=
 =?us-ascii?Q?Yy4ti4QrW9SwP39lj6fGNgGpyTkIArb8rEpXwpEgf2pUYsXhkXyIlY6CyiMB?=
 =?us-ascii?Q?AMRsZE9MovBiqXNX1V2UcgXey3G/gsIPwPSK1EIcwtAinnD5L9r7MfmxCENZ?=
 =?us-ascii?Q?tAlQzGXEGU9AfKC1qnbECZRYm0GqlcDPx9vpvQ3yWvph87/W61IsLioCzdM8?=
 =?us-ascii?Q?Y09JRWVUNlhGk7NrrFoS991zIhyrbr4ZRMLKV55FQmcxknGgwqPJ0LiX/pYu?=
 =?us-ascii?Q?OoDbaO3TIHmhFQaKIg8g3BUd7Cl/qaF2udlWsSwMrO++61LwIHN9ryOy572P?=
 =?us-ascii?Q?+g+7QXuQrZUglORuPKS3i7rjVszaWXlc89sYAPCTCcE7DGTrqc8UB/EdnzTb?=
 =?us-ascii?Q?qWaiitEZD4ObHtCb4LvyCfzEFY3T1v+3L4sHwFuJoiWybcWtAKi3mhwg2cYr?=
 =?us-ascii?Q?AgzoMAqY7RkheqTu7abp8p+edrjaIuE0tKnmC1sp25rEl+RKQNTTNN5VSzpA?=
 =?us-ascii?Q?mEkZqInSNggV6N7NsOJ1woxOSjM4L/li7mnD1lCIrMZkHyME/B7xL8pVtOa0?=
 =?us-ascii?Q?PK/8yZGeKG/4kGKlxhVNEdjZIeRlvsCgY599R7aHQi4kuBV+8jXs6a8B6IMr?=
 =?us-ascii?Q?ddl+eieekaomDonH8olXTboXcKBlPdKc1FneZN7a2rnpQEeWin7BzI9UrW0K?=
 =?us-ascii?Q?hHoMlRZXE+NK2VD5lgajUKW8MXs53NVOfxlStXK0VlbgeS+1/y/sjMdbbonp?=
 =?us-ascii?Q?o9jAT5ftyo8H7Mc2WMfNPRfVrxk0H3vnyd5sx2/E8cehUJzPCxZDgQDO9ZEZ?=
 =?us-ascii?Q?KEFYbdTcCtNUn9MSMD2ePJNDJ6INt9d9h4dY04fAp5er9+gez/s+r0c3GnuX?=
 =?us-ascii?Q?/e4OLGF4krmh+awZ6vlAw+flAkf+Bj/PlmcT+RT0NV2ta0cE2po1kzIXQE2g?=
 =?us-ascii?Q?Yh9PYlMDMTOCf9rqeSCyrbr9fMIS9HBM1sAYMXXdDX8cmO7n8PK92BPMWVQu?=
 =?us-ascii?Q?ME3rfXbuJGibU0/Y0pdQ5yOaa0Fjpe3Q0c/O4ILTMCQwsQxRsQ9KO4t9OVkO?=
 =?us-ascii?Q?OOhQ/Sxb2m8cxiXtRe4g7rU8ma96o4uNHgZbLULKO7T38sHZ38X6DbltdQ8h?=
 =?us-ascii?Q?IDAQQ/RpVi0/MpaSM0nWAu0LE4TUSwOy+y9QBazlKnaSuWXKrgjMjhTrncYs?=
 =?us-ascii?Q?j9zynVihXhUKNikSFt6IJhD2qmxbuI2vnJXQIkfLx2cbjVOunYZMstpVEHC9?=
 =?us-ascii?Q?j1wgZnVZhhhYwOrq+r+Wu5aXnwCIzQ9uOOUatW+Dv5znWhtOUINO?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 400d55fe-d236-4074-9f0a-08dec1349262
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 05:54:27.2396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ORMriaDURR8/UJqCX5XW9RC67UXZYRBngnBE3//G4sVbYMXJVbIHxd7Ato62yXpI8+9cG98cExJTuSYHeQFaGcWIzP5FLgLtJU7foNVdOLcJPWKYx86jQYgQ0XYsowD2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1154
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
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kernel@esmil.dk,m:pjw@kernel.org,m:aou@eecs.berkeley.edu,m:palmer@dabbelt.com,m:alex@ghiti.fr,m:p.zabel@pengutronix.de,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:lianfeng.ouyang@starfivetech.com,m:changhuang.liang@starfivetech.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-37871-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[starfivetech.com:mid,starfivetech.com:from_mime,starfivetech.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9D43B6348C2

Add pinctrl nodes for starfive JHB100 SoC. They contain
pinctrl_per0/pinctrl_per1/pinctrl_per2/pinctrl_per2pok/pinctrl_per3/
pinctrl_sys0/pinctrl_sys0h/pinctrl_sys1/pinctrl_sys2.

Simultaneously add the pinctrl reference for uart6.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 arch/riscv/boot/dts/starfive/jhb100-evb1.dts  |   3 +
 .../boot/dts/starfive/jhb100-pinctrl.dtsi     |  23 ++++
 arch/riscv/boot/dts/starfive/jhb100.dtsi      | 110 ++++++++++++++++++
 3 files changed, 136 insertions(+)
 create mode 100644 arch/riscv/boot/dts/starfive/jhb100-pinctrl.dtsi

diff --git a/arch/riscv/boot/dts/starfive/jhb100-evb1.dts b/arch/riscv/boot/dts/starfive/jhb100-evb1.dts
index 462b6fb7953b..8ad2b30a4e0b 100644
--- a/arch/riscv/boot/dts/starfive/jhb100-evb1.dts
+++ b/arch/riscv/boot/dts/starfive/jhb100-evb1.dts
@@ -4,6 +4,7 @@
  */
 
 #include "jhb100.dtsi"
+#include "jhb100-pinctrl.dtsi"
 
 / {
 	model = "StarFive JHB100 EVB-1";
@@ -29,4 +30,6 @@ memory@40000000 {
 
 &uart6 {
 	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart6_pins>;
 };
diff --git a/arch/riscv/boot/dts/starfive/jhb100-pinctrl.dtsi b/arch/riscv/boot/dts/starfive/jhb100-pinctrl.dtsi
new file mode 100644
index 000000000000..acc357e98548
--- /dev/null
+++ b/arch/riscv/boot/dts/starfive/jhb100-pinctrl.dtsi
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (c) 2025-2026 StarFive Technology Co., Ltd.
+ */
+
+#include <dt-bindings/pinctrl/starfive,jhb100-pinctrl.h>
+
+&pinctrl_sys2 {
+	uart6_pins: uart6-grp {
+		uart6-tx-pins {
+			pins = <PADNUM_SYS2_GPIO_A38>;
+			function = "uart";
+			power-source = <JHB100_PINVREF_3_3V>;
+		};
+
+		uart6-rx-pins {
+			pins = <PADNUM_SYS2_GPIO_A39>;
+			function = "uart";
+			input-enable;
+			power-source = <JHB100_PINVREF_3_3V>;
+		};
+	};
+};
diff --git a/arch/riscv/boot/dts/starfive/jhb100.dtsi b/arch/riscv/boot/dts/starfive/jhb100.dtsi
index 943324b3b2fd..f9a7fa9d37e3 100644
--- a/arch/riscv/boot/dts/starfive/jhb100.dtsi
+++ b/arch/riscv/boot/dts/starfive/jhb100.dtsi
@@ -428,6 +428,19 @@ per0crg: clock-controller@11a08000 {
 				#reset-cells = <1>;
 			};
 
+			pinctrl_per0: pinctrl@11a0a000 {
+				compatible = "starfive,jhb100-per0-pinctrl";
+				reg = <0x0 0x11a0a000 0x0 0x1000>;
+				resets = <&per0crg JHB100_PER0RST_GPIO_IOMUX_PRESETN>;
+				interrupts = <60>;
+				interrupt-controller;
+				#interrupt-cells = <3>;
+				gpio-controller;
+				#gpio-cells = <3>;
+				gpio-ranges = <&pinctrl_per0 0 0 0 32>,
+					      <&pinctrl_per0 1 0 32 28>;
+			};
+
 			per1crg: clock-controller@11b40000 {
 				compatible = "starfive,jhb100-per1crg";
 				reg = <0x0 0x11b40000 0x0 0x1000>;
@@ -443,6 +456,19 @@ per1crg: clock-controller@11b40000 {
 				#reset-cells = <1>;
 			};
 
+			pinctrl_per1: pinctrl@11b42000 {
+				compatible = "starfive,jhb100-per1-pinctrl";
+				reg = <0x0 0x11b42000 0x0 0x800>;
+				resets = <&per1crg JHB100_PER1RST_IOMUX_PRESETN>;
+				interrupts = <61>;
+				interrupt-controller;
+				#interrupt-cells = <3>;
+				gpio-controller;
+				#gpio-cells = <3>;
+				gpio-ranges = <&pinctrl_per1 0 0 0 32>,
+					      <&pinctrl_per1 1 0 32 4>;
+			};
+
 			per2crg: clock-controller@11bc0000 {
 				compatible = "starfive,jhb100-per2crg";
 				reg = <0x0 0x11bc0000 0x0 0x1000>;
@@ -464,6 +490,30 @@ per2crg: clock-controller@11bc0000 {
 				#reset-cells = <1>;
 			};
 
+			pinctrl_per2: pinctrl@11bc2000 {
+				compatible = "starfive,jhb100-per2-pinctrl";
+				reg = <0x0 0x11bc2000 0x0 0x400>;
+				resets = <&per2crg JHB100_PER2RST_IOMUX_PRESETN>;
+				interrupts = <62>;
+				interrupt-controller;
+				#interrupt-cells = <3>;
+				gpio-controller;
+				#gpio-cells = <3>;
+				gpio-ranges = <&pinctrl_per2 0 0 0 31>;
+			};
+
+			pinctrl_per2pok: pinctrl@11bc2400 {
+				compatible = "starfive,jhb100-per2pok-pinctrl";
+				reg = <0x0 0x11bc2400 0x0 0x400>;
+				resets = <&per2crg JHB100_PER2RST_POK_IOMUX_PRESETN>;
+				interrupts = <63>;
+				interrupt-controller;
+				#interrupt-cells = <3>;
+				gpio-controller;
+				#gpio-cells = <3>;
+				gpio-ranges = <&pinctrl_per2pok 0 0 0 18>;
+			};
+
 			per3crg: clock-controller@11c40000 {
 				compatible = "starfive,jhb100-per3crg";
 				reg = <0x0 0x11c40000 0x0 0x1000>;
@@ -483,6 +533,18 @@ per3crg: clock-controller@11c40000 {
 				#reset-cells = <1>;
 			};
 
+			pinctrl_per3: pinctrl@11c42000 {
+				compatible = "starfive,jhb100-per3-pinctrl";
+				reg = <0x0 0x11c42000 0x0 0x1000>;
+				resets = <&per3crg JHB100_PER3RST_IOMUX_PRESETN>;
+				interrupts = <64>;
+				interrupt-controller;
+				#interrupt-cells = <3>;
+				gpio-controller;
+				#gpio-cells = <3>;
+				gpio-ranges = <&pinctrl_per3 0 0 0 11>;
+			};
+
 			sys0crg: clock-controller@13000000 {
 				compatible = "starfive,jhb100-sys0crg";
 				reg = <0x0 0x13000000 0x0 0x4000>;
@@ -517,6 +579,54 @@ sys2crg: clock-controller@13008000 {
 				#reset-cells = <1>;
 			};
 
+			pinctrl_sys0: pinctrl@13080000 {
+				compatible = "starfive,jhb100-sys0-pinctrl";
+				reg = <0x0 0x13080000 0x0 0x800>;
+				resets = <&sys0crg JHB100_SYS0RST_SYS0_IOMUX_PRESETN>;
+				interrupts = <56>;
+				interrupt-controller;
+				#interrupt-cells = <3>;
+				gpio-controller;
+				#gpio-cells = <3>;
+				gpio-ranges = <&pinctrl_sys0 0 0 0 4>;
+			};
+
+			pinctrl_sys0h: pinctrl@13080800 {
+				compatible = "starfive,jhb100-sys0h-pinctrl";
+				reg = <0x0 0x13080800 0x0 0x800>;
+				resets = <&sys0crg JHB100_SYS0RST_SYS0H_IOMUX_PRESETN>;
+				interrupts = <57>;
+				interrupt-controller;
+				#interrupt-cells = <3>;
+				gpio-controller;
+				#gpio-cells = <3>;
+				gpio-ranges = <&pinctrl_sys0h 0 0 0 12>;
+			};
+
+			pinctrl_sys1: pinctrl@13081000 {
+				compatible = "starfive,jhb100-sys1-pinctrl";
+				reg = <0x0 0x13081000 0x0 0x1000>;
+				resets = <&sys1crg JHB100_SYS1RST_SYS1_IOMUX_PRESETN>;
+				interrupts = <58>;
+				interrupt-controller;
+				#interrupt-cells = <3>;
+				gpio-controller;
+				#gpio-cells = <3>;
+				gpio-ranges = <&pinctrl_sys1 0 0 0 8>;
+			};
+
+			pinctrl_sys2: pinctrl@13082000 {
+				compatible = "starfive,jhb100-sys2-pinctrl";
+				reg = <0x0 0x13082000 0x0 0x1000>;
+				interrupts = <59>;
+				interrupt-controller;
+				#interrupt-cells = <3>;
+				gpio-controller;
+				#gpio-cells = <3>;
+				gpio-ranges = <&pinctrl_sys2 0 0 0 32>,
+					      <&pinctrl_sys2 1 0 32 5>;
+			};
+
 			intc: interrupt-controller@13220000 {
 				compatible = "starfive,jhb100-intc";
 				reg = <0x0 0x13220000 0x0 0x80>;
-- 
2.25.1


