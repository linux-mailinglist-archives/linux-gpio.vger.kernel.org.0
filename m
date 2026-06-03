Return-Path: <linux-gpio+bounces-37867-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id imG0E4jFH2ropgAAu9opvQ
	(envelope-from <linux-gpio+bounces-37867-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 08:11:20 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C4B6348E9
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Jun 2026 08:11:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37867-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37867-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=starfivetech.com (policy=quarantine);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C8F4830FD9B3
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2026 05:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61CD03F9272;
	Wed,  3 Jun 2026 05:55:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2132.outbound.protection.partner.outlook.cn [139.219.17.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8D53F0AA4;
	Wed,  3 Jun 2026 05:55:25 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780466127; cv=fail; b=b3z3GNs6x96q2MP98XlXf4g7qEtrTFpbrv+rw8tZEnEk4RYll2fcaeou1pIz2gZBZTqf8WVBt9/t7tEC25QAnqv7kS75+iwytNv9npVGb86EyQgWwP+2KZ/fiipX2qbgB8Pu7VI60aB45SKavQrUaCo4Dxluo/oSS5DqvhD8Ga4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780466127; c=relaxed/simple;
	bh=lXv5kZahPDlX3u+rfhqPp5YOetqyaI9jksFmVc+82iE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MVCDhcwBKtrssba730YGOoNUgO09BXGVW1zX08YVAjJ5A6fZ1fkcsCs73HPngRpdZKin8DK6ie1G4TQZLUN2DyBEi79gyVwzyiq6Gx7iaqJ81rFaPsftZdo8OPJi5yI8RnyQJHlbVKjo7pKVnRMIA7yU8qhqLigbRIzUJOXyjGM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.132
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VAmJmeSa4p/aG0ca6wtKOip478CO2VmCA6owNn+XyFHO8NogEijJwCF0Ij+vvooR7QgOw2/FKEIgwvLgENKeSKtdCTuAb8ly/sOAX//ck9iKm9x4F0vaoF2qHFUUcTK0RSIgiIG8fLWjHdkse9HGrGXE7YDEyln6/PNUDMVRjdChJB6QV8rCNRd7icjFY3RK+LFLTzcxbDVp7xEeroBtQRQ14rDfDXEY612d92pfolzWiU2J8f1jz/ms9gP4zg/av0NHnXRHHKLJAnvNTNfYLDIFtgfp/4v52ULROoAcgtiXgVN6mO0I+dY+iYWIv/8IjesfaS6VqlubJmsmxEyLUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TyYFTWh7ExATN7isVSKq9GzHnrRsc8f3xPIwknMc000=;
 b=cfiMXImlijtjegt87e9Z3FAWt0VqRDuDvOq5nNhVuljC8j2pBnigUQbW6zo78jRTgdVscPteWFSTVaKryDBPi6JecpBbNoYJSGU2ZXvBATODu4SqSgHWnowPvOMvtXUhkzCekQWm90A9pY0+T0udLuFCkOmCMoie1JM5HTLjOECU+C14x9dyE8Sf+U3xMo0nAYwmkBtW375isLFRsyLKg9Vjc/jJb3SsqUYhMxImLSJ2EBKSiAVAY44Z7u/h4TRqg06tPxFkQUcLXiMbiYnTwe2KlNESdLlz0owus9bNPLgqIMnIgMWMTYR0zkG+0BeOKU7Ge+itUm+VfMAjpwKHcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1153.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 05:54:18 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.21.0092.006; Wed, 3 Jun 2026 05:54:18 +0000
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
Subject: [PATCH v3 14/21] pinctrl: starfive: Add StarFive JHB100 per1 controller driver
Date: Tue,  2 Jun 2026 22:53:40 -0700
Message-Id: <20260603055347.66845-15-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 33820002-94a4-4129-5208-08dec1348d28
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|3023799007|22082099003|18002099003|6133799003|5023799004|56012099006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	194e/dJJY4fMI7Ju2tsxpNXVmeWQb4zfHFYRvHpcuFX1lz9msNsv4vQUF7R1QRUoZd52dhsZMgxeL4b60tSO6DHamYQX9GZMoyBWyips25N56prsKmaij2xQc8KwJgoO9CHOrUL/bcZY50c2+Nvyy8mXdOHdaDsgeIYYXfWHh0jRiaoTqi+wRWrCzRP/SQ/maG7UWgXCdaYB2GnL7QANtuoEXy0aMgXegZqK0uhKkN++lIgSedr5CURBvHjQCkVZyrTYzZOF3IOZdhY+y9WIkSyYdq8T1ow+x1+fWS8sBdtgJbhX7xxbR2qCRdWLzrF97+pAEoEjpKThOtrFCAgWWRgdwcfiaRR5SlgdvyWjhlZohbW1blPgZAL3omKq6SlY+upN1FLAQjVkfm3CeKOTPWcy2tiVjZecy3zYmngVFculd/rnzvMXQB17GXb9La4vRu8uamVEsfwVbUWovJ6GK9jz9EiWt165ooPfWdmVs57wa2eM9UWzeISrudzjMf3v5Anj6dLltUaQTYX6B2fjqYiwUbi6Wb92vb3gQIv5r5qzzAIToN1yY2fGfowcmHSa2p1bkT8k9FLDVuP5yKaOnw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(3023799007)(22082099003)(18002099003)(6133799003)(5023799004)(56012099006)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZL4dwH1yFs5Oyn6NxaKUDCtuIuDfCeY1PFgyMTTd2yAOmS8gfVPU9FSt5SZk?=
 =?us-ascii?Q?/781gcallRI93RhLTxaV2W9CJL5xZEGJkrVUXGsJPTfaLWQrGu0XHNM467wh?=
 =?us-ascii?Q?Yv2Wd7IzwwaKxiaf30G+odL75vZ/bvFCD8+vt5wKzNNoIyHyoDr9vh+Et+yB?=
 =?us-ascii?Q?mX0gDmiDXLJPDsAoNmOyArRhurPrQbWjLvVT/86xE6KCgZJJbZ6kUJrqvj+o?=
 =?us-ascii?Q?Air8R6YB2h32qUMs/dNl58yJcV+Lsst7GcJ60J9Z+UPiubw9MZNp191bZXps?=
 =?us-ascii?Q?O2oHuUvztoha4GNW9h540F793yFzJlJHCjzYrSs34/PF6Om/pb2TkHNBPB3+?=
 =?us-ascii?Q?VA+4sKZu3ioRm1JV52+EuXIOGnFOTFi0IpmIBZkTldUFqQsRHrRa/TEYx3qW?=
 =?us-ascii?Q?rQS2XK3Qnq0WaW2JsatO320wUBq7dpeZ/SCiV4jY0puDQeV3kTQtkSTRwTOo?=
 =?us-ascii?Q?t2A4g/ES6YID+nmYje8x4ng04TzlqlrT5F1bXxIKj6rOFMoIaD5beGzXpDX5?=
 =?us-ascii?Q?iUT9ope0szaiJJSmHQQE3d9QgTw08XX8C6XL40jFqf4qKn0PdlbBVeT+0Nxl?=
 =?us-ascii?Q?j+9Ebyyy4A5ku3fxrgNW2uJTEgAOwNvAufZMTBv9gzRXjzsyJIDLFsKNV+Yq?=
 =?us-ascii?Q?48uZ0pMbatqBNGZZb/HgVgRpAd4B1E+ZiXYfwzkOrd4ajF0YotRZRsq5sdT/?=
 =?us-ascii?Q?eS6X6QSk/CX3q2lUsgGHvMOfT1OrGR78jhjST35Sr3vIwx+lGIg0EWWUOjnE?=
 =?us-ascii?Q?TQyBa7wKehvmeMTJ1Q5ODiIkjtHjZuXke/5mxbemMjWkuUycnysH0/gmHnn5?=
 =?us-ascii?Q?yaMHiH9lHIo2ggCrfAzIBdx7cIPsiCY8MNZPM1TEXKO/Vkp3LdjyYL7l3a2X?=
 =?us-ascii?Q?xcva66jT5xfDgq7lnIBS+JNNzLAwCAb9sBlnRvN1T4R5qiJ7gOuq7tTxCeHw?=
 =?us-ascii?Q?kZboaMlvnM4jC18OndfvY/A3gwHpzBpJz98utxUUQuYVoDE4CWuHN+NJmwnu?=
 =?us-ascii?Q?TNZ4hWuTFQUaMx06YUVaNQ9E1Cnr3kCEAoTRg6H9Ca+6dXt7mYpXMm0cunJu?=
 =?us-ascii?Q?tJ9KbbwQaGgDKqirDQV15b0fmUq/1FRQjrf6s2ijUVK/gkoonDcSGKZebc9C?=
 =?us-ascii?Q?QHL4kXLojSyR9og28uCkE4/vRsG+N5hjDVYlx5YLfeMuh6hRguO0fkZd8S7P?=
 =?us-ascii?Q?Pr0bKvlGoOih1LdUCBI9Oq2+2k9SoVVtRpXi0GVlBhrmBUJHmEjVyi/runju?=
 =?us-ascii?Q?ZoyYsX+YzK9OYTo+AaGIu1yEAM4Ozg3rIN+/n8jyMfSkaVC8pjUNgq7s3880?=
 =?us-ascii?Q?kB62aJD5BMdyerGBmaFcrxSSFR8ReASwcdoqpWuYcX913r5GOGZF02CAAGV5?=
 =?us-ascii?Q?00DaQ8eepj/vubzbrgiN+kD+3Ox6aMMzyzcnoc9mB/do+ZUoztIm7cTZsy5h?=
 =?us-ascii?Q?GRzi5AXj4mdz4IBJeUluUJBXwoCmF942OfkvIni1umDLrp9Sr6FJ+LPSo25B?=
 =?us-ascii?Q?KNxkfrImH4HSBYnHR3M6HZo/TVEpXpDY38j5/F+y/wvG/wNlBNNLytu44Zg5?=
 =?us-ascii?Q?odj93SD+sXBFj5OehbN4bpuQZGqBBeWx0ozaXDrb4DlVbs7g6oYKKr6uRINm?=
 =?us-ascii?Q?7rRAXw/yZNKNXRZq9CqqwY7KlovG5Kghhz9PHrRUjqQwccaAz8EfSfT8/j3P?=
 =?us-ascii?Q?i2dXLhI54+1ixt4lZdw/gyy+NLbQrwF4fSW0TnnLNEw1rWyrQstvpXIhbkpJ?=
 =?us-ascii?Q?i2eVPEYjiPS7Y4HL5WeTENyvX/npa0ovTVHCimQkbZfOpy2mrXMy?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33820002-94a4-4129-5208-08dec1348d28
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 05:54:18.4590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mzgR7IsjAleHLBWWcyT/yvfFhteKk2iW61Gd4hDoYx/yisB4HTxbKalkrJr/+I77V8WgZvpz3ASX5qCsG2bV9eTCJXDqV3Dh7UN4pLn4WbZAiRdrp3a3reawxbZ55yTI
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
	TAGGED_FROM(0.00)[bounces-37867-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,starfivetech.com:mid,starfivetech.com:from_mime,starfivetech.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E8C4B6348E9

Add pinctrl driver for StarFive JHB100 SoC Peripheral-1(per1) pinctrl
controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              |  12 ++
 drivers/pinctrl/starfive/Makefile             |   1 +
 .../starfive/pinctrl-starfive-jhb100-per1.c   | 165 ++++++++++++++++++
 3 files changed, 178 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per1.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index 1e1bfdf87c31..c3889a152f6c 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -67,6 +67,18 @@ config PINCTRL_STARFIVE_JHB100_PER0
 	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
 	  and interrupts on input changes.
 
+config PINCTRL_STARFIVE_JHB100_PER1
+	tristate "StarFive JHB100 SoC Peripheral-1 pinctrl and GPIO driver"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	depends on OF
+	select PINCTRL_STARFIVE_JHB100
+	default ARCH_STARFIVE
+	help
+	  Say yes here to support Peripheral-1 pin control on the StarFive JHB100 SoC.
+	  This also provides an interface to the GPIO pins not used by other
+	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
+	  and interrupts on input changes.
+
 config PINCTRL_STARFIVE_JHB100_SYS0
 	tristate "StarFive JHB100 SoC System-0 pinctrl and GPIO driver"
 	depends on ARCH_STARFIVE || COMPILE_TEST
diff --git a/drivers/pinctrl/starfive/Makefile b/drivers/pinctrl/starfive/Makefile
index f2bb0c35a2a0..6beef7e313ef 100644
--- a/drivers/pinctrl/starfive/Makefile
+++ b/drivers/pinctrl/starfive/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_PINCTRL_STARFIVE_JH7110_AON)	+= pinctrl-starfive-jh7110-aon.o
 
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100)		+= pinctrl-starfive-jhb100.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER0)	+= pinctrl-starfive-jhb100-per0.o
+obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER1)	+= pinctrl-starfive-jhb100-per1.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0)	+= pinctrl-starfive-jhb100-sys0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0H)	+= pinctrl-starfive-jhb100-sys0h.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS1)	+= pinctrl-starfive-jhb100-sys1.o
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per1.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per1.c
new file mode 100644
index 000000000000..26cc48313263
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per1.c
@@ -0,0 +1,165 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC Peripheral-1 domain
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
+static const struct jhb100_pin_layout_desc jhb100_per1_pl_desc[] = {
+	{ .pin_start = 0, .pin_cnt = 36, .name = "gpio", .gpio_func_sel = 0 },
+	{ 0xff },
+};
+
+static struct config_reg_layout_desc jhb100_per1_pinctr_rldesc[] = {
+	{
+		.pin_start			= 0,
+		.pin_cnt			= 32,
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
+		.pin_start			= 32,
+		.pin_cnt			= 4,
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
+static const struct pinvref_desc pinvref_desc_per1[] = {
+	{
+		/* gpioe-spi */
+		.pin_grp = {
+			PADNUM_PER1_GPIO_C0,
+			PADNUM_PER1_GPIO_C1,
+			PADNUM_PER1_GPIO_C2,
+			PADNUM_PER1_GPIO_C3,
+			PADNUM_PER1_GPIO_C4
+		},
+		.num_pins = 5,
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
+	},
+	{
+		/* gpioe-qspi0 */
+		.pin_grp = {
+			PADNUM_PER1_GPIO_C5,
+			PADNUM_PER1_GPIO_C6,
+			PADNUM_PER1_GPIO_C7,
+			PADNUM_PER1_GPIO_C8,
+			PADNUM_PER1_GPIO_C9,
+			PADNUM_PER1_GPIO_C10,
+			PADNUM_PER1_GPIO_C11
+		},
+		.num_pins = 7,
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
+	},
+	{
+		/* gpioe-qspi1 */
+		.pin_grp = {
+			PADNUM_PER1_GPIO_C12,
+			PADNUM_PER1_GPIO_C13,
+			PADNUM_PER1_GPIO_C14,
+			PADNUM_PER1_GPIO_C15,
+			PADNUM_PER1_GPIO_C16,
+			PADNUM_PER1_GPIO_C17,
+			PADNUM_PER1_GPIO_C18,
+			PADNUM_PER1_GPIO_C19
+		},
+		.num_pins = 8,
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
+	},
+	{
+		/* gpioe-qspi2 */
+		.pin_grp = {
+			PADNUM_PER1_GPIO_C20,
+			PADNUM_PER1_GPIO_C21,
+			PADNUM_PER1_GPIO_C22,
+			PADNUM_PER1_GPIO_C23,
+			PADNUM_PER1_GPIO_C24,
+			PADNUM_PER1_GPIO_C25,
+			PADNUM_PER1_GPIO_C26,
+			PADNUM_PER1_GPIO_C27
+		},
+		.num_pins = 8,
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
+	},
+};
+
+struct starfive_pinctrl_regs jhb100_per1_pinctrl_regs = {
+	.vref			= { .reg = 0x00, .pv_desc = pinvref_desc_per1,
+				    .num_pv = ARRAY_SIZE(pinvref_desc_per1) },
+	.func_sel		= { .reg = 0xbc, .width_per_pin = 2 },
+	.config			= 0x14,
+	.output			= 0xa4,
+	.output_en		= 0xac,
+	.gpio_status		= 0xb4,
+	.irq_en			= 0xc8,
+	.irq_status		= 0xd0,
+	.irq_clr		= 0xd8,
+	.irq_trigger		= 0xe0,
+	.irq_level		= 0xe8,
+	.irq_both_edge		= 0xf0,
+	.irq_edge		= 0xf8,
+};
+
+static const struct jhb100_pinctrl_func_maps jhb100_func_maps_per1[] = {
+	{ .func = "gpio",		.val = 0 },
+	{ .func = "i2c",		.val = 1 },
+	{ .func = "sfc",		.val = 1 },
+	{ .func = "sgpio",		.val = 1,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_PER1_GPIO_C31) },
+	{ .func = "sgpio",		.val = 2,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_PER1_GPIO_C35) },
+	{ .func = "spi",		.val = 1 },
+};
+
+static const struct jhb100_pinctrl_domain_info jhb100_per1_pinctrl_info = {
+	.name			= "jhb100-per1",
+	.pl_desc		= jhb100_per1_pl_desc,
+	.crl_desc		= jhb100_per1_pinctr_rldesc,
+	.regs			= &jhb100_per1_pinctrl_regs,
+	.fmaps			= jhb100_func_maps_per1,
+	.num_maps		= ARRAY_SIZE(jhb100_func_maps_per1),
+};
+
+static const struct of_device_id jhb100_per1_pinctrl_of_match[] = {
+	{
+		.compatible = "starfive,jhb100-per1-pinctrl",
+		.data = &jhb100_per1_pinctrl_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jhb100_per1_pinctrl_of_match);
+
+static struct platform_driver jhb100_per1_pinctrl_driver = {
+	.probe = jhb100_pinctrl_probe,
+	.driver = {
+		.name = "starfive-jhb100-per1-pinctrl",
+		.of_match_table = jhb100_per1_pinctrl_of_match,
+	},
+};
+module_platform_driver(jhb100_per1_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for StarFive JHB100 SoC Peripheral-1 domain");
+MODULE_AUTHOR("Alex Soo <yuklin.soo@starfivetech.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1


