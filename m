Return-Path: <linux-gpio+bounces-37873-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id n59jHK7GH2oepwAAu9opvQ
	(envelope-from <linux-gpio+bounces-37873-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 08:16:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1CB634953
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 08:16:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37873-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37873-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=starfivetech.com (policy=quarantine);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A12A3022ABC
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2026 06:09:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2834E3DB62B;
	Wed,  3 Jun 2026 06:09:26 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2123.outbound.protection.partner.outlook.cn [139.219.17.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2449937C930;
	Wed,  3 Jun 2026 06:09:18 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780466966; cv=fail; b=u4JSxog8pmp0P37GSbS8Jda+dfj1CmlU/RBVW+0RoD2YRVOuFKsL9QRi9OIUpyJRxR1PxzORj/P0gfppZJPCfNe9vOnxvroDTx8mXxef4MOh5IsGz6G1+8zU3+oororqYgiPWxb9ZIa/2xRI0icSHv3JANf/7OL+5gonNEDaJsA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780466966; c=relaxed/simple;
	bh=IyuuQp/F7NhMptB5zrdNyZ8A1fDV/oYwL+nvqbJjuBM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NIBPTTvlJkS9paEp7EGiqVar6uEVyDoCcBdWOEQd2RPn27pvfX8P+k+W5XMN4fVyfMX/fjbLzoBLzh8Bb2QALd81zsaZTSFq+delZ76w8IKmdfpe1u0fasD5mMxn1HaZLZIBGo0+GJLJBGeDKMUG/qUoqfzqQwnEp7AleF0R00U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.123
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hu6E96AQsGaHFatX2vOTdaVeSWlTHv60inZrf+ToDLxe7SMA0pBXyfgKrN7X8YxgrkTWVyeE4wMzI2mwu3D8ap9Ab3mIb1M2mlWiQ/5JH4XVQG53Vmy86EbBjkdjJbFw/4tkvCiWLKBkyKTHSWJhJY+zTXphjjGb0AJd6iImarpbikREfaJDllPoewgjLXa2j30t/CQDpqka5itBPLr7FuA71mugMW3BuRBJ5pcPuydcGLdLMLCI3KBZbS9yG/OSR4y/pGoxaFwcEEVkZSLCaGHK+4+QmVLJLqsfKv3+kk2Is3eqlegz8NozZ13lm59Eu8muFnN3olqpM8CXBD4cNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2x+bwv4pTPSFlgmzmYrYV9iMc3kbkytw3oVFfDrdjxQ=;
 b=Mgc0f3Vfy9dh+z+uQOXF5xFA2bd5ajaDb1/YAqtXmEMSYPQpCHxCbyqUZufa7IS++vygUgdWp0PFKf0ekXZUawrpBGhaUsHC/pbmUDK8sUd1Qe41DzuNaqIJ4sodGq/KzoUS3HEesKWDWiQ1PkwofsA9EifoT1frnhVyfoEEbuq2rwOmhykAKRhy5gBUDXrr2iQLVKr8/QhtFu+VztnBe1HcqHkn/9c9HDUEBterwlsnBf5XX2BUkgZMqqN5q4e4q+9Pfqpx2YNrnxwUZnM0sy/7d28PnfL6S8XmrWbmy8yE0aJmGijZjTZEM5gUW+B73x0MMyfQH2mp+t5y1ZOxXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1153.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 05:54:05 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.21.0092.006; Wed, 3 Jun 2026 05:54:05 +0000
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
Subject: [PATCH v3 04/21] pinctrl: starfive: Add StarFive JHB100 sys0 controller driver
Date: Tue,  2 Jun 2026 22:53:30 -0700
Message-Id: <20260603055347.66845-5-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8a3dfa19-31dc-414d-72de-08dec1348555
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|3023799007|22082099003|18002099003|6133799003|5023799004|56012099006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	Zs7/h05f/DPolu+73GLXG51RHY6M/R0xZsa6t2eFw+AqEptm7pDYwLEfgNGNzLy3dP+nZO9xzj8QgQVcS8754soLBIfgE54IDp2fQIEHuIEK8eKMOLsRTXIN/hbn8C3rpbJ2Ds04aBRJeKds55P1EpKBdU5BTX+iiXsLjQ+sWDYY0prODajks7Hkn2JZt3xz8bPSz0rWgn0XUWfjZ4VZeqVBeU4Po/nGB549IkaWPQkKkQOCXpGHYa+hCmocOpst2gW5bLDIuAjikysCgc3uQUkxrs4o3HgHCowQzAQ9qzBWPFV8GNCjY0r5Mbh2HWLqM0itt/qJe2BOCzXKEjpmo79FLsqkA7Whq2gfnjNqnfEJjGip/gMZN3vUWaer8zBv3pvBArsoLEZllJJZiEDPvc4Fs0YZ98YUSUdm3lf9V86oCT9Ap7sbEaw27UmPaHgnzSCJ/zaaCo6R0Zv6LjaOWdK962STG+5JBNafH69MJYUlwA4yJ6OdFKefmNVSJwST8SOjGtEr2j65ZKO15dKJoon9N9iWm7JAT+gGCj5eei2hLLM2M0+8UC7DiyPv3ZXFd+mmgLO55QHHgNbj6qDh5g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(3023799007)(22082099003)(18002099003)(6133799003)(5023799004)(56012099006)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wf/H9WxKjT2PWVx2XHDh9EnNvP5sZy/obNP/DiqzLpcIX9GeTPtfTE6fhLPf?=
 =?us-ascii?Q?nNXq5w4S1Qx93lDB1A4rOLJZ1FdLmtgO7aVrl4I+RnK8HgtwUr5OmKHUgcO+?=
 =?us-ascii?Q?bCmCrruo5zt4aSYSJrz/z1O87dTkuoxAHpvhAVld/o72V+hTuB1kZXsaCbgt?=
 =?us-ascii?Q?he6VxeSAK8UZNgI2CcLJTnfG4769NAgnnI8m4/UwqU74WauTUG696s0ZaHdu?=
 =?us-ascii?Q?rScksPcp30r4BTftxZMeq3ByjeQiGu7IFoPnPi1iwCMa8zfhWM+nyOftHnJ3?=
 =?us-ascii?Q?Z6T8zRIamMVvOVmp5OoQ8xA+TUzuzDmwavlYb1DI0wK27DF3H5ag6JYO9UYK?=
 =?us-ascii?Q?w35FY52IWPIxyWlfSINuEnf0ZrJCJdKBfFUXFsdmkxNIUFXQVffjG5OrE4tr?=
 =?us-ascii?Q?015q6Nme5aHDXuSiy/0jGttPS9p8ln1e4LXnvKuu+bPjWjaTCTdEVZKwfuU2?=
 =?us-ascii?Q?XBf5Tk/CaTSTsjEvhJpF8YDjik5v2mRA/HKPF0JD3+dCL2OUnjR0ZwpIIMgP?=
 =?us-ascii?Q?Hg0djKIiDYf3wuLVR0Nmdc77rlMXlZJaX8lXdjHR3Ttn67zqZ9ab6c95LG80?=
 =?us-ascii?Q?L8/e0XObTeFmh4nxfloBF+QbkavQ/FQDLC0BYLKv6GHBADVT8oqEEpnjkN6a?=
 =?us-ascii?Q?GTTvmCnPwPwqM8UZXLoNJH6d5C99Lv1hcCpbT1h3c5VOOQ+SuYIspz4dokjW?=
 =?us-ascii?Q?yIPVIUzQex2KyqAELSegD7IfwswxNgzRrxvIWNy32FlqjW+BDekWFTUvrtsg?=
 =?us-ascii?Q?/pVNY3UDeydU2y5SK3DZRwfWJI5E1kRhtKZeMY5nnH4ID4Z/13rNjE96yFJa?=
 =?us-ascii?Q?tu86tBbB6FepJFdFYpFegQzQ7S7Mku6npGOf5y1IOL7Y8iccsUB/8zfUcNWA?=
 =?us-ascii?Q?Ti/yifVlJmH9RjZ6lFRYrbII6vsA4ZBM6QJmbjPxsW8JqtqcB3R0m1LU1eSV?=
 =?us-ascii?Q?8JPKyg7int2xGOhVtdajMduaptWXjVyG0ALwk1clkNGeZKQjito+KP/aOeyQ?=
 =?us-ascii?Q?KR9tkEytU3I38EF8yemyQrxlJWIUvKZLDVoHErg6CrpLNqe1NIxu23UzxlJr?=
 =?us-ascii?Q?pb7F1V+IahtY02s7Mae0P3ouQPRFOk2vlXMtMO7ZUfZS10VIPkwPKEozAKJm?=
 =?us-ascii?Q?AytOcUC6tTcupqsNQwIlLEJx9rLEV5lRadYxhkTWwA7rLvelyjXoHCqYD+uz?=
 =?us-ascii?Q?+/wgY1oPbJ0mT/n1c+0xdX9B4EuC7PM4ELgLkEOSgYWMSWwqlYmiWnfpxEum?=
 =?us-ascii?Q?GeqCIGIqyhl55/J8myNJyjF6HT1QQdIBsZ/kH+CRH4Kz0uCtm1HAfrSEQPFi?=
 =?us-ascii?Q?Gmnl/S72R5blEWg8icu2Bgkv4zwP7TMrIxekgAU2VK076GomDBPlJwVmzJB1?=
 =?us-ascii?Q?dAqweXOwHlnNUQnEMkNwdmXSNcyG3UyRv9nTxjDHEu4eKW55ZXj0Uf8Zpr6k?=
 =?us-ascii?Q?DfX3exrkWnjdC555X6sEMaIFdqg7EavVcfMSZTO1eVqzcJo2BnULUZnmFsVj?=
 =?us-ascii?Q?a8gxhDJsUckCOiFmCQ0KMVP+5xAMxz2WOp76+GtSJWAO3QZf4+kiMX7m+OFN?=
 =?us-ascii?Q?3PMmwt4UsHHtv6ea9F3dtemcYVDnsw8ppDLbRivvFf46MGwiJSmOkZnE2zt7?=
 =?us-ascii?Q?t8t/3OS7QpSU8DGbEWFo/Cbi0lq0an/ALF1//cvo+72NNYmNUE7jnTEhpdds?=
 =?us-ascii?Q?siin/+KZJSPJRN0ijnvlEwqBvgKSigJI56UtCBBi4LidTsEfob+Fne47e2Lh?=
 =?us-ascii?Q?JrbugCGlr3QM8DfadKZ6fOWeNGCnC10/48SdYRsFJpFgSRvrEqDG?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a3dfa19-31dc-414d-72de-08dec1348555
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 05:54:05.5098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XTVPdiK9TWThqkGfDE+ELuvEDHIg/tS4BnNQnTHvkVko8Czi0IXizeC16C5+vp2L/sR3M8LxuB74M6/FKduXIdB/NpAI8laUG8IWMoOz7cb6iGs5mll4DFTAmphup7sz
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
	TAGGED_FROM(0.00)[bounces-37873-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[starfivetech.com:mid,starfivetech.com:from_mime,starfivetech.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6B1CB634953

Add pinctrl driver for StarFive JHB100 SoC System-0(sys0) pinctrl
controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 MAINTAINERS                                   |    9 +
 drivers/pinctrl/starfive/Kconfig              |   19 +
 drivers/pinctrl/starfive/Makefile             |    3 +
 .../starfive/pinctrl-starfive-jhb100-sys0.c   |  123 ++
 .../starfive/pinctrl-starfive-jhb100.c        | 1607 +++++++++++++++++
 .../starfive/pinctrl-starfive-jhb100.h        |  152 ++
 6 files changed, 1913 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 47e4b368347f..f56721b4cbd1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25607,6 +25607,15 @@ S:	Supported
 F:	Documentation/devicetree/bindings/interrupt-controller/starfive,jhb100-intc.yaml
 F:	drivers/irqchip/irq-starfive-jhb100-intc.c
 
+STARFIVE JHB100 PINCTRL DRIVERS
+M:	Changhuang Liang <changhuang.liang@starfivetech.com>
+M:	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
+L:	linux-gpio@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/pinctrl/starfive,jhb1*.yaml
+F:	drivers/pinctrl/starfive/pinctrl-starfive-jhb1*
+F:	include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
+
 STARFIVE JHB100 RESET CONTROLLER DRIVERS
 M:	Changhuang Liang <changhuang.liang@starfivetech.com>
 S:	Maintained
diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index a9a7cb101684..548a1b133f81 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -47,3 +47,22 @@ config PINCTRL_STARFIVE_JH7110_AON
 	  This also provides an interface to the GPIO pins not used by other
 	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
 	  and interrupts on input changes.
+
+config PINCTRL_STARFIVE_JHB100
+	bool
+	select GENERIC_PINCTRL
+	select GPIOLIB
+	select GPIOLIB_IRQCHIP
+	select OF_GPIO
+
+config PINCTRL_STARFIVE_JHB100_SYS0
+	tristate "StarFive JHB100 SoC System-0 pinctrl and GPIO driver"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	depends on OF
+	select PINCTRL_STARFIVE_JHB100
+	default ARCH_STARFIVE
+	help
+	  Say yes here to support system-0 pin control on the StarFive JHB100 SoC.
+	  This also provides an interface to the GPIO pins not used by other
+	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
+	  and interrupts on input changes.
diff --git a/drivers/pinctrl/starfive/Makefile b/drivers/pinctrl/starfive/Makefile
index ee0d32d085cb..c0d368f413bc 100644
--- a/drivers/pinctrl/starfive/Makefile
+++ b/drivers/pinctrl/starfive/Makefile
@@ -5,3 +5,6 @@ obj-$(CONFIG_PINCTRL_STARFIVE_JH7100)	+= pinctrl-starfive-jh7100.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JH7110)		+= pinctrl-starfive-jh7110.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JH7110_SYS)	+= pinctrl-starfive-jh7110-sys.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JH7110_AON)	+= pinctrl-starfive-jh7110-aon.o
+
+obj-$(CONFIG_PINCTRL_STARFIVE_JHB100)		+= pinctrl-starfive-jhb100.o
+obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0)	+= pinctrl-starfive-jhb100-sys0.o
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0.c
new file mode 100644
index 000000000000..d86a82eb5e05
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0.c
@@ -0,0 +1,123 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC System-0 domain
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
+static const struct jhb100_pin_layout_desc jhb100_sys0_pl_desc[] = {
+	{ .pin_start = 0, .pin_cnt = 3, .name = "gpio", .gpio_func_sel = 0, },
+	{ .pin_start = 3, .pin_cnt = 1, .name = "bmcpcierp_pe2rst_out", .gpio_func_sel = 1, },
+	{ .pin_start = 4, .pin_cnt = 1, .name = "testen", .gpio_func_sel = -1, },
+	{ .pin_start = 5, .pin_cnt = 1, .name = "syspok_in", .gpio_func_sel = -1, },
+	{ .pin_start = 6, .pin_cnt = 1, .name = "sysrstn_in", .gpio_func_sel = -1, },
+	{ .pin_start = 7, .pin_cnt = 1, .name = "perstn0_in", .gpio_func_sel = -1, },
+	{ .pin_start = 8, .pin_cnt = 1, .name = "perstn1_in", .gpio_func_sel = -1, },
+	{ .pin_start = 9, .pin_cnt = 1, .name = "aprstn_out", .gpio_func_sel = -1, },
+	{ .pin_start = 10, .pin_cnt = 1, .name = "pcierp_wake", .gpio_func_sel = -1, },
+	{ 0xff },
+};
+
+static struct config_reg_layout_desc jhb100_sys0_pinctrl_crl_desc[] = {
+	{
+		.pin_start			= 0,
+		.pin_cnt			= 4,
+		.drive_strength_2bit		= { .shift = 0, .width = 2 },
+		.input_enable			= { .shift = 2, .width = 1 },
+		.pull_down			= { .shift = 3, .width = 1 },
+		.pull_up			= { .shift = 4, .width = 1 },
+		.slew_rate			= { .shift = 5, .width = 1 },
+		.schmitt_trigger_select		= { .shift = 6, .width = 1 },
+		.reserved			= { .shift = 7, .width = 8 },
+		.debounce_width			= { .shift = 15, .width = 17 },
+	},
+	{
+		.pin_start			= 4,
+		.pin_cnt			= 5,
+		.schmitt_trigger_select		= { .shift = 0, .width = 1 },
+		.reserved			= { .shift = 1, .width = 31 },
+	},
+	{
+		.pin_start			= 9,
+		.pin_cnt			= 1,
+		.drive_strength_2bit		= { .shift = 0, .width = 2 },
+		.slew_rate			= { .shift = 2, .width = 1 },
+		.reserved			= { .shift = 3, .width = 29 },
+	},
+	{
+		.pin_start			= 10,
+		.pin_cnt			= 1,
+		.drive_strength_2bit		= { .shift = 0, .width = 2 },
+		.input_enable			= { .shift = 2, .width = 1 },
+		.pull_down			= { .shift = 3, .width = 1 },
+		.pull_up			= { .shift = 4, .width = 1 },
+		.slew_rate			= { .shift = 5, .width = 1 },
+		.schmitt_trigger_select		= { .shift = 6, .width = 1 },
+		.reserved			= { .shift = 7, .width = 25 },
+	},
+	{ 0xff },
+};
+
+struct starfive_pinctrl_regs jhb100_sys0_pinctrl_regs = {
+	.func_sel		= { .reg = 0x44, .width_per_pin = 2 },
+	.config			= 0x0c,
+	.output			= 0x38,
+	.output_en		= 0x3c,
+	.gpio_status		= 0x40,
+	.irq_en			= 0x48,
+	.irq_status		= 0x4c,
+	.irq_clr		= 0x50,
+	.irq_trigger		= 0x54,
+	.irq_level		= 0x58,
+	.irq_both_edge		= 0x5c,
+	.irq_edge		= 0x60,
+};
+
+static const struct jhb100_pinctrl_func_maps jhb100_func_maps_sys0[] = {
+	{ .func = "auxpwrgood",		.val = 1 },
+	{ .func = "gpio",		.val = 0,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_PER3_GPIO_E2) },
+	{ .func = "gpio",		.val = 1,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_PER3_GPIO_E3) },
+	{ .func = "hbled",		.val = 1 },
+	{ .func = "pe2rst_out",		.val = 0 },
+};
+
+static const struct jhb100_pinctrl_domain_info jhb100_sys0_pinctrl_info = {
+	.name			= "jhb100-sys0",
+	.pl_desc		= jhb100_sys0_pl_desc,
+	.crl_desc		= jhb100_sys0_pinctrl_crl_desc,
+	.regs			= &jhb100_sys0_pinctrl_regs,
+	.fmaps			= jhb100_func_maps_sys0,
+	.num_maps		= ARRAY_SIZE(jhb100_func_maps_sys0),
+};
+
+static const struct of_device_id jhb100_sys0_pinctrl_of_match[] = {
+	{
+		.compatible = "starfive,jhb100-sys0-pinctrl",
+		.data = &jhb100_sys0_pinctrl_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jhb100_sys0_pinctrl_of_match);
+
+static struct platform_driver jhb100_sys0_pinctrl_driver = {
+	.probe = jhb100_pinctrl_probe,
+	.driver = {
+		.name = "starfive-jhb100-sys0-pinctrl",
+		.of_match_table = jhb100_sys0_pinctrl_of_match,
+	},
+};
+module_platform_driver(jhb100_sys0_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for StarFive JHB100 SoC System-0 domain");
+MODULE_AUTHOR("Alex Soo <yuklin.soo@starfivetech.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c
new file mode 100644
index 000000000000..52b97870b991
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c
@@ -0,0 +1,1607 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC
+ *
+ * Copyright (C) 2024 StarFive Technology Co., Ltd.
+ * Author: Alex Soo <yuklin.soo@starfivetech.com>
+ *
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/gpio/driver.h>
+#include <linux/io.h>
+#include <linux/irq.h>
+#include <linux/minmax.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+#include <linux/seq_file.h>
+#include <linux/spinlock.h>
+#include <linux/string.h>
+#include <linux/sort.h>
+
+#include <linux/pinctrl/consumer.h>
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+
+#include "../core.h"
+#include "../pinconf.h"
+#include "../pinctrl-utils.h"
+#include "../pinmux.h"
+#include "pinctrl-starfive-jhb100.h"
+
+#define GPOUT_LOW				0
+#define GPOUT_HIGH				1
+
+#define GPOEN_ENABLE				0
+#define GPOEN_DISABLE				1
+
+#define JHB100_DEBOUNCE_WIDTH_STAGES_MAX	0x1FFFFU
+#define JHB100_DEBOUNCE_WIDTH_STAGE_NS		80
+
+/* mode select */
+#define JHB100_PUSH_PULL			0
+#define JHB100_OPEN_DRAIN			1
+#define JHB100_LEGACY_FAST_MODE_PLUS		2
+#define JHB100_LEGACY_FAST_MODE			3
+
+/* i2c open-drain pull-up select */
+#define JHB100_I2C_OPEN_DRAIN_PU_600_OHMS	0
+#define JHB100_I2C_OPEN_DRAIN_PU_900_OHMS	1
+#define JHB100_I2C_OPEN_DRAIN_PU_1200_OHMS	2
+#define JHB100_I2C_OPEN_DRAIN_PU_2000_OHMS	3
+
+#define JHB100_NR_GPIOS_PER_BANK		32
+
+struct field_info {
+	const char *name;
+	unsigned int shift;
+	unsigned int width;
+	unsigned int end;
+};
+
+static int jhb100_map_get_func_val(struct jhb100_pinctrl *sfp, const char *function,
+				   unsigned int pin)
+{
+	const struct jhb100_pinctrl_func_maps *fmaps = sfp->info->fmaps;
+	size_t num = sfp->info->num_maps;
+
+	for (int i = 0; i < num; i++) {
+		if (!strcmp(function, fmaps[i].func)) {
+			if (!fmaps[i].max_pin)
+				return fmaps[i].val;
+
+			if (pin < fmaps[i].max_pin)
+				return fmaps[i].val;
+
+			continue;
+		}
+	}
+
+	return -EINVAL;
+}
+
+static struct config_reg_layout_desc *get_crl_desc_by_pin(struct jhb100_pinctrl *sfp,
+							  unsigned int pin)
+{
+	struct config_reg_layout_desc *crl_desc = sfp->info->crl_desc;
+	unsigned int i = 0;
+
+	do {
+		if (pin >= crl_desc[i].pin_start &&
+		    pin < crl_desc[i].pin_start + crl_desc[i].pin_cnt)
+			return &crl_desc[i];
+	} while (crl_desc[i++].pin_start != 0xff);
+
+	return NULL;
+}
+
+static inline struct jhb100_gpio_bank *jhb100_gc_to_bank(struct gpio_chip *gc)
+{
+	return container_of(gc, struct jhb100_gpio_bank, gc);
+}
+
+static unsigned int jhb100_gpio_to_pin(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct jhb100_gpio_bank *bank = jhb100_gc_to_bank(gc);
+
+	return bank->id * JHB100_NR_GPIOS_PER_BANK + gpio;
+}
+
+static const struct pinctrl_ops jhb100_pinctrl_ops = {
+	.get_groups_count = pinctrl_generic_get_group_count,
+	.get_group_name	  = pinctrl_generic_get_group_name,
+	.get_group_pins   = pinctrl_generic_get_group_pins,
+	.dt_node_to_map	  = pinctrl_generic_pins_function_dt_node_to_map,
+	.dt_free_map	  = pinctrl_utils_free_map,
+};
+
+static void jhb100_set_gpioval(struct jhb100_pinctrl *sfp, unsigned int pin,
+			       unsigned int val)
+{
+	const struct jhb100_pinctrl_domain_info *info = sfp->info;
+	unsigned int offset = 4 * (pin / 32);
+	unsigned int shift = 1 * (pin % 32);
+	unsigned int fs_offset = 4 * (pin / 16);
+	unsigned int fs_shift = 2 * (pin % 16);
+	u32 func_sel_mask;
+	u32 dout, doen, fs;
+	void __iomem *reg_gpio_o;
+	void __iomem *reg_gpio_oen;
+	void __iomem *reg_gpio_func_sel;
+	unsigned long flags;
+
+	reg_gpio_o = sfp->base + info->regs->output + offset;
+	reg_gpio_oen = sfp->base + info->regs->output_en + offset;
+	reg_gpio_func_sel = sfp->base + info->regs->func_sel.reg + fs_offset;
+
+	func_sel_mask = GENMASK(info->regs->func_sel.width_per_pin - 1, 0) << fs_shift;
+	dout = val << shift;
+	doen = 0;
+
+	raw_spin_lock_irqsave(&sfp->lock, flags);
+	fs = readl_relaxed(reg_gpio_func_sel);
+	if (fs & func_sel_mask) {
+		fs &= ~func_sel_mask;
+		writel_relaxed(fs, reg_gpio_func_sel);
+	}
+	dout |= readl_relaxed(reg_gpio_o) & ~BIT(shift);
+	writel_relaxed(dout, reg_gpio_o);
+	doen |= readl_relaxed(reg_gpio_oen) & ~BIT(shift);
+	writel_relaxed(doen, reg_gpio_oen);
+	raw_spin_unlock_irqrestore(&sfp->lock, flags);
+}
+
+static void jhb100_set_function(struct jhb100_pinctrl *sfp,
+				unsigned int pin, u8 func)
+{
+	struct starfive_pinctrl_regs *pinctrl_regs = sfp->info->regs;
+	void __iomem *func_sel_reg;
+	unsigned long flags;
+	u32 func_sel_mask;
+	u32 func_sel_val;
+	unsigned int offset = 4 * (pin / (32 / pinctrl_regs->func_sel.width_per_pin));
+	unsigned int shift = pinctrl_regs->func_sel.width_per_pin *
+			     (pin % (32 / pinctrl_regs->func_sel.width_per_pin));
+
+	if (!pinctrl_regs->func_sel.reg || !pinctrl_regs->func_sel.width_per_pin)
+		return;
+
+	func_sel_reg = sfp->base + pinctrl_regs->func_sel.reg + offset;
+	func_sel_mask = GENMASK(pinctrl_regs->func_sel.width_per_pin - 1, 0) << shift;
+	func_sel_val = func << shift;
+
+	raw_spin_lock_irqsave(&sfp->lock, flags);
+	func_sel_val |= readl_relaxed(func_sel_reg) & ~func_sel_mask;
+	writel_relaxed(func_sel_val, func_sel_reg);
+	raw_spin_unlock_irqrestore(&sfp->lock, flags);
+}
+
+static int jhb100_set_one_pin_mux(struct jhb100_pinctrl *sfp,
+				  unsigned int pin,
+				  u8 func,
+				  int val)
+{
+	const struct pinctrl_pin_desc *desc = &sfp->pins[pin];
+	struct device *dev = sfp->dev;
+	s8 gpio_func_sel =  sfp->gpio_func_sel_arr[pin];
+
+	jhb100_set_function(sfp, pin, func);
+
+	if (pin < sfp->ngpios && (val == 0 || val == 1)) {
+		if (func == gpio_func_sel)
+			jhb100_set_gpioval(sfp, pin, val);
+		else
+			dev_err(dev, "pin (%s) is not a GPIO. func=%d/%d\n",
+				desc->name, func, gpio_func_sel);
+	}
+
+	return 0;
+}
+
+static int jhb100_set_mux(struct pinctrl_dev *pctldev,
+			  unsigned int fsel, unsigned int gsel)
+{
+	struct jhb100_pinctrl *sfp = pinctrl_dev_get_drvdata(pctldev);
+	const struct group_desc *group;
+	unsigned int i;
+	const char **functions;
+
+	group = pinctrl_generic_get_group(pctldev, gsel);
+	if (!group)
+		return -EINVAL;
+
+	functions = group->data;
+
+	for (i = 0; i < group->grp.npins; i++) {
+		int function;
+
+		function = jhb100_map_get_func_val(sfp, functions[i], group->grp.pins[i]);
+		if (function < 0) {
+			dev_err(pctldev->dev, "invalid function %s\n", functions[i]);
+			return function;
+		}
+
+		jhb100_set_one_pin_mux(sfp, group->grp.pins[i], function, -1);
+	}
+
+	return 0;
+}
+
+static const struct pinmux_ops jhb100_pinmux_ops = {
+	.get_functions_count = pinmux_generic_get_function_count,
+	.get_function_name   = pinmux_generic_get_function_name,
+	.get_function_groups = pinmux_generic_get_function_groups,
+	.set_mux             = jhb100_set_mux,
+};
+
+static const u8 jhb100_drive_strength_ma[4] = { 2, 4, 8, 12 };
+
+static const u8 jhb100_drive_strength_ma_3bit[8] = { 2, 5, 8, 10, 14, 16, 18, 20 };
+
+static u32 jhb100_padcfg_ds_to_mA(u32 padcfg)
+{
+	return jhb100_drive_strength_ma[padcfg];
+}
+
+static u32 jhb100_padcfg_ds_to_mA_3bit(u32 padcfg)
+{
+	return jhb100_drive_strength_ma_3bit[padcfg];
+}
+
+static u32 jhb100_padcfg_ds_to_uA(u32 padcfg)
+{
+	return (jhb100_drive_strength_ma[padcfg] * 1000);
+}
+
+static u32 jhb100_padcfg_ds_to_uA_3bit(u32 padcfg)
+{
+	return (jhb100_drive_strength_ma_3bit[padcfg] * 1000);
+}
+
+static u32 jhb100_padcfg_ds_from_mA(u32 v)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(jhb100_drive_strength_ma); i++) {
+		if (v <= jhb100_drive_strength_ma[i])
+			break;
+	}
+	return i;
+}
+
+static u32 jhb100_padcfg_ds_from_mA_3bit(u32 v)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(jhb100_drive_strength_ma_3bit); i++) {
+		if (v <= jhb100_drive_strength_ma_3bit[i])
+			break;
+	}
+	return i;
+}
+
+static u32 jhb100_padcfg_ds_from_uA(u32 v)
+{
+	/* Convert from uA to mA */
+	v /= 1000;
+
+	return jhb100_padcfg_ds_from_mA(v);
+}
+
+static u32 jhb100_padcfg_ds_from_uA_3bit(u32 v)
+{
+	/* Convert from uA to mA */
+	v /= 1000;
+
+	return jhb100_padcfg_ds_from_mA_3bit(v);
+}
+
+static void jhb100_padcfg_rmw(struct jhb100_pinctrl *sfp,
+			      unsigned int pin, u32 mask, u32 value)
+{
+	void __iomem *reg;
+	unsigned int offset;
+	unsigned long flags;
+	int padcfg_base;
+
+	padcfg_base = sfp->info->regs->config;
+
+	offset = 4 * pin;
+
+	reg = sfp->base + padcfg_base + offset;
+
+	value &= mask;
+	raw_spin_lock_irqsave(&sfp->lock, flags);
+	value |= readl_relaxed(reg) & ~mask;
+	writel_relaxed(value, reg);
+	raw_spin_unlock_irqrestore(&sfp->lock, flags);
+}
+
+static int jhb100_pincfg_pin_vref_get(struct jhb100_pinctrl *sfp, unsigned int pin)
+{
+	struct pinvref_reg *vref = &sfp->info->regs->vref;
+	u32 grp = 0, i;
+
+	while (grp < vref->num_pv) {
+		for (i = 0; i < vref->pv_desc[grp].num_pins; i++) {
+			if (pin != vref->pv_desc[grp].pin_grp[i])
+				continue;
+
+			return readl(sfp->base + vref->reg + grp * 4);
+		}
+
+		grp++;
+	}
+
+	return -ENOTSUPP;
+}
+
+static void jhb100_pincfg_pin_vref_set(struct jhb100_pinctrl *sfp, unsigned int pin,
+				       u32 arg)
+{
+	struct pinvref_reg *vref = &sfp->info->regs->vref;
+	u32 grp = 0, i;
+
+	while (grp < vref->num_pv) {
+		for (i = 0; i < vref->pv_desc[grp].num_pins; i++) {
+			if (pin != vref->pv_desc[grp].pin_grp[i])
+				continue;
+
+			if (!(vref->pv_desc[grp].range & BIT(arg)))
+				return;
+
+			writel(arg, sfp->base + vref->reg + grp * 4);
+			return;
+		}
+
+		grp++;
+	}
+}
+
+static int jhb100_pinconf_get(struct pinctrl_dev *pctldev,
+			      unsigned int pin, unsigned long *config)
+{
+	struct jhb100_pinctrl *sfp = pinctrl_dev_get_drvdata(pctldev);
+	int param = pinconf_to_config_param(*config);
+	struct device *dev = sfp->dev;
+	struct config_reg_layout_desc *crl_desc;
+	unsigned int offset;
+	u32 padcfg, arg;
+	bool enabled;
+	int padcfg_base;
+
+	padcfg_base = sfp->info->regs->config;
+	offset = 4 * pin;
+
+	if (pin >= sfp->npins)
+		return -EINVAL;
+
+	padcfg = readl_relaxed(sfp->base + padcfg_base + offset);
+
+	crl_desc = get_crl_desc_by_pin(sfp, pin);
+	if (!crl_desc) {
+		dev_err(dev, "pin %d can't not found reg layout descriptor\n", pin);
+		return -EINVAL;
+	}
+
+	switch (param) {
+	case PIN_CONFIG_BIAS_DISABLE:
+		arg = 0;
+
+		if (!RL_DESC_SUPPORTED(crl_desc, pull_down) ||
+		    !RL_DESC_SUPPORTED(crl_desc, pull_up))
+			return -ENOTSUPP;
+
+		enabled = !(padcfg & (RL_DESC_GENMASK(crl_desc, pull_down) |
+				      RL_DESC_GENMASK(crl_desc, pull_up)));
+		break;
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		arg = 1;
+
+		if (!RL_DESC_SUPPORTED(crl_desc, pull_down))
+			return -ENOTSUPP;
+
+		enabled = (padcfg & RL_DESC_GENMASK(crl_desc, pull_down))
+			  >> RL_DESC_SHIFT(crl_desc, pull_down);
+		break;
+	case PIN_CONFIG_BIAS_PULL_UP:
+		enabled = false;
+
+		if (!RL_DESC_SUPPORTED(crl_desc, pull_up) ||
+		    !RL_DESC_SUPPORTED(crl_desc, open_drain_pull_up_sel))
+			return -ENOTSUPP;
+
+		if (RL_DESC_SUPPORTED(crl_desc, pull_up)) {
+			arg = (padcfg & RL_DESC_GENMASK(crl_desc, pull_up)) >>
+			      RL_DESC_SHIFT(crl_desc, pull_up);
+
+			enabled = arg ? true : false;
+		}
+
+		if (!enabled && RL_DESC_SUPPORTED(crl_desc, open_drain_pull_up_sel)) {
+			enabled = true;
+
+			arg = (padcfg & RL_DESC_GENMASK(crl_desc, open_drain_pull_up_sel)) >>
+			      RL_DESC_SHIFT(crl_desc, open_drain_pull_up_sel);
+
+			if (arg == JHB100_I2C_OPEN_DRAIN_PU_600_OHMS)
+				arg = 600;
+			else if (arg == JHB100_I2C_OPEN_DRAIN_PU_900_OHMS)
+				arg = 900;
+			else if (arg == JHB100_I2C_OPEN_DRAIN_PU_1200_OHMS)
+				arg = 1200;
+			else if (arg == JHB100_I2C_OPEN_DRAIN_PU_2000_OHMS)
+				arg = 2000;
+			else
+				return -ENOTSUPP;
+		}
+
+		break;
+	case PIN_CONFIG_DRIVE_STRENGTH:
+		enabled = true;
+
+		if (RL_DESC_SUPPORTED(crl_desc, drive_strength_2bit)) {
+			arg = (padcfg & RL_DESC_GENMASK(crl_desc, drive_strength_2bit)) >>
+			      RL_DESC_SHIFT(crl_desc, drive_strength_2bit);
+			arg = jhb100_padcfg_ds_to_mA(arg);
+		} else if (RL_DESC_SUPPORTED(crl_desc, drive_strength_3bit)) {
+			arg = (padcfg & RL_DESC_GENMASK(crl_desc, drive_strength_3bit)) >>
+			      RL_DESC_SHIFT(crl_desc, drive_strength_3bit);
+			arg = jhb100_padcfg_ds_to_mA_3bit(arg);
+		} else {
+			return -ENOTSUPP;
+		}
+		break;
+	case PIN_CONFIG_DRIVE_STRENGTH_UA:
+		enabled = true;
+
+		if (RL_DESC_SUPPORTED(crl_desc, drive_strength_2bit)) {
+			arg = (padcfg & RL_DESC_GENMASK(crl_desc, drive_strength_2bit)) >>
+			      RL_DESC_SHIFT(crl_desc, drive_strength_2bit);
+			arg = jhb100_padcfg_ds_to_uA(arg);
+		} else if (RL_DESC_SUPPORTED(crl_desc, drive_strength_3bit)) {
+			arg = (padcfg & RL_DESC_GENMASK(crl_desc, drive_strength_3bit)) >>
+			      RL_DESC_SHIFT(crl_desc, drive_strength_3bit);
+			arg = jhb100_padcfg_ds_to_uA_3bit(arg);
+		} else {
+			return -ENOTSUPP;
+		}
+		break;
+	case PIN_CONFIG_INPUT_ENABLE:
+		if (!RL_DESC_SUPPORTED(crl_desc, input_enable))
+			return -ENOTSUPP;
+
+		enabled = (padcfg & RL_DESC_GENMASK(crl_desc, input_enable))
+			   >> RL_DESC_SHIFT(crl_desc, input_enable);
+		arg = enabled;
+		break;
+	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+		if (!RL_DESC_SUPPORTED(crl_desc, schmitt_trigger_select))
+			return -ENOTSUPP;
+
+		enabled = (padcfg & RL_DESC_GENMASK(crl_desc, schmitt_trigger_select))
+			   >> RL_DESC_SHIFT(crl_desc, schmitt_trigger_select);
+		arg = enabled;
+		break;
+	case PIN_CONFIG_SLEW_RATE:
+		enabled = true;
+
+		if (RL_DESC_SUPPORTED(crl_desc, slew_rate)) {
+			arg = (padcfg & RL_DESC_GENMASK(crl_desc, slew_rate)) >>
+			      RL_DESC_SHIFT(crl_desc, slew_rate);
+		} else if (RL_DESC_SUPPORTED(crl_desc, mode_select)) {
+			arg = (padcfg & RL_DESC_GENMASK(crl_desc, mode_select)) >>
+			      RL_DESC_SHIFT(crl_desc, mode_select);
+
+			if (arg == JHB100_LEGACY_FAST_MODE_PLUS)
+				arg = 1;
+			else if (arg == JHB100_LEGACY_FAST_MODE)
+				arg = 0;
+			else
+				return -ENOTSUPP;
+		} else {
+			return -ENOTSUPP;
+		}
+		break;
+	case PIN_CONFIG_DRIVE_PUSH_PULL:
+		if (!RL_DESC_SUPPORTED(crl_desc, mode_select))
+			return -ENOTSUPP;
+
+		arg = (padcfg & RL_DESC_GENMASK(crl_desc, mode_select)) >>
+		      RL_DESC_SHIFT(crl_desc, mode_select);
+
+		if (arg == JHB100_PUSH_PULL)
+			enabled = true;
+
+		break;
+	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+		if (!RL_DESC_SUPPORTED(crl_desc, mode_select))
+			return -ENOTSUPP;
+
+		arg = (padcfg & RL_DESC_GENMASK(crl_desc, mode_select)) >>
+		      RL_DESC_SHIFT(crl_desc, mode_select);
+
+		if (arg == JHB100_OPEN_DRAIN)
+			enabled = true;
+
+		break;
+	case PIN_CONFIG_INPUT_DEBOUNCE_NS:
+		enabled = true;
+
+		if (!RL_DESC_SUPPORTED(crl_desc, debounce_width))
+			return -ENOTSUPP;
+
+		arg = (padcfg & RL_DESC_GENMASK(crl_desc, debounce_width)) >>
+		      RL_DESC_SHIFT(crl_desc, debounce_width);
+
+		arg *= JHB100_DEBOUNCE_WIDTH_STAGE_NS;
+
+		break;
+	case PIN_CONFIG_POWER_SOURCE:
+		if (!sfp->info->regs->vref.num_pv && !RL_DESC_SUPPORTED(crl_desc, vsel))
+			return -ENOTSUPP;
+
+		enabled = true;
+
+		if (sfp->info->regs->vref.num_pv) {
+			int ret;
+
+			ret = jhb100_pincfg_pin_vref_get(sfp, pin);
+			if (ret < 0)
+				return ret;
+
+			arg = ret;
+		} else if (RL_DESC_SUPPORTED(crl_desc, vsel)) {
+			arg = (padcfg & RL_DESC_GENMASK(crl_desc, vsel)) >>
+			      RL_DESC_SHIFT(crl_desc, vsel);
+		} else {
+			return -ENOTSUPP;
+		}
+		break;
+	default:
+		return -ENOTSUPP;
+	}
+
+	*config = pinconf_to_config_packed(param, arg);
+	return enabled ? 0 : -EINVAL;
+}
+
+static int jhb100_pinconf_set(struct pinctrl_dev *pctldev,
+			      unsigned int pin, unsigned long *configs,
+			      unsigned int num_configs)
+{
+	struct jhb100_pinctrl *sfp = pinctrl_dev_get_drvdata(pctldev);
+	struct device *dev = sfp->dev;
+	struct config_reg_layout_desc *crl_desc;
+	bool vref_set = false;
+	u32 value = 0;
+	u32 mask = 0;
+	u32 vref = 0;
+	int i;
+
+	crl_desc = get_crl_desc_by_pin(sfp, pin);
+	if (!crl_desc) {
+		dev_err(dev, "pin %d can't not found reg layout descriptor\n", pin);
+		return -EINVAL;
+	}
+
+	for (i = 0; i < num_configs; i++) {
+		int param = pinconf_to_config_param(configs[i]);
+		u32 arg = pinconf_to_config_argument(configs[i]);
+
+		switch (param) {
+		case PIN_CONFIG_BIAS_DISABLE:
+			if (!RL_DESC_SUPPORTED(crl_desc, pull_down) ||
+			    !RL_DESC_SUPPORTED(crl_desc, pull_up))
+				return -ENOTSUPP;
+
+			mask |= RL_DESC_GENMASK(crl_desc, pull_down) |
+				RL_DESC_GENMASK(crl_desc, pull_up);
+			value &= ~(RL_DESC_GENMASK(crl_desc, pull_down) |
+				   RL_DESC_GENMASK(crl_desc, pull_up));
+			break;
+		case PIN_CONFIG_BIAS_PULL_DOWN:
+			if (!arg || !RL_DESC_SUPPORTED(crl_desc, pull_down) ||
+			    !RL_DESC_SUPPORTED(crl_desc, pull_up))
+				return -ENOTSUPP;
+
+			mask |= RL_DESC_GENMASK(crl_desc, pull_down) |
+				RL_DESC_GENMASK(crl_desc, pull_up);
+			value &= ~(RL_DESC_GENMASK(crl_desc, pull_down) |
+				   RL_DESC_GENMASK(crl_desc, pull_up));
+			value |= RL_DESC_GENMASK(crl_desc, pull_down);
+			break;
+		case PIN_CONFIG_BIAS_PULL_UP:
+			if ((!arg || arg == 1) && RL_DESC_SUPPORTED(crl_desc, pull_up)) {
+				mask |= RL_DESC_GENMASK(crl_desc, pull_down) |
+					RL_DESC_GENMASK(crl_desc, pull_up);
+				value &= ~(RL_DESC_GENMASK(crl_desc, pull_down) |
+					RL_DESC_GENMASK(crl_desc, pull_up));
+				value |= RL_DESC_GENMASK(crl_desc, pull_up);
+			} else if (arg && RL_DESC_SUPPORTED(crl_desc, open_drain_pull_up_sel)) {
+				mask |= RL_DESC_GENMASK(crl_desc, open_drain_pull_up_sel);
+				value &= ~RL_DESC_GENMASK(crl_desc, open_drain_pull_up_sel);
+				switch (arg) {
+				case 600:
+					value |= JHB100_I2C_OPEN_DRAIN_PU_600_OHMS <<
+						RL_DESC_SHIFT(crl_desc, open_drain_pull_up_sel);
+					break;
+				case 900:
+					value |= JHB100_I2C_OPEN_DRAIN_PU_900_OHMS <<
+						RL_DESC_SHIFT(crl_desc, open_drain_pull_up_sel);
+					break;
+				case 1200:
+					value |= JHB100_I2C_OPEN_DRAIN_PU_1200_OHMS <<
+						RL_DESC_SHIFT(crl_desc, open_drain_pull_up_sel);
+					break;
+				case 2000:
+					value |= JHB100_I2C_OPEN_DRAIN_PU_2000_OHMS <<
+						RL_DESC_SHIFT(crl_desc, open_drain_pull_up_sel);
+					break;
+				default:
+					return -ENOTSUPP;
+				}
+			} else {
+				return -ENOTSUPP;
+			}
+			break;
+		case PIN_CONFIG_DRIVE_STRENGTH:
+			if (RL_DESC_SUPPORTED(crl_desc, drive_strength_2bit)) {
+				mask |= RL_DESC_GENMASK(crl_desc, drive_strength_2bit);
+				value &= ~RL_DESC_GENMASK(crl_desc, drive_strength_2bit);
+				value |= jhb100_padcfg_ds_from_mA(arg) <<
+					 RL_DESC_SHIFT(crl_desc, drive_strength_2bit);
+			} else if (RL_DESC_SUPPORTED(crl_desc, drive_strength_3bit)) {
+				mask |= RL_DESC_GENMASK(crl_desc, drive_strength_3bit);
+				value &= ~RL_DESC_GENMASK(crl_desc, drive_strength_3bit);
+				value |= jhb100_padcfg_ds_from_mA_3bit(arg) <<
+					 RL_DESC_SHIFT(crl_desc, drive_strength_3bit);
+			} else {
+				return -ENOTSUPP;
+			}
+			break;
+		case PIN_CONFIG_DRIVE_STRENGTH_UA:
+			if (RL_DESC_SUPPORTED(crl_desc, drive_strength_2bit)) {
+				mask |= RL_DESC_GENMASK(crl_desc, drive_strength_2bit);
+				value &= ~RL_DESC_GENMASK(crl_desc, drive_strength_2bit);
+				value |= jhb100_padcfg_ds_from_uA(arg) <<
+					 RL_DESC_SHIFT(crl_desc, drive_strength_2bit);
+			} else if (RL_DESC_SUPPORTED(crl_desc, drive_strength_3bit)) {
+				mask |= RL_DESC_GENMASK(crl_desc, drive_strength_3bit);
+				value &= ~RL_DESC_GENMASK(crl_desc, drive_strength_3bit);
+				value |= jhb100_padcfg_ds_from_uA_3bit(arg) <<
+					 RL_DESC_SHIFT(crl_desc, drive_strength_3bit);
+			} else {
+				return -ENOTSUPP;
+			}
+			break;
+		case PIN_CONFIG_INPUT_ENABLE:
+			if (!RL_DESC_SUPPORTED(crl_desc, input_enable))
+				return -ENOTSUPP;
+
+			mask |= RL_DESC_GENMASK(crl_desc, input_enable);
+			value = arg ? (value | RL_DESC_GENMASK(crl_desc, input_enable))
+				: value;
+			break;
+		case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
+			if (!RL_DESC_SUPPORTED(crl_desc, schmitt_trigger_select))
+				return -ENOTSUPP;
+
+			mask |= RL_DESC_GENMASK(crl_desc, schmitt_trigger_select);
+			value = arg
+				? (value | RL_DESC_GENMASK(crl_desc, schmitt_trigger_select))
+				: value;
+			break;
+		case PIN_CONFIG_SLEW_RATE:
+			if (RL_DESC_SUPPORTED(crl_desc, slew_rate)) {
+				mask |= RL_DESC_GENMASK(crl_desc, slew_rate);
+				value = arg ?
+					(value | RL_DESC_GENMASK(crl_desc, slew_rate)) :
+					value;
+			} else if (RL_DESC_SUPPORTED(crl_desc, mode_select)) {
+				mask |= RL_DESC_GENMASK(crl_desc, mode_select);
+				value &= ~RL_DESC_GENMASK(crl_desc, mode_select);
+				value |= arg ?
+					 JHB100_LEGACY_FAST_MODE_PLUS <<
+					 RL_DESC_SHIFT(crl_desc, mode_select) :
+					 JHB100_LEGACY_FAST_MODE <<
+					 RL_DESC_SHIFT(crl_desc, mode_select);
+			} else {
+				return -ENOTSUPP;
+			}
+			break;
+		case PIN_CONFIG_DRIVE_PUSH_PULL:
+			if (!RL_DESC_SUPPORTED(crl_desc, mode_select))
+				return -ENOTSUPP;
+
+			mask |= RL_DESC_GENMASK(crl_desc, mode_select);
+			value &= ~RL_DESC_GENMASK(crl_desc, mode_select);
+			value |= JHB100_PUSH_PULL <<
+				 RL_DESC_SHIFT(crl_desc, mode_select);
+			break;
+		case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+			if (!RL_DESC_SUPPORTED(crl_desc, mode_select))
+				return -ENOTSUPP;
+
+			mask |= RL_DESC_GENMASK(crl_desc, mode_select);
+			value &= ~RL_DESC_GENMASK(crl_desc, mode_select);
+			value |= JHB100_OPEN_DRAIN <<
+				 RL_DESC_SHIFT(crl_desc, mode_select);
+			break;
+		case PIN_CONFIG_INPUT_DEBOUNCE_NS:
+			u32 debounce_stage;
+
+			if (!RL_DESC_SUPPORTED(crl_desc, debounce_width))
+				return -ENOTSUPP;
+
+			mask |= RL_DESC_GENMASK(crl_desc, debounce_width);
+			value &= ~RL_DESC_GENMASK(crl_desc, debounce_width);
+
+			debounce_stage = arg ? arg / JHB100_DEBOUNCE_WIDTH_STAGE_NS : 0;
+			debounce_stage = umin(debounce_stage, JHB100_DEBOUNCE_WIDTH_STAGES_MAX);
+
+			value |= (debounce_stage << RL_DESC_SHIFT(crl_desc, debounce_width));
+
+			break;
+		case PIN_CONFIG_POWER_SOURCE:
+			if (!sfp->info->regs->vref.num_pv && !RL_DESC_SUPPORTED(crl_desc, vsel))
+				return -ENOTSUPP;
+
+			if (sfp->info->regs->vref.num_pv) {
+				vref_set = true;
+				vref = arg;
+			}
+
+			if (RL_DESC_SUPPORTED(crl_desc, vsel)) {
+				mask |= RL_DESC_GENMASK(crl_desc, vsel);
+				value &= ~RL_DESC_GENMASK(crl_desc, vsel);
+
+				value |= arg & BIT(0) ?
+					 1 << RL_DESC_SHIFT(crl_desc, vsel) :
+					 0;
+			}
+			break;
+		default:
+			return -ENOTSUPP;
+		}
+	}
+
+	jhb100_padcfg_rmw(sfp, pin, mask, value);
+
+	if (vref_set)
+		jhb100_pincfg_pin_vref_set(sfp, pin, vref);
+
+	return 0;
+}
+
+static int jhb100_pinconf_group_get(struct pinctrl_dev *pctldev,
+				    unsigned int gsel,
+				    unsigned long *config)
+{
+	const struct group_desc *group;
+
+	group = pinctrl_generic_get_group(pctldev, gsel);
+	if (!group)
+		return -EINVAL;
+
+	return jhb100_pinconf_get(pctldev, group->grp.pins[0], config);
+}
+
+static int jhb100_pinconf_group_set(struct pinctrl_dev *pctldev,
+				    unsigned int gsel,
+				    unsigned long *configs,
+				    unsigned int num_configs)
+{
+	const struct group_desc *group;
+	int ret;
+	u32 i;
+
+	group = pinctrl_generic_get_group(pctldev, gsel);
+	if (!group)
+		return -EINVAL;
+
+	for (i = 0; i < group->grp.npins; i++) {
+		ret = jhb100_pinconf_set(pctldev, group->grp.pins[i], configs, num_configs);
+		if (ret) {
+			dev_err(pctldev->dev, "failed to set config for pin %d\n",
+				group->grp.pins[i]);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static const struct pinconf_ops jhb100_pinconf_ops = {
+	.pin_config_get		= jhb100_pinconf_get,
+	.pin_config_set		= jhb100_pinconf_set,
+	.pin_config_group_get	= jhb100_pinconf_group_get,
+	.pin_config_group_set	= jhb100_pinconf_group_set,
+	.is_generic		= true,
+};
+
+static int jhb100_gpio_get_direction(struct gpio_chip *gc,
+				     unsigned int gpio)
+{
+	struct jhb100_gpio_bank *bank = jhb100_gc_to_bank(gc);
+	struct jhb100_pinctrl *sfp = gpiochip_get_data(gc);
+	const struct jhb100_pinctrl_domain_info *info = sfp->info;
+	unsigned int offset = 4 * bank->id;
+	u32 doen;
+	void __iomem *reg_gpio_oen;
+
+	reg_gpio_oen = sfp->base + info->regs->output_en + offset;
+
+	doen = (readl_relaxed(reg_gpio_oen) & BIT(gpio)) >> gpio;
+
+	return doen == GPOEN_ENABLE ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
+}
+
+static int jhb100_gpio_direction_input(struct gpio_chip *gc,
+				       unsigned int gpio)
+{
+	struct jhb100_pinctrl *sfp = gpiochip_get_data(gc);
+	struct device *dev = sfp->dev;
+	struct config_reg_layout_desc *crl_desc;
+	unsigned int pin = jhb100_gpio_to_pin(gc, gpio);
+
+	crl_desc = get_crl_desc_by_pin(sfp, pin);
+	if (!crl_desc) {
+		dev_err(dev, "pin %d can't not found reg layout descriptor\n",
+			pin);
+		return -EINVAL;
+	}
+
+	jhb100_padcfg_rmw(sfp, pin,
+			  RL_DESC_GENMASK(crl_desc, input_enable) |
+			  RL_DESC_GENMASK(crl_desc, schmitt_trigger_select),
+			  RL_DESC_GENMASK(crl_desc, input_enable) |
+			  RL_DESC_GENMASK(crl_desc, schmitt_trigger_select));
+
+	jhb100_set_one_pin_mux(sfp, pin, 0, -1);
+
+	return 0;
+}
+
+static int jhb100_gpio_direction_output(struct gpio_chip *gc,
+					unsigned int gpio, int value)
+{
+	struct jhb100_pinctrl *sfp = gpiochip_get_data(gc);
+	struct device *dev = sfp->dev;
+	struct config_reg_layout_desc *crl_desc;
+	unsigned int pin = jhb100_gpio_to_pin(gc, gpio);
+
+	jhb100_set_one_pin_mux(sfp, pin, 0,
+			       value ? GPOUT_HIGH : GPOUT_LOW);
+
+	crl_desc = get_crl_desc_by_pin(sfp, pin);
+	if (!crl_desc) {
+		dev_err(dev, "pin %d can't not found reg layout descriptor\n",
+			pin);
+		return -EINVAL;
+	}
+
+	jhb100_padcfg_rmw(sfp, pin,
+			  RL_DESC_GENMASK(crl_desc, input_enable) |
+			  RL_DESC_GENMASK(crl_desc, schmitt_trigger_select) |
+			  RL_DESC_GENMASK(crl_desc, pull_down) |
+			  RL_DESC_GENMASK(crl_desc, pull_up),
+			  0);
+
+	return 0;
+}
+
+static int jhb100_gpio_get(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct jhb100_gpio_bank *bank = jhb100_gc_to_bank(gc);
+	struct jhb100_pinctrl *sfp = gpiochip_get_data(gc);
+	const struct jhb100_pinctrl_domain_info *info = sfp->info;
+	unsigned int offset = 4 * bank->id;
+	u32 doen = 0;
+	void __iomem *reg_gpio_oen;
+	void __iomem *reg;
+	unsigned long flags;
+
+	reg_gpio_oen = sfp->base + info->regs->output_en + offset;
+	reg = sfp->base + info->regs->gpio_status + offset;
+
+	raw_spin_lock_irqsave(&sfp->lock, flags);
+	doen = readl_relaxed(reg_gpio_oen) | BIT(gpio);
+	writel_relaxed(doen, reg_gpio_oen);
+	raw_spin_unlock_irqrestore(&sfp->lock, flags);
+
+	return !!(readl_relaxed(reg) & BIT(gpio % 32));
+}
+
+static int jhb100_gpio_set(struct gpio_chip *gc, unsigned int gpio, int value)
+{
+	struct jhb100_gpio_bank *bank = jhb100_gc_to_bank(gc);
+	struct jhb100_pinctrl *sfp = gpiochip_get_data(gc);
+	const struct jhb100_pinctrl_domain_info *info = sfp->info;
+	unsigned int offset = 4 * bank->id;
+	void __iomem *reg_dout;
+	u32 dout;
+	unsigned long flags;
+
+	reg_dout = sfp->base + info->regs->output + offset;
+	dout = (value ? GPOUT_HIGH : GPOUT_LOW) << gpio;
+
+	raw_spin_lock_irqsave(&sfp->lock, flags);
+	dout |= readl_relaxed(reg_dout) & ~BIT(gpio);
+	writel_relaxed(dout, reg_dout);
+	raw_spin_unlock_irqrestore(&sfp->lock, flags);
+
+	return 0;
+}
+
+static void jhb100_irq_ack(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct jhb100_gpio_bank *bank = jhb100_gc_to_bank(gc);
+	struct jhb100_pinctrl *sfp = gpiochip_get_data(gc);
+	struct starfive_pinctrl_regs *pinctrl_regs = sfp->info->regs;
+	irq_hw_number_t gpio = irqd_to_hwirq(d);
+	unsigned int offset = 4 * bank->id;
+	void __iomem *ic;
+	unsigned long flags;
+	u32 value;
+	u32 mask;
+
+	ic = sfp->base + pinctrl_regs->irq_clr + offset;
+	mask = BIT(gpio);
+
+	raw_spin_lock_irqsave(&sfp->lock, flags);
+	value = readl_relaxed(ic) & ~mask;
+	writel_relaxed(value | mask, ic);
+	value = readl_relaxed(ic) & ~mask;
+	writel_relaxed(value, ic);
+	raw_spin_unlock_irqrestore(&sfp->lock, flags);
+}
+
+static void jhb100_irq_mask(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct jhb100_gpio_bank *bank = jhb100_gc_to_bank(gc);
+	struct jhb100_pinctrl *sfp = gpiochip_get_data(gc);
+	struct starfive_pinctrl_regs *pinctrl_regs = sfp->info->regs;
+	irq_hw_number_t gpio = irqd_to_hwirq(d);
+	unsigned int offset = 4 * bank->id;
+	void __iomem *ien;
+	unsigned long flags;
+	u32 value;
+	u32 mask;
+
+	ien = sfp->base + pinctrl_regs->irq_en + offset;
+	mask = BIT(gpio);
+
+	raw_spin_lock_irqsave(&sfp->lock, flags);
+	value = readl_relaxed(ien) & ~mask;
+	writel_relaxed(value, ien);
+	raw_spin_unlock_irqrestore(&sfp->lock, flags);
+
+	gpiochip_disable_irq(gc, d->hwirq);
+}
+
+static void jhb100_irq_mask_ack(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct jhb100_gpio_bank *bank = jhb100_gc_to_bank(gc);
+	struct jhb100_pinctrl *sfp = gpiochip_get_data(gc);
+	struct starfive_pinctrl_regs *pinctrl_regs = sfp->info->regs;
+	irq_hw_number_t gpio = irqd_to_hwirq(d);
+	unsigned int offset = 4 * bank->id;
+	void __iomem *ien;
+	void __iomem *ic;
+	unsigned long flags;
+	u32 value;
+	u32 mask;
+
+	ien = sfp->base + pinctrl_regs->irq_en + offset;
+	ic = sfp->base + pinctrl_regs->irq_clr + offset;
+	mask = BIT(gpio);
+
+	raw_spin_lock_irqsave(&sfp->lock, flags);
+	value = readl_relaxed(ien) & ~mask;
+	writel_relaxed(value, ien);
+
+	value = readl_relaxed(ic) & ~mask;
+	writel_relaxed(value | mask, ic);
+	value = readl_relaxed(ic) & ~mask;
+	writel_relaxed(value, ic);
+	raw_spin_unlock_irqrestore(&sfp->lock, flags);
+}
+
+static void jhb100_irq_unmask(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct jhb100_gpio_bank *bank = jhb100_gc_to_bank(gc);
+	struct jhb100_pinctrl *sfp = gpiochip_get_data(gc);
+	struct starfive_pinctrl_regs *pinctrl_regs = sfp->info->regs;
+	irq_hw_number_t gpio = irqd_to_hwirq(d);
+	unsigned int offset = 4 * bank->id;
+	void __iomem *ien;
+	unsigned long flags;
+	u32 value;
+	u32 mask;
+
+	ien = sfp->base + pinctrl_regs->irq_en + offset;
+	mask = BIT(gpio);
+
+	gpiochip_enable_irq(gc, d->hwirq);
+
+	raw_spin_lock_irqsave(&sfp->lock, flags);
+	value = readl_relaxed(ien) | mask;
+	writel_relaxed(value, ien);
+	raw_spin_unlock_irqrestore(&sfp->lock, flags);
+}
+
+static int jhb100_irq_set_type(struct irq_data *d, unsigned int trigger)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct jhb100_gpio_bank *bank = jhb100_gc_to_bank(gc);
+	struct jhb100_pinctrl *sfp = gpiochip_get_data(gc);
+	struct starfive_pinctrl_regs *pinctrl_regs = sfp->info->regs;
+	irq_hw_number_t gpio = irqd_to_hwirq(d);
+	unsigned int offset = 4 * bank->id;
+	void __iomem *base;
+	u32 irq_type, edge_both, polarity, mask;
+	unsigned long flags;
+
+	base = sfp->base + offset;
+	mask = BIT(gpio);
+
+	switch (trigger) {
+	case IRQ_TYPE_EDGE_RISING:
+		irq_type  = mask; /* 1: edge triggered */
+		edge_both = 0;    /* 0: single edge */
+		polarity  = mask; /* 1: rising edge */
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		irq_type  = mask; /* 1: edge triggered */
+		edge_both = 0;    /* 0: single edge */
+		polarity  = 0;    /* 0: falling edge */
+		break;
+	case IRQ_TYPE_EDGE_BOTH:
+		irq_type  = mask; /* 1: edge triggered */
+		edge_both = mask; /* 1: both edges */
+		polarity  = 0;    /* 0: ignored */
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+		irq_type  = 0;    /* 0: level triggered */
+		edge_both = 0;    /* 0: ignored */
+		polarity  = mask; /* 1: high level */
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		irq_type  = 0;    /* 0: level triggered */
+		edge_both = 0;    /* 0: ignored */
+		polarity  = 0;    /* 0: low level */
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (trigger & IRQ_TYPE_EDGE_BOTH)
+		irq_set_handler_locked(d, handle_edge_irq);
+	else
+		irq_set_handler_locked(d, handle_level_irq);
+
+	raw_spin_lock_irqsave(&sfp->lock, flags);
+	irq_type |= readl_relaxed(base + pinctrl_regs->irq_trigger) & ~mask;
+	writel_relaxed(irq_type, base + pinctrl_regs->irq_trigger);
+
+	edge_both |= readl_relaxed(base + pinctrl_regs->irq_both_edge) & ~mask;
+	writel_relaxed(edge_both, base + pinctrl_regs->irq_both_edge);
+
+	if (irq_type & mask) { /* edge polarity */
+		polarity |= readl_relaxed(base + pinctrl_regs->irq_edge) & ~mask;
+		writel_relaxed(polarity, base + pinctrl_regs->irq_edge);
+	} else if (irq_type == 0) { /* level polarity */
+		polarity |= readl_relaxed(base + pinctrl_regs->irq_level) & ~mask;
+		writel_relaxed(polarity, base + pinctrl_regs->irq_level);
+	}
+	raw_spin_unlock_irqrestore(&sfp->lock, flags);
+	return 0;
+}
+
+static int jhb100_irq_set_wake(struct irq_data *d, unsigned int enable)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct jhb100_pinctrl *sfp = gpiochip_get_data(gc);
+	int ret = 0;
+
+	if (enable)
+		ret = enable_irq_wake(sfp->wakeup_irq);
+	else
+		ret = disable_irq_wake(sfp->wakeup_irq);
+	if (ret)
+		dev_err(sfp->dev, "failed to %s wake-up interrupt\n",
+			enable ? "enable" : "disable");
+
+	return ret;
+}
+
+static void jhb100_irq_print_chip(struct irq_data *d, struct seq_file *p)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct jhb100_gpio_bank *bank = jhb100_gc_to_bank(gc);
+
+	seq_printf(p, "%s-%d", gc->label, bank->id);
+}
+
+static const struct irq_chip jhb100_irq_chip = {
+	.irq_ack        = jhb100_irq_ack,
+	.irq_mask       = jhb100_irq_mask,
+	.irq_mask_ack   = jhb100_irq_mask_ack,
+	.irq_unmask     = jhb100_irq_unmask,
+	.irq_set_type   = jhb100_irq_set_type,
+	.irq_set_wake   = jhb100_irq_set_wake,
+	.irq_print_chip = jhb100_irq_print_chip,
+	.flags          = IRQCHIP_SET_TYPE_MASKED |
+			  IRQCHIP_IMMUTABLE |
+			  IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND |
+			  IRQCHIP_MASK_ON_SUSPEND |
+			  IRQCHIP_SKIP_SET_WAKE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
+static irqreturn_t jhb100_gpio_irq_handler(int irq, void *dev_id)
+{
+	struct jhb100_gpio_bank *bank = dev_id;
+	struct gpio_chip *gc = &bank->gc;
+	struct jhb100_pinctrl *sfp = gpiochip_get_data(gc);
+	struct gpio_irq_chip *girq = &gc->irq;
+	struct starfive_pinctrl_regs *pinctrl_regs = sfp->info->regs;
+	unsigned int irq_status = pinctrl_regs->irq_status + bank->id * 4;
+	unsigned long is;
+	unsigned int gpio;
+
+	is = readl_relaxed(sfp->base + irq_status);
+	if (!is)
+		return IRQ_NONE;
+
+	for_each_set_bit(gpio, &is, gc->ngpio)
+		generic_handle_domain_irq(girq->domain, gpio);
+
+	return IRQ_HANDLED;
+}
+
+static int field_compare(const void *a, const void *b)
+{
+	const struct field_info *fa = (const struct field_info *)a;
+	const struct field_info *fb = (const struct field_info *)b;
+
+	if (fa->shift < fb->shift)
+		return -1;
+
+	if (fa->shift > fb->shift)
+		return 1;
+
+	return 0;
+}
+
+static int check_crl_desc(struct jhb100_pinctrl *sfp, unsigned int index,
+			  const struct config_reg_layout_desc *desc)
+{
+	struct device *dev = sfp->dev;
+	struct field_info *fields;
+	int field_cnt = 0;
+	int num, i;
+
+	num = sizeof(struct config_reg_layout_desc) / sizeof(struct reg_layout_field);
+
+	fields = kcalloc(num, sizeof(struct field_info), GFP_KERNEL);
+	if (!fields)
+		return -ENOMEM;
+
+	#define COLLECT_FIELD(field) \
+		do { \
+			if (desc->field.width > 0) { \
+				fields[field_cnt].name = #field; \
+				fields[field_cnt].shift = desc->field.shift; \
+				fields[field_cnt].width = desc->field.width; \
+				fields[field_cnt].end = desc->field.shift + desc->field.width; \
+				field_cnt++; \
+			} \
+		} while (0)
+
+	/* same as struct config_reg_layout_desc filed except for pin_start and pin_cnt */
+	COLLECT_FIELD(debounce_width);
+	COLLECT_FIELD(drive_strength_2bit);
+	COLLECT_FIELD(drive_strength_3bit);
+	COLLECT_FIELD(function);
+	COLLECT_FIELD(input_enable);
+	COLLECT_FIELD(vsel);
+	COLLECT_FIELD(mode_select);
+	COLLECT_FIELD(open_drain_pull_up_sel);
+	COLLECT_FIELD(pull_down);
+	COLLECT_FIELD(pull_up);
+	COLLECT_FIELD(reserved);
+	COLLECT_FIELD(retention_signal_bus);
+	COLLECT_FIELD(schmitt_trigger_select);
+	COLLECT_FIELD(slew_rate);
+
+	#undef COLLECT_FIELD
+
+	sort(fields, field_cnt, sizeof(struct field_info), field_compare, NULL);
+
+	for (i = 0; i < field_cnt; i++) {
+		if (fields[i].end > 32) {
+			dev_err(dev,
+				"layout %d: field %s exceeds 32bit [shift=%u, width=%u, end=%u]\n",
+				index, fields[i].name,
+				fields[i].shift, fields[i].width, fields[i].end);
+			goto failed;
+		}
+
+		if (i < field_cnt - 1) {
+			if (fields[i].end > fields[i + 1].shift) {
+				dev_err(dev,
+					"layout %d: field overlap: %s[%u:%u] with %s[%u:%u]\n",
+					index, fields[i].name, fields[i].end - 1,
+					fields[i].shift, fields[i + 1].name,
+					fields[i + 1].end - 1, fields[i + 1].shift);
+				goto failed;
+			}
+		}
+	}
+
+	if (desc->reserved.width > 0) {
+		unsigned int used_mask = 0;
+		unsigned int reserved_mask = 0;
+
+		for (i = 0; i < field_cnt; i++) {
+			if (strcmp(fields[i].name, "reserved"))
+				used_mask |= GENMASK(fields[i].end - 1, fields[i].shift);
+			else
+				reserved_mask |= GENMASK(fields[i].end - 1, fields[i].shift);
+		}
+
+		if ((used_mask | reserved_mask) != 0xFFFFFFFF) {
+			dev_err(dev,
+				"layout %d: reserved field not cover all unused bits\n",
+				index);
+			dev_err(dev,
+				"used mask: 0x%08X, reserved mask: 0x%08X, combined: 0x%08X\n",
+				used_mask, reserved_mask, used_mask | reserved_mask);
+		}
+	}
+
+	kfree(fields);
+	return 0;
+
+failed:
+	kfree(fields);
+	return -EINVAL;
+}
+
+static int check_layout_pin_range(struct jhb100_pinctrl *sfp,
+				  const struct config_reg_layout_desc *descs,
+				  unsigned int num_desc)
+{
+	struct device *dev = sfp->dev;
+
+	if (descs[num_desc - 1].pin_start + descs[num_desc - 1].pin_cnt > sfp->npins) {
+		dev_err(dev, "layout %u pin_start[%u] + pin_cnt[%u] exceeds pin number[%u]\n",
+			num_desc - 1, descs[num_desc - 1].pin_start,
+			descs[num_desc - 1].pin_cnt, sfp->npins);
+		return -EINVAL;
+	}
+
+	for (int i = 0; i < num_desc; i++) {
+		if (descs[i].pin_start == 0xff)
+			break;
+
+		if (i < num_desc - 1) {
+			if (descs[i].pin_start + descs[i].pin_cnt > descs[i + 1].pin_start) {
+				dev_err(dev, "pin range: [%u-%u] overlaps with [%u-%u]\n",
+					descs[i].pin_start, descs[i].pin_cnt,
+					descs[i + 1].pin_start, descs[i + 1].pin_cnt);
+				return -EINVAL;
+			}
+
+			if (descs[i].pin_start + descs[i].pin_cnt < descs[i + 1].pin_start) {
+				dev_err(dev, "pin range: [%u-%u] -> [%u-%u] has gap\n",
+					descs[i].pin_start, descs[i].pin_cnt,
+					descs[i + 1].pin_start, descs[i + 1].pin_cnt);
+				return -EINVAL;
+			}
+		}
+	}
+
+	return 0;
+}
+
+static int check_pinctrl_layouts(struct jhb100_pinctrl *sfp,
+				 const struct config_reg_layout_desc *layouts)
+{
+	struct device *dev = sfp->dev;
+	int i = 0, err_cnt = 0, ret;
+
+	if (!layouts) {
+		dev_err(dev, "layout pointer is NULL\n");
+		return -EINVAL;
+	}
+
+	while (layouts[i].pin_start != 0xff) {
+		ret = check_crl_desc(sfp, i, &layouts[i]);
+		if (ret) {
+			dev_err(dev, "layout %d check failed\n", i);
+			err_cnt++;
+		}
+
+		if (++i > 100) {
+			dev_err(dev, "too many layouts or missing 0xff for end\n");
+			return -EINVAL;
+		}
+	}
+
+	if (!err_cnt) {
+		ret = check_layout_pin_range(sfp, layouts, i);
+		if (ret)
+			err_cnt++;
+	}
+
+	if (err_cnt) {
+		dev_err(dev, "pinctrl layout check finish with %d error(s)\n", err_cnt);
+		return -EINVAL;
+	}
+
+	dev_info(dev, "pinctrl layout check completed!\n");
+	return 0;
+}
+
+static
+struct pinctrl_pin_desc *devm_create_pins_from_pld(struct device *dev,
+						   const struct jhb100_pin_layout_desc *desc,
+						   const char *prefix,
+						   unsigned int *total_pins,
+						   unsigned int *total_gpios,
+						   s8 **gpio_func_sel_arr)
+{
+	struct pinctrl_pin_desc *pins = NULL;
+	unsigned int i, j, ngpios = 0, npins = 0, pin_index = 0;
+	unsigned int same_name_found = 0;
+	s8 *arr;
+
+	if (!dev || !desc || !prefix) {
+		dev_err(dev, "Invalid parameters: desc=%p, prefix=%s\n",
+			desc, prefix);
+		return ERR_PTR(-EINVAL);
+	}
+
+	for (i = 0; desc[i].pin_start != 0xff; i++) {
+		if (!desc[i].pin_cnt) {
+			dev_err(dev, "Invalid pin cnt\n");
+			return ERR_PTR(-EINVAL);
+		}
+
+		npins += desc[i].pin_cnt;
+	}
+
+	if (npins == 0) {
+		dev_err(dev, "No pins defined\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	dev_dbg(dev, "Total pins to create: %d\n", npins);
+
+	pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
+	if (!pins)
+		return ERR_PTR(-ENOMEM);
+
+	arr = devm_kzalloc(dev, npins, GFP_KERNEL);
+	if (!arr)
+		return ERR_PTR(-ENOMEM);
+
+	for (i = 0; desc[i].pin_start != 0xff; i++) {
+		same_name_found = 0;
+
+		for (j = 0; j < i; j++) {
+			if (!strcmp(desc[j].name, desc[i].name)) {
+				same_name_found = 1;
+				break;
+			}
+		}
+
+		for (j = 0; j < desc[i].pin_cnt; j++) {
+			char *name = NULL;
+			int pin_num = desc[i].pin_start + j;
+
+			pins[pin_index].number = pin_num;
+			if (same_name_found) {
+				name = devm_kasprintf(dev, GFP_KERNEL, "%s_%s_%d",
+						      prefix, desc[i].name,
+						      desc[i].pin_start + j);
+			} else {
+				if (desc[i].pin_cnt > 1)
+					name = devm_kasprintf(dev, GFP_KERNEL, "%s_%s_%d",
+							      prefix, desc[i].name, j);
+				else
+					name = devm_kasprintf(dev, GFP_KERNEL, "%s_%s",
+							      prefix, desc[i].name);
+			}
+
+			if (!name) {
+				dev_err(dev, "Failed to allocate pin name for pin %d\n",
+					pin_num);
+				return ERR_PTR(-ENOMEM);
+			}
+
+			if (!strcmp(desc[i].name, "gpio") || desc[i].gpio_func_sel != -1)
+				ngpios++;
+
+			pins[pin_index].name = name;
+			arr[pin_index] = desc[i].gpio_func_sel;
+			pin_index++;
+		}
+	}
+
+	*total_pins = npins;
+	*total_gpios = ngpios;
+	*gpio_func_sel_arr = arr;
+
+	return pins;
+}
+
+static bool starfive_of_node_instance_match(struct gpio_chip *gc, unsigned int i)
+{
+	struct jhb100_pinctrl *sfp = gpiochip_get_data(gc);
+
+	if (i >= sfp->num_banks)
+		return false;
+
+	return (gc == &sfp->banks[i].gc);
+}
+
+int jhb100_pinctrl_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct gpio_irq_chip *girq;
+	const struct jhb100_pinctrl_domain_info *info;
+	struct jhb100_pinctrl *sfp;
+	struct pinctrl_desc *jhb100_pinctrl_desc;
+	struct starfive_pinctrl_regs *pinctrl_regs;
+	struct reset_control *rst;
+	struct clk *clk;
+	int ret;
+	int irq;
+
+	info = of_device_get_match_data(&pdev->dev);
+	if (!info)
+		return -ENODEV;
+
+	pinctrl_regs = info->regs;
+
+	sfp = devm_kzalloc(dev, sizeof(*sfp), GFP_KERNEL);
+	if (!sfp)
+		return -ENOMEM;
+
+	sfp->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(sfp->base))
+		return PTR_ERR(sfp->base);
+
+	clk = devm_clk_get_optional_enabled(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk), "could not get & enable clock\n");
+
+	rst = devm_reset_control_array_get_optional_shared(dev);
+	if (IS_ERR(rst))
+		return dev_err_probe(dev, PTR_ERR(rst), "could not get reset control\n");
+
+	/*
+	 * we don't want to assert reset and risk undoing pin muxing for the
+	 * early boot serial console, but let's make sure the reset line is
+	 * deasserted in case someone runs a really minimal bootloader.
+	 */
+	ret = reset_control_deassert(rst);
+	if (ret)
+		return dev_err_probe(dev, ret, "could not deassert reset\n");
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	sfp->pins = devm_create_pins_from_pld(dev, info->pl_desc, info->name,
+					      &sfp->npins, &sfp->ngpios,
+					      &sfp->gpio_func_sel_arr);
+	if (IS_ERR(sfp->pins))
+		return PTR_ERR(sfp->pins);
+
+	jhb100_pinctrl_desc = devm_kzalloc(&pdev->dev,
+					   sizeof(*jhb100_pinctrl_desc),
+					   GFP_KERNEL);
+	if (!jhb100_pinctrl_desc)
+		return -ENOMEM;
+
+	jhb100_pinctrl_desc->name = dev_name(dev);
+	jhb100_pinctrl_desc->pctlops = &jhb100_pinctrl_ops;
+	jhb100_pinctrl_desc->pmxops = &jhb100_pinmux_ops;
+	jhb100_pinctrl_desc->confops = &jhb100_pinconf_ops;
+	jhb100_pinctrl_desc->owner = THIS_MODULE;
+	jhb100_pinctrl_desc->pins = sfp->pins;
+	jhb100_pinctrl_desc->npins = sfp->npins;
+
+	sfp->info = info;
+	sfp->dev = dev;
+	platform_set_drvdata(pdev, sfp);
+
+	raw_spin_lock_init(&sfp->lock);
+	mutex_init(&sfp->mutex);
+
+	ret = devm_pinctrl_register_and_init(dev, jhb100_pinctrl_desc,
+					     sfp, &sfp->pctl);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "could not register pinctrl driver\n");
+
+	ret = pinctrl_enable(sfp->pctl);
+	if (ret)
+		return ret;
+
+	sfp->num_banks = DIV_ROUND_UP(sfp->ngpios, JHB100_NR_GPIOS_PER_BANK);
+
+	for (unsigned int i = 0; i < sfp->num_banks; i++) {
+		if (sfp->ngpios > (i + 1) * JHB100_NR_GPIOS_PER_BANK)
+			sfp->banks[i].gc.ngpio = (i + 1) * JHB100_NR_GPIOS_PER_BANK;
+		else
+			sfp->banks[i].gc.ngpio = sfp->ngpios - i * JHB100_NR_GPIOS_PER_BANK;
+
+		sfp->banks[i].id = i;
+
+		sfp->banks[i].gc.parent = dev;
+		sfp->banks[i].gc.label = dev_name(dev);
+		sfp->banks[i].gc.owner = THIS_MODULE;
+		sfp->banks[i].gc.request = pinctrl_gpio_request;
+		sfp->banks[i].gc.free = pinctrl_gpio_free;
+		sfp->banks[i].gc.get_direction = jhb100_gpio_get_direction;
+		sfp->banks[i].gc.direction_input = jhb100_gpio_direction_input;
+		sfp->banks[i].gc.direction_output = jhb100_gpio_direction_output;
+		sfp->banks[i].gc.get = jhb100_gpio_get;
+		sfp->banks[i].gc.set = jhb100_gpio_set;
+		sfp->banks[i].gc.set_config = gpiochip_generic_config;
+		sfp->banks[i].gc.base = -1;
+		sfp->banks[i].gc.of_gpio_n_cells = 3;
+		sfp->banks[i].gc.of_node_instance_match = starfive_of_node_instance_match;
+
+		girq = &sfp->banks[i].gc.irq;
+		girq->handler = handle_simple_irq;
+
+		gpio_irq_chip_set_chip(girq, &jhb100_irq_chip);
+
+		/* mask all GPIO interrupts */
+		writel_relaxed(0U, sfp->base + pinctrl_regs->irq_en + 4 * i);
+		/* clear all interrupts */
+		writel_relaxed(~0U, sfp->base + pinctrl_regs->irq_clr + 4 * i);
+		writel_relaxed(0U, sfp->base + pinctrl_regs->irq_clr + 4 * i);
+
+		ret = devm_request_irq(dev, irq, jhb100_gpio_irq_handler, IRQF_SHARED,
+				       sfp->banks[i].gc.label, &sfp->banks[i]);
+		if (ret < 0)
+			return dev_err_probe(dev, ret, "failed to register IRQ\n");
+
+		ret = devm_gpiochip_add_data(dev, &sfp->banks[i].gc, sfp);
+		if (ret)
+			return dev_err_probe(dev, ret, "could not register gpiochip\n");
+	}
+
+	dev_info(dev, "StarFive JHB100 GPIO chip registered %d GPIOs\n",
+		 sfp->ngpios);
+
+	ret = check_pinctrl_layouts(sfp, info->crl_desc);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(jhb100_pinctrl_probe);
+
+MODULE_DESCRIPTION("Pinctrl driver for the StarFive JHB100 SoC");
+MODULE_AUTHOR("Alex Soo <yuklin.soo@starfivetech.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100.h b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100.h
new file mode 100644
index 000000000000..529b358abbbe
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100.h
@@ -0,0 +1,152 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC
+ *
+ * Copyright (C) 2024 StarFive Technology Co., Ltd.
+ * Author: Alex Soo <yuklin.soo@starfivetech.com>
+ *
+ */
+
+#ifndef __PINCTRL_STARFIVE_JHB100_H__
+#define __PINCTRL_STARFIVE_JHB100_H__
+
+#include <linux/gpio/driver.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinmux.h>
+
+#define JHB100_MAX_BANKS			2
+
+struct jhb100_pin_layout_desc {
+	unsigned int pin_start;
+	unsigned int pin_cnt;
+	const char *name;
+	s8 gpio_func_sel;
+};
+
+struct jhb100_gpio_bank {
+	struct gpio_chip gc;
+	unsigned int id;
+};
+
+struct jhb100_pinctrl {
+	struct device *dev;
+	struct jhb100_gpio_bank banks[JHB100_MAX_BANKS];
+	unsigned int num_banks;
+	struct pinctrl_gpio_range gpios;
+	raw_spinlock_t lock;
+	const char *iodomain_name;
+	void __iomem *base;
+	struct pinctrl_dev *pctl;
+	/* register read/write mutex */
+	struct mutex mutex;
+	const struct jhb100_pinctrl_domain_info *info;
+	/* wakeup */
+	int wakeup_irq;
+	struct irq_domain *irq_domain;
+	const struct pinctrl_pin_desc *pins;
+	unsigned int npins;
+	unsigned int ngpios;
+	s8 *gpio_func_sel_arr;
+};
+
+struct pinvref_desc {
+	unsigned int range;
+	u32 pin_grp[32];
+	u32 num_pins;
+};
+
+struct pinvref_reg {
+	unsigned int reg;
+	const struct pinvref_desc *pv_desc;
+	u32 num_pv;
+};
+
+struct gpio_irq_reg {
+	unsigned int reg;
+	unsigned int width_per_pin;
+};
+
+struct starfive_pinctrl_regs {
+	struct pinvref_reg vref;
+	struct gpio_irq_reg func_sel;
+	unsigned int config;
+	unsigned int output;
+	unsigned int output_en;
+	unsigned int gpio_status;
+	unsigned int irq_en;
+	unsigned int irq_status;
+	unsigned int irq_clr;
+	unsigned int irq_trigger;
+	unsigned int irq_level;
+	unsigned int irq_both_edge;
+	unsigned int irq_edge;
+};
+
+struct reg_layout_field {
+	unsigned char shift;
+	unsigned char width;
+};
+
+#define RL_DESC_SUPPORTED(crl_desc, field) ({ \
+	typeof(crl_desc) _desc = (crl_desc); \
+	(_desc && _desc->field.width > 0); \
+})
+
+#define RL_DESC_SHIFT(crl_desc, field) ({ \
+	typeof(crl_desc) __desc = (crl_desc); \
+	__desc->field.shift; \
+})
+
+#define RL_DESC_GENMASK(crl_desc, field) ({ \
+	typeof(crl_desc) __desc = (crl_desc); \
+	RL_DESC_SUPPORTED(__desc, field) ? \
+	GENMASK(__desc->field.shift + __desc->field.width - 1, __desc->field.shift) : 0; \
+})
+
+struct config_reg_layout_desc {
+	unsigned int pin_start;
+	unsigned int pin_cnt;
+
+	struct reg_layout_field debounce_width;
+	struct reg_layout_field drive_strength_2bit;
+	struct reg_layout_field drive_strength_3bit;
+	struct reg_layout_field function;
+	struct reg_layout_field input_enable;
+	struct reg_layout_field vsel;
+	struct reg_layout_field mode_select;
+	struct reg_layout_field open_drain_pull_up_sel;
+	struct reg_layout_field pull_down;
+	struct reg_layout_field pull_up;
+	struct reg_layout_field reserved;
+	struct reg_layout_field retention_signal_bus;
+	struct reg_layout_field schmitt_trigger_select;
+	struct reg_layout_field slew_rate;
+};
+
+struct funcsel_reg_layout_desc {
+	unsigned int pin_start;
+	unsigned int pin_cnt;
+	unsigned int width;
+};
+
+#define JHB100_FUNC_MAPS_MAX_PIN(n)	((n) + 1)
+
+struct jhb100_pinctrl_func_maps {
+	char *func;
+	unsigned char val;
+	u32 max_pin;
+};
+
+struct jhb100_pinctrl_domain_info {
+	const char *name;
+	const struct pinctrl_pin_desc *pins;
+	const struct jhb100_pin_layout_desc *pl_desc;
+	const struct jhb100_pinctrl_func_maps *fmaps;
+	u32 num_maps;
+	struct config_reg_layout_desc *crl_desc;
+	struct starfive_pinctrl_regs *regs;
+};
+
+int jhb100_pinctrl_probe(struct platform_device *pdev);
+
+#endif /* __PINCTRL_STARFIVE_JHB100_H__ */
-- 
2.25.1


