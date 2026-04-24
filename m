Return-Path: <linux-gpio+bounces-35483-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EWMHIRW62nkKwAAu9opvQ
	(envelope-from <linux-gpio+bounces-35483-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 13:39:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3428145DE2C
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 13:39:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A786D3019C8B
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 11:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 996F03BA22C;
	Fri, 24 Apr 2026 11:31:38 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2130.outbound.protection.partner.outlook.cn [139.219.17.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD233947B0;
	Fri, 24 Apr 2026 11:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777030298; cv=fail; b=SvcaQ1cBc9qWhPUmbaEYhArppUOyebaqH65ubPtF3Ch2o6oCPfs1JzCk71ZWi6cSXiUErHt7AN7Us41SXBDQrua82aNZgPi0I7OY1wK50XvkpBez/hY1asLw7k0xwU14Bqgpwveh1BDtn4jBfBJ86Hj6BoNy447ltFDMhfp+VcY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777030298; c=relaxed/simple;
	bh=Relx63zse047sx/dv6hN7sE3KUbVYG9Z9KxQyRgtvCY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ohgx8KtQKYTVaC7wVAW+aeoN2yOr8o3KUvn/CE6EnuHJsm1dTHgQ1/kT0pplknCza2kY0U9S+Hm8ZVzcZiamsKoZsWPup8yQS58SUBmCel4IpiqttnMP3qu3hcddp5aRH08tMSOkVVbEMZvANxJfG4H4Ts3YiZsL3uLAcGfRcdA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qe2yczIFfC+n2QzXrlk4prQH9lf/yyz5+m6BgL/+5VODik5C7/Gx/jEXKWYjoxgfAto1mjbxlQEJ2sZ7Peid6mAscNwCe8q7y7i3kllnSkUqHEiSxZ9quzSWVNESV8zqk+0ORwSce/F2OBQGUJgly9DaWPcouFTxmwP5eWQYHeYQsmpR/kbDlc/rMet4B4zOBl/91gzJvOhAqC/LTTjR1RMrocsRjw18QXn9CeYrnHQVZVAWHWd0OnLFb4tGydjbEXbc0ye+IOMf0Nqa4V6NtcLHxeQRezYh6NH3wBYJ+k8k4tbmqDoYxcsJtHA2aTFvW54J7rF2HJW1FHEjWQZzNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yZrtsDgIuKH6PtrhZuvSK9dRADdHPR9pp0sw1LFagfM=;
 b=gCqkjeANb07W53LxYbt4EJtSKYJDdG5dZvH++BSnWdBO5zdyJP0Zf5imxisOJ0wlua7L3egGHnOnaPv/hTCbMYVgGButdUp9ZtySKPhZVJgSVFGyQRwhDUVPgUiTHmjUozXjQgUG5wxTGS1NdvT4ikfjc5SAWc00GbQx4FHXHE+4v8yb52MgJd6rACfNszuIRVcoJNECqXZ0DrJv4NJArTMJnUuQ7JuHDQfZNQMxZEzSrRE7fr9fCXfH0nK5vduavJ5MQ2bfWCfi/VAWK5kwrGc1curi/nNVZ7HxpChKj/sRxzHPELDb+w49q/VsuWOWL20/ZQvs1QocpiSSDugCcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1156.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 11:14:00 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9846.021; Fri, 24 Apr 2026 11:14:00 +0000
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
Subject: [PATCH v1 16/20] pinctrl: starfive: Add StarFive JHB100 per2pok controller driver
Date: Fri, 24 Apr 2026 04:13:26 -0700
Message-Id: <20260424111330.702272-17-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9a3548dd-999a-4a64-73c9-08dea1f295af
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	gYazQT+BEQNNuOBRS2aZKWAcjnv5yOWpFZYX0N1+qMa2N7FF4zmNIWXIPNCjKhIPx3/Jx2DjuFzJmbFOnJDdXufY4sTZE2P/5OOuZCnholwEdu//Oj95E4YopJNoBCV+In0Uc1LIEunqIQpaUb2bJ8YwF1uXA4mxJkIh7l0yskJDii+aIlNynV4kugsakCcL486GjTJqc8zi88139jHZJ7a+6U2Exgbq/qidFd08bNQCFbQpsc/whmkNyyBoeg5BA0Io3r86KLt77JtntDf+h3rQqh30PuGIujl8Xfd0PBd5Bll11h3tJfzZ4PvRkvlXIsTz8gsWZY1V6Of5OcFJ7ZMUO81FudYwgWVZXVlPpksq1PeQG5pis1jTSYMcLYx4pvdNCKKEumkE3rp7YEOiBLxjp0vk2GGSKcpjuPuOcDFmtPa62yO5yJUTuzS/QEsZptpn52IHxHjgD0mG8566HRg8TW9nXc9sknStnU8fuI4RWY5eTe0TaGZrfhH11eTvaJPKRykZLBvh27cDDhNBw/tiHUGn44miQV+oSwShPl88fnBQto5fAHpuU8KZX7qSQGCcrKq+bVt/Y/3e4NNca/cpY/jFuihSdVlOhAVZ3nE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pu55isGctqvHjoz2YEZPwsDjqJzqTQbC0lUEg31+lilXPeq218fzmXO8lNhK?=
 =?us-ascii?Q?LYA2DG4LP8cXXG98zYKzIjnT3GYX1k8aI7VveH+OeI2ZRWckRx8jHfhy81MT?=
 =?us-ascii?Q?XDg/lIhpMSFxNmE9EzM//SnFSNcsfSoLtzvZumkAJXuPhlQFgaYfHD8ts+Nj?=
 =?us-ascii?Q?Y0CF6O4oUz/FclXofa1axCeCklMOP/5Of4PvHxUxcxhoqeDUdebA7NnWBg2H?=
 =?us-ascii?Q?2dcuwh8TBdGFWMSi3eRDwzhpUSrweMNKTeatZiSOWwCQxwxzlnVjFVTZbQ4k?=
 =?us-ascii?Q?tLYSABUF33659vm7MBYhWJlmt3ZoVhR5RrBW75l7jFVOrjVJ7FwhcOsPIUaC?=
 =?us-ascii?Q?7zYUV9aA4xMozQ7RsyeaeKreNwILv7JIm2/Td0KA/wrIZwR7XOV6Jq2EBBXc?=
 =?us-ascii?Q?eMqpWvPWc69umCTh9IuA+m8tdgW+ac6+7EfyS59c+G9GffzzEzkWGpR9vAKu?=
 =?us-ascii?Q?RXwVQNX6H7oUcpLqoYvcJsvCtEyqvmCTHyaQoVOo+2pwjZIVKu9FjQjPW2md?=
 =?us-ascii?Q?XOKLfupF9cHc1v7a22eJiPvzHFZPKiAdznPKyHsszGwBNNHZ5q6GrI/Je0cx?=
 =?us-ascii?Q?OY10qPExMn2rkgb+X+9HRxh0OXtU0rPL2us1CAGgVV26aCOo9rCM4mirlMa0?=
 =?us-ascii?Q?2uab6e1fP2qV4tS9XxFjWGaG9/+e7oLs2HzA6Rk6uCiFddXNh8TUr6yoCOcz?=
 =?us-ascii?Q?4zQR4vQO63gl5UB40Oca/b4D8np5fYiOrmtEfbq820cWOc4kb8AlRIZWZTqe?=
 =?us-ascii?Q?ddSXHfqNS2hEIZ18rxB7N5ZJFQkruwNYdup9EeVWcRZDkQ4yv1lluPhmYbA0?=
 =?us-ascii?Q?ub2lsL5o9HUp82miyNcB5CA9Ghu/9lWIXsPnNWqHxjJZdCcmdHly1N0h7GE7?=
 =?us-ascii?Q?xpX2H8/BSIUiaFvfz7uIdPNt4rjTWUMRR0Iw+jho77Mo2UJc676WM3la2t3O?=
 =?us-ascii?Q?nG8i9notAEpaE7LN5HNRRMl1AnncxXl+VKhN044JBZBAtgQDRr8cal9bgTXb?=
 =?us-ascii?Q?v+kfJWnA91ZWUM/Xu76QjJc1xBl9qJp0u/st3TqelPtHlDP/a3nRuWH3T8m+?=
 =?us-ascii?Q?G3Te5TIgHRmgL0fxtxhOEd0VyyvJGmtekV/4IqkV3moMjWcz+Nm8i+ErZTQL?=
 =?us-ascii?Q?lP2/4cFyPA8bMxdJ8E6Bqa1R0HjltqY2hVteAurIK1rK+D41WfMd7B9Z8Hxf?=
 =?us-ascii?Q?EhvIzZN0tWWscvwUfmv1Y54LRPmbjLlT+lzEA4AeumEp0GkNYQdpLVKxjKeH?=
 =?us-ascii?Q?coaYD9bSkjxVWcliCNb4KNY97iByEvQ1pMpzqG0GODsS1LlCEZjOQUjyteSR?=
 =?us-ascii?Q?2oWozKtaFvgsgBZOTsedAQIxWqIC3zDg2wAmyeoXcFBWsFScK4qLN3a9wldi?=
 =?us-ascii?Q?807edzgk5vIXn1XtM8lFGE5MtEykxIh89wJkibKo2pNz1hOz3YjyuUZZhTon?=
 =?us-ascii?Q?yuZ8/FE+xBeXN07t5sl40kRQoWrT8o+/1TxfPMYLnt8dPVSoSzAfP2kgG7Hk?=
 =?us-ascii?Q?P0ARLyqKZ7wGgtUY+7Fb2XfMao1Nddlp1kmqPLGePZmIn7fkO5ZFzLz7CQLs?=
 =?us-ascii?Q?D3UX+ax74aJf1p9mJMchpcuePEVUEkZ28cM4Y6NNws4g4DIMy22R5jzpWZ9y?=
 =?us-ascii?Q?1X+jfGzZM5J3Wo7SlRWjv3fuAEBjRlvhmnL+bzaM7G3FnzxjrDN+NMvLXDdd?=
 =?us-ascii?Q?jVs0KHvvQWE0YzvbTS2vyhUTNwBx6A8W0beSv4SS4ycDtJyypaJsuF1NONRS?=
 =?us-ascii?Q?fyopKhzjUQB5PVHQkL5DCrV4T59uBNSNaff4OrU3Od+wPhBdkMIo?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a3548dd-999a-4a64-73c9-08dea1f295af
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 11:13:59.9707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cV79yW8AvtH/dkATeW1C2Rlhh6/bSHsNDJuLXVg4gU5szTbkHkMr6WauC9T0AKvcfYCnYeLjxPGvA8LXM97Q+Uy8uSjoCeR0c/LgesFJdZ5ia+zrgEJBEo3uGpkypWQu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1156
X-Rspamd-Queue-Id: 3428145DE2C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35483-lists,linux-gpio=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[starfivetech.com:mid,starfivetech.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Add pinctrl driver for StarFive JHB100 SoC Peripheral-2 Power OK
(per2pok) pinctrl controller.

Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              | 12 +++
 drivers/pinctrl/starfive/Makefile             |  1 +
 .../pinctrl-starfive-jhb100-per2pok.c         | 80 +++++++++++++++++++
 3 files changed, 93 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2pok.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index 765379bf3d52..ed29f87e9d7a 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -95,6 +95,18 @@ config PINCTRL_STARFIVE_JHB100_PER2
 	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
 	  and interrupts on input changes.
 
+config PINCTRL_STARFIVE_JHB100_PER2POK
+	tristate "StarFive JHB100 SoC Peripheral-2 Power OK pinctrl and GPIO driver"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	depends on OF
+	select PINCTRL_STARFIVE_JHB100
+	default ARCH_STARFIVE
+	help
+	  Say yes here to support Peripheral-2 Power OK pin control on the StarFive JHB100 SoC.
+	  This also provides an interface to the GPIO pins not used by other
+	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
+	  and interrupts on input changes.
+
 config PINCTRL_STARFIVE_JHB100_SYS0
 	tristate "StarFive JHB100 SoC System-0 pinctrl and GPIO driver"
 	depends on ARCH_STARFIVE || COMPILE_TEST
diff --git a/drivers/pinctrl/starfive/Makefile b/drivers/pinctrl/starfive/Makefile
index 33213bd1919f..213002da9cdd 100644
--- a/drivers/pinctrl/starfive/Makefile
+++ b/drivers/pinctrl/starfive/Makefile
@@ -10,6 +10,7 @@ obj-$(CONFIG_PINCTRL_STARFIVE_JHB100)		+= pinctrl-starfive-jhb100.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER0)	+= pinctrl-starfive-jhb100-per0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER1)	+= pinctrl-starfive-jhb100-per1.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER2)	+= pinctrl-starfive-jhb100-per2.o
+obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_PER2POK)	+= pinctrl-starfive-jhb100-per2pok.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0)	+= pinctrl-starfive-jhb100-sys0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0H)	+= pinctrl-starfive-jhb100-sys0h.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS1)	+= pinctrl-starfive-jhb100-sys1.o
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2pok.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2pok.c
new file mode 100644
index 000000000000..31ff047e63a4
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per2pok.c
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC Peripheral-2 Power OK domain
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
+static const struct jhb100_pin_layout_desc jhb100_per2pok_pl_desc[] = {
+	{ .pin_start = 0, .pin_cnt = 10, .name = "gpio", .gpio_func_sel = 0 },
+	{ .pin_start = 10, .pin_cnt = 8, .name = "pwm_channel", .gpio_func_sel = 1 },
+	{ 0xff },
+};
+
+static struct config_reg_layout_desc jhb100_per2pok_pinctrl_rl_desc[] = {
+	{
+		.pin_start			= 0,
+		.pin_cnt			= 18,
+		.drive_strength_2bit		= { .shift = 0, .width = 2 },
+		.input_enable			= { .shift = 2, .width = 1 },
+		.pull_down			= { .shift = 3, .width = 1 },
+		.pull_up			= { .shift = 4, .width = 1 },
+		.slew_rate			= { .shift = 5, .width = 1 },
+		.schmitt_trigger_select		= { .shift = 6, .width = 1 },
+		.reserved			= { .shift = 7, .width = 8 },
+		.debounce_width			= { .shift = 15, .width = 17 },
+	},
+	{ 0xff },
+};
+
+struct starfive_pinctrl_regs jhb100_per2pok_pinctrl_regs = {
+	.config			= { .reg = 0x04, .width_per_pin = 1 },
+	.output			= { .reg = 0x4c, .width_per_pin = 1 },
+	.output_en		= { .reg = 0x50, .width_per_pin = 1 },
+	.gpio_status		= { .reg = 0x54, .width_per_pin = 1 },
+	.func_sel		= { .reg = 0x58, .width_per_pin = 2 },
+	.irq_en			= { .reg = 0x60, .width_per_pin = 1 },
+	.irq_status		= { .reg = 0x64, .width_per_pin = 1 },
+	.irq_clr		= { .reg = 0x68, .width_per_pin = 1 },
+	.irq_trigger		= { .reg = 0x6c, .width_per_pin = 1 },
+	.irq_level		= { .reg = 0x70, .width_per_pin = 1 },
+	.irq_both_edge		= { .reg = 0x74, .width_per_pin = 1 },
+	.irq_edge		= { .reg = 0x78, .width_per_pin = 1 },
+};
+
+static const struct jhb100_pinctrl_domain_info jhb100_per2pok_pinctrl_info = {
+	.name			= "jhb100-per2pok",
+	.gc_base		= -1,
+	.pl_desc		= jhb100_per2pok_pl_desc,
+	.crl_desc		= jhb100_per2pok_pinctrl_rl_desc,
+	.regs			= &jhb100_per2pok_pinctrl_regs,
+};
+
+static const struct of_device_id jhb100_per2pok_pinctrl_of_match[] = {
+	{
+		.compatible = "starfive,jhb100-per2pok-pinctrl",
+		.data = &jhb100_per2pok_pinctrl_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jhb100_per2pok_pinctrl_of_match);
+
+static struct platform_driver jhb100_per2pok_pinctrl_driver = {
+	.probe = jhb100_pinctrl_probe,
+	.driver = {
+		.name = "starfive-jhb100-per2pok-pinctrl",
+		.of_match_table = jhb100_per2pok_pinctrl_of_match,
+	},
+};
+module_platform_driver(jhb100_per2pok_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for StarFive JHB100 SoC Peripheral-2 Power OK domain");
+MODULE_AUTHOR("Alex Soo <yuklin.soo@starfivetech.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1


