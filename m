Return-Path: <linux-gpio+bounces-37865-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iimILD/DH2pbpgAAu9opvQ
	(envelope-from <linux-gpio+bounces-37865-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 08:01:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 679D663478C
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 08:01:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37865-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37865-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=starfivetech.com (policy=quarantine);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2F28630582DD
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2026 05:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 805233FBB7E;
	Wed,  3 Jun 2026 05:55:25 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2132.outbound.protection.partner.outlook.cn [139.219.17.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691E53F8886;
	Wed,  3 Jun 2026 05:55:22 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780466125; cv=fail; b=hIl5ENuKkgeXT4avCjA33qHumQtM9Szsvh5bioOzuWMAUg0A9ZyJWqq18DdyosSRSZ28Fo4nPn3fT8oDMCW7O21t5tigC1R82L6J96mvwL1zE2HRdISvLBsY92TS97EYc4mbqiztT/QeXGtqpkOl6WqVyjVgGmh41J2GVSNusa0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780466125; c=relaxed/simple;
	bh=UDrafPNuqszk9i5Aux5Hc9Dx2GUJf/pkVgo+63pHkAs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=k4rpUhm98QJfhxrwbNcDh99gRRascU0Iy7v+v8LbRyrK4xyyIrk4Eptrx1A8uv3/CPuhBSsKzF1/apw04wtug71O1kRv9j7GNa1isOdGFG8sMyFZ6rnfu9QCQWQ5f2TyEg+shj4lRy9FxpUCrawtP938wBMrncOjfJ1UEmXrV5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.132
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VsJZBySoubCWYX9plLjtAMJIuwzdnq/5o6v+snb2aJLNOyFjbCzryiYtgAmUv3Fowu1+/wQgEbxhpStM672z4BszlMZLbnzKZ/RnTv5cKqDWpjqBK43XnszyzsO+pejNljjYCBNDAHRl4POk030lMM7PtRWzgLbcvW2FHNL08mBw5qvqjWfAB/OqLPBSxoZDrVoCOyAvWU48q0QqjZzyj8EkWYGOXVZZ3fzJBCB+mWh0XHQgHyDle3nkt8O3EFs2PA+X7+N0C1cf3SqWB/kCeL5v1kPrNDqtZzYRnsqPtBj5Aekpwp8QHzgx4EXRYSWyLkk1IWWuGJy17TMEVBQYdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fYGTMjaqBIMNhKOvw2HqCUJk86v61ZO0dOpqvFT0XbU=;
 b=chq9PpC5FyDQCkPAd8MK9ZPbJeRS2A1BLeSqo6qq81FaFMC8XBZv0gLizOzhFWiB+W2QXCjRf3nrMXqHEmEp1fih7KSXrdWlAmzl5pDF/Q/1S7RQpvSNuslX7Oi5hMdzQ/KV2WU8RM1+1ZI9Oxc630KVc/WC+C3J5LGk6JOVqx0kVCqnOof77UCAiTwSORCmAfyEx0u37CLgugDpQcIXSg8wZwLl6Pd2Kpk9awQFuC6b35BrOuHORPBuEiLQ2TkxbFumQe3iZS709vsu299jutfvVNvtW5uIj3r0OGdisx+q1byRSJd1Yx8W3eIY/MCarCgfHmxUaDKAjatqvPFj+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1153.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 05:54:15 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.21.0092.006; Wed, 3 Jun 2026 05:54:15 +0000
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
Subject: [PATCH v3 12/21] pinctrl: starfive: Add StarFive JHB100 per0 controller driver
Date: Tue,  2 Jun 2026 22:53:38 -0700
Message-Id: <20260603055347.66845-13-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: fd16638e-d7ce-43df-96b3-08dec1348b96
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|3023799007|22082099003|18002099003|6133799003|5023799004|56012099006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	eyjCfpwQ+uXus1AMq3RLLmQUGyHMr2p4h0vfNAsnx78BI1/J/cDEQ1OEJBKE92LB5+iDXamzmAUgnjMD8Ith1ParZiIFqGp3sbLW6H14eadkOBBCD2Clax2fVoV3IJGmyuUSmeuip0Q7vVz4A4cdLYqCAtwEVmkO7t956emk1ZgdkDnDBxWg8cH3MrLy1UDQ5OQhh2gnQ/OwFKAPkDpCzdrC8AJzDtFlJBkwXJGIipcdhLFhiv8z8kuLz3BIFfvNW85zEQ0/5wMFVRv3o4AVp9rbwfcNZb2f7O/mIPltMcnpe/zTsqKTnr0rTOqYFtS1X7ueJZd1yk3UXKHq4+vbLkvaEpIlT+OHW1gkDDTupZLU4VMUHzyLxcJJy4h4QIgKhv0CJt35ePOyATISuHgFF1LCg7Wg3wdKyR5JvrRNLBqcE/pnE7eGt6/6aPFehHEMzP2B+/Xxf9ZF8VY2NPP38OvY6ApPdw42xxNxON9TVl9srELht74EWVQ1NJjxWsX/5YwmoA+Qe4Iu4GMQAntNXYRHM3reH5peiJg4OHkk7BvY2euJ1fOSCq1Ep6kCOzaN735dIievmnweEETq6/Fg1Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(3023799007)(22082099003)(18002099003)(6133799003)(5023799004)(56012099006)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dGQhZ2avArjIKhzuNnsmeE3/Uwrhj4yLD7gfNnAvfNcCGO30q8dUy2ismu6U?=
 =?us-ascii?Q?u3s8+PE5ybzPNWoUj3wbWtdGn5jeLm7fNOvJpKN1nyNP8qY2iH41mG/bUR1H?=
 =?us-ascii?Q?UVoPBfqq48AYeEJjnZYHq5U40VLjxQxfVWdw9rUAswZ2qu/sOlm1AaA2hLax?=
 =?us-ascii?Q?R1cvWctEXdzX9MCS2Q8okBI//ziheUWBjKyO2S/XB6nLA9dRrxylnTZkS+aO?=
 =?us-ascii?Q?xA7IMaC8Dguetg7WZfDOnJNfa39/Q5lpVFX+p5rYwCcfVixa7ka0B5X5DuK9?=
 =?us-ascii?Q?+bD7/Kw9jEbMUhdwfGTU3vHqWHT4koQIvNfXu4oYt1UpsxtmsV6d1c6eCA7z?=
 =?us-ascii?Q?nNsRh5hNgB98WNKVFniBhCwpVM0aL1jT0QzHVDKv/WML7rsypjC74Fya0sEY?=
 =?us-ascii?Q?YHvaTY15zKoySJnzKwIpToegA3ANPOOQJC8u+h3p5p7oDZgoBZjjT1jH51YE?=
 =?us-ascii?Q?Vguh7kIKQwRFoeGAAokaTtKqqsWyFTKfQv4kq660HLBe1u/efrjgjy4kDJJU?=
 =?us-ascii?Q?rXj3FBX9ZKRJn2GQSHAyIi5EDP0z0KR+vXhjCN+JU9ltHLX4Vp3xJmyEPAfV?=
 =?us-ascii?Q?4UZCXvI/JwVTITuh9A79m1dSlGuX6f2cLEIa6qE4XeDALh6/uoEdtqpHJWsw?=
 =?us-ascii?Q?nceRD91UpTW+d8m6b5UZ3giCon0+9bX4YgoGUb4dR7b5kWmg12Wgmg39N8w7?=
 =?us-ascii?Q?OBXBL7G0fkHFN3r4RC8BgaFf87dO5qeZyNBW5JPEFIi6aBuO9IjUkyN/smtj?=
 =?us-ascii?Q?phANDhMGzw7ApSBQwGTjP1a9UMi3RZ846Y7h9+57oaPqvAnGU5zS6zNaCU6z?=
 =?us-ascii?Q?dhsNtpHzEajcnCnchVJUWKU6BoAfW6Q4Ee0j7MmSyhcAMakFT7AIw+Xh88VZ?=
 =?us-ascii?Q?wPKlfp/AhmhkGnHYU1BXRel7atw1IEScMhxNNdyZNTGwxYYgFk0I81owDf80?=
 =?us-ascii?Q?4V2KEz6Fkp5QIZKtpOoUaE1D0kaQEjssrthdi7lLPOKVcm7jQTCuWyEbSthy?=
 =?us-ascii?Q?i3mDuBnT11zr2kRulufdDO3+YKJj9K0urB7T8kP/tEt4ZsdiTUzXTOhXH6q1?=
 =?us-ascii?Q?76D/MzLODFuB+/8h+DB0Pau5+W6GWiLwMTsCotOYuXyX0bj1JhIsVR4v9ZGo?=
 =?us-ascii?Q?RJB1Lf3jTTanQU51469R6doLFJcig6BRy0zl11XyPfLu+7M5x+Svxpse22S6?=
 =?us-ascii?Q?77wzi7QQEqvG4lYkauQnJ9hHRK1o7+MVhMM5hGtH5oVszHWW0GA0G8C7A0p2?=
 =?us-ascii?Q?NRPyUD7TD4MjrPvLQZpxxANKxuOZf8seD97RiwQT2F9YfSI6AH62Huz/MT9r?=
 =?us-ascii?Q?X4C6csgn/ESAPgvxg/nqvAsQtLT7tozM7208ltghOUuJrcguyd3zrx9kHEVJ?=
 =?us-ascii?Q?NGi/qRvp5AnfoBiEABRQ+AUVJaCAgqM8RQgDlOqQAygSgJldB1krZ5fMCTgW?=
 =?us-ascii?Q?mkV3mjk/iszshmeU0yf8S3Tr1FV6eo/c8NOcQtze0Pt1c3YlQWEGQySQ43PG?=
 =?us-ascii?Q?UTvNPUeDVRANSHT6Jb51jRq5Dutw3GFOtY4Upeehy3i2VflHT16U0bGeg2wC?=
 =?us-ascii?Q?EnJt0zED2hXvdzpIE+2VfKG4XAwJFQ9ajTv4kPyggmWRZ08sBU8Vc6RFlcKX?=
 =?us-ascii?Q?QYI6nXuzMMiaghqxlA4jV/zh9JR3Hdu4/eXivDlifRWmae0sSEWW8zmnoXZU?=
 =?us-ascii?Q?odA/s95u1Duo54+VhgztLD2RXXXLBEuadAE+evt0eQmmVoWmqHiG36ENprkg?=
 =?us-ascii?Q?t0kODIeMFXGbR70nWw5i+63AF2nw8HrwrhXTwrnszWoxosHv25Wa?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd16638e-d7ce-43df-96b3-08dec1348b96
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 05:54:15.8325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zvuMXmETL1Jv0BDfvKTQC2Dtq+kxByojb6guQwmqGM3x56Up+532J/tEfG94eWGLbkMMtipQ8kdQx1VeYJ/sfAhMfveFPO38scFPsH4zvthJSvjA1rjUjzcppJPiQSNl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1153
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
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
	TAGGED_FROM(0.00)[bounces-37865-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,starfivetech.com:mid,starfivetech.com:from_mime,starfivetech.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 679D663478C

Add pinctrl driver for StarFive JHB100 SoC Peripheral-0(per0) pinctrl
controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              |  12 ++
 drivers/pinctrl/starfive/Makefile             |   1 +
 .../starfive/pinctrl-starfive-jhb100-per0.c   | 154 ++++++++++++++++++
 3 files changed, 167 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per0.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index da11d486779a..1e1bfdf87c31 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -55,6 +55,18 @@ config PINCTRL_STARFIVE_JHB100
 	select GPIOLIB_IRQCHIP
 	select OF_GPIO
 
+config PINCTRL_STARFIVE_JHB100_PER0
+	tristate "StarFive JHB100 SoC Peripheral-0 pinctrl and GPIO driver"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	depends on OF
+	select PINCTRL_STARFIVE_JHB100
+	default ARCH_STARFIVE
+	help
+	  Say yes here to support Peripheral-0 pin control on the StarFive JHB100 SoC.
+	  This also provides an interface to the GPIO pins not used by other
+	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
+	  and interrupts on input changes.
+
 config PINCTRL_STARFIVE_JHB100_SYS0
 	tristate "StarFive JHB100 SoC System-0 pinctrl and GPIO driver"
 	depends on ARCH_STARFIVE || COMPILE_TEST
diff --git a/drivers/pinctrl/starfive/Makefile b/drivers/pinctrl/starfive/Makefile
index b817ad93b91d..f2bb0c35a2a0 100644
--- a/drivers/pinctrl/starfive/Makefile
+++ b/drivers/pinctrl/starfive/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_PINCTRL_STARFIVE_JH7110_SYS)	+= pinctrl-starfive-jh7110-sys.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JH7110_AON)	+= pinctrl-starfive-jh7110-aon.o
 
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100)		+= pinctrl-starfive-jhb100.o
+obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER0)	+= pinctrl-starfive-jhb100-per0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0)	+= pinctrl-starfive-jhb100-sys0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0H)	+= pinctrl-starfive-jhb100-sys0h.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS1)	+= pinctrl-starfive-jhb100-sys1.o
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per0.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per0.c
new file mode 100644
index 000000000000..d3364dfd9cbe
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per0.c
@@ -0,0 +1,154 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC Peripheral-0 domain
+ *
+ * Copyright (C) 2024 StarFive Technology Co., Ltd.
+ * Author: Alex Soo <yuklin.soo@starfivetech.com>
+ *
+ */
+
+#include <dt-bindings/pinctrl/starfive,jhb100-pinctrl.h>
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+
+#include "pinctrl-starfive-jhb100.h"
+
+static const struct jhb100_pin_layout_desc jhb100_per0_pl_desc[] = {
+	{ .pin_start = 0, .pin_cnt = 60, .name = "gpio", .gpio_func_sel = 0 },
+	{ 0xff },
+};
+
+static struct config_reg_layout_desc jhb100_per0_pinctrl_rl_desc[] = {
+	{
+		.pin_start			= 0,
+		.pin_cnt			= 60,
+		.input_enable			= { .shift = 0, .width = 1 },
+		.mode_select			= { .shift = 1, .width = 2 },
+		.pull_down			= { .shift = 3, .width = 1 },
+		.pull_up			= { .shift = 4, .width = 1 },
+		.open_drain_pull_up_sel		= { .shift = 5, .width = 2 },
+		.schmitt_trigger_select		= { .shift = 7, .width = 1 },
+		.reserved			= { .shift = 8, .width = 7 },
+		.debounce_width			= { .shift = 15, .width = 17 },
+	},
+	{ 0xff },
+};
+
+static const struct pinvref_desc pinvref_desc_per0[] = {
+	{
+		/* gpioe-i3c0 */
+		.pin_grp = {
+			PADNUM_PER0_GPIO_B8,
+			PADNUM_PER0_GPIO_B9,
+			PADNUM_PER0_GPIO_B10,
+			PADNUM_PER0_GPIO_B11,
+			PADNUM_PER0_GPIO_B32,
+			PADNUM_PER0_GPIO_B33
+		},
+		.num_pins = 6,
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
+	},
+	{
+		/* gpioe-i3c1 */
+		.pin_grp = {
+			PADNUM_PER0_GPIO_B12,
+			PADNUM_PER0_GPIO_B13,
+			PADNUM_PER0_GPIO_B14,
+			PADNUM_PER0_GPIO_B15,
+			PADNUM_PER0_GPIO_B34,
+			PADNUM_PER0_GPIO_B35
+		},
+		.num_pins = 6,
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
+	},
+	{
+		/* gpioe-i3c2 */
+		.pin_grp = {
+			PADNUM_PER0_GPIO_B16,
+			PADNUM_PER0_GPIO_B17,
+			PADNUM_PER0_GPIO_B18,
+			PADNUM_PER0_GPIO_B19,
+			PADNUM_PER0_GPIO_B20,
+			PADNUM_PER0_GPIO_B21,
+			PADNUM_PER0_GPIO_B22,
+			PADNUM_PER0_GPIO_B23
+		},
+		.num_pins = 8,
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
+	},
+	{
+		/* gpioe-i3c4 */
+		.pin_grp = {
+			PADNUM_PER0_GPIO_B36,
+			PADNUM_PER0_GPIO_B37,
+			PADNUM_PER0_GPIO_B38,
+			PADNUM_PER0_GPIO_B39,
+			PADNUM_PER0_GPIO_B40,
+			PADNUM_PER0_GPIO_B41,
+			PADNUM_PER0_GPIO_B42,
+			PADNUM_PER0_GPIO_B43
+		},
+		.num_pins = 8,
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
+	},
+};
+
+struct starfive_pinctrl_regs jhb100_per0_pinctrl_regs = {
+	.vref			= { .reg = 0x004, .pv_desc = pinvref_desc_per0,
+				    .num_pv = ARRAY_SIZE(pinvref_desc_per0) },
+	.func_sel		= { .reg = 0x11c, .width_per_pin = 2 },
+	.config			= 0x014,
+	.output			= 0x104,
+	.output_en		= 0x10c,
+	.gpio_status		= 0x114,
+	.irq_en			= 0x12c,
+	.irq_status		= 0x134,
+	.irq_clr		= 0x13c,
+	.irq_trigger		= 0x144,
+	.irq_level		= 0x14c,
+	.irq_both_edge		= 0x154,
+	.irq_edge		= 0x15c,
+};
+
+static const struct jhb100_pinctrl_func_maps jhb100_func_maps_per0[] = {
+	{ .func = "gmac_mdio",		.val = 2 },
+	{ .func = "gpio",		.val = 0 },
+	{ .func = "i2c",		.val = 1 },
+	{ .func = "i3c",		.val = 2,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_PER0_GPIO_B23) },
+	{ .func = "i3c",		.val = 1,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_PER0_GPIO_B59) },
+	{ .func = "smbalert",		.val = 1 },
+	{ .func = "wdt",		.val = 2 },
+};
+
+static const struct jhb100_pinctrl_domain_info jhb100_per0_pinctrl_info = {
+	.name			= "jhb100-per0",
+	.pl_desc		= jhb100_per0_pl_desc,
+	.crl_desc		= jhb100_per0_pinctrl_rl_desc,
+	.regs			= &jhb100_per0_pinctrl_regs,
+	.fmaps			= jhb100_func_maps_per0,
+	.num_maps		= ARRAY_SIZE(jhb100_func_maps_per0),
+};
+
+static const struct of_device_id jhb100_per0_pinctrl_of_match[] = {
+	{
+		.compatible = "starfive,jhb100-per0-pinctrl",
+		.data = &jhb100_per0_pinctrl_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jhb100_per0_pinctrl_of_match);
+
+static struct platform_driver jhb100_per0_pinctrl_driver = {
+	.probe = jhb100_pinctrl_probe,
+	.driver = {
+		.name = "starfive-jhb100-per0-pinctrl",
+		.of_match_table = jhb100_per0_pinctrl_of_match,
+	},
+};
+module_platform_driver(jhb100_per0_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for StarFive JHB100 SoC Peripheral-0 domain");
+MODULE_AUTHOR("Alex Soo <yuklin.soo@starfivetech.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1


