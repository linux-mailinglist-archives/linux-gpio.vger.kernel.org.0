Return-Path: <linux-gpio+bounces-35482-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oES3IqVV62nkKwAAu9opvQ
	(envelope-from <linux-gpio+bounces-35482-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 13:36:05 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF6945DCB6
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 13:36:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EEF893004F29
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 11:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBCBB3B95E4;
	Fri, 24 Apr 2026 11:30:43 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2111.outbound.protection.partner.outlook.cn [139.219.17.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067383B7760;
	Fri, 24 Apr 2026 11:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777030243; cv=fail; b=QUydcyj+uOkS6xI7DEaKNzEUO5giG619nV467vf5+2biIZWj2LdPFOQTQt1wR2yLECO9HfY7vNKXyZfqHrZTOFIDOksvclqCaWXbl3xe4d1OAkCv1/TkWhc3vOS3vovviyjrIGI6YPPj8zdlbpbzlAkoVtIXfosHMyhXlIDWIkw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777030243; c=relaxed/simple;
	bh=zEJLJiHYyoqPpjDU5i/dGNPjL3lppC1I/CkaP4qe8Ac=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oNHl6o1bQXiDj0wka9+HC1/0iWG7nm/9fGqKpKguF60JHTxCeu682kC5uI+qpK7r7GTahSiCdJEUc9LzurWmKQUlLy5+Lbjm49x/6FlToDpf1r4EfcFTu26yKl0ukGTfT/wOhtj9/SyzQjSUZooHo124mRClCicoBuKVxdjTTU4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iR3wXiS3UobvLhXXICMdFPAEZFyVIHA0aQYKrcl16oBWzkdZIQfnF+nDr+jTTw+4RXpu1Bo2imD5JxczSKYVBHsIKb/pA2M9GUDgAomhDUVe9c4Nf8R09zs89CvNltIcgm9264bcY6q/NKKXTazCp5VRnADsmIMbaePw9XoShWnYkVMfoE72yPNUd4ilN7IVa3KnbV70T2/MRsr640OVLc3cQxg/6rJc20wQqDnnxPiFZflNsdgNjrlkRxluJdJ6EnQyh2m5Ae5HBmaHQXtPnC7AHAjBJTJQyGy21/YD0SzjRd6EcEmM7yGuwRP7mYFG0NPk7CyY02WJD94m7+HwUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ACUaAYRGlq536mJLMkSGeliFkDuQFA7ive8BX0d35TU=;
 b=SLREnZb9Z8cKCwh8Gi/9bu2XnbWW2ACNmfaGocXTe2Zx+QzO5tggVMTQwL4OnSdEXwZF3PWCZSbYu/M2/OnGPLn/UqwoX1jJ4N/JT9MaZZbV4aQnNgQPBU35Xl75W8aYOh8SEWDdZK3H9NLL7WnXzEosU8jSvZunjyBuNYsKnJuxrycuq1EMNqvhd78bpn4mIErsaWWx3AkmVR3FXE0G+RxRTsWtjl5P/ckPIn0ZeQq+JsdbHOvCt5Won1G5/Rj/eyoW+t/MfHZSjzlvGke/F/yp0uaGRzOfwclClz9UdA3v+Q20DvqvSMizggex1Ca8UC8/B6xmPgD+GISGIMDeNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1156.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 11:13:54 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9846.021; Fri, 24 Apr 2026 11:13:54 +0000
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
Subject: [PATCH v1 12/20] pinctrl: starfive: Add StarFive JHB100 per1 controller driver
Date: Fri, 24 Apr 2026 04:13:22 -0700
Message-Id: <20260424111330.702272-13-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7127f9db-57a4-4f51-d89a-08dea1f29276
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	QwBCmmaC4A6bcIU2i5jZ6XimkUSLIIgJUaNSE22DJ85R4WTTmUxUVxYCycMTON6O+4k2q8DnPQ2+YTzQOFlUHECXlWhBVgIeIrq6IK8aOS1X2AdUWcKRxKyBy9gZ5jI02eB73RgZ86ts9ChXpA+wP3EQkXpeE7I3JNuZG9PENjCIrzJMTv9aWuaeWcd3Lqd0/MMFvs58sgBNX/h42aTNtXHzdLz8uf1JRE7Yy/OuCsw3LvFIapS3Jomjd/FasrgBktjiubZakFCzfMRaMECW+8IXTKkgiVxAc5E1DMN4CoOCEXNj3xSYSPppvHxsnx+xzAnhKYJOaY69V8oe1q6bNpr9kQ3Mf9ztl4Gew6Jb4iFLgDIeXKX07+nubgzAGXsVF/ZjFfVVD14DRehKWSl5FC12Gx8R3w50z5y7Com7otFNBRQ4A0IFSPh4jlC204wIB7OwIwplMg9AV92lsFGrDgL431keETL1RobV+S4Aa6tpiwgH1rytr5+FLqCGD1EBwRkc5hX0sVFirWFlG7onWFx1OCRFF2DMQIhJgMAq8tZxIvUCcxmI1mIswjrFYqQKuyMdv1MC0oIFvZhoqMI3dLc7DoXoetXshfEKiFasIb8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1sxwb3b+LUBGCCikFX2a+MR6P2HpNYJShM6oiKUQrp2O7RnikYVYETeQDt0x?=
 =?us-ascii?Q?SvdMBAYNv/1jPewCGdTj64GSemDTApK7kIuMdXq0eyYGRlDExabDEgl++3cx?=
 =?us-ascii?Q?tUTSTSBsAFu3tj7r2bd5eQUTE4zTjMSO8b2jtc5L09VnsIsVZ7fV4d/b6Cgm?=
 =?us-ascii?Q?x5veYiDuifzlnBBM38SU2ozIkq2DrPVMottlC1QCVIeXC01VhA+ji6mcL762?=
 =?us-ascii?Q?bSmlgsNgbDkhNdMjgmMuO9qvkwZr8xuKchlDc0YFS5+JPMTw1BDXi86ZSCED?=
 =?us-ascii?Q?i+7tAziiBYMMJOkXHCiwKsJf0XVs9Kx09bGhGnAREO+fTIX7CUhIui7+ac5j?=
 =?us-ascii?Q?+ZXXnIykAEXtLHKSRHBydeKSTTP5q9cbgHti0aIq9LsYhbzNCzZM2Pc+Mown?=
 =?us-ascii?Q?tAHujNNRu6waPww0nUoydJgBDpc6lbw0JlEE4jMZSA4U+LSg1FhLYBeBKk/5?=
 =?us-ascii?Q?MdEFR1fAEb2TSm1Mr0hgOnQGKLfRGvVKO5cPIkOOs3W+owIUPNK7cKQasGgl?=
 =?us-ascii?Q?J5PLIj1lvE4Xfg551oaibqRgxLvdHxCnwo0725/ee8+4Z+94FxoKBPGYCsr8?=
 =?us-ascii?Q?wMnD8Q67Zfroe3R5tp++d4yWpztpFF4v5uWkswEWX+RVV6HPavT2JtSKbxBN?=
 =?us-ascii?Q?udj2THEk84xfJkA2alGwppAG2jQdGWSTNymK+RvOgj0nSh5lfbXGpRYvBMpg?=
 =?us-ascii?Q?E1psGSLP5P1eWnOaEg64VCYESyMDBwJL7BjtAsSOA9UzU/rwrDNX3xIcUqNO?=
 =?us-ascii?Q?mq93l9vE5tvpWLTKkxk9HAy6HsFjGGgcBcWZa4xhel+gFqnYHAG6ZxBcQBPQ?=
 =?us-ascii?Q?hsOEtNiLk08WP7FuFQaxKQAj4ZtChpLS+mWehl6P8w9kCZGQFRWcZAiTvSnZ?=
 =?us-ascii?Q?UoAboBTuAbXSpDie5mfXESiGesBRR7Hvu1V5aV0PodoM6XQcHIbXz42aBb1n?=
 =?us-ascii?Q?gmekCcAq1lLxxituzj73vIsk1kGnQ34bHkCJy64U8FuxWLWzis7sTYO8mi5V?=
 =?us-ascii?Q?4YOJiuVHI7DdAnVZoHp5FXxzJAjQPOQNP2RD/+89JVwxeXJgrbAw7ZPuKSaZ?=
 =?us-ascii?Q?oHHcQayLixOci53/6bfp5YrufgslBMaofQ+9kVSh6m5/f+k4MhwkGfMrl8uB?=
 =?us-ascii?Q?Cw7Z2AzGAEe38HooutfNAk7u6dXqg4Up6KDOa3M9erUZRd795AZAb0zrAJ1J?=
 =?us-ascii?Q?kBdNZUQtqqQStst70GTnE8FEnXO9u4Rbw4jgTRgstGTHY+yF5QbHcuBuWxob?=
 =?us-ascii?Q?CwOnNoDSJwt68Y/EMM/zk7pd0j9fkyUgJ3H2spS+6QHL851IrMnxPP1VzFwB?=
 =?us-ascii?Q?4N3RavFhSJUf+uBsV8u3D0EZsetyzL1IvnQDHLLUyRvKdSQMoAUop3ey1Bo5?=
 =?us-ascii?Q?AdIeWzHfH++0lVKchmAgyJf7t94Na1ftVa3inR2KToFjBHgBSczricXVTz/R?=
 =?us-ascii?Q?X8l59lJ6aOaJQc4Mz8bE/XGC3V1UTAMZDCDgxWqSq+7zjpINy561K3EqVf9d?=
 =?us-ascii?Q?vuyDk83n8w8ah6nYqz85KJiI1p6W/ZkjWSwHXa0xgW22VdJJiNuYnUMEJUTh?=
 =?us-ascii?Q?96FLiW8lUGfcTT/MaeCx7/2MjuJeNa8xg8l1Joa2y1ONNy2FSO33hM+NdoO6?=
 =?us-ascii?Q?hWuZjNfFtJ0l4Qkw8LBrkOO9w55LEodu1CtuxHNoWk42aAt8UqgatZZcOVDO?=
 =?us-ascii?Q?jLBsP8B8I7nAtqDEE9g5MwzNLBUf83oQepp/nvEByD+O/OrSIVyXC8veixZD?=
 =?us-ascii?Q?bhv4PSRCwGLCkvRQWUc2xGR4GFU8nBvKHRRxSGg0+zN1XBFuHQ/C?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7127f9db-57a4-4f51-d89a-08dea1f29276
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 11:13:54.5599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E4f5H4OYZaiMlSGbxpdFu3U4Aw8eGUKTuPe7+h3PfVE9WhtrmMEF98CSNws+4rNr1hk9/ZUFp2PIu+fhgRMdrHZyOF+s8Wli4hxs3JMUeY1zOTU82TeDmGNdM4n7KGPi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1156
X-Rspamd-Queue-Id: 5DF6945DCB6
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
	TAGGED_FROM(0.00)[bounces-35482-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,starfivetech.com:mid,starfivetech.com:email]

Add pinctrl driver for StarFive JHB100 SoC Peripheral-1(per1) pinctrl
controller.

Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              |  12 ++
 drivers/pinctrl/starfive/Makefile             |   1 +
 .../starfive/pinctrl-starfive-jhb100-per1.c   | 112 ++++++++++++++++++
 3 files changed, 125 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per1.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index e5afd937c4a1..c5937207b2d3 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -71,6 +71,18 @@ config PINCTRL_STARFIVE_JHB100_PER0
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
index 000000000000..fcdc326ac50f
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-per1.c
@@ -0,0 +1,112 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC Peripheral-1 domain
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
+static const struct pinvref_desc pinvref_desc_per0[] = {
+	{
+		.name = "gpioe-spi",
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
+	},
+	{
+		.name = "gpioe-qspi0",
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
+	},
+	{
+		.name = "gpioe-qspi1",
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
+	},
+	{
+		.name = "gpioe-qspi2",
+		.range = BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
+	},
+	{ NULL },
+};
+
+struct starfive_pinctrl_regs jhb100_per1_pinctrl_regs = {
+	.vref			= { .reg = 0x00, .pv_desc = pinvref_desc_per0 },
+	.config			= { .reg = 0x14, .width_per_pin = 32 },
+	.output			= { .reg = 0xa4, .width_per_pin = 1 },
+	.output_en		= { .reg = 0xac, .width_per_pin = 1 },
+	.gpio_status		= { .reg = 0xb4, .width_per_pin = 1 },
+	.func_sel		= { .reg = 0xbc, .width_per_pin = 2 },
+	.irq_en			= { .reg = 0xc8, .width_per_pin = 1 },
+	.irq_status		= { .reg = 0xd0, .width_per_pin = 1 },
+	.irq_clr		= { .reg = 0xd8, .width_per_pin = 1 },
+	.irq_trigger		= { .reg = 0xe0, .width_per_pin = 1 },
+	.irq_level		= { .reg = 0xe8, .width_per_pin = 1 },
+	.irq_both_edge		= { .reg = 0xf0, .width_per_pin = 1 },
+	.irq_edge		= { .reg = 0xf8, .width_per_pin = 1 },
+};
+
+static const struct jhb100_pinctrl_domain_info jhb100_per1_pinctrl_info = {
+	.name			= "jhb100-per1",
+	.gc_base		= -1,
+	.pl_desc		= jhb100_per1_pl_desc,
+	.crl_desc		= jhb100_per1_pinctr_rldesc,
+	.regs			= &jhb100_per1_pinctrl_regs,
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


