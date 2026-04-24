Return-Path: <linux-gpio+bounces-35484-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBbSMs5W62nkKwAAu9opvQ
	(envelope-from <linux-gpio+bounces-35484-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 13:41:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B685645DE9D
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 13:41:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EE8533007531
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 11:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B7F23BB9E5;
	Fri, 24 Apr 2026 11:31:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2130.outbound.protection.partner.outlook.cn [139.219.17.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBF03BA24F;
	Fri, 24 Apr 2026 11:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777030301; cv=fail; b=qR8LDgGihQ3q772vZTkEB7ar8dDt8dUuX9AjzBpcWx/F6R2Kvtrpsvigg9eRFO5ZJzGxDuX8TYHYsRJnb0n6Pqo9itL20zTz4s+RMJoQgRCnXQX767Cp0gH4tXncAL1572L5SsAyONew1i7sH9EWoozAGovXf13ZpqSxUKeFA3Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777030301; c=relaxed/simple;
	bh=71DVKHuDV+KDZLCkHdP1o2ZdW6rHgmOPTzSF6ok6PXg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GhJRI8UukLNpYt36FPt3D3ZfE/mgYdDRnR888EsURaJiwcocK7fNuiZ/Ovk+ZMVE56EWVSTo2Hfqu4l8Bkjt2E7MV+AsOfVJ8aT4oAXGc6tP+yrybSQMAnhZgAu+3tcor+jhUWWh2U41nqzESDMvV2AtQ85hSFeTLRfr/kaa3kI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ms2Lchkf3u9kh+VRBk0V0m3oYdNpseMozqt1MQUI+ra9ittzXk4kfZVjMM2q7D1OhQJQqePKjktFeBR15cuInlPozBEc/v6mT0/caBL8skO+pfL6s0eZGWkKxrEIpXPxd1fT2cMKiNp6FX4xsaIwsKD0hA1sTreyo9ImmL96ISNt/YQY9s+4OBGN5OwP9c9wakQhpmpE7cP3G9uZuMWb+7NbV2y98b2aKMMXXLB1VYicjCIr7DD1JXFqjoeYs+hdhXF94C3Hb/AuMHD54I7BjQa6WzxVqatKfKy6QR2Ibsm3NwBHfKnqt29Mt38qK0gUXMPeaLYa7FXNhI0kTPOtuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XKIWBk6uEye8vAuO1pm33yRYca12RGJVU+r8NIoOUsU=;
 b=gQZ/Flvb2WkVRDW8ZOnYsN/fOeFZPqvDHARgbs/P9ZtIIezDLZW0Sj7YPiOwg/j/HWYe+0q7UgnWMILJ7xyKOuTBBQNZUlmRNjExcAAUMlEl+aoerJctn2tsiVpKs4QW0F3gBv4PBV5GHWjYCOe8hKEi0xhAZhF9/lS6amZAONKuueLujvF46vqFPFY2K1W3MadayQZHGP2fiTuEZ7int/dC1+8a0UJcRwExCRcDxWjYp1bmlWaL5DsLzvKU1d3/lc4DmGs+UcqLXPFIBsXDDRCwm7mA24KT3SON7aHJQvo9tLUTZtk0h4iSZYd1EKdWIrcwxtuYDki0ziIgAyTjjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1156.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 11:13:57 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9846.021; Fri, 24 Apr 2026 11:13:57 +0000
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
Subject: [PATCH v1 14/20] pinctrl: starfive: Add StarFive JHB100 per2 controller driver
Date: Fri, 24 Apr 2026 04:13:24 -0700
Message-Id: <20260424111330.702272-15-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: cd059695-448d-4140-880c-08dea1f2940a
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	fn3Vg3TsbboS3ujYYnsM6KLSBRbjbFNZMAbcLtE8JJ2j697O5JnIPTlrRjonqWF3dC9RWVk2Xj6NKx4YuvcVT0ZNdI+FLA2Z4G7DHWpX8iwsKLgW+cy+gRy/6T1Zb9fP6heHnkbc28WtG4jU0u6usU9RuVtAVhD2xdqkypwulti6eGWq4A6lwJoodMqM//8bXPcjU82YA0SLyuXtb1UUogOlmV8z8+pV7IT73psGzHovSqIWmbeZ1iQ+mo1y6KNbrAFooo8mdhgUwT2RHsuiju/fTncD8PO00Jw+sXCd5uwpKmBIUkJHsjW2doglOhwljs1bbfLu+avlmrqgWxSKaTf3Gn22Q2rEAQSjQHa9LurioA6EPMQqAI+2LLPjAWxFK1NN/c9Ge4+Gc8jY7nh+3szr6QWiUMUaWGH3RqYsfgXg9ikjwsxjVCZvUyBx9/DCRPBvwhSH+h5Ipz8qagb5hzLYnWWrx0886Iza8Y/5iQz8IYZavWMWF0J1wjw+lZwoVoUm3u0o8Mczlxf4yzPOp80l5WazWiYfRy3H2aSz3OU5B8kHAL/LU7PGfKCOhjWMbcgxkgTn+gsj45KO/IC5+CCU4wBNGGYPQ6g9le0hd7E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OKp6QvgT9uKScjRueS7S4LZwq7b+VZ33ZjnpxG/PMVH2U3ENAaBAtXv/yyRC?=
 =?us-ascii?Q?AEf+feUr/x1GKKjFYICK85oBbgxLGBVcyfsP9PIzSh/A/hdym1Su7lq7duiI?=
 =?us-ascii?Q?071qUuS8MtORE0UK+2epp3uoUlsCi+etVjCEjzIPZ+cj+iJiLofUHhn1B66U?=
 =?us-ascii?Q?kJVmvn0X4mikYalB0makrJ4TZQsGY9X8eA5CpEx6HAk6JBQY+5w7iZjzCQGG?=
 =?us-ascii?Q?NIG2QyURo4VgtNUnNMnuJX/F4qdpmj62U0dKFMquxsobPXarmr18JcOI2QPZ?=
 =?us-ascii?Q?WyO+QrxTLIiYRgwvUGoaeGXHTwWJueHna1S6tHdLyglHaaWsDgRE7PVO4j/R?=
 =?us-ascii?Q?gsqJ+P87FZFieCDl3zqKFrQqitu3vTBkLq81AGmRrsv3IU12+kL2ggixfU1+?=
 =?us-ascii?Q?P8/SMdMPbZ7BWWZbKq8cTkUB5lnsXokhJbxk5gYWRqdGA8vGxxoXKIfNy7B1?=
 =?us-ascii?Q?m/5zCovpcGGRzFjUYWGdnqTzuAj+N6deJe6Xht6O1dFVyfj+sD+GFyPLE9lW?=
 =?us-ascii?Q?zjK3dTyUV/uuL0pxQbTl+QbFO5sA9h1C5gHnpotxlbPDVCW2GZEhLh8LKgoH?=
 =?us-ascii?Q?i8farem8Rd4UrFJltO/Psa7f8qwmMNimJ2pKjJyTeve2BlYgQlpNitwtlkkC?=
 =?us-ascii?Q?8+GiZ0SpWkSb2PrnFrMuGKaB7ug/oO/lPMDlbL9IsdquSy4IFLyTFpN0Nw+n?=
 =?us-ascii?Q?/dK/zpTjP5DjXJ7XQb4Gffq31x/l6KnaPMQysJBw9pn+1BSTgTi4aHfL0RrF?=
 =?us-ascii?Q?fW1QTHjIocwgZcsXxiIy3VMPMt0dTiV1f52D76NAA5kBEzaLABM3Le7IUiUh?=
 =?us-ascii?Q?zemB0XiIsVrR67OKyEgd/3u6VUflpcmGKbBYBGKBxLivjPcGn2LiG6NIWCQF?=
 =?us-ascii?Q?lrJD3jQ1OB12vm7etq1tkWiIFCpbIgRYhTKF3b+CGUCnn1o1rduhGw2KH1tg?=
 =?us-ascii?Q?OdpI/iqik1b7WOx3aW6PrG/3WGudo2VtmN0NDmULxfNuApbPFIrTOFY9Eb7E?=
 =?us-ascii?Q?0nlScdqSti1A2Z4fYyljbAMCkwQCCBCScX6uBX5kUC6fWbmKnx1Qnzv99fGk?=
 =?us-ascii?Q?rbmbTfM4UZ6flWNMSvOFtWVDgd+gsm6kMNFofcDaqI0vHPWE30c6mAxOMmKv?=
 =?us-ascii?Q?n/VZg3dVxW10NXCIndFyVDsyBCDrWsRm2pBWDz7jrajOV+lBz3FNWfzwEwK1?=
 =?us-ascii?Q?GPeUsTOx5wpQqglQsC5i2a39jbHwTpUOd1I7yB2PoWJf4yaySBhEfPPt1FJk?=
 =?us-ascii?Q?6KwWHSfc4yfmS9VXUUEeV0rBV/06mUQEdOXfm9n8ba8sjT0cLj/oyWjGebdJ?=
 =?us-ascii?Q?OVTdjOLZZnOdkaj0fygZbq6PJNyxeHvUKZIQubDdUsOPhjk/3zDcg2a0BT9r?=
 =?us-ascii?Q?BvK9ikn2xzBHmQFgxsvPr9xcUhyFwo4Jkdlf8RJA7mytACcW3EXwIQkIsP5H?=
 =?us-ascii?Q?SHCAHRBwwAsKzWe16iIKBvqhN0yJKlRZ8p7OKIfrTgKtD1kv/Kw1hJZERjCQ?=
 =?us-ascii?Q?qQo8y3m4NvS+MmJGQYTZR79hJhoaxVFv096bNgTYAz8bBVT7bxsRR/B/DVNp?=
 =?us-ascii?Q?gnYq7VjFDDzROue4tcLrSBOG/7FY+D83pAEWkujMrOvYsH1u+wglfOpqxdeU?=
 =?us-ascii?Q?T+o60S9eF+DXENsQi3Zu6FC5ixloTZAo5AJXITFPnjngMhs4jIaQhmFn5Z0I?=
 =?us-ascii?Q?7BYifU5vJ03fy3ohDPNTw0AsNoqSI/Y4dWwD/xW2UALwQwSc0A566Upd76ou?=
 =?us-ascii?Q?veaMM1QD7x0p+1dfjKeifPF2xmnvx8z04ZbvZ4S5WozwOXRFYJUo?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd059695-448d-4140-880c-08dea1f2940a
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 11:13:57.2186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4QiFwjAamil2SywrehiAXly4hhhWrAvGvn1638epbqF4TVGF/SZ7yKrbPBGUNtKdMQefEV0dYCMvOwxXEK2lFgChADdf+/R/PqvpUQOibLCUcbuHNP6d+E42Zh5DUlD7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1156
X-Rspamd-Queue-Id: B685645DE9D
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-35484-lists,linux-gpio=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[starfivetech.com:mid,starfivetech.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

Add pinctrl driver for StarFive JHB100 SoC Peripheral-2(per2) pinctrl
controller.

Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              |  12 +++
 drivers/pinctrl/starfive/Makefile             |   1 +
 .../starfive/pinctrl-starfive-jhb100-per2.c   | 102 ++++++++++++++++++
 3 files changed, 115 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index c5937207b2d3..765379bf3d52 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -83,6 +83,18 @@ config PINCTRL_STARFIVE_JHB100_PER1
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
index 000000000000..d4c2927f1014
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2.c
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC Peripheral-2 domain
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
+		.vsel				= { .shift = 2, .width = 2,
+						    .func = BIT(PER2_GMAC_RGMII_FUNC) |
+							    BIT(PER2_GMAC_RMII_FUNC) },
+		.reserved			= {.shift = 4, .width = 11 },
+		.debounce_width			= {.shift = 15, .width = 17 },
+	},
+	{ 0xff },
+};
+
+static const struct pinvref_desc pinvref_desc_per2[] = {
+	{
+		.name = "gpionw",
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_2_5V) |
+			 BIT(JHB100_PINVREF_3_3V)
+	},
+	{ NULL },
+};
+
+struct starfive_pinctrl_regs jhb100_per2_pinctrl_regs = {
+	.vref			= { .reg = 0x00, .pv_desc = pinvref_desc_per2 },
+	.config			= { .reg = 0x04, .width_per_pin = 1 },
+	.output			= { .reg = 0x80, .width_per_pin = 1 },
+	.output_en		= { .reg = 0x84, .width_per_pin = 1 },
+	.gpio_status		= { .reg = 0x88, .width_per_pin = 1 },
+	.func_sel		= { .reg = 0x8c, .width_per_pin = 2 },
+	.irq_en			= { .reg = 0x94, .width_per_pin = 1 },
+	.irq_status		= { .reg = 0x98, .width_per_pin = 1 },
+	.irq_clr		= { .reg = 0x9c, .width_per_pin = 1 },
+	.irq_trigger		= { .reg = 0xa0, .width_per_pin = 1 },
+	.irq_level		= { .reg = 0xa4, .width_per_pin = 1 },
+	.irq_both_edge		= { .reg = 0xa8, .width_per_pin = 1 },
+	.irq_edge		= { .reg = 0xac, .width_per_pin = 1 },
+};
+
+static const struct jhb100_pinctrl_domain_info jhb100_per2_pinctrl_info = {
+	.name			= "jhb100-per2",
+	.gc_base		= -1,
+	.pl_desc		= jhb100_per2_pl_desc,
+	.crl_desc		= jhb100_per2_pinctrl_rl_desc,
+	.regs			= &jhb100_per2_pinctrl_regs,
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


