Return-Path: <linux-gpio+bounces-36821-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id O0kwDHOwBWqIZwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36821-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 13:22:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 142CA540ED8
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 13:22:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B4931300AB02
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 11:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B010E37998C;
	Thu, 14 May 2026 11:13:00 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2134.outbound.protection.partner.outlook.cn [139.219.146.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144E83BF69C;
	Thu, 14 May 2026 11:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778757180; cv=fail; b=CPilY13wvyRCqElIpjpLQsEgUxB33TFAYMKETzaeGSfWRr8evddz7yjVzyYdOfLOO86t15T4dfR5VmO0viVRaV2vxWTqfGnfqiQafpWT1HmEiW5qMAhXZHJMqwDTQmbChn2zJrbdUmHSx7q5OUFMLoc/F0OfpMGKlZFrtKXAud0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778757180; c=relaxed/simple;
	bh=F4vbJY2+YJoKdPGbx1nMzDrjyICIBLzk32IR3peYn5w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N+d4fTZvT3/QnqIFzCgoHBl8iGdrxAQgJpvY3fGbrgj3nvsoI2By5EBYq/8ZfHRVZI/ERmeZpAqdpw5n+oPQjFPGjxn7EJzhDcMks2zeqH0MdDexJG1V491MtsbeyDdD2vPwtugoykBI9Q7s0fs0pRTSrwTAUjv8I8Netm7fgUM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hU2Wa94HZ24kRSYfjd2ujImEGBqMBPy66wqRxXdWTwPoSQqdsp1nBBOVK2epXA0XzuV/e/cfypoZPw6k3GKL2Xzgl99a5m66U/BExK+cN22tMtO8j9ErIT4slH+MXyaDSee+4hNo2DDOkjwluJ4IHb4fvnn0Coj2dD+299Z2snNLAKJ2Qdz8xgnyzNCkA02DDjsA91M09E4qvXUpfHFNWRhDWUGOBnld589iNsU8eFktQrMGnzJ4vgiEk7am6AI7ackjEDBa0lmpDxbuyDcSZ+ju5/qAN7niBjeS61kx/3xEmjOz70SzdVgHrepUC+Kb4BXzm/71qF9/kPiK5h2WlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TaiK0NzSTsBPYbh5UO1oKYlNcqAfuenMhYOrL1wMAWQ=;
 b=MOjNYJSGnpO8sf5kxWEK4H0uZ9UB+W9woJVr8WGW/vqptLF/nLgs9EXLpVTrCSsix2MXd/6HOYPv6UVT0FYMsPZkwHMuRxni5ecWvuWEnDPLA9j8EJdEI/4Wt8e2Ymxj6ZrxwkNVJ351Gfyz8XXsIyvXU75XHGFPsby6tapHZEAU/LGLw8N2LpFM+1zkTABVhn2gH5/DQOlGys/r7YZFjP80+H3nd+qcPwXMaOizG60cpmujQEUlIhu6ct073UFdCvQAJisPHeZck34rk6KNFp3m2YqRpp6YgO/uk+XXGbLl0/JHtmw3O+UDyQB751L84pPU0AAyC9JfH7rtmoFmNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1139.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.25; Thu, 14 May
 2026 11:12:42 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9913.009; Thu, 14 May 2026 11:12:42 +0000
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
Subject: [PATCH v2 09/22] pinctrl: starfive: Add StarFive JHB100 sys1 controller driver
Date: Thu, 14 May 2026 04:12:05 -0700
Message-Id: <20260514111218.94519-10-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6473026b-f116-4936-d00d-08deb1a9b78b
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|921020|38350700014|3023799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	qWeN7rhxFuLAQMWn/ABPklJuZAjP2MDXhavYQFTMQ4rDKXzZB3Uf92DA/jtQitFUmRVX9fnTIr4Pfw8vs4+/SutSMpDoPYS1xNRddEB9Q+ajQOV09BDk1HPE9A1vacEHUsJfwUyE8y/5ZfW410uY90EI/MOOjoOknpbcdVuTCWMPeQQVACwzQGcj52wvePEwnn/9OKSXJLqkJ+UorKgPcUppi4t3ntS5blVFW6D/MtAE4mhkChVO6TqOzG61nw2KdpJKJoJBp5OroyVicKc7bqKr8u5P4Egs/kqwyAjsHfzqjo6p2xxUWp5//4y/4o2yjxLcZMS2cE+wLXpDmDQ1CPs7iqKHI9OGoUyv3F+JNsR7ccgqSFjJx0AAsQXE4trAFLRVlOQtu8OZ42dcey1OXLlOOFhhpVGKQjTLJFx94mOcIL+QUQo7bRNCYBR1wyGotErMNvNC7tHrqKmqhpBrremjaodGUcS7WCgaZgozvtytBR0Cqo2BPhtYaNjVNBsZg2k07f5Hq72MbTQMg0UI+PrYwQY84vzaXkU2L5Ff6caQT5qCiAWD3++Nl7Qnr9fFbeoa1z3PYB2wTz5tZvu+jA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(921020)(38350700014)(3023799003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fNiB575KsSJM9JR73hOdR56eDBxPuSbGyLJnfoZM88V8oOvXVUjLhj3dW0gk?=
 =?us-ascii?Q?XxmjIRBU/GpbtooydY+WO/4XAfQyl5OCxwbvvFIMsplx9jqpOlKmKmzGEpHO?=
 =?us-ascii?Q?SRF+orK+WhfY0Ekqaao3XJThyg9wDfoJQA2i7yzDdjsbITmFlurdLZ7mHC8p?=
 =?us-ascii?Q?KGsqBwX+TmS9cI6Oe3eOthd+6bm8VPuEGBjGZnBI8pJPZZsfGgEF+9AW1Ilq?=
 =?us-ascii?Q?zu7047a/eSj2Z8g9AtbhXSEwGcDFfWS5QOdEbG+Tkz1JXfKMy9V+7GI/2ytr?=
 =?us-ascii?Q?M8WIcidge1Adgwec/MOVREHHuQNI7gxYo1O+j3gZ11C5RvMaclUtoZ/zi02d?=
 =?us-ascii?Q?CjvabkFU/lp4VuggtiXxm6MgCtM37YnkuSTKoQ5A1A2zvDB8HWbrsBeNYYDi?=
 =?us-ascii?Q?zMUO+7lJOh6WWDMFaXY0OcafYm+15dd9UVO+9VHLkGZA83ce03U09dyuvuVh?=
 =?us-ascii?Q?MnL4Xa4SbV+pHaVPwueQZVFxgAQAVudwM2W30DQgsnFVFJZDP62pxXAcM7x3?=
 =?us-ascii?Q?Tv7Y3RtZqUi0o/sCVLd3V1Fg3B15+0vaHi1nNtUbSa63feER5j4GYfn+2uww?=
 =?us-ascii?Q?yA+Wj1XMKcn01hAlCjK1tPFz4Qgz8hmvuVhZrWD/+v/yNZoLU3LijMRVlqiC?=
 =?us-ascii?Q?SdlVhtlZVkZlIWOgzMjHx2KH/HA+RxD6F4QwVh4I0BZGXzvhLAt/2vhvqcW3?=
 =?us-ascii?Q?6x7C7Tugg6b/3lejGvKCqHDv7dUbA+159oqyTTSxpoqtxd9T3IX0m43dX9J8?=
 =?us-ascii?Q?cmygecapmPbIePQ8hvYU7GCKDqgGWifaLwv34IHfIDCwsFkOPABn3XxlgokV?=
 =?us-ascii?Q?dq1mCM8jgSdfJfgDMb2F4NVUTfZKBRkKz5bGAPQn+wYz5ASxjqGhwu/DMdCn?=
 =?us-ascii?Q?0n64HE/WmQRBoqQpUlq3DVoSkhyr2yFnG0fDrm84r7q6UR0s6BdBpEAknZO6?=
 =?us-ascii?Q?D4+3nm0chZWf/hyBTQL+K3HTD7aYTjLEIit/KtmTweopuFAd0o6JiyGr/v2c?=
 =?us-ascii?Q?SlPHI25PJzDDSug9U+huMfQyRCnI+Zoaab2/X/nNY9sovC8lEB3JKEXJTDwZ?=
 =?us-ascii?Q?GGoK3zOQfI+/iMg+EZ0DY4EEZGgMA19qWBSh/mh4ZTESNRzKB8CRUHc36B6o?=
 =?us-ascii?Q?uSyKPGlluhovsR5rBo+o0RNEwB3sOSOCKMsNWK5Arad8VNU4AnhrXlG1fnyP?=
 =?us-ascii?Q?7nSIyRn3EQIm1L9KLX+m0ngRiBFvVmXDts9IebUhVK3ERmVlB78sdGd3bQjF?=
 =?us-ascii?Q?mTclZDPBOOex5PM7L/jmLswSQrJAeVZmqSrwmpx4Rt/sd5ToxeqP3l7h0avR?=
 =?us-ascii?Q?KOOfqgrDF0wgSerpBfjPTyl958knCxXghYyOLE9B0fwhNWYvJ4nFd2ZkdJbp?=
 =?us-ascii?Q?Pbu8Dgh54kdSkblUUM1fip6P/Us4kFjCwAby4C9hx9aHAB4mJWQ9Y0+3DaYU?=
 =?us-ascii?Q?c2uGLSc3apWurMUHZZVxNIvLinojLL5gG3G2LqFUD/sTvM5fq67/K4QkaBV3?=
 =?us-ascii?Q?0Sf16ZFzPfNT2kkfj5fbpbcON6A3FcB79tEgb56oAxEDXpsR6aW8GLDLNBf1?=
 =?us-ascii?Q?3vEu5Wf5YXujng4O8bAHLR6xBv7fM8Xr3LgS5mF1ALxiW3kU2gyCFx5JwMLF?=
 =?us-ascii?Q?23h0viCiTMl92k4n5n2oheJjLtZNjl9JpDEXcn9/YQV6D+w94Z2JB5cL1Q+d?=
 =?us-ascii?Q?Pecx3Ja9EZKZebcHnoC6qvyD46QQCRKLN3cPoFbNuV+SjSScCXQehD1Lqn86?=
 =?us-ascii?Q?+tSjzh/30QcTKdZjDFMUdPxTd56K/RdrianrkDZVWB/qbGQjecYt?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6473026b-f116-4936-d00d-08deb1a9b78b
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 11:12:42.1313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0kgTVGQ2s+Ss8P6DERAIqIH+3C6eBEj/oP1qnDktvmAeRmU8YMBK9DAPigH/WTwf2TELypojpTl0uay2NTzieJJKsuiF3yvkc/NDLflJG+6GDBjMoeS91OEX2l+heiMh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1139
X-Rspamd-Queue-Id: 142CA540ED8
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
	TAGGED_FROM(0.00)[bounces-36821-lists,linux-gpio=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.890];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[starfivetech.com:email,starfivetech.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Add pinctrl driver for StarFive JHB100 SoC System-1(sys1) pinctrl
controller.

Co-developed-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              | 12 +++
 drivers/pinctrl/starfive/Makefile             |  1 +
 .../starfive/pinctrl-starfive-jhb100-sys1.c   | 93 +++++++++++++++++++
 3 files changed, 106 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys1.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index 1c87f64830ed..882d621eaf57 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -78,3 +78,15 @@ config PINCTRL_STARFIVE_JHB100_SYS0H
           This also provides an interface to the GPIO pins not used by other
           peripherals supporting inputs, outputs, configuring pull-up/pull-down
           and interrupts on input changes.
+
+config PINCTRL_STARFIVE_JHB100_SYS1
+	tristate "StarFive JHB100 SoC System-1 pinctrl and GPIO driver"
+	depends on ARCH_STARFIVE  || COMPILE_TEST
+	depends on OF
+	select PINCTRL_STARFIVE_JHB100
+	default ARCH_STARFIVE
+	help
+	  Say yes here to support System-1 pin control on the StarFive JHB100 SoC.
+	  This also provides an interface to the GPIO pins not used by other
+	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
+	  and interrupts on input changes.
diff --git a/drivers/pinctrl/starfive/Makefile b/drivers/pinctrl/starfive/Makefile
index b26156a6d0eb..8d96cf80d377 100644
--- a/drivers/pinctrl/starfive/Makefile
+++ b/drivers/pinctrl/starfive/Makefile
@@ -9,3 +9,4 @@ obj-$(CONFIG_PINCTRL_STARFIVE_JH7110_AON)	+= pinctrl-starfive-jh7110-aon.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100)		+= pinctrl-starfive-jhb100.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0)	+= pinctrl-starfive-jhb100-sys0.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0H)	+= pinctrl-starfive-jhb100-sys0h.o
+obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS1)	+= pinctrl-starfive-jhb100-sys1.o
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys1.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys1.c
new file mode 100644
index 000000000000..84ca7b33a5a4
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys1.c
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC System-1 domain
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
+static const struct jhb100_pin_layout_desc jhb100_sys1_pl_desc[] = {
+	{ .pin_start = 0, .pin_cnt = 7, .name = "gpio", .gpio_func_sel = 0 },
+	{ .pin_start = 7, .pin_cnt = 1, .name = "espi1_reset", .gpio_func_sel = 1 },
+	{ 0xff },
+};
+
+static struct config_reg_layout_desc jhb100_sys1_pinctrl_rl_desc[] = {
+	{
+		.pin_start			= 0,
+		.pin_cnt			= 8,
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
+struct starfive_pinctrl_regs jhb100_sys1_pinctrl_regs = {
+	.func_sel		= { .reg = 0x30, .width_per_pin = 2 },
+	.config			= 0x04,
+	.output			= 0x24,
+	.output_en		= 0x28,
+	.gpio_status		= 0x2c,
+	.irq_en			= 0x34,
+	.irq_status		= 0x38,
+	.irq_clr		= 0x3c,
+	.irq_trigger		= 0x40,
+	.irq_level		= 0x44,
+	.irq_both_edge		= 0x48,
+	.irq_edge		= 0x4c,
+};
+
+static const struct jhb100_pinctrl_func_maps jhb100_func_maps_sys1[] = {
+	{ .func = "espi",		.val = 1 },
+	{ .func = "espi_reset",		.val = 0 },
+	{ .func = "gpio",		.val = 0,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_SYS1_GPIO_A22) },
+	{ .func = "gpio",		.val = 1,
+	  .max_pin = JHB100_FUNC_MAPS_MAX_PIN(PADNUM_SYS1_GPIO_A23) },
+	{ .func = "host0_port80",	.val = 2 },
+	{ .func = "host1_port80",	.val = 3 },
+};
+
+static const struct jhb100_pinctrl_domain_info jhb100_sys1_pinctrl_info = {
+	.name			= "jhb100-sys1",
+	.pl_desc		= jhb100_sys1_pl_desc,
+	.crl_desc		= jhb100_sys1_pinctrl_rl_desc,
+	.regs			= &jhb100_sys1_pinctrl_regs,
+	.fmaps			= jhb100_func_maps_sys1,
+	.num_maps		= ARRAY_SIZE(jhb100_func_maps_sys1),
+};
+
+static const struct of_device_id jhb100_sys1_pinctrl_of_match[] = {
+	{
+		.compatible = "starfive,jhb100-sys1-pinctrl",
+		.data = &jhb100_sys1_pinctrl_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jhb100_sys1_pinctrl_of_match);
+
+static struct platform_driver jhb100_sys1_pinctrl_driver = {
+	.probe = jhb100_pinctrl_probe,
+	.driver = {
+		.name = "starfive-jhb100-sys1-pinctrl",
+		.of_match_table = jhb100_sys1_pinctrl_of_match,
+	},
+};
+module_platform_driver(jhb100_sys1_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for StarFive JHB100 SoC System-1 domain");
+MODULE_AUTHOR("Alex Soo <yuklin.soo@starfivetech.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1


