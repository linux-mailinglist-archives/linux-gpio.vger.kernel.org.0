Return-Path: <linux-gpio+bounces-35492-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNXON3NZ62nkKwAAu9opvQ
	(envelope-from <linux-gpio+bounces-35492-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 13:52:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A0C45E08C
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 13:52:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A15B4300B068
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 11:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C0F93BE629;
	Fri, 24 Apr 2026 11:50:39 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2099.outbound.protection.partner.outlook.cn [139.219.17.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8273A962E;
	Fri, 24 Apr 2026 11:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777031439; cv=fail; b=Bn0T9ZWVFOLJiQv44UteRBFC39hE2nVazyRkMh79KM3M85HYwpz0Mlc9XjvXvNm8VslgeDlrO9nVWZFBUrAWbNsBkKp6apjZ+/LBUdfRVE/jQ58cuK1KPWv7KXKSO5ClKxT6aZAZZ84UXGBXWQNjwqGDwlKDvx8S5qN4fe53lgo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777031439; c=relaxed/simple;
	bh=kpR499a0C9QG6tkQB58Hrii1q1p0xhGkWidaTgyynGo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IWHk6AwdbrWjceruTcF5sCOp56TpEExAQM5NBoVt43KYbo0sZxtcz/yvIvFnAbMgiVlKamTKnp4BNPIEvOpWCIQdEKkyeYDje8yU8y4eWWqAB0+Qxb27AwVf94bZI2YbGfi3MPCvK4Wmiy7H3LBBxa4ugdOuoUpHdVL5RM2Xf40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ga92SpW7/IcDCPiGHEYU2OupUqnVdtde/jedrIRgm/gI/0vHC13yDQyVaEO7ljrU8Kp/zOQVoCrbbMVZ8yn29u3qaTNheykv4umJ0ylDmlezQG9doqdPUhvDhj1nUKjRi9wimnLzmwDCPIpKLp6eaM1j865Cmt+6YX5+tmNpljrbCWA0wLtoFSLgdTsXYC/Ta67UmUmhxXahAg5+brc7ASR8+ZOkIdglAGqEGSPC7u+OLfrhKLRsVuC0ZnORmNbuoTwFPg4Oq13d9kx5qC1a87r047UEej1muntfMXfioqx8FBNFHN5DPALff3IWNFdCLnUs+sW+FZ7Mm0r+xlPlJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o8vOaeFjpGWAkSvR6+ujUSYFb7UgKQYbBB1+5aPha0A=;
 b=H7dOo2ui5nIC94yOr6jBnujXpjCj/TqeRIIFksXmFa7gKyD99Z2XaQXWLbmVEsTlYMWmoXpDrjODfFopShvnxfECJWPGWzdGO5NeLYlKg448ie48b/VvcUQ0zn5zP2b33WWXdZiSy6fRArVpsPyGk0hNBzQoFAHvLgRM3ont2Qv/hkCotFiG1YOEDRDbty5BjsYlwA9D/JFNoTXmjv3dy2C24XdPDL8IyMDjt4/CJBPN65lv7AlglhsiYpX9LMOVA3WOfPTECgRBzv6G3abEggi1GY+9Q+5ONfCHtQivfOlj2T8DaO+jHW5RVyTPU3gkf8ET/RFv9fxXsGd0WUhpwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1156.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 11:13:51 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9846.021; Fri, 24 Apr 2026 11:13:51 +0000
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
Subject: [PATCH v1 10/20] pinctrl: starfive: Add StarFive JHB100 per0 controller driver
Date: Fri, 24 Apr 2026 04:13:20 -0700
Message-Id: <20260424111330.702272-11-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260424111330.702272-1-changhuang.liang@starfivetech.com>
References: <20260424111330.702272-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHXPR01CA0025.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::34) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1156:EE_
X-MS-Office365-Filtering-Correlation-Id: dfea425f-6b7c-4256-130d-08dea1f290da
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	xOyG+G6luOgxfzJ0UgHCMDnMUR4HRkqYe+aIzjMB9pLoEgx4VmS+/g75QRJXu8XKmd98XuHHH51RBCFZxUch0LYJTKuXEqt6hMcLIhNTZ7yIid+ZmVPpnZYQZIdVDVvt+aBr84pqzl32M8WFj4TjTM4WHBUP/WxHdfmu0IuXzlPzlWjPREOZtzLDQAoni1BOy7c6uDKD26UyYwsaByfLp5T5QXwVG8Ss7egg79UhLBQKxbNf3VUJiR1GAbGUAy+QgSz4UZv14Ijf15x+dJcqaXg9PjofWaOPMxAXSnPJ8uOyFZt1J+qUMWKszJlGLvHOZGLrCruTuTvbrHpwq6cqzibLbnYCEitYs/W70q52HMbyK8FhiC4slLEGf+suhGEJ35CH3QclX9PqmDRddz4elSydAWvSkpHjL7jCosQZfzctT3fTg7SOAkv/Pnrf6VEhbxqFSny84IRStefd8WQT8CaBbhO20sPp4PQoPfN0fLBpBRkBwmrniQ2c45aRzOWhbsnQ6oJ5sQWmy/Uc4IEkgOKi9y6SYhIQKxOMPLnXXU37rm1dfki4u80MWeuupDNKYCDsubTLTxmJKlfbTxJackykKK7cKg7WMD8u5GE/VOE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2sRY02+GSNRvZ1bZuJg/o1FXwoyBtPy8itMpAkDFLHjHTB/vYO02JzeWV8js?=
 =?us-ascii?Q?fO6j7JgIGhzjk+47vvVukm2O3MmGmrAaU1WhVjhxrqMZv1FiR+Pvb4k40h0C?=
 =?us-ascii?Q?V7cKIBFDNoO0+gFrOUZNEsf+Ppt+wu0AadtbqmNAhtMrddcNdTeV8mLFXwYR?=
 =?us-ascii?Q?cIrzG+JaUsSGfoK1MLDXXMQ3CXPak5nXIVdmEf280aqTKWFaZY878xZqtaNa?=
 =?us-ascii?Q?BXkBpL0V8uUvhSznlRZ3JjC/CddTy15eyE6xKylnYKWQrTCX3qv+oPCMBS+v?=
 =?us-ascii?Q?1xrYpJIKeYDp/W+tNI6eKq8L4PO/mbMJ2UEVrl5DcqkixNyY9Ckb1GQmVVh3?=
 =?us-ascii?Q?tTFd1cNsM8iYQITxwldwkknXsV/OyJ+KCL1qN5ZUbohCoRrEtJp96B/A9NUp?=
 =?us-ascii?Q?TELWq8whkZkHrY4ffdgkZC9TkJ3RjQBBpv/Uj/1ooWQSWpCE1zJMr/+GhL/9?=
 =?us-ascii?Q?k8VEahdtwOJlIVhCgZtfA3jBuseWXuq7rhdu2CR08CU5SmJNdYjr4WUT/iiZ?=
 =?us-ascii?Q?P64BD+jYYmzdZiX8adbZ/PQe3N0iHiE5RsLQ0H87gPikk933Dp7HembmJFLF?=
 =?us-ascii?Q?2VKEj5BiYl81vJB/A++bmh4rzuMKkEsepN+3FluK8v860zKCtFSj02+ntKSZ?=
 =?us-ascii?Q?0XpgTk2zlUdQjndcBUufCzlUDA/KIEkQX4J3VbZC5SbF8a2jSwmnozhdvN3D?=
 =?us-ascii?Q?MXTWszFVTQ/Ol2h60UG1NWU2n/+7bn/yCCIzsS8uB+IBVbeV2Z64XozpGy+k?=
 =?us-ascii?Q?DVDpxf0HhuW+XNB4VRvQEUg0tq/AtZDYM1t0R9pGxNuVSMxQa4Dws3ZpmjqA?=
 =?us-ascii?Q?dODo1Ea5aNiic1CGGYbJ3VMANdlz5ZPpJkorW0siYvtPso8HSs9fM6FbJZsV?=
 =?us-ascii?Q?a62IJ/pqgBDo6uZ27Wz/EtuJWhuK2zD0JOi95uNgoNX3esfDNEPHcdGRI40V?=
 =?us-ascii?Q?CWcV/9SxBzwKtL/tclaQ4O2Yg2xg9bly8Ut6OG5+hugb/U2rcBOghQbkuxXC?=
 =?us-ascii?Q?u5IRacXo0oMC6wkfcsHnh9GR0JB/qjuBMpqcFU21p11i8f+AGN7RWgFq6/nn?=
 =?us-ascii?Q?mSUTWjHvzi3ynDgQNFcTOURgJQ++DMJjs/qCQ+Meyvm2XgKhR7cp+TQrEOl/?=
 =?us-ascii?Q?xTL2qVZd/Aj0G4EFM1canrSSCmg9pJZx0HWYcITjTh6KTlJpE1CLyRzs1WI8?=
 =?us-ascii?Q?Ttv92U0n+8Y/3j0LM6Jn3DxJuZwKXcK2UPsaFzg7foc/BQpVgEaQloacfe+K?=
 =?us-ascii?Q?GJ9gZeIJ3nE3jXUKJj7S2dzjWf/7ri9sowycX+pBBZYt16WggBmbcR7DW1Am?=
 =?us-ascii?Q?JoAOrSSIpO3BVjE9hUNJgFHvPPBsq5TWxltZFilK6V8Zv8NLiY6RxxKqAYHf?=
 =?us-ascii?Q?EMjlQ2R6j4qlCuwVZasEqjPPjRn1wEDEIEcCs4ybYaZPg165jw1fp8C++Xi2?=
 =?us-ascii?Q?Ek4xUaqaZq/ug3IgoXERYhghyTsI2h41MJtmnR8CVLQnxoZAG6aEojRvkPgB?=
 =?us-ascii?Q?aYwKAlCU9E0D5RKgA7y4yhc5Xq0AuhO0YNlSIM0egfQeuzKMramLNt6D/7yR?=
 =?us-ascii?Q?cAK7MSmkcDAKhUEjEKzb7rZDf1Qc8IqDVOPzofvFUTj0ohgiUpjC9tgA6BsV?=
 =?us-ascii?Q?eHYguXYmdtOn6dGZ4GXKvqUiW5TIPhuy7hRzn7HNo8w/mZLGgN3YDBonJVyv?=
 =?us-ascii?Q?kJQgoZiz6nCpVT8fUBUREF8ZvRICb9di2GAULevXB4KhIBITWQadLEf4FDuZ?=
 =?us-ascii?Q?Nkl3BrBaEAS/m/H7stg2kA00AZIVhOnRiXo/jsVi1k/qqsZcjnZ1?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfea425f-6b7c-4256-130d-08dea1f290da
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 11:13:51.8559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hV6h91TOvxDv0Ml2pVb+wUHkbAMpYlAAVB+n40diAoPWychzgjrUNddLtJcZJr4tn1+d3n0WW12uJfu33KA608r0zJvc6QLE9A8AlNj3XKjTMypCvpDG3y0CnPhq74Rs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1156
X-Rspamd-Queue-Id: 79A0C45E08C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	GREYLIST(0.00)[pass,meta];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35492-lists,linux-gpio=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[starfivetech.com:mid,starfivetech.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Add pinctrl driver for StarFive JHB100 SoC Peripheral-0(per0) pinctrl
controller.

Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              |  12 +++
 drivers/pinctrl/starfive/Makefile             |   1 +
 .../starfive/pinctrl-starfive-jhb100-per0.c   | 100 ++++++++++++++++++
 3 files changed, 113 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per0.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index 7d68cf6ebd90..e5afd937c4a1 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -59,6 +59,18 @@ config PINCTRL_STARFIVE_JHB100
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
index 000000000000..bc708775d466
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per0.c
@@ -0,0 +1,100 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC Peripheral-0 domain
+ *
+ * Copyright (C) 2024 StarFive Technology Co., Ltd.
+ * Author: Alex Soo <yuklin.soo@starfivetech.com>
+ *
+ */
+
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
+		.name = "gpioe-i3c0",
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
+	},
+	{
+		.name = "gpioe-i3c1",
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
+	},
+	{
+		.name = "gpioe-i3c2",
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
+	},
+	{
+		.name = "gpioe-i3c4",
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
+	},
+	{ NULL },
+};
+
+struct starfive_pinctrl_regs jhb100_per0_pinctrl_regs = {
+	.vref			= { .reg = 0x004, .pv_desc = pinvref_desc_per0 },
+	.config			= { .reg = 0x014, .width_per_pin = 32 },
+	.output			= { .reg = 0x104, .width_per_pin = 1 },
+	.output_en		= { .reg = 0x10c, .width_per_pin = 1 },
+	.gpio_status		= { .reg = 0x114, .width_per_pin = 1 },
+	.func_sel		= { .reg = 0x11c, .width_per_pin = 2 },
+	.irq_en			= { .reg = 0x12c, .width_per_pin = 1 },
+	.irq_status		= { .reg = 0x134, .width_per_pin = 1 },
+	.irq_clr		= { .reg = 0x13c, .width_per_pin = 1 },
+	.irq_trigger		= { .reg = 0x144, .width_per_pin = 1 },
+	.irq_level		= { .reg = 0x14c, .width_per_pin = 1 },
+	.irq_both_edge		= { .reg = 0x154, .width_per_pin = 1 },
+	.irq_edge		= { .reg = 0x15c, .width_per_pin = 1 },
+};
+
+static const struct jhb100_pinctrl_domain_info jhb100_per0_pinctrl_info = {
+	.name			= "jhb100-per0",
+	.gc_base		= -1,
+	.pl_desc		= jhb100_per0_pl_desc,
+	.crl_desc		= jhb100_per0_pinctrl_rl_desc,
+	.regs			= &jhb100_per0_pinctrl_regs,
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


