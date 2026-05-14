Return-Path: <linux-gpio+bounces-36827-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id F3MTCXOwBWqHZwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36827-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 13:22:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A2214540ED5
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 13:22:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 04FCF3016B52
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 11:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BABE3C378A;
	Thu, 14 May 2026 11:13:08 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2134.outbound.protection.partner.outlook.cn [139.219.146.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAB33C13EF;
	Thu, 14 May 2026 11:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778757187; cv=fail; b=UIUVCKr0F/v2fS1wahNH1y9Koy8Pw8HE1TFvF+aoDN76B0/qw5WAgUESq5Irq4NwNNgbAZ++UJepXj0mSgJs6vh0jHpAWjqZM/zwWQ8BS0f/TlKXmli90f5oZ9jM2zLckhxGCsyLL1wxga+InnJ+656DDZW8YAlehlQDckznA9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778757187; c=relaxed/simple;
	bh=noMozoAewIGGQZ0X6ukTpqne9N0siyO+EEHYcUuqSRc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PSQLxV7OX1Xx4mkn9ebKD3TI77z3azEpzlYDr0rTf14NfzOwZ2B104s/K6CoPr/BzbyzV34DpA8w1Id9u8SpkUAWd8q8Fq0xXubKUGPpyhs9AZRErU65b/NHJr4XaF96nrvDDfO//RWjftGxMgPO/jC2gzQInDoSsLEw9dMedrA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MFj3WalBBKblCewTlONFTQaeTZfD7nZ21OP36KI+tEevhqcwZAKI1pjOZn3zXQh/oWSKjztaQWf/q2h2GEzmIs32jYrpQ/30R+bIMKdmXXOPY/Cm6TDLIa65aNLCTnrCrM1eqAFJfLSuc2OTBfwulwKolgucsRCCVL8M/S2rKMJJVzTA5CW/lIoPOq/Zi7DyhcpFhEX8JnVyzEO3S7ue4eWs3ORokyQL9Q6CvNjFf5HZbogleXtIYxDtzuHMTWvW2cNhb8/d2D2wvx4xvpqCBl7xJMYlbAB57DsShdNMPRt56gywKFEsr3fAH3WGW4VqKMoQBFBOa1He+dYvDyopQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5BuJpWowvLwqTfDYZUfXpozkcUxnDT2v6C9YPVoGtIo=;
 b=mT0JiLICFk4sU3pEd+By+DUWF9LhWHLnV4KB9jGWkzAEA+1Ta+mvXREdhgmvN9Vt8PXMDlQuICTV8TQM204DT6AgAcfRfyCNiRg9c624H4KXZZGc0oLeFKPEenT4ynDhlcaiWZ4QlaCv4aWbk+DoDiMxLlkG280TUdJlwoEyi/UL4U8Qgvs26oQJPrGTuREBVUNeu1AWO1SOoL3JI7GboMSK+mdMrr5Pw2Aff/qiTmn2GQpWc/zQw0CpKUdhv04qOcoiQHxOe6vY2EjPDh4SXVN8ZLazQBkD0T+zE+ZprxzqTp4QxVBxC5t5pRIudTyCRVB50p2bS1X6Rw6p8plTPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1139.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.25; Thu, 14 May
 2026 11:12:51 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9913.009; Thu, 14 May 2026 11:12:51 +0000
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
Subject: [PATCH v2 17/22] pinctrl: starfive: Add StarFive JHB100 per2 controller driver
Date: Thu, 14 May 2026 04:12:13 -0700
Message-Id: <20260514111218.94519-18-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260514111218.94519-1-changhuang.liang@starfivetech.com>
References: <20260514111218.94519-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0028.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:2::18) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1139:EE_
X-MS-Office365-Filtering-Correlation-Id: aa6aca7c-45ef-4172-b992-08deb1a9bd1b
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|921020|38350700014|3023799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	KYo9ZbzFWMmGx0x769ZAjbofjStLoJ1oWVt+JsDBw8lOVM3CxsLOSkpb1aqjc6C7FVBVkc9R1Aka73WbDp1PK/sl9DShqtojmB8muW6tdUpOcWnduRI+7f6bA90QSjNAg5qvwbWGLg5R5iSy682R5UK5+VDwDyacgQ8YhYHpRuPpdxjLG28dJVekyjXYAQoQnZi4H0LIp2kadQkycqq326KHtf1803cCTfz+8jK7E3GVCtDiIK9W27O+VxOYQ0sHKCqGSNfJyOCs4C7EE9fkkc6kf/HYZl5ZL5+ps119jbqunpYTxFt143Kax0PXE5h/TOOloynyNthGe6f8FO+wYxRUuYZzHAQx4rm6v6Ip8WzoFQ70dqjlHcsVBlX3S6ppWRQzXSDq0558ncL0i8n37+8/tV0dYF80zzMzZdrlhJOnKD6xj/jWrRMFbpM6mLJICT/kYtLLdF+0seKjdqkd5oRPoZCwcBDW7/KGfQ/ii8K+c9FbxtgyeYtsHENhjeiqpgMcKE+SPJcGKrLmBMxkm9jQ2qVou1ahHtjD2r9bo2WgXGugFVwQp1qha54og6F6CnhPbHnhbrMPykuxcUSevQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(921020)(38350700014)(3023799003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ncn+WQKTtD4vRffxuLPzatPWStiVhmRtkm3G2BYWP8iwq5KnjRdt0CF//77G?=
 =?us-ascii?Q?ZzWJDpJ3/wKEa7O1k0Kzr/RidHJkbFZ50n8XLvMW78W0RwHSJ9cFuNdfh/mw?=
 =?us-ascii?Q?l1eD8T/Rr/5sIyPgf2H83WV47WZxQb3uv77Y1hogGfPTI8IuhV6YFBC4pOQD?=
 =?us-ascii?Q?bEDAExwdXPDoQaXFwMMKj9E+kWblWu1XJa+RIJihD1VZMflbCxLvMXvbxKU6?=
 =?us-ascii?Q?YDPLmk8/+G5Zh/AjxS6TGJPJvCffF3E7igGBUF/iJjxbTsE/7Y0y9TfL/GBu?=
 =?us-ascii?Q?dIJHSUbC7cCnrUxtiJjk7tANkVglG+sGxFpVqrKulIUtzYJqU5WBaZT7PaXF?=
 =?us-ascii?Q?gdhhdYkMHdXVisO2BC3cqlDQ9ymMxJ6CugQUpcWpy5BVXIhnMm5nnBKmIq99?=
 =?us-ascii?Q?U45976hmrERBciAu6JvB6Omd3EHwb3b5YXvHqueRsukPbkqOR56DWsg4f2Go?=
 =?us-ascii?Q?5Sg9LkQL/Dg/dHMQEQcSxZNUVdCVM/PjZxVYdMpBK/cSv7oIYaihzPm9zk3p?=
 =?us-ascii?Q?nm8OvEIpeV+R8ZdL7i9OXBygOgqptliletsHfKdnv8n5ygt107OiD0P7s5BK?=
 =?us-ascii?Q?/dmm8CS4S7XfoPg0PMpRo75XtnYmMD0583e/hqv7MxFVzrsjI9OI34Svb2Ex?=
 =?us-ascii?Q?NrNZyGDxW/Itr9eD5ZRme39WvHFrXuq1OC3eKBAaz0L1Qw5C5D42gQas5y26?=
 =?us-ascii?Q?x94McRrqfNp35gaAfv7XrlYcDElW7huH5/K8oia4xcZDRO6pY9QxjLqPUJyw?=
 =?us-ascii?Q?sXymDRNOFWcktrNiHGMoPpryWPAip55idCzpIcCliT6UgxqTQIqLYoqXGeju?=
 =?us-ascii?Q?VvMmrAPHzu3dYGhWkG+o1KOSkWVfPTV24DiUs66Xe5zmdIhDsIzYKQOl1o9X?=
 =?us-ascii?Q?yuaEQM/5bEoVE1iaqzW+3nGlHXktP3cEY+hFr3E0waPrKxyt5PUCDoKHTyg7?=
 =?us-ascii?Q?jezOzXn2JAve9oCtJoadgBm6tbUKDJ/RncEe+k+xlHwsiQNfTWEjbMjYgq1i?=
 =?us-ascii?Q?gWk28KlfYX/OeNG9Em+41xb05knG6C081a65bJqRPE1pcJR4V1IAi50+qOvs?=
 =?us-ascii?Q?QftLjBQSZ2pPfakmzmM0pqz8MTS6j2e+SHOnpnToaI8bIb7beoqy2To+bMJb?=
 =?us-ascii?Q?u+8yZlJYNArwWuR+U+ucRZ3jW8RunQcM7Ok5iAdcETtnmtkM8s/HXuSMNyeO?=
 =?us-ascii?Q?3oySt2eli7pC/TOUrqzulvY2FTIF53rxb+nRWMqJG5M0GSX/YeeOMffOLbBP?=
 =?us-ascii?Q?zJjH1+dMDLcHW6egatUhW3lh/hW8Pc/uLabci/94Ny7nBzRnubBkfbod9i6H?=
 =?us-ascii?Q?QSMtYPJ1sx5vFtIdpdmEBInMWjNfE7rv8xkWBFaI8GAaApviWrY66GS6I9N8?=
 =?us-ascii?Q?wLIu48gW59MCF2ncmrFYddcP51DhM5o1NDENMLfa3cisI3ksS1AFIenxETN8?=
 =?us-ascii?Q?MsHapRwK3U9iE4QVSfS/ykJzLOlXLQeGBqx0HqZiwiuaOns206C3G9pwTNKG?=
 =?us-ascii?Q?jlXdP35znBKYoGHyMLzunAofJ2NRKOL78Hx4gOlFK+zZ5o1tCeafAomrBcIZ?=
 =?us-ascii?Q?N+IUb9HPgxX8j1GXMZ1RsMMAtlTa5dbGfydT4GJdo1ZgxGzgjqLHxItEap/O?=
 =?us-ascii?Q?Y89DSEkX+OKp0YMV1YYaK8pyvo6Bc9MJtB2IAXaOk1MxfjkkVHKaCN1HOUZJ?=
 =?us-ascii?Q?t+YlrsU1zDsBBom1pP0nu4HmxxCPar6bHGCzdFpheYkAx3HU9jRD8aoS8oTz?=
 =?us-ascii?Q?OuZ+daxBtagxcRko4Bf5uRR3J8oOJtQrMr1dUJohMyu7AfSvm8x0?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa6aca7c-45ef-4172-b992-08deb1a9bd1b
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 11:12:51.4605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K/BJvuRVx4slgT98rf1kkFl0LGt4JYk1gpqtgmxTquycDJlNaCoCBHtF0eY0OXafohuXYD72hg7t/f6ekWivuSuSN8i2NH05b00fVtVDrF0pmohBKdaNRjQj2EqtA8/a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1139
X-Rspamd-Queue-Id: A2214540ED5
X-Rspamd-Server: lfdr
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
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36827-lists,linux-gpio=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.897];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,starfivetech.com:email,starfivetech.com:mid]
X-Rspamd-Action: no action

