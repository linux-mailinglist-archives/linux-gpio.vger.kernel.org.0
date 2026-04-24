Return-Path: <linux-gpio+bounces-35480-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCFqCOJX62nkKwAAu9opvQ
	(envelope-from <linux-gpio+bounces-35480-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 13:45:38 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF2245DF64
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 13:45:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ACB44302632B
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 11:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0C4C3B19CE;
	Fri, 24 Apr 2026 11:29:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2114.outbound.protection.partner.outlook.cn [139.219.17.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0B63AE6FD;
	Fri, 24 Apr 2026 11:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777030196; cv=fail; b=iRa4VIdU5kzY15eUUSQcBKY/AJMw0T1el4yV+b89CkEQ23qhB55VyqlDzdu9ass4AU+9CWartifd7u0eQg4sxSVMrZTGxm9kmKNOlFuVkO6FtpbFE1RGnV9XZPWvwAqOc9jZXHfmgU20gMrttxmErKjgTkSz4+fD4Necv4LYXVA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777030196; c=relaxed/simple;
	bh=GgKxsMsQxjOoL/x7sw9gbjTSMCCKLbtse6HxPhq8x0c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fbgoYcrp0Hj8WVqE6Wh90jAv7fYHcTS88f8J48smMJX2P9pbbMLgYFztkdOdYEL+QVXZFaEqHdcwnwb5Ptw9C+zE/gkF6XxVOtdQY5zmaaXrg6sHNeMV3uqp+2SZ7L+9/4bJXVOxEN0hMc+Z0CYfREuQ/orCFTY7Fn/LbeYb5ZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g6cv8FZKr1bEKkf7xi7xSd0qVWB4q6n8+g423FAKQWRdxvFZIqMh5a1RJYBNPz6GxfrUY0+kTEgu3QzFunBgdMJrOir3u0gZjTslAUVPWKjbdCt8K8DaC2NiHvJ/Y0tpifJghHTF2rrgNT7bakauU5R9XepyoNBog6cpW33dt0KXuDmJvxYWYcUyO97HgQN70DH6vb599E1Ew+vv9UcYpbrBtWKI/kjw9kOXch24yF/AkpOpL1LL/ChfB57XGu26asJymhAf1S3ed2bFVJKGxf9TlTQx4DIQITun9PrSJ237e70dYoa1C1GdtgA9OzWiUvbtHgQn8/sQCAbF6FdBeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c8HCphpLRhGHiqEiHVozL8jW5p5KHx9NAqpovZ1F7ow=;
 b=he0WSSthuY5xaWm9KkZXs3CWXBZvyCJ5kAOyZt0kYGmdnPYR6HsySD5/G+HWELpaqUGt6zWXdipFUqLFZYYKa1dvuIw8xlx/uE3oGJMGfeoS6b8Un8YGYpdsAd8jQGsG6M4A4oLykW7N/XrKuNCfqq+DnDWpT9qa8ItGq85ljiaEuExcs7F9AEvYrf7KNOawGNQOXJ+DmS+53BcnnMiOWroHXCdqQPKYbwWIQNuaqBhn86KjZiIItLo+kpaY2dkQPBQxrm7BiDX+Kb1HoCSrcq+Ccd490VfxSt9GEwlMPw8bOvqFpT/TZeoQWXiDemJUEWhpVtVfS2egdO4sLx4PSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1299.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 11:13:44 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9846.021; Fri, 24 Apr 2026 11:13:44 +0000
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
Subject: [PATCH v1 04/20] pinctrl: starfive: Add StarFive JHB100 sys0h controller driver
Date: Fri, 24 Apr 2026 04:13:14 -0700
Message-Id: <20260424111330.702272-5-changhuang.liang@starfivetech.com>
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
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1299:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d2be3ba-5583-45bc-5402-08dea1f28c04
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|921020|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	zzOLb6JJLHWYcT5F0pTJvAtH5utA40kSSK9rmF+AUxuqiWwmutt5Ng4OgBIkqXfSlXXBVwkQchMnX2EwwoL0x/d2yOdlcvKVN0biFvMF8hVdUaCASJAMqBkz0ygYtUHlSTuFUgAlf//W9sqonuSaAVMuBbzX4q2OhjTFrqglcrENJylU9KRwW25u9f1jHZAIuo0gGE4zEq/+bwrum0qQJzThdwNCQYO4qubgfJrPd2xQRIbR0HNLSL9dOmw+Dxhk64kLtNrOTKOsRegdNzyZnWPjOZ5l6EvvRXEdwBidx0Cz/DzWRx0LnF3xMZFYwcomeRRIIwKg5Cenip8+Gy+LItTIniMr8ADwqUqRq6pwdyQ4+epUWoJ5k+pbq0d6LEftqZpBAdwxOmxmlMoNVjeibQYIMSo8ryjqQAPBo5K0wOh87Tsimo7GohpaR7dUyLlICbRFdX59UHJq3PsuT+G+vdJWbdx7SXpcqP6WBkfpUAr0ilR94H4hKOYqjnWP3o3Bbv1UDTVxNT7eQvixAFMyklF5r67+PbPAKAJCu3UcHzgqYGhI8D1WTT/IIjKQV8rhbq81Ej5gmdwHwFhlH0afDDtk28JfktezgMjg8Jp0QDE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(921020)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jjDJIphStxPIY6zNGzZH54JKDgrIrCh2i8NrONp76mHiCcu+PskZz05fpg56?=
 =?us-ascii?Q?4aHzarqnOxrxrX8NGsbgHxLDJ2SpdS41fe/mCWbJMEVsJc4U0GfTBOXquuoh?=
 =?us-ascii?Q?48b572NOwQLHfDzP5I5tZvVRCLEp0GMJE0UnMZ3ELJetbTu0fZs8mqX3a0j9?=
 =?us-ascii?Q?71+P6yk46BHbZLrqrGxh3w/p2OVsIfBLEcJvW3I15cO3Q9mjolFZ9dH3cCsx?=
 =?us-ascii?Q?LNUYD3gvb9+AAOFIOu4+CdlU6Mnd5TM8squ2JhKVk4RzcrzCYmrv7w/aUjIr?=
 =?us-ascii?Q?2qE7COC+C0h46NqIqZXr1HDjonlyIwlFxKDm11VaJovHOl33L3vrWRx+2Gew?=
 =?us-ascii?Q?bmDyHDybYB0g56o5+AiT2A3zEBrJcEgYdsqn/A2j/fhGP6JtL3Q1vzasCH2o?=
 =?us-ascii?Q?yL+DVuQCvkyoG6wzLIhiWMisldC2NzCUGOKE7sOAuEkyTLxAxcoGqYvSWNZp?=
 =?us-ascii?Q?X8nb83ME6WTtB/NhVEDPvWFDU9OPnhr0T3RXHMn0jBT/XKSFHdnEuAMxQKCH?=
 =?us-ascii?Q?ueofBe65XDCFceiZQUwdGHNCdQw79b2mr9FEcN3+3Bg6wKm0DvGrloHOBP/4?=
 =?us-ascii?Q?L6tsNT2qTX0HM72SyH3hkA81KqADhepeo8ni/Q9Oa6yiLwnKVTlbkCx31fSf?=
 =?us-ascii?Q?OJLk6CmAQE5cAq508xAwpXP1eQ6XkjEcssY4rU44s+i1YTMMghexJWofprPM?=
 =?us-ascii?Q?tWEnmNlqd9wRpiStWD/5gPxHiK/2ADOl0Yen2toL45Ia3jgvopIByZPQt7Eh?=
 =?us-ascii?Q?NIoeiplg0H3moDzLv04+0oHfRJZ0lvC3hSNnMEHoeSMsiy0nK4tUwbV9qcvA?=
 =?us-ascii?Q?OLcb+Qh/Upzg/J4F38YGMVoVIdugmiVRD410zM04ZG+XH9wX01mH74aSOZun?=
 =?us-ascii?Q?VNM86Bi1xfHT7NaNp317TSYzqp3tSLgz7JQF8jeJBbaMekzZQb7Cfiae+VG8?=
 =?us-ascii?Q?DvykMIiuVfaIsUaan/VtVfAvzcEpjmi6eadNGyrrmJSHLrK54lQ/zOqFCk8v?=
 =?us-ascii?Q?32ABKEckooVgcbWlTpNhLKxLA5jcSe4KwMhWhHWCntcPC/c25s75QMklHr+r?=
 =?us-ascii?Q?jwOTaRohNPMXCgRe/eO3zOLEugUmmVSoOf1XS5ygwYkduqgtIU+c7XFqHmNd?=
 =?us-ascii?Q?UX9ex92Rfx9ad7oqV4B/1JE2No+6hY6rKvHH4HauOUMyVLvQQ9pJbqeb1vs1?=
 =?us-ascii?Q?WT9Hm3yzLW3SsGMxyoVJEmZETMBnpNoOANNAn145JsRv9vN3ojVTedym/Vn0?=
 =?us-ascii?Q?lOB8bqo3vqR9/AtZdJLS6+pBxcYXkJg7NJjTESNQ0iJ4wE7LvWMP8/AZl8X6?=
 =?us-ascii?Q?ZYF7LcuGTfBRhL4gxSYT6dGrvtLykz+U6Am505//9ks+VVp05NCfYfRLUGvG?=
 =?us-ascii?Q?nH3kYeDEy6+vUeVT9KBOor9T2KG1MdO0/Dy6eP7H/Rfv4verBBOKKpMI0HHs?=
 =?us-ascii?Q?Ecod1OcdzpZdJRH2/0r3HRpidxLKB+RlL3jf0BSiyoo8wGwUlm1n7DMEPC9M?=
 =?us-ascii?Q?NmXEznhwLHf1dm8tAEoODW56oLF/SNF3PaCHSsZqBA1LEdUwFpkJ+FOhwO9f?=
 =?us-ascii?Q?GZB3C9n+Vc4feLdFLbByaqmI1hwMFi7V5D5m7JG4VHakLMWVH9XJB4wXDOBA?=
 =?us-ascii?Q?fi5fN52ODejPRRiXTPesZvbRtVV5BdFK+YnPwdB1diWOqnXlaQQaST9HQkkK?=
 =?us-ascii?Q?DhlIj69BaEVYDE0u/YIIfrjfLAhvEx7u+FwC+E9v/4ziK/mDiRpa9WFihEDh?=
 =?us-ascii?Q?M2onplyRCdAtvN82xyKTS0cVjQ0A1DQwUQjofweqodw2xl2UCUk7?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d2be3ba-5583-45bc-5402-08dea1f28c04
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 11:13:43.7427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hYJ+BhMGlHdAHibAFv8N3bvC4MogUqDyiFQ9O0JdYlpbD5TwQerKYlMBPftBbzkQ+46cqCyxbHBlTfyUHHNIeV16wguk6ZtHC4pi4gaML/VlX/onmKQPMMTDP6PaQu+2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1299
X-Rspamd-Queue-Id: 9DF2245DF64
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.04 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	GREYLIST(0.00)[pass,meta];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35480-lists,linux-gpio=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[changhuang.liang@starfivetech.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,starfivetech.com:mid,starfivetech.com:email]

Add pinctrl driver for StarFive JHB100 SoC System-0 Host(sys0h) pinctrl
controller.

Signed-off-by: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/pinctrl/starfive/Kconfig              | 12 +++
 drivers/pinctrl/starfive/Makefile             |  1 +
 .../starfive/pinctrl-starfive-jhb100-sys0h.c  | 81 +++++++++++++++++++
 3 files changed, 94 insertions(+)
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0h.c

diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/Kconfig
index dc53070ee2c8..8739ed1ca350 100644
--- a/drivers/pinctrl/starfive/Kconfig
+++ b/drivers/pinctrl/starfive/Kconfig
@@ -70,3 +70,15 @@ config PINCTRL_STARFIVE_JHB100_SYS0
 	  This also provides an interface to the GPIO pins not used by other
 	  peripherals supporting inputs, outputs, configuring pull-up/pull-down
 	  and interrupts on input changes.
+
+config PINCTRL_STARFIVE_JHB100_SYS0H
+        tristate "StarFive JHB100 SoC System-0 Host pinctrl and GPIO driver"
+        depends on ARCH_STARFIVE  || COMPILE_TEST
+        depends on OF
+        select PINCTRL_STARFIVE_JHB100
+        default ARCH_STARFIVE
+        help
+          Say yes here to support System-0 Host pin control on the StarFive JHB100 SoC.
+          This also provides an interface to the GPIO pins not used by other
+          peripherals supporting inputs, outputs, configuring pull-up/pull-down
+          and interrupts on input changes.
diff --git a/drivers/pinctrl/starfive/Makefile b/drivers/pinctrl/starfive/Makefile
index c0d368f413bc..b26156a6d0eb 100644
--- a/drivers/pinctrl/starfive/Makefile
+++ b/drivers/pinctrl/starfive/Makefile
@@ -8,3 +8,4 @@ obj-$(CONFIG_PINCTRL_STARFIVE_JH7110_AON)	+= pinctrl-starfive-jh7110-aon.o
 
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100)		+= pinctrl-starfive-jhb100.o
 obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0)	+= pinctrl-starfive-jhb100-sys0.o
