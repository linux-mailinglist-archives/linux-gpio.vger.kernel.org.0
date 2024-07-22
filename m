Return-Path: <linux-gpio+bounces-8336-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E60EE93875A
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2024 03:41:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 158C71C2061C
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2024 01:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36BBFDF51;
	Mon, 22 Jul 2024 01:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="VMWGsFRO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11olkn2055.outbound.protection.outlook.com [40.92.20.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D77E125D6;
	Mon, 22 Jul 2024 01:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.20.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721612429; cv=fail; b=ajFQA8p1ZC/Y6hys/PpPzQRNmdbrFub6Qtg37gitpHp9I5Wvo/32Ff29JBKwRODf/2I4vH1pTk4To5E+NNbitP0OV41gOsRAc4MWOJazWALVZ5PoujFADlqeyV3G4bic3VKSAkeM3NXPpYETaCLr31xZvBfwQXtY5GeqwNoJSTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721612429; c=relaxed/simple;
	bh=cBwwkhnr+QPC973CZHF7wP1NC9V3F+joXlyB6XZLL9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q4Q9S2b2ZguAf2gp27UxxSnJEpmHxg9xLiBi3T0FRdmRpvzQ4mBXKBUcDHg3zdG3cQVvkiqHgxldOGASb8MOPxYFiLK/TgEwyyXmfttsNb2u2PBgcu3vseQX4g28O1JA7hn50AczJ9peXWRLpqHLlDiMjuYDBt8sn6A9zKi9Ucs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=VMWGsFRO; arc=fail smtp.client-ip=40.92.20.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c+VJCQvXsrz/Q0jrf+6v+NFNZqgRwgIjhR2pcoJUDhDyJjk4vanGQNt13b8TGgflpYYD6IpaWjSMJxkSzfL5vQrIpJj3WQarLaDGZ5q/dxdYwrNmGwp3NDB0ow3TDnmaZyGjynVupPr7GO7WZSWPDmLzt+hgvbBilBhaFZ/To8sPaB4mDblRuKDCe2mr5QdUXjEf/WJxjyKXCSCFQBe5JBgrYMN+NZrAP+NWiLB7wAyKpGgPi1qDu2c8+w3dNb94nKoYyB+iB0JnjQrxs7vSmf60ODl0t5ICjm2kxOwA2GFdHc9Df8R/IpcKS281TwMN+4/AHyTIHf0LWsivcvjerA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cL3bhuYxzN8aa2ans40jo3yUMGBwl1yf5lokYVVD/70=;
 b=KJX7aSHshl1F+CNXR4UCU9mUV1c5qRXp3RznP2wVrdkPOix54ZP3YfKkda+Cv4SmtEedm+ijZtv2KX0HbuTVW50BUA598+X/MfZAhW2rWy74EayUPzWiGI+8QmtK/6DIqzsWfY5aGS3D2t418xzNE8S1XWaNlegHDEy0aLIysXQXkxC1Acl5Whb+IymB+TGewtC0k42y41rsM0Zkge9BTYMUnlMdYywiio9KPN/Fuz4IORrPuOFVBvIhI+zdpIOgzC0GIcE1cKAUUzCsQb8L4mBzz3HY6Rbuw7T86X2qGzFYoHA39Uv++rzlZFQijhb5e+PlOSS97uYT5pxLwtNzWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cL3bhuYxzN8aa2ans40jo3yUMGBwl1yf5lokYVVD/70=;
 b=VMWGsFROpNXviuXXhRbR8iXgiAoVj2zxCQ5xXm0U6DUYSyf0adVpvyNVtIX3ahc0kM5Yz3tMwyAKO5Tr8AbpZj9agYSdAmV4y3Utk1yIYTCke3pBnY9fODXfLN55ufQ6Wj9krJ0ONEKcRhQGhWKKa1+NaF97p5L7ZTfUlT1Y/VT2Qzch2Tsp6ASAxwBBroAub8Jpr+HSGS8fncLIVzp5wnwgDj40bg9XYhtN+95PjA60lqgdxpgNtTtCsuV0H14j49jgs4/aW0jG5B3H7G0Z63a/jrG3G5f7lPgyfPuvjeGndbysYIdSPn309GwLSfqfi3t6IYzPDZTM3I7K2h9CRA==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by CY8PR20MB5403.namprd20.prod.outlook.com (2603:10b6:930:5d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23; Mon, 22 Jul
 2024 01:40:17 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%5]) with mapi id 15.20.7784.016; Mon, 22 Jul 2024
 01:40:17 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Drew Fustini <dfustini@baylibre.com>
Cc: Yixun Lan <dlan@gentoo.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 5/7] pinctrl: sophgo: add support for SG2002 SoC
Date: Mon, 22 Jul 2024 09:39:24 +0800
Message-ID:
 <IA1PR20MB4953D8CBEE8265CBE39D5768BBA82@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <IA1PR20MB49535F9918829FA524BDB02ABBA82@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49535F9918829FA524BDB02ABBA82@IA1PR20MB4953.namprd20.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [QgUsYu8RVh11rs/0n0nk6EV3+OXXR2om6LSmNMbHSY8=]