Add pinctrl driver for StarFive JHB100 SoC Peripheral-2(per2) pinctrl
controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              |  12 ++
 drivers/pinctrl/starfive/Makefile             |   1 +
 .../starfive/pinctrl-starfive-jhb100-per2.c   | 126 ++++++++++++++++++
 3 files changed, 139 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index c3889a152f6c..edc3b6d9c8d7 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -79,6 +79,18 @@ config PINCTRL_STARFIVE_JHB100_PER1
 	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
 	  and interrupts on input changes.
 
+config PINCTRL_STARFIVE_JHB100_PER2
+	tristate "StarFive JHB100 SoC Peripheral-2 pinctrl and GPIO driver"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	depends on OF
+	select PINCTRL_STARFIVE_JHB100
+	default ARCH_STARFIVE
+	help
+	  Say yes here to support Peripheral-2 pin control on the StarFive JHB100 SoC.
+	  This also provides an interface to the GPIO pins not used by other
+	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
+	  and interrupts on input changes.
+
 config PINCTRL_STARFIVE_JHB100_SYS0
 	tristate "StarFive JHB100 SoC System-0 pinctrl and GPIO driver"
 	depends on ARCH_STARFIVE || COMPILE_TEST
diff --git a/drivers/pinctrl/starfive/Makefile b/drivers/pinctrl/starfive/Makefile
index 6beef7e313ef..33213bd1919f 100644
--- a/drivers/pinctrl/starfive/Makefile
+++ b/drivers/pinctrl/starfive/Makefile
@@ -9,6 +9,7 @@ obj-$(CONFIG_PINCTRL_STARFIVE_JH7110_AON)	+= pinctrl-starfive-jh7110-aon.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100)		+= pinctrl-starfive-jhb100.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER0)	+= pinctrl-starfive-jhb100-per0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER1)	+= pinctrl-starfive-jhb100-per1.o
+obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER2)	+= pinctrl-starfive-jhb100-per2.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0)	+= pinctrl-starfive-jhb100-sys0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0H)	+= pinctrl-starfive-jhb100-sys0h.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS1)	+= pinctrl-starfive-jhb100-sys1.o
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2.c
new file mode 100644
index 000000000000..b3af13abcffa
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2.c
@@ -0,0 +1,126 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC Peripheral-2 domain
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
+static const struct jhb100_pin_layout_desc jhb100_per2_pl_desc[] = {
+	{ .pin_start = 0, .pin_cnt = 15, .name = "gpio", .gpio_func_sel = 0 },
+	{ .pin_start = 15, .pin_cnt = 1, .name = "gpio", .gpio_func_sel = -1 },
+	{ .pin_start = 16, .pin_cnt = 15, .name = "gpio", .gpio_func_sel = 0 },
+	{ 0xff },
+};
+
+static struct config_reg_layout_desc jhb100_per2_pinctrl_rl_desc[] = {
+	{
+		.pin_start			= 0,
+		.pin_cnt			= 19,
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
+		.pin_start			= 19,
+		.pin_cnt			= 12,
+		.input_enable			= { .shift = 0, .width = 1 },
+		.slew_rate			= { .shift = 1, .width = 1 },
+		.vsel				= { .shift = 2, .width = 2 },
+		.reserved			= { .shift = 4, .width = 11 },
+		.debounce_width			= { .shift = 15, .width = 17 },
+	},
+	{ 0xff },
+};
+
+static const struct pinvref_desc pinvref_desc_per2[] = {
+	{
+		.name = "gpionw",
+		.pin_grp = {
+			PADNUM_PER2_GPIO_D19,
+			PADNUM_PER2_GPIO_D20,
+			PADNUM_PER2_GPIO_D21,
+			PADNUM_PER2_GPIO_D22,
+			PADNUM_PER2_GPIO_D23,
+			PADNUM_PER2_GPIO_D24,
+			PADNUM_PER2_GPIO_D25,
+			PADNUM_PER2_GPIO_D26,
+			PADNUM_PER2_GPIO_D27,
+			PADNUM_PER2_GPIO_D28,
+			PADNUM_PER2_GPIO_D29,
+			PADNUM_PER2_GPIO_D30
+		},
+		.num_pins = 12,
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_2_5V) |
+			 BIT(JHB100_PINVREF_3_3V)
+	},
+	{ NULL },
+};
+
+struct starfive_pinctrl_regs jhb100_per2_pinctrl_regs = {
+	.vref			= { .reg = 0x00, .pv_desc = pinvref_desc_per2 },
+	.func_sel		= { .reg = 0x8c, .width_per_pin = 2 },
+	.config			= 0x04,
+	.output			= 0x80,
+	.output_en		= 0x84,
+	.gpio_status		= 0x88,
+	.irq_en			= 0x94,
+	.irq_status		= 0x98,
+	.irq_clr		= 0x9c,
+	.irq_trigger		= 0xa0,
+	.irq_level		= 0xa4,
+	.irq_both_edge		= 0xa8,
+	.irq_edge		= 0xac,
+};
+
+static const struct jhb100_pinctrl_func_maps jhb100_func_maps_per2[] = {
+	{ .func = "fan_tach",		.val = 1 },
+	{ .func = "gmac_rgmii",		.val = 1 },
+	{ .func = "gmac_rmii",		.val = 2 },
+	{ .func = "gpio",		.val = 0 },
+	{ .func = "host0_port80",	.val = 2 },
+	{ .func = "host1_port80",	.val = 3 },
+};
+
+static const struct jhb100_pinctrl_domain_info jhb100_per2_pinctrl_info = {
+	.name			= "jhb100-per2",
+	.pl_desc		= jhb100_per2_pl_desc,
+	.crl_desc		= jhb100_per2_pinctrl_rl_desc,
+	.regs			= &jhb100_per2_pinctrl_regs,
+	.fmaps			= jhb100_func_maps_per2,
+	.num_maps		= ARRAY_SIZE(jhb100_func_maps_per2),
+};
+
+static const struct of_device_id jhb100_per2_pinctrl_of_match[] = {
+	{
+		.compatible = "starfive,jhb100-per2-pinctrl",
+		.data = &jhb100_per2_pinctrl_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jhb100_per2_pinctrl_of_match);
+
+static struct platform_driver jhb100_per2_pinctrl_driver = {
+	.probe = jhb100_pinctrl_probe,
+	.driver = {
+		.name = "starfive-jhb100-per2-pinctrl",
+		.of_match_table = jhb100_per2_pinctrl_of_match,
+	},
+};
+module_platform_driver(jhb100_per2_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for StarFive JHB100 SoC Peripheral-2 domain");
+MODULE_AUTHOR("Alex Soo <yuklin.soo@starfivetech.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1


