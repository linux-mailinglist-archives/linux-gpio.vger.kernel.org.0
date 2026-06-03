Return-Path: <linux-gpio+bounces-37870-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nn/5DjfDH2papgAAu9opvQ
	(envelope-from <linux-gpio+bounces-37870-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 08:01:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A5830634785
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 08:01:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37870-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37870-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=starfivetech.com (policy=quarantine);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DC9FC314E544
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2026 05:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E8D03F8EB5;
	Wed,  3 Jun 2026 05:55:40 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2105.outbound.protection.partner.outlook.cn [139.219.17.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834ED3F4DC1;
	Wed,  3 Jun 2026 05:55:38 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780466139; cv=fail; b=Owcc66G81ooIiLMTDLkpZpcvcSSPY/fKMzNhhdg8XzHNTukUBhvQBXwATVcEGttaj7qRufiSE5zLT4gT2xvV3oVUdbeMAv2xlFw7CgVqvwElBzmYgab/c5Vf7quCOqrXzJA2u2J4GzUIdaQAdK6M7tHHaG0barOqynCfr3JQQfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780466139; c=relaxed/simple;
	bh=7VZSc5m0dchLpZl1t61gbuDkLCJOhORxyIm3GXrtZJk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m7A1EZoUL6rr9udrARMzy2jlBfOzrQJCLvo7IZnjZiYZdOGSCcFBDXxAd7MnqhdWayFRm7ZOWOuNPyqNc2NOUrSubf8mMmjOjhVbBRFlbbStkuvULXO0zM1kIMHnjLh1LrlyJEes5QzbpZRmPHODidkZb1lLvf3oL+RHgzlCzUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.105
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vz4NCTrdW8Y+EDtCjeLstc1P7G7TbwSV1Q8CTbTSoXNpf2TLy/vb/ODi+9jd+/OtRfOAndjbvg8Sxw6KG0sNvaPo6vFYpCEnSN3rmAkNjw02Bxp81sXciw+WyZgQXMvStZHRArIwhalOuTIGP7+RvvTFlhE3JLkTBgyKT16E0umcYV7WiJfnM5/y9/WQ5sAGCDe6oF16TY1aTfr4ScO8j2Pcy4ceykzDvMD53AzIdWZ4Wo49qJms+xuJpEcncuW5Fq9EJVygz8o0Hy5P4Iy0R8aP7RRaX2qSmbeih5YCl+tXEISD6W1jkQ6If94YUqoNcgR07/9hPhAHbVQA4TKRjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Th4obsE9ljubuuU+wZuKCgpV1YrTnb55u5yNmEAyi1U=;
 b=l37hFVdpBaSIQCmxJw3jAErYZSphP4aXFijSHVsuZaMS42vFlyDfmSuZfAhN7I1DqQGXog24S5FQJnj+8uiBTkRT9bvUeyzpzmOqtsXgAHMdFsGQSRoNWucj31mhoMlNqld29WWJ5ABOraW/Hg8MuJZENkLMvudsy4sUMjvXG5ZzUqdbj0PxAHaEmOrncAIjSkbls6vT7N4npAa2emhl+l4QqXRTkMeNu0PL6X7HyqEsFMgHLnfT6mekTGayBrTVhdrzofVvMzzCOaiAd8hmyfoJ82qs8pQB31CicO3SpGQtdslCtBohnJmsVYFxO6riyBZypjBDA+tw9KOMRLhGeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1154.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 05:54:26 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.21.0092.006; Wed, 3 Jun 2026 05:54:26 +0000
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
Subject: [PATCH v3 20/21] pinctrl: starfive: Add StarFive JHB100 per3 controller driver
Date: Tue,  2 Jun 2026 22:53:46 -0700
Message-Id: <20260603055347.66845-21-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 336ded67-85fe-4f7f-f645-08dec13491a2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|3023799007|22082099003|18002099003|6133799003|5023799004|56012099006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	gqiRV2NGhxSsJoR86oqm7y9LP7PNx8sYBGBgT08Q/2+VuImT+r94e78RmXapgSdDzacUoARhDxZ1PArWXHFE18FFql7BOMId588HTodsZEZSVTfenxeeyjII7enRfJ2koK9yMkem7U/ImJeBJDO8Tk+Kbib0bE9OrYRqU7/R2egiUrmqKTsXjOdlHItXr1SCHZ/kxEomZHG1OAOOfFHqBfVftpiem7BPxrnbxNnj/lfcoCW3vZi+LeYzVNN9zsCAQhvPZb+xeSl285Xip7h61DAaMUdoCasCG80NCq+Q3Hh5d9u60xwTD7yBZ3Ldv6dbe7dv0FxRLfipcPRwNXevRBE80YrZphw4+Ri6/8AE+cf/Zvn6hPTbMiKI08pPYWm2GAjjYLkpu4nR75C1xzWx9G3w7N5TyIhifMzI4wYv6aXJJLfWiJmQSXxDWIQem9ugP3xZH6qOqngD8VlLIyHbqLSKEiikJToqB/kYXWb++3ezMD/L35LCkstywJRJCkXegi0UQRId/re/IcewPwfiPhVLR7sx97WBByOCEZHLal1+j5Yd/BhhrNGF21xpNgvi4iq6kjrzUQpUZQIhlYmnHA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(3023799007)(22082099003)(18002099003)(6133799003)(5023799004)(56012099006)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RGyV3TrbWtl7449v3MiLHmlzdjuAhfbNAF8X8GAicv9IaW1HkH4nJeTNC3ln?=
 =?us-ascii?Q?50H0HyOqixwVI4SjJ0Ax+NVawdx7gZeHuqAec+x8iEWPZwuUEfTs0h6ca6V9?=
 =?us-ascii?Q?73Aptg1tS4pQyC5gf5wA/yaoJuChva8Wrf4QY4YKyGs6BOv69j03B8KXWf+e?=
 =?us-ascii?Q?ua/Oe/xCKGTWQDgdDAUZ6ncCjoYRtzwIsKOfqWfufc7zlWvWSotWX0xFg5LL?=
 =?us-ascii?Q?CFz31DRhAnLghea6OYcnTIKCy1aBDQVG6Ej4UUz7bYkUQaDkguIsOrv24zYk?=
 =?us-ascii?Q?WgK54vwoO6jYpmfOWYQ/DmCDPt4DHJEbWwLgZbnrg1UTksvRXwVO9POESIh+?=
 =?us-ascii?Q?mZqvfdPoXI7a4+D9/VADhfEuJsuWJx9s7Bwx6f/zZZ0QpEKpnjBE0ZYSync9?=
 =?us-ascii?Q?MRC3tM5/nAux1h1s9HEkBxugNsRIkNanRkNrrc714KaJknAF74JimTVi+l+C?=
 =?us-ascii?Q?6sJs7PnRM7PLTQRh4X5aPEuKQvq33+WCVizzah4Wu1hG5HkzlAc448R9JLdV?=
 =?us-ascii?Q?9lr5hu5/weCtogTJ5+kaK7sFrJhgSg9zMLguzAur8/NbpG3M2ZIwt5Xz1DDa?=
 =?us-ascii?Q?pnxx8nk+5x3/jEevDUtIkgeryxT3paDThyet2RBAAbQzwS5PAH+UwrwF0Wsi?=
 =?us-ascii?Q?EHmGijD1l25fbGxKoyIgKA+sXrKxmO8nwJsCNs3j6y4XPd2+8x7bfP9DtuIa?=
 =?us-ascii?Q?6ary0tmMLL1TlTCQCOHwdF+26mHG64H7ri0m8qgBeMiyltS/EDyxivfL/RXB?=
 =?us-ascii?Q?PgfKp3mWDm+lvs+hiHzDsvxgNl0u8wgxa6wBDQoHT31/d0TVMXYoNsYhzrVl?=
 =?us-ascii?Q?pPpEm/k7JvNAfRLp7hRdEaQh2E7PEFYoPJa2YDJ/wgX/wzu6bX8JdP/JlmEl?=
 =?us-ascii?Q?XTPuF9rmWZZmo13LHWjlT019AskD2NlKXnaGEdH2DPzrytc/L0Zk4uatNiZO?=
 =?us-ascii?Q?zuujwzD1o2ScvJTaTM4I9axrfB3SwQNgGU0WB1Bq/2fnBEaL3M6htzKJwoSm?=
 =?us-ascii?Q?Vcr+iJMwR0Le5mO68iF8kJad2NE5aLY5jqKhEJsC8lNDzPgB6trIOK28z4hV?=
 =?us-ascii?Q?3aXp4w58P+UzaO0hHh5Dzrtm63/AmIyb20sEn/nVDQdFZu6+mdl0HfDnPMfw?=
 =?us-ascii?Q?aIrtbt1FcBhy1l544pxr5U2QxBWbekreY014qEAWGNq2UC4Xza9h3lkuTCIq?=
 =?us-ascii?Q?taNMStqQfawVb1ZcqQpL4Gsg7fRYVBwYNttuIhbXTA3eiCRoo/27M4L8mn1k?=
 =?us-ascii?Q?qJ2tEle7vrtxdacVhRqJhPwBkbmP87YotHFiStASwTZZzAjaywJPDJ4fqM8X?=
 =?us-ascii?Q?fio0czWp5pRUrSKjKyj/OwaxUXCqcuF4iLRpjmLPz0cSB/tiIJmsarAsY2Zp?=
 =?us-ascii?Q?eKGufBOez39ROvrvtnYAlhkRXb8v4zj0PYf1qOoMtJk2Swk6WfYPjcjBds+Y?=
 =?us-ascii?Q?lna3R5aMgdysNtDcoC7OE2BE3uEunHafISRDC1SZ6+sInTc8UFjgTwgioqXl?=
 =?us-ascii?Q?NGUNmpy2tEItzyJ5pt2Tzax4XlnNWuJK/Ugc8I+HIh4IktP0W+OJxN3YiWpJ?=
 =?us-ascii?Q?gWp+TrAJmR0YnvklLxw0vaYHY3HIjRaEUW2lVXXDLGBRvUCbLPREOXzmI+w/?=
 =?us-ascii?Q?Jh044Pzm3j4IpXpt3yL/bF4asOBoU6fYH1BxaHBarPY0WsDTyQxue4jYcwDp?=
 =?us-ascii?Q?HphnNwGko4hufbEMI4+cvA1GJ3zMEbEmPiWb/ib3mNGby9/UUQE12elFuoqE?=
 =?us-ascii?Q?jrFYVN2GzCUa5A0J3SKRyBpeoBJK9slaNpm2nYtH3iyeGFoKZYRs?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 336ded67-85fe-4f7f-f645-08dec13491a2
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 05:54:25.9822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zPaEtzL/wAkY9tcuWV93Nn5Wnry4YBJ1Y1So59ziIAQ1IyikGNQmCxQOzCaRfCDr8sVsmw8CBXCdUn461J10OACHB7+/NRGXPWNz/TinLWpmVsBpjoANATAkEIfnNtEg
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
	TAGGED_FROM(0.00)[bounces-37870-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,starfivetech.com:mid,starfivetech.com:from_mime,starfivetech.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A5830634785

Add pinctrl driver for StarFive JHB100 SoC Peripheral-3(per3) pinctrl
controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              |  12 ++
 drivers/pinctrl/starfive/Makefile             |   1 +
 .../starfive/pinctrl-starfive-jhb100-per3.c   | 119 ++++++++++++++++++
 3 files changed, 132 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per3.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index bf5915e0a5f2..da1dcdcc4140 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -103,6 +103,18 @@ config PINCTRL_STARFIVE_JHB100_PER2POK
 	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
 	  and interrupts on input changes.
 
+config PINCTRL_STARFIVE_JHB100_PER3
+	tristate "StarFive JHB100 SoC Peripheral-3 pinctrl and GPIO driver"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	depends on OF
+	select PINCTRL_STARFIVE_JHB100
+	default ARCH_STARFIVE
+	help
+	  Say yes here to support Peripheral-3 pin control on the StarFive JHB100 SoC.
+	  This also provides an interface to the GPIO pins not used by other
+	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
+	  and interrupts on input changes.
+
 config PINCTRL_STARFIVE_JHB100_SYS0
 	tristate "StarFive JHB100 SoC System-0 pinctrl and GPIO driver"
 	depends on ARCH_STARFIVE || COMPILE_TEST
diff --git a/drivers/pinctrl/starfive/Makefile b/drivers/pinctrl/starfive/Makefile
index 213002da9cdd..351fce524fec 100644
--- a/drivers/pinctrl/starfive/Makefile
+++ b/drivers/pinctrl/starfive/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER0)	+= pinctrl-starfive-jhb100-per0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER1)	+= pinctrl-starfive-jhb100-per1.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER2)	+= pinctrl-starfive-jhb100-per2.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER2POK)	+= pinctrl-starfive-jhb100-per2pok.o
+obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER3)	+= pinctrl-starfive-jhb100-per3.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0)	+= pinctrl-starfive-jhb100-sys0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0H)	+= pinctrl-starfive-jhb100-sys0h.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS1)	+= pinctrl-starfive-jhb100-sys1.o
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per3.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per3.c
new file mode 100644
index 000000000000..1379599c99a8
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per3.c
@@ -0,0 +1,119 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC Peripheral-3 domain
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
+static const struct jhb100_pin_layout_desc jhb100_per3_pl_desc[] = {
+	{ .pin_start = 0, .pin_cnt = 11, .name = "gpio", .gpio_func_sel = 0 },
+	{ 0xff },
+};
+
+static struct config_reg_layout_desc jhb100_per3_pinctrl_rl_desc[] = {
+	{
+		.pin_start			= 0,
+		.pin_cnt			= 2,
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
+		.pin_start			= 2,
+		.pin_cnt			= 9,
+		.input_enable			= { .shift = 0, .width = 1 },
+		.slew_rate			= { .shift = 1, .width = 1 },
+		.vsel				= { .shift = 2, .width = 2 },
+		.reserved			= { .shift = 4, .width = 11 },
+		.debounce_width			= { .shift = 15, .width = 17 },
+	},
+	{ 0xff },
+};
+
+static const struct pinvref_desc pinvref_desc_per3[] = {
+	{
+		/* gpios */
+		.pin_grp = {
+			PADNUM_PER3_GPIO_E0,
+			PADNUM_PER3_GPIO_E1,
+			PADNUM_PER3_GPIO_E2,
+			PADNUM_PER3_GPIO_E3,
+			PADNUM_PER3_GPIO_E4,
+			PADNUM_PER3_GPIO_E5,
+			PADNUM_PER3_GPIO_E6,
+			PADNUM_PER3_GPIO_E7,
+			PADNUM_PER3_GPIO_E8,
+			PADNUM_PER3_GPIO_E9,
+			PADNUM_PER3_GPIO_E10
+		},
+		.num_pins = 11,
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
+	},
+};
+
+struct starfive_pinctrl_regs jhb100_per3_pinctrl_regs = {
+	.vref			= { .reg = 0x00, .pv_desc = pinvref_desc_per3,
+				    .num_pv = ARRAY_SIZE(pinvref_desc_per3) },
+	.func_sel		= { .reg = 0x3c, .width_per_pin = 2 },
+	.config			= 0x04,
+	.output			= 0x30,
+	.output_en		= 0x34,
+	.gpio_status		= 0x38,
+	.irq_en			= 0x40,
+	.irq_status		= 0x44,
+	.irq_clr		= 0x48,
+	.irq_trigger		= 0x4c,
+	.irq_level		= 0x50,
+	.irq_both_edge		= 0x54,
+	.irq_edge		= 0x58,
+};
+
+static const struct jhb100_pinctrl_func_maps jhb100_func_maps_per3[] = {
+	{ .func = "gmac_mdio",		.val = 1 },
+	{ .func = "gmac_rmii",		.val = 1 },
+	{ .func = "gpio",		.val = 0 },
+};
+
+static const struct jhb100_pinctrl_domain_info jhb100_per3_pinctrl_info = {
+	.name			= "jhb100-per3",
+	.pl_desc		= jhb100_per3_pl_desc,
+	.crl_desc		= jhb100_per3_pinctrl_rl_desc,
+	.regs			= &jhb100_per3_pinctrl_regs,
+	.fmaps			= jhb100_func_maps_per3,
+	.num_maps		= ARRAY_SIZE(jhb100_func_maps_per3),
+};
+
+static const struct of_device_id jhb100_per3_pinctrl_of_match[] = {
+	{
+		.compatible = "starfive,jhb100-per3-pinctrl",
+		.data = &jhb100_per3_pinctrl_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jhb100_per3_pinctrl_of_match);
+
+static struct platform_driver jhb100_per3_pinctrl_driver = {
+	.probe = jhb100_pinctrl_probe,
+	.driver = {
+		.name = "starfive-jhb100-per3-pinctrl",
+		.of_match_table = jhb100_per3_pinctrl_of_match,
+	},
+};
+module_platform_driver(jhb100_per3_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for StarFive JHB100 SoC Peripheral-3 domain");
+MODULE_AUTHOR("Alex Soo <yuklin.soo@starfivetech.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1