X-ClientProxiedBy: TYCPR01CA0131.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::19) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID:
 <20240722013937.623685-5-inochiama@outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|CY8PR20MB5403:EE_
X-MS-Office365-Filtering-Correlation-Id: 262a3159-950d-4658-75e7-08dca9ef3d52
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799006|461199028|19110799003|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	TOmCqtTP/EIrwrSzd1mITlsFL1qXtL4RGIqQkNAIj/nnTmyDUF7s44cp+cmfdjpoQQObcbSCsm2eUNoPAL3JP7xHQD0AnPVgEIemS2oUeleS/wAzkqxBlmwQwuSYpMMuD9DvDt1+D7ZTOtd9EF1Cr9BkH5MEh4wM3UUfUGmryyD6RAW99kxGjIBDnVUXRm2Fb7PRcXJEsm5Bgjg9jR4YgKAZJ9+cK9ueod8whD8qNNJXeGOLK/iRRjcKJUVO334AiQGqzGrZU0G/3AMeNW5tDSkXnm328FC1NEfnqwpJuOhGL7zml4gkVzMG49aeKTbhXIMRVxgibSDiO0jMIglYgFuXM8YjLczXPrYAnMRAjF0a4UNWnX7nggor/6th44QMKcx+s7vMSRYgGQUt1sCeOZZ5eNjGinxOJ+jGcHmIF9so4Wpojvjb2KqhkJt/HuwvK2dM78xHgP4WpBqp9gtR+zEYhPPRlG3d1Ppw4+weUmgi7I3aumlaWK/edQ/XLJBSUkvrfUBwqCq2hHxsXGf0cTDZr8TIx0zSAIDv82i8CueB0U12Y3KebgNj1Bkdci+o9sGXWI6NrmMLZ/NNFaQq6mcPTQx5Zs0ZbC9efaPqRbGER/tgJAjqV71R8eZl55zMIZznnx7TyDyAtrCJLlYzfvRetxj7Sfpe/IMdFKKx8c5PpRhS4LfIOzTygNEn/a56
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?m3anlzjcvFgEytyO3lgPxU713VOt+abyexz9XSPgjJusL/98ABxlLcYkFTr3?=
 =?us-ascii?Q?BWq8c/2z1J6f5xuNbYqrmbhDC8HNo6LLSc28awYbUR32cxWIXsfwmshdiyKf?=
 =?us-ascii?Q?q0qreApdwlM5Yo8Smc+MYYmYoyYdSuuMaP32uwuk1AXfEslltPwW6eV4WdtD?=
 =?us-ascii?Q?pA+RW4iIZCe1TwtaefMOIusfY9Ux0OP8Mx7BG3Wsay6o7ljFwc+oMGo8arwp?=
 =?us-ascii?Q?eNNMO9hD6Wo1pc9v1nDqfdG0QsZaE8/qk9GYxoOYE4lGzIdPfeWZpojsYfP2?=
 =?us-ascii?Q?GuodN9extx+bPTuEQ+534YW7zHpezrIG5urPeP8gmhdB+5IEwMc0vJ0gS+8m?=
 =?us-ascii?Q?bNj6SJZchb82AKE81uk4bjHD72cjhsYGq2I/NnNok4xDUVBamWibqWUrQEQH?=
 =?us-ascii?Q?cYUI5kiqMJm2KCurstK8FXDY7Hsu2vQOaO8q9cAK+lzpE98GLwkQxb4rZuD8?=
 =?us-ascii?Q?KDJbggiQqsLu3oHsR8pZkFWQtjG6R4G3UGi6oAQoz/b04Cgkf9c29kVGLbRN?=
 =?us-ascii?Q?UZN9YGJ7MQTIkFQDGt+DpClsqDEqKQv1S+ZekWOiygtu7v7Dxk0lCqXtdzc9?=
 =?us-ascii?Q?URV7fIgBgbcNQp6CfMtERodbYWx95R/QqgsY9o3rPhC3093D6GtZE+55cODh?=
 =?us-ascii?Q?sXLnzJxR7rsBwqcQ5gfB/6FSN8Dz/B7Oq7NEU4Fr+zjXdI3O4dagaPST5FEF?=
 =?us-ascii?Q?oEJfh5oVxlR+Uv9CkJcWgOW3WmAvV/U/mjuwwFVdZbspJMdb7VoWifKatBhn?=
 =?us-ascii?Q?+Tg2Up7WUkqrEbdSasTwCvTt0z4J6ZdG0xAwHgKeVh2jFuWlmAAnhYe14mjN?=
 =?us-ascii?Q?3nZM3+M7DO3b8HcYDhrKzS/SJmeufO5U0YGZMVlYLs++9530sGvMTOLTvHXA?=
 =?us-ascii?Q?cCwdUx4ljZr4CgV2Qa/mAfZJxHdvSF22kB+SaZRiEJEOgEcRprdk87+OGVAo?=
 =?us-ascii?Q?agNa6swQs2o8ck1pgzk3G/reQOydQ6N3n4QCvhRvuO4eqpVANaU59C/2YmOm?=
 =?us-ascii?Q?N+40sy6m8TwAUoeSqxqidFeQUbGk07wsW4OvYq9DEcPKSd/3bFjdAE2j8RSe?=
 =?us-ascii?Q?C4T9niRBdUg5pxY9GU8WMRV+6vi9ZF9FQshSk7d9QY6ovbb66mIcdXMWVLrl?=
 =?us-ascii?Q?d6nuaCalIwyC0ZXD9VgpS9lujHD1YkUFzxoCQhN9w+fHn0hBYbFGE7fxFuDH?=
 =?us-ascii?Q?F3qEU/5HBVp3orT9bM90EYw9EmXHCZwAfuraL+6OZpur+FDxvnHWPdDv6hSP?=
 =?us-ascii?Q?QHz55VJkBzTtbMokHlg1?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 262a3159-950d-4658-75e7-08dca9ef3d52
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2024 01:40:17.4007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR20MB5403