+obj-$(CONFIG_PINCTRL_STARFIVE_JHB100_SYS0H)	+= pinctrl-starfive-jhb100-sys0h.o
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0h.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0h.c
new file mode 100644
index 000000000000..42fbbcd92550
--- /dev/null
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100-sys0h.c
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Pinctrl / GPIO driver for StarFive JHB100 SoC System-0 host domain
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
+static const struct jhb100_pin_layout_desc jhb100_sys0h_pl_desc[] = {
+	{ .pin_start = 0, .pin_cnt = 7, .name = "gpio", .gpio_func_sel = 0 },
+	{ .pin_start = 7, .pin_cnt = 1, .name = "espi0_reset", .gpio_func_sel = 1 },
+	{ .pin_start = 8, .pin_cnt = 4, .name = "gpio", .gpio_func_sel = 0 },
+	{ 0xff },
+};
+
+static struct config_reg_layout_desc jhb100_sys0h_pinctrl_rl_desc[] = {
+	{
+		.pin_start			= 0,
+		.pin_cnt			= 12,
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
+struct starfive_pinctrl_regs jhb100_sys0h_pinctrl_regs = {
+	.config			= { .reg = 0x04, .width_per_pin = 1 },
+	.output			= { .reg = 0x34, .width_per_pin = 1 },
+	.output_en		= { .reg = 0x38, .width_per_pin = 1 },
+	.gpio_status		= { .reg = 0x3c, .width_per_pin = 1 },
+	.func_sel		= { .reg = 0x40, .width_per_pin = 2 },
+	.irq_en			= { .reg = 0x44, .width_per_pin = 1 },
+	.irq_status		= { .reg = 0x48, .width_per_pin = 1 },
+	.irq_clr		= { .reg = 0x4c, .width_per_pin = 1 },
+	.irq_trigger		= { .reg = 0x50, .width_per_pin = 1 },
+	.irq_level		= { .reg = 0x54, .width_per_pin = 1 },
+	.irq_both_edge		= { .reg = 0x58, .width_per_pin = 1 },
+	.irq_edge		= { .reg = 0x5c, .width_per_pin = 1 },
+};
+
+static struct jhb100_pinctrl_domain_info jhb100_sys0h_pinctrl_info = {
+	.name			= "jhb100-sys0h",
+	.gc_base		= -1,
+	.pl_desc		= jhb100_sys0h_pl_desc,
+	.crl_desc		= jhb100_sys0h_pinctrl_rl_desc,
+	.regs			= &jhb100_sys0h_pinctrl_regs,
+};
+
+static const struct of_device_id jhb100_sys0h_pinctrl_of_match[] = {
+	{
+		.compatible = "starfive,jhb100-sys0h-pinctrl",
+		.data = &jhb100_sys0h_pinctrl_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jhb100_sys0h_pinctrl_of_match);
+
+static struct platform_driver jhb100_sys0h_pinctrl_driver = {
+	.probe = jhb100_pinctrl_probe,
+	.driver = {
+		.name = "starfive-jhb100-sys0h-pinctrl",
+		.of_match_table = jhb100_sys0h_pinctrl_of_match,
+	},
+};
+module_platform_driver(jhb100_sys0h_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for StarFive JHB100 SoC System-0 host domain");
+MODULE_AUTHOR("Alex Soo <yuklin.soo@starfivetech.com>");
+MODULE_LICENSE("GPL");
-- 
2.25.1


