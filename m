Return-Path: <linux-gpio+bounces-35487-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wcl0OVBV62mmLQAAu9opvQ
	(envelope-from <linux-gpio+bounces-35487-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 13:34:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 785FE45DC36
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 13:34:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B99133018599
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 11:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 905D83BADAB;
	Fri, 24 Apr 2026 11:34:30 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2139.outbound.protection.partner.outlook.cn [139.219.17.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01B83947B0;
	Fri, 24 Apr 2026 11:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777030466; cv=fail; b=QYhCYrXMT7XvaP7cll6nZ9V8eS9AFsVsWjcP0g0WYPjb8P4KGhjM8qVCU+dGvlEx9YeQ2b2LmItvzc0GAC2CrXkAMyZyk+/E7w3GUTtHtfqXoPnhYGmBJKR/UTncq7croRmr8tRsCYARGIljLJtCiUQd+xCSve/q53127UXb1g0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777030466; c=relaxed/simple;
	bh=PXKv+1tZ/zGZl9Hdl9ZQ3QPtXAb5Zl+yRJcfAOFxoDE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IifVILqrmxupLXQ/64CcbWaN2RxJBBGuHPE+ao9XxGwto7Q0rO+5WUX/T0zIq69CsCSlPvDOUiaGvXkoQFD8TNomgcQJhMI8T8qWbaXE/TxxHdrTtx6j3lfTjkNNkTxtfJJWcvUWBGmA86PBZRO5T42HpcfqiiSe4mctjRNTx9c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LXYSpcuDWv4v+3ZWAJWdjFUWiR/5Fqa36qUTa0PH5SLMaTnnMFbkqxFwwoJYJOlo8NBzfN+Hnsv7VJAIqvX/cizWKOAB5uSId+kMtb4pjWlL8ZRQmGBiXUmANPn1BaxQpH1rf1g8sIX9GOsxSN8TZAwyu4Kjpzuey0KexBv5tBSrql3fcOCcQJ7VuWQ0//DkTbTyBR09NNJmdRPVzBn506wr/j79xKBMSMI29dfEb0RIAhLJg1lOLitLcTpXBryorXz8yzklArP/7U3sdvgGHSMdZ7Hlbq0jZF1p6oWRRXT5LFO8alX1FWL3tcgtm72vBZMEFxrOQcuNXjypXULIrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UBwkIOq6B2reee1LevWUV3iwNpJfXnG62D5DZL8F3s4=;
 b=gJKNXoyjLD+XN/AMqTWugWVcD1AdMDmB1HkHE5uqpYdyrbsI7ncexFybPFnz4x3B0DLL/3ZA1nChiK+8+X1VyfLbah6Ho7/r/rYBaDHWopuhOxJE1WPVml4Wgmxa+EnjXjuo7Eo0SRRWeL3GRTiQbwL+kCAUoHwZZKjVYjaYC7p2q1n3YqAOasbWrN79nBoeHXiYsac5Iq4CO3C+p+nwcwsrW9yVmn5bkimje1CqJ+oDdv7pyqwkjjQlSHRMLjaL7c5C2vfv0pd4YyEowoMbpkZUs5Y2IXuC4228AkpsrRp5W8/Kfzo+T6F4kF3iQrDeXp18lg+qioK9W1ie8X+gsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1156.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 11:14:02 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9846.021; Fri, 24 Apr 2026 11:14:02 +0000
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
Subject: [PATCH v1 18/20] pinctrl: starfive: Add StarFive JHB100 per3 controller driver
Date: Fri, 24 Apr 2026 04:13:28 -0700
Message-Id: <20260424111330.702272-19-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0054a019-f448-436c-ed1a-08dea1f29748
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	XcZCJI/MlsmykaCMQCJiULam5SR1dFXuVmS5XOernOifKLVhKeSFdQorbeqmSPzLdDObKzjnzvWaz4fc18u6oUVO9VWmmOf7Hb0qvblvCoFARwRQwitbB+KD9dacBLwkKp9RFAzkZSawtbvmUGHoL5MhbzdXzqihA0aYjy8QsyHEjHg1IDJPntL8RHomp1KQeyhq6xYqlJF1bVeBMRpu0iru6BvCcdZMh+KaeX4shGVsls7iXltNAky3fKfdcS5OZEkeLv/AJsXzLM1ENqdqAf3t38VKJxLwUJTX2OmcyNpTXXsaTR+E8Xj4qPzQ3WObl7qxxoDsbVR3tTQzHriaYqwe9aEXjZJmXHMeHMs6gmuKOJLMaRNX/LWhK73PjAybA4+HVkNCBBlNULwbHlwfpS3q/yneycxD653fOgvKgRgbtD+Ekt9Iwi9p38BHJoW/KUK3+urNpcF2vX3j+p3WpMqELHEc09jx7+CAzcw8qHWQ1dKdHRtM0v65k15TA7yzfiOpopsnfyWovwY3b0g+KUtHvOBCwVRcF3KfejHJzfOa0IKSPpWWgsXCvAztaAfyEdoGPK6NFdIaPjWp/kwPOYfykawoLRfa+Mgu7uFE20c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?svVcVa9iovRMM+nnvyaGhhyhf52s+KXo0puJ2q+t010DUHdZtTzkBjx22ZBA?=
 =?us-ascii?Q?E1bIXu7atHjeJQaZlWHYa+QGXqYkl9G3gnYq8vblMHTfMi57x9sSke6eWwZ7?=
 =?us-ascii?Q?9ZJrWANV/Wa437MpYR6+unc5bxQiDXor2vLWWu5gP5KFuSJAx8KNc+mP4+3O?=
 =?us-ascii?Q?LUOUT1HUEEKDadhO4aMjplXyfmWEGT5Pb0c5L3HwdI5cfStIm+lEhm0rP0Rh?=
 =?us-ascii?Q?uGk8Jgvd/UmPyoMIS4hrymCPZruhPtBgv3tP8axMX3daK86zitePjAh+Oa8x?=
 =?us-ascii?Q?TU4i21VRluTPDVxBwwG0V4mWorrgF/XMlC0AbUPMM87rZLcXLf3ArVWfOPwu?=
 =?us-ascii?Q?5HbhdCDWRfto9vtNNFhrqqI7jnvq4V3lY2oYiqaF7oyufiw1BLb/61I76YNc?=
 =?us-ascii?Q?22JDHJ5uBnJGmanNaj0ZvsbpnkjaI14D8zE0zdeXs6LvxFtp4EccJmmM2SaL?=
 =?us-ascii?Q?1uAI2WxIuZEYdxN2qsFNuMt/28mZ9/+W3WHU/OgGeuo5hl/3UyHYRK2iaDWu?=
 =?us-ascii?Q?COO8/zwAJkUJ8i54W592WWBCzwth/GQjnasu3ibbxIpT17l4z169HdjjDjqv?=
 =?us-ascii?Q?n3gcYKkiVwW2nqj0HUqSN4nXDdZCLpjSYDIl4bT2nNpRom/7L3IGto200lYg?=
 =?us-ascii?Q?3/JgOFQj+eX6VNpratnB7V6ssgQF9SzmA19Dz9VJCNGzFTLgUuaJV9eb3nFa?=
 =?us-ascii?Q?ebLt+kV+yBrxRQGWKzbSYW8j1fLelaqH+vardfFieX4ON5YdlnQg49poYFD9?=
 =?us-ascii?Q?e1htPkQRrsqrk90w0BMc76fasOHAYiiEO+kPaaG+oRS2+7EBFPSjKfir5Sje?=
 =?us-ascii?Q?aBpKUm5F3aVngRKz3Jn+2vgAei7ZqPIKk+pHNgu4qKj44kowXRw3JJb+T1tb?=
 =?us-ascii?Q?M0w49uK8QJ6yOfiX0A+lIMa6ddTqnyhilaa8qaKsl1fVeuwKJkkYSN/oYyO2?=
 =?us-ascii?Q?xcb5vge9i7uYLSzkmfH2u4ftHq6fFUKmnyke+SseIIvZo80FQnUU3xdc0qJc?=
 =?us-ascii?Q?+6ZckdwIEtvPEkNjNb2n2bWlGB+a72/B1ewUL71Qirn9q1y0uhLsq8F6zZEq?=
 =?us-ascii?Q?oczKKzjsIdBa/6XMYATji9XpWCM8WyhK1mYIo4yYmqDEeXrZAb7ZTv/BCPW8?=
 =?us-ascii?Q?uG/wW896hMVYeig3GLwM4+GJhmQlPwtG6Og+kRH9YGJ3sA8pbzD8MY/91/F4?=
 =?us-ascii?Q?YU4Mvll+1shUH6kD3vNg6dYKtsxDbS5zoaNlBF3LwjUJv2k86i63+nflk0Kd?=
 =?us-ascii?Q?a6VkQuJR5j60T2JOD+zSrIB3kuRHXOLEFnLjciSKXDeNe40kkMcE61+fCD79?=
 =?us-ascii?Q?8zqZ6tDKgOWBUqf30GG1CZ4vL8N3TylejqsdMuJUUdhOyM3+skQYau3H7Ctu?=
 =?us-ascii?Q?PK71Go1lDcXWPlUPRJSmh0zHLbLy/Th/mpzK+1xxQYHuAphTLs0epRl4tkAh?=
 =?us-ascii?Q?EQMFH2GHpvdXcwNmaCBHnRnjWdnNigWxp/C6hK51qQGByA/wf3hwkb5HtqRb?=
 =?us-ascii?Q?wHoJkhw8jDCTCpAfWw337UtQ8xrTne80SXYhAq3epOqUXvcn2gnhPCpXOKr+?=
 =?us-ascii?Q?ZoE+mK61pEErH/gj7vtUbrB56btS4x2P0tbNADLSsrUw4EHmjaGm9x4u6t37?=
 =?us-ascii?Q?lyEYShFuLPFqR1uE0pC5xDlXfZQMpdVVNdJtAVJUV+Ra0nR+TeL6NTwcn9ob?=
 =?us-ascii?Q?bJ4sl8cCzEkzhR2QrZBxg014h8/KAYChCmiUAgHlPThpK79x2ccz3cvhEGmG?=
 =?us-ascii?Q?iqTDbK9/SS53NO2apav2hCf8hs4I+wuWWMFZ5tF3vSrnxI7L+599?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0054a019-f448-436c-ed1a-08dea1f29748
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 11:14:02.6569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M5tBXSfnwWHUPql67h/EgvhrZSuRUttzvxswtRoh8BiyeOGwp5NzZ66vf0dpIxLpTYQd7rqLFSbfX6RUmXiWaUGT9raVlg3QZCd8NoIqowjfqY3qwaxS2+ad2abIjeUP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1156
X-Rspamd-Queue-Id: 785FE45DC36
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
	GREYLIST(0.00)[pass,meta];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35487-lists,linux-gpio=lfdr.de];
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

Add pinctrl driver for StarFive JHB100 SoC Peripheral-3(per3) pinctrl
controller.

Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              |  12 +++
 drivers/pinctrl/starfive/Makefile             |   1 +
 .../starfive/pinctrl-starfive-jhb100-per3.c   | 101 ++++++++++++++++++
 3 files changed, 114 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per3.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index ed29f87e9d7a..07cef96f8e90 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -107,6 +107,18 @@ config PINCTRL_STARFIVE_JHB100_PER2POK
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
index 000000000000..a2e6ea4097a5
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per3.c
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC Peripheral-3 domain
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
+static const struct jhb100_pin_layout_desc jhb100_per3_pl_desc[] = {
+	{ .pin_start = 0, .pin_cnt = 11, .name = "gpio", .gpio_func_sel = 0 },
+	{ .pin_start = 11, .pin_cnt = 1, .name = "peci1_out", .gpio_func_sel = -1 },
+	{ .pin_start = 12, .pin_cnt = 1, .name = "peci2_out", .gpio_func_sel = -1 },
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
+		.vsel				= { .shift = 2, .width = 2,
+						    .func = BIT(PER3_GMAC_RMII_FUNC) },
+		.reserved			= { .shift = 4, .width = 11 },
+		.debounce_width			= { .shift = 15, .width = 17 },
+	},
+	{ 0xff },
+};
+
+static const struct pinvref_desc pinvref_desc_per3[] = {
+	{
+		.name = "gpios",
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_2_5V) |
+			 BIT(JHB100_PINVREF_3_3V)
+	},
+	{ NULL },
+};
+
+struct starfive_pinctrl_regs jhb100_per3_pinctrl_regs = {
+	.vref			= { .reg = 0x00, .pv_desc = pinvref_desc_per3 },
+	.config			= { .reg = 0x04, .width_per_pin = 1 },
+	.output			= { .reg = 0x30, .width_per_pin = 1 },
+	.output_en		= { .reg = 0x34, .width_per_pin = 1 },
+	.gpio_status		= { .reg = 0x38, .width_per_pin = 1 },
+	.func_sel		= { .reg = 0x3c, .width_per_pin = 2 },
+	.irq_en			= { .reg = 0x40, .width_per_pin = 1 },
+	.irq_status		= { .reg = 0x44, .width_per_pin = 1 },
+	.irq_clr		= { .reg = 0x48, .width_per_pin = 1 },
+	.irq_trigger		= { .reg = 0x4c, .width_per_pin = 1 },
+	.irq_level		= { .reg = 0x50, .width_per_pin = 1 },
+	.irq_both_edge		= { .reg = 0x54, .width_per_pin = 1 },
+	.irq_edge		= { .reg = 0x58, .width_per_pin = 1 },
+};
+
+static const struct jhb100_pinctrl_domain_info jhb100_per3_pinctrl_info = {
+	.name			= "jhb100-per3",
+	.gc_base		= -1,
+	.pl_desc		= jhb100_per3_pl_desc,
+	.crl_desc		= jhb100_per3_pinctrl_rl_desc,
+	.regs			= &jhb100_per3_pinctrl_regs,
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