Add pin definition driver of SG2002.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 drivers/pinctrl/sophgo/Kconfig          |  11 +
 drivers/pinctrl/sophgo/Makefile         |   1 +
 drivers/pinctrl/sophgo/pinctrl-sg2002.c | 542 ++++++++++++++++++++++++
 3 files changed, 554 insertions(+)
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-sg2002.c

diff --git a/drivers/pinctrl/sophgo/Kconfig b/drivers/pinctrl/sophgo/Kconfig
index 000351566fcf..b14792ee46fc 100644
--- a/drivers/pinctrl/sophgo/Kconfig
+++ b/drivers/pinctrl/sophgo/Kconfig
@@ -41,3 +41,14 @@ config PINCTRL_SOPHGO_SG2000
 	  This pin controller allows selecting the mux function for
 	  each pin. This driver can also be built as a module called
 	  pinctrl-sg2000.
+
+config PINCTRL_SOPHGO_SG2002
+	tristate "Sophgo SG2000 SoC Pinctrl driver"
+	depends on ARCH_SOPHGO || COMPILE_TEST
+	depends on OF
+	select PINCTRL_SOPHGO_CV18XX
+	help
+	  Say Y to select the pinctrl driver for SG2002 SoC.
+	  This pin controller allows selecting the mux function for
+	  each pin. This driver can also be built as a module called
+	  pinctrl-sg2002.
diff --git a/drivers/pinctrl/sophgo/Makefile b/drivers/pinctrl/sophgo/Makefile
index 16e923e3f77b..4113a5c9191b 100644
--- a/drivers/pinctrl/sophgo/Makefile
+++ b/drivers/pinctrl/sophgo/Makefile
@@ -4,3 +4,4 @@ obj-$(CONFIG_PINCTRL_SOPHGO_CV18XX)	+= pinctrl-cv18xx.o
 obj-$(CONFIG_PINCTRL_SOPHGO_CV1800B)	+= pinctrl-cv1800b.o
 obj-$(CONFIG_PINCTRL_SOPHGO_CV1812H)	+= pinctrl-cv1812h.o
 obj-$(CONFIG_PINCTRL_SOPHGO_SG2000)	+= pinctrl-sg2000.o
+obj-$(CONFIG_PINCTRL_SOPHGO_SG2002)	+= pinctrl-sg2002.o
diff --git a/drivers/pinctrl/sophgo/pinctrl-sg2002.c b/drivers/pinctrl/sophgo/pinctrl-sg2002.c
new file mode 100644
index 000000000000..5c49208dcb59
--- /dev/null
+++ b/drivers/pinctrl/sophgo/pinctrl-sg2002.c
@@ -0,0 +1,542 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Sophgo SG2002 SoC pinctrl driver.
+ *
+ * Copyright (C) 2024 Inochi Amaoto <inochiama@outlook.com>
+ *
+ * This file is generated from vendor pinout definition.
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+
+#include <dt-bindings/pinctrl/pinctrl-sg2002.h>
+
+#include "pinctrl-cv18xx.h"
+
+enum SG2002_POWER_DOMAIN {
+	VDD18A_MIPI		= 0,
+	VDD18A_USB_PLL_ETH	= 1,
+	VDDIO_RTC		= 2,
+	VDDIO_SD0_EMMC		= 3,
+	VDDIO_SD1		= 4
+};
+
+static const char *const sg2002_power_domain_desc[] = {
+	[VDD18A_MIPI]		= "VDD18A_MIPI",
+	[VDD18A_USB_PLL_ETH]	= "VDD18A_USB_PLL_ETH",
+	[VDDIO_RTC]		= "VDDIO_RTC",
+	[VDDIO_SD0_EMMC]	= "VDDIO_SD0_EMMC",
+	[VDDIO_SD1]		= "VDDIO_SD1",
+};
+
+static int sg2002_get_pull_up(struct cv1800_pin *pin, const u32 *psmap)
+{
+	u32 pstate = psmap[pin->power_domain];
+	enum cv1800_pin_io_type type = cv1800_pin_io_type(pin);
+
+	if (type == IO_TYPE_1V8_ONLY)
+		return 79000;
+
+	if (type == IO_TYPE_1V8_OR_3V3) {
+		if (pstate == PIN_POWER_STATE_1V8)
+			return 60000;
+		if (pstate == PIN_POWER_STATE_3V3)
+			return 60000;
+
+		return -EINVAL;
+	}
+
+	return -ENOTSUPP;
+}
+
+static int sg2002_get_pull_down(struct cv1800_pin *pin, const u32 *psmap)
+{
+	u32 pstate = psmap[pin->power_domain];
+	enum cv1800_pin_io_type type = cv1800_pin_io_type(pin);
+
+	if (type == IO_TYPE_1V8_ONLY)
+		return 87000;
+
+	if (type == IO_TYPE_1V8_OR_3V3) {
+		if (pstate == PIN_POWER_STATE_1V8)
+			return 61000;
+		if (pstate == PIN_POWER_STATE_3V3)
+			return 62000;
+
+		return -EINVAL;
+	}
+
+	return -ENOTSUPP;
+}
+
+static const u32 sg2002_1v8_oc_map[] = {
+	12800,
+	25300,
+	37400,
+	49000
+};
+
+static const u32 sg2002_18od33_1v8_oc_map[] = {
+	7800,
+	11700,
+	15500,
+	19200,
+	23000,
+	26600,
+	30200,
+	33700
+};
+
+static const u32 sg2002_18od33_3v3_oc_map[] = {
+	5500,
+	8200,
+	10800,
+	13400,
+	16100,
+	18700,
+	21200,
+	23700
+};
+
+static const u32 sg2002_eth_oc_map[] = {
+	15700,
+	17800
+};
+
+static int sg2002_get_oc_map(struct cv1800_pin *pin, const u32 *psmap,
+			     const u32 **map)
+{
+	enum cv1800_pin_io_type type = cv1800_pin_io_type(pin);
+	u32 pstate = psmap[pin->power_domain];
+
+	if (type == IO_TYPE_1V8_ONLY) {
+		*map = sg2002_1v8_oc_map;
+		return ARRAY_SIZE(sg2002_1v8_oc_map);
+	}
+
+	if (type == IO_TYPE_1V8_OR_3V3) {
+		if (pstate == PIN_POWER_STATE_1V8) {
+			*map = sg2002_18od33_1v8_oc_map;
+			return ARRAY_SIZE(sg2002_18od33_1v8_oc_map);
+		} else if (pstate == PIN_POWER_STATE_3V3) {
+			*map = sg2002_18od33_3v3_oc_map;
+			return ARRAY_SIZE(sg2002_18od33_3v3_oc_map);
+		}
+	}
+
+	if (type == IO_TYPE_ETH) {
+		*map = sg2002_eth_oc_map;
+		return ARRAY_SIZE(sg2002_eth_oc_map);
+	}
+
+	return -ENOTSUPP;
+}
+
+static const u32 sg2002_1v8_schmitt_map[] = {
+	0,
+	970000,
+	1040000
+};
+
+static const u32 sg2002_18od33_1v8_schmitt_map[] = {
+	0,
+	1070000
+};
+
+static const u32 sg2002_18od33_3v3_schmitt_map[] = {
+	0,
+	1100000
+};
+
+static int sg2002_get_schmitt_map(struct cv1800_pin *pin, const u32 *psmap,
+				  const u32 **map)
+{
+	enum cv1800_pin_io_type type = cv1800_pin_io_type(pin);
+	u32 pstate = psmap[pin->power_domain];
+
+	if (type == IO_TYPE_1V8_ONLY) {
+		*map = sg2002_1v8_schmitt_map;
+		return ARRAY_SIZE(sg2002_1v8_schmitt_map);
+	}
+
+	if (type == IO_TYPE_1V8_OR_3V3) {
+		if (pstate == PIN_POWER_STATE_1V8) {
+			*map = sg2002_18od33_1v8_schmitt_map;
+			return ARRAY_SIZE(sg2002_18od33_1v8_schmitt_map);
+		} else if (pstate == PIN_POWER_STATE_3V3) {
+			*map = sg2002_18od33_3v3_schmitt_map;
+			return ARRAY_SIZE(sg2002_18od33_3v3_schmitt_map);
+		}
+	}
+
+	return -ENOTSUPP;
+}
+
+static const struct cv1800_vddio_cfg_ops sg2002_vddio_cfg_ops = {
+	.get_pull_up		= sg2002_get_pull_up,
+	.get_pull_down		= sg2002_get_pull_down,
+	.get_oc_map		= sg2002_get_oc_map,
+	.get_schmitt_map		= sg2002_get_schmitt_map,
+};
+
+static const struct pinctrl_pin_desc sg2002_pins[] = {
+	PINCTRL_PIN(PIN_AUD_AINL_MIC,	"AUD_AINL_MIC"),
+	PINCTRL_PIN(PIN_AUD_AOUTR,	"AUD_AOUTR"),
+	PINCTRL_PIN(PIN_SD0_CLK,	"SD0_CLK"),
+	PINCTRL_PIN(PIN_SD0_CMD,	"SD0_CMD"),
+	PINCTRL_PIN(PIN_SD0_D0,		"SD0_D0"),
+	PINCTRL_PIN(PIN_SD0_D1,		"SD0_D1"),
+	PINCTRL_PIN(PIN_SD0_D2,		"SD0_D2"),
+	PINCTRL_PIN(PIN_SD0_D3,		"SD0_D3"),
+	PINCTRL_PIN(PIN_SD0_CD,		"SD0_CD"),
+	PINCTRL_PIN(PIN_SD0_PWR_EN,	"SD0_PWR_EN"),
+	PINCTRL_PIN(PIN_SPK_EN,		"SPK_EN"),
+	PINCTRL_PIN(PIN_UART0_TX,	"UART0_TX"),
+	PINCTRL_PIN(PIN_UART0_RX,	"UART0_RX"),
+	PINCTRL_PIN(PIN_EMMC_DAT2,	"EMMC_DAT2"),
+	PINCTRL_PIN(PIN_EMMC_CLK,	"EMMC_CLK"),
+	PINCTRL_PIN(PIN_EMMC_DAT0,	"EMMC_DAT0"),
+	PINCTRL_PIN(PIN_EMMC_DAT3,	"EMMC_DAT3"),
+	PINCTRL_PIN(PIN_EMMC_CMD,	"EMMC_CMD"),
+	PINCTRL_PIN(PIN_EMMC_DAT1,	"EMMC_DAT1"),
+	PINCTRL_PIN(PIN_JTAG_CPU_TMS,	"JTAG_CPU_TMS"),
+	PINCTRL_PIN(PIN_JTAG_CPU_TCK,	"JTAG_CPU_TCK"),
+	PINCTRL_PIN(PIN_IIC0_SCL,	"IIC0_SCL"),
+	PINCTRL_PIN(PIN_IIC0_SDA,	"IIC0_SDA"),
+	PINCTRL_PIN(PIN_AUX0,		"AUX0"),
+	PINCTRL_PIN(PIN_GPIO_ZQ,	"GPIO_ZQ"),
+	PINCTRL_PIN(PIN_PWR_VBAT_DET,	"PWR_VBAT_DET"),
+	PINCTRL_PIN(PIN_PWR_RSTN,	"PWR_RSTN"),
+	PINCTRL_PIN(PIN_PWR_SEQ1,	"PWR_SEQ1"),
+	PINCTRL_PIN(PIN_PWR_SEQ2,	"PWR_SEQ2"),
+	PINCTRL_PIN(PIN_PWR_WAKEUP0,	"PWR_WAKEUP0"),
+	PINCTRL_PIN(PIN_PWR_BUTTON1,	"PWR_BUTTON1"),
+	PINCTRL_PIN(PIN_XTAL_XIN,	"XTAL_XIN"),
+	PINCTRL_PIN(PIN_PWR_GPIO0,	"PWR_GPIO0"),
+	PINCTRL_PIN(PIN_PWR_GPIO1,	"PWR_GPIO1"),
+	PINCTRL_PIN(PIN_PWR_GPIO2,	"PWR_GPIO2"),
+	PINCTRL_PIN(PIN_SD1_D3,		"SD1_D3"),
+	PINCTRL_PIN(PIN_SD1_D2,		"SD1_D2"),
+	PINCTRL_PIN(PIN_SD1_D1,		"SD1_D1"),
+	PINCTRL_PIN(PIN_SD1_D0,		"SD1_D0"),
+	PINCTRL_PIN(PIN_SD1_CMD,	"SD1_CMD"),
+	PINCTRL_PIN(PIN_SD1_CLK,	"SD1_CLK"),
+	PINCTRL_PIN(PIN_PWM0_BUCK,	"PWM0_BUCK"),
+	PINCTRL_PIN(PIN_ADC1,		"ADC1"),
+	PINCTRL_PIN(PIN_USB_VBUS_DET,	"USB_VBUS_DET"),
+	PINCTRL_PIN(PIN_ETH_TXP,	"ETH_TXP"),
+	PINCTRL_PIN(PIN_ETH_TXM,	"ETH_TXM"),
+	PINCTRL_PIN(PIN_ETH_RXP,	"ETH_RXP"),
+	PINCTRL_PIN(PIN_ETH_RXM,	"ETH_RXM"),
+	PINCTRL_PIN(PIN_GPIO_RTX,	"GPIO_RTX"),
+	PINCTRL_PIN(PIN_MIPIRX4N,	"MIPIRX4N"),
+	PINCTRL_PIN(PIN_MIPIRX4P,	"MIPIRX4P"),
+	PINCTRL_PIN(PIN_MIPIRX3N,	"MIPIRX3N"),
+	PINCTRL_PIN(PIN_MIPIRX3P,	"MIPIRX3P"),
+	PINCTRL_PIN(PIN_MIPIRX2N,	"MIPIRX2N"),
+	PINCTRL_PIN(PIN_MIPIRX2P,	"MIPIRX2P"),
+	PINCTRL_PIN(PIN_MIPIRX1N,	"MIPIRX1N"),
+	PINCTRL_PIN(PIN_MIPIRX1P,	"MIPIRX1P"),
+	PINCTRL_PIN(PIN_MIPIRX0N,	"MIPIRX0N"),
+	PINCTRL_PIN(PIN_MIPIRX0P,	"MIPIRX0P"),
+	PINCTRL_PIN(PIN_MIPI_TXM2,	"MIPI_TXM2"),
+	PINCTRL_PIN(PIN_MIPI_TXP2,	"MIPI_TXP2"),
+	PINCTRL_PIN(PIN_MIPI_TXM1,	"MIPI_TXM1"),
+	PINCTRL_PIN(PIN_MIPI_TXP1,	"MIPI_TXP1"),
+	PINCTRL_PIN(PIN_MIPI_TXM0,	"MIPI_TXM0"),
+	PINCTRL_PIN(PIN_MIPI_TXP0,	"MIPI_TXP0"),
+};
+
+static const struct cv1800_pin sg2002_pin_data[ARRAY_SIZE(sg2002_pins)] = {
+	CV1800_FUNC_PIN(PIN_AUD_AINL_MIC, VDD18A_MIPI,
+			IO_TYPE_AUDIO,
+			CV1800_PINCONF_AREA_SYS, 0x1bc, 5),
+	CV1800_FUNC_PIN(PIN_AUD_AOUTR, VDD18A_MIPI,
+			IO_TYPE_AUDIO,
+			CV1800_PINCONF_AREA_SYS, 0x1c8, 6),
+	CV1800_GENERAL_PIN(PIN_SD0_CLK, VDDIO_SD0_EMMC,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x01c, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xa00),
+	CV1800_GENERAL_PIN(PIN_SD0_CMD, VDDIO_SD0_EMMC,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x020, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xa04),
+	CV1800_GENERAL_PIN(PIN_SD0_D0, VDDIO_SD0_EMMC,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x024, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xa08),
+	CV1800_GENERAL_PIN(PIN_SD0_D1, VDDIO_SD0_EMMC,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x028, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xa0c),
+	CV1800_GENERAL_PIN(PIN_SD0_D2, VDDIO_SD0_EMMC,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x02c, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xa10),
+	CV1800_GENERAL_PIN(PIN_SD0_D3, VDDIO_SD0_EMMC,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x030, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xa14),
+	CV1800_GENERAL_PIN(PIN_SD0_CD, VDDIO_SD0_EMMC,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x034, 3,
+			   CV1800_PINCONF_AREA_SYS, 0x900),
+	CV1800_GENERAL_PIN(PIN_SD0_PWR_EN, VDDIO_SD0_EMMC,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x038, 3,
+			   CV1800_PINCONF_AREA_SYS, 0x904),
+	CV1800_GENERAL_PIN(PIN_SPK_EN, VDDIO_SD0_EMMC,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x03c, 3,
+			   CV1800_PINCONF_AREA_SYS, 0x908),
+	CV1800_GENERAL_PIN(PIN_UART0_TX, VDDIO_SD0_EMMC,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x040, 7,
+			   CV1800_PINCONF_AREA_SYS, 0x90c),
+	CV1800_GENERAL_PIN(PIN_UART0_RX, VDDIO_SD0_EMMC,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x044, 7,
+			   CV1800_PINCONF_AREA_SYS, 0x910),
+	CV1800_GENERAL_PIN(PIN_EMMC_DAT2, VDDIO_SD0_EMMC,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x04c, 3,
+			   CV1800_PINCONF_AREA_SYS, 0x918),
+	CV1800_GENERAL_PIN(PIN_EMMC_CLK, VDDIO_SD0_EMMC,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x050, 3,
+			   CV1800_PINCONF_AREA_SYS, 0x91c),
+	CV1800_GENERAL_PIN(PIN_EMMC_DAT0, VDDIO_SD0_EMMC,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x054, 3,
+			   CV1800_PINCONF_AREA_SYS, 0x920),
+	CV1800_GENERAL_PIN(PIN_EMMC_DAT3, VDDIO_SD0_EMMC,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x058, 3,
+			   CV1800_PINCONF_AREA_SYS, 0x924),
+	CV1800_GENERAL_PIN(PIN_EMMC_CMD, VDDIO_SD0_EMMC,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x05c, 3,
+			   CV1800_PINCONF_AREA_SYS, 0x928),
+	CV1800_GENERAL_PIN(PIN_EMMC_DAT1, VDDIO_SD0_EMMC,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x060, 3,
+			   CV1800_PINCONF_AREA_SYS, 0x92c),
+	CV1800_GENERAL_PIN(PIN_JTAG_CPU_TMS, VDDIO_SD0_EMMC,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x064, 7,
+			   CV1800_PINCONF_AREA_SYS, 0x930),
+	CV1800_GENERAL_PIN(PIN_JTAG_CPU_TCK, VDDIO_SD0_EMMC,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x068, 7,
+			   CV1800_PINCONF_AREA_SYS, 0x934),
+	CV1800_GENERAL_PIN(PIN_IIC0_SCL, VDDIO_SD0_EMMC,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x070, 7,
+			   CV1800_PINCONF_AREA_SYS, 0x93c),
+	CV1800_GENERAL_PIN(PIN_IIC0_SDA, VDDIO_SD0_EMMC,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x074, 7,
+			   CV1800_PINCONF_AREA_SYS, 0x940),
+	CV1800_GENERAL_PIN(PIN_AUX0, VDDIO_SD0_EMMC,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x078, 7,
+			   CV1800_PINCONF_AREA_SYS, 0x944),
+	CV1800_GENERAL_PIN(PIN_GPIO_ZQ, VDDIO_RTC,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x1d0, 4,
+			   CV1800_PINCONF_AREA_RTC, 0x0e0),
+	CV1800_GENERAL_PIN(PIN_PWR_VBAT_DET, VDDIO_RTC,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x07c, 0,
+			   CV1800_PINCONF_AREA_RTC, 0x000),
+	CV1800_GENERAL_PIN(PIN_PWR_RSTN, VDDIO_RTC,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x080, 0,
+			   CV1800_PINCONF_AREA_RTC, 0x004),
+	CV1800_GENERAL_PIN(PIN_PWR_SEQ1, VDDIO_RTC,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x084, 3,
+			   CV1800_PINCONF_AREA_RTC, 0x008),
+	CV1800_GENERAL_PIN(PIN_PWR_SEQ2, VDDIO_RTC,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x088, 3,
+			   CV1800_PINCONF_AREA_RTC, 0x00c),
+	CV1800_GENERAL_PIN(PIN_PWR_WAKEUP0, VDDIO_RTC,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x090, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x018),
+	CV1800_GENERAL_PIN(PIN_PWR_BUTTON1, VDDIO_RTC,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x098, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x020),
+	CV1800_GENERAL_PIN(PIN_XTAL_XIN, VDDIO_RTC,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x0a0, 0,
+			   CV1800_PINCONF_AREA_RTC, 0x028),
+	CV1800_GENERAL_PIN(PIN_PWR_GPIO0, VDDIO_RTC,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x0a4, 4,
+			   CV1800_PINCONF_AREA_RTC, 0x02c),
+	CV1800_GENERAL_PIN(PIN_PWR_GPIO1, VDDIO_RTC,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x0a8, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x030),
+	CV1800_GENERAL_PIN(PIN_PWR_GPIO2, VDDIO_RTC,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x0ac, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x034),
+	CV1800_GENERAL_PIN(PIN_SD1_D3, VDDIO_SD1,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x0d0, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x058),
+	CV1800_GENERAL_PIN(PIN_SD1_D2, VDDIO_SD1,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x0d4, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x05c),
+	CV1800_GENERAL_PIN(PIN_SD1_D1, VDDIO_SD1,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x0d8, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x060),
+	CV1800_GENERAL_PIN(PIN_SD1_D0, VDDIO_SD1,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x0dc, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x064),
+	CV1800_GENERAL_PIN(PIN_SD1_CMD, VDDIO_SD1,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x0e0, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x068),
+	CV1800_GENERAL_PIN(PIN_SD1_CLK, VDDIO_SD1,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x0e4, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x06c),
+	CV1800_GENERAL_PIN(PIN_PWM0_BUCK, VDD18A_USB_PLL_ETH,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x0ec, 3,
+			   CV1800_PINCONF_AREA_SYS, 0x804),
+	CV1800_GENERAL_PIN(PIN_ADC1, VDD18A_USB_PLL_ETH,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x0f8, 4,
+			   CV1800_PINCONF_AREA_SYS, 0x810),
+	CV1800_GENERAL_PIN(PIN_USB_VBUS_DET, VDD18A_USB_PLL_ETH,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x108, 5,
+			   CV1800_PINCONF_AREA_SYS, 0x820),
+	CV1800_FUNC_PIN(PIN_ETH_TXP, VDD18A_USB_PLL_ETH,
+			IO_TYPE_ETH,
+			CV1800_PINCONF_AREA_SYS, 0x124, 7),
+	CV1800_FUNC_PIN(PIN_ETH_TXM, VDD18A_USB_PLL_ETH,
+			IO_TYPE_ETH,
+			CV1800_PINCONF_AREA_SYS, 0x128, 7),
+	CV1800_FUNC_PIN(PIN_ETH_RXP, VDD18A_USB_PLL_ETH,
+			IO_TYPE_ETH,
+			CV1800_PINCONF_AREA_SYS, 0x12c, 7),
+	CV1800_FUNC_PIN(PIN_ETH_RXM, VDD18A_USB_PLL_ETH,
+			IO_TYPE_ETH,
+			CV1800_PINCONF_AREA_SYS, 0x130, 7),
+	CV1800_GENERAL_PIN(PIN_GPIO_RTX, VDD18A_USB_PLL_ETH,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x1cc, 5,
+			   CV1800_PINCONF_AREA_SYS, 0xc8c),
+	CV1800_GENERATE_PIN_MUX2(PIN_MIPIRX4N, VDD18A_MIPI,
+				 IO_TYPE_1V8_ONLY,
+				 CV1800_PINCONF_AREA_SYS, 0x16c, 7,
+				 CV1800_PINCONF_AREA_SYS, 0x120, 7,
+				 CV1800_PINCONF_AREA_SYS, 0xc38),
+	CV1800_GENERATE_PIN_MUX2(PIN_MIPIRX4P, VDD18A_MIPI,
+				 IO_TYPE_1V8_ONLY,
+				 CV1800_PINCONF_AREA_SYS, 0x170, 7,
+				 CV1800_PINCONF_AREA_SYS, 0x11c, 7,
+				 CV1800_PINCONF_AREA_SYS, 0xc3c),
+	CV1800_GENERATE_PIN_MUX2(PIN_MIPIRX3N, VDD18A_MIPI,
+				 IO_TYPE_1V8_ONLY,
+				 CV1800_PINCONF_AREA_SYS, 0x174, 7,
+				 CV1800_PINCONF_AREA_SYS, 0x114, 7,
+				 CV1800_PINCONF_AREA_SYS, 0xc40),
+	CV1800_GENERATE_PIN_MUX2(PIN_MIPIRX3P, VDD18A_MIPI,
+				 IO_TYPE_1V8_ONLY,
+				 CV1800_PINCONF_AREA_SYS, 0x178, 7,
+				 CV1800_PINCONF_AREA_SYS, 0x118, 7,
+				 CV1800_PINCONF_AREA_SYS, 0xc44),
+	CV1800_GENERAL_PIN(PIN_MIPIRX2N, VDD18A_MIPI,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x17c, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc48),
+	CV1800_GENERAL_PIN(PIN_MIPIRX2P, VDD18A_MIPI,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x180, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc4c),
+	CV1800_GENERAL_PIN(PIN_MIPIRX1N, VDD18A_MIPI,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x184, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc50),
+	CV1800_GENERAL_PIN(PIN_MIPIRX1P, VDD18A_MIPI,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x188, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc54),
+	CV1800_GENERAL_PIN(PIN_MIPIRX0N, VDD18A_MIPI,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x18c, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc58),
+	CV1800_GENERAL_PIN(PIN_MIPIRX0P, VDD18A_MIPI,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x190, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc5c),
+	CV1800_GENERAL_PIN(PIN_MIPI_TXM2, VDD18A_MIPI,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x1a4, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc70),
+	CV1800_GENERAL_PIN(PIN_MIPI_TXP2, VDD18A_MIPI,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x1a8, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc74),
+	CV1800_GENERAL_PIN(PIN_MIPI_TXM1, VDD18A_MIPI,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x1ac, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc78),
+	CV1800_GENERAL_PIN(PIN_MIPI_TXP1, VDD18A_MIPI,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x1b0, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc7c),
+	CV1800_GENERAL_PIN(PIN_MIPI_TXM0, VDD18A_MIPI,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x1b4, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc80),
+	CV1800_GENERAL_PIN(PIN_MIPI_TXP0, VDD18A_MIPI,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x1b8, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc84),
+};
+
+static const struct cv1800_pinctrl_data sg2002_pindata = {
+	.pins		= sg2002_pins,
+	.pindata	= sg2002_pin_data,
+	.pdnames	= sg2002_power_domain_desc,
+	.vddio_ops	= &sg2002_vddio_cfg_ops,
+	.npins		= ARRAY_SIZE(sg2002_pins),
+	.npd		= ARRAY_SIZE(sg2002_power_domain_desc),
+};
+
+static const struct of_device_id sg2002_pinctrl_ids[] = {
+	{ .compatible = "sophgo,sg2002-pinctrl", .data = &sg2002_pindata },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, sg2002_pinctrl_ids);
+
+static struct platform_driver sg2002_pinctrl_driver = {
+	.probe	= cv1800_pinctrl_probe,
+	.driver	= {
+		.name			= "sg2002-pinctrl",
+		.suppress_bind_attrs	= true,
+		.of_match_table		= sg2002_pinctrl_ids,
+	},
+};
+module_platform_driver(sg2002_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for the SG2002 series SoC");
+MODULE_LICENSE("GPL");
--
2.45.2


