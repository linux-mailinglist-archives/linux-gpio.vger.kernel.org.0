Return-Path: <linux-gpio+bounces-8334-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6715B938754
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2024 03:40:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 207C12812EF
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2024 01:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 039E9107A0;
	Mon, 22 Jul 2024 01:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="sMW4A1SF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10olkn2042.outbound.protection.outlook.com [40.92.41.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C1DFBF6;
	Mon, 22 Jul 2024 01:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.41.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721612417; cv=fail; b=RScEWQ9NW7OdtHnUoLLBv9ufBt1k7YEwMyxFrei5kyiL8p6HcaGFR/d15ECGRN/z0qEqmmgqb7bLG9kdqhLnJios2vhCjb3XpRK3Ne6ConaZvWnmJJswuK1EQ/Afcjf2/fo0gfpRelhUoyCf45SXr0Z7BfYPKhOwG4oUBWjNDUk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721612417; c=relaxed/simple;
	bh=bItOACnmqauVkxJFXzBJmr8tF1yDURfCdELTg1MNug8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LwcMGwcRJHZbaViIyrZHZmBJnve3wDhFKDXXzGScbq8KEFHE/8TWPDwt0zXLJv6AC4vCved1i17fmRpA312anx27w8DEYT7DeGKafCeOHVuEqXTWHZpWgfF2/ImpUzCx3DqyZp2J3wzkINV3HkFbaUrAiX5FardsEZJnUb9Nta4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=sMW4A1SF; arc=fail smtp.client-ip=40.92.41.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cpZEYWiZwC+Uw8e7KOw9UbmUzSVdPiTDlplaa0tIr/xEC/zWRrhK2qJkbXr/9A6L5kaHcn0+9QFOrcgz0QjK22B9Y9zVaOuLWc7ll/3TBRQIRtYOrXJ/vsYRMcqv/+Qi8/ZtkB1UwFlCWOnsbQBtRtN2L8wClpE2Jg9qEQoW3bX+VRRrbN+Ue97sOuUfC43sySCv9iuHTfGy153sfra3u3mGPntO3BNS2nf8VIW2pOU2Fo20rD50Bn1hsspnsXfq1HqA7A/bJPTYE1Qd6ye1zAWElcNvBjiifYp1G7n7E6bJt9mEWQ3Pcy8ezuO+avswiRCH6T5x7gsZ92CFLCV8Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R0yUBbyg+LdeVuSnn+SvVq1k0+4biIiq0BxifOJ2vOs=;
 b=k0GNaz0VWNHFw1+++lZ/vnQ9m4R3BSYTnJiOSp0Ei0/vTARIORq2pKWxnUypDdEsO/fFIWiA2Ps6XPVsCpZErK9EkvINapdGZZLK6KYxhsfP0aHuE2pPMp/pTgQz0pxBYzuVmNoNBTObmivhAds7ea0f2bvswAC13K2A7KceClxJT2YZnvUJYE3Igg4RHH8kpADJHUVGo22MGNVGG5I+2e+Oed1tIZ6xlCz+bPDqrzJQCrvx2j8GyPiz391AEERpJChRUoZ+DuMuXr2/T4bvZPi6axvo5Ge2xq8YmqRKjHdo/9SScweFk88T2gGY/y9/0K/QuZI/Xgbw0PtZyYjSGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R0yUBbyg+LdeVuSnn+SvVq1k0+4biIiq0BxifOJ2vOs=;
 b=sMW4A1SFn6QVLggeg8IsWZ6Xs4hRzwhVJa8j49VrglkjMuIoLqJ2iuLbAkwaTQtUMIuGDpquS2w4UEnYCeJiuK5HofTV6Bee787Fjrap4zFDUn6YVOSAElbhLpkyXrGSY0XV+hFv+pqA5uFU7MqeQbFqt3rikd9VHppIEIDtbbmS/JsrUDqQO3C6yut8OU4hHOjkjMbn3u/fdsaA6MSW2PqtK3Z0+yS20xpG4Ap2IJ0TWle0NcFxcHNLuHkyNME2+2oUAOvsfibjcBOX9JGuiAq8DFBvKchpfqoxzxiQnIXlzetT3JqryULqkYHPSOEbKYHaqxyFu1EfyYFDjBE0bQ==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by CY8PR20MB5403.namprd20.prod.outlook.com (2603:10b6:930:5d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23; Mon, 22 Jul
 2024 01:40:12 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%5]) with mapi id 15.20.7784.016; Mon, 22 Jul 2024
 01:40:12 +0000
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
Subject: [PATCH v2 4/7] pinctrl: sophgo: add support for SG2000 SoC
Date: Mon, 22 Jul 2024 09:39:23 +0800
Message-ID:
 <IA1PR20MB49532D0E6B6100BE202C1CD5BBA82@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <IA1PR20MB49535F9918829FA524BDB02ABBA82@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49535F9918829FA524BDB02ABBA82@IA1PR20MB4953.namprd20.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [lyA2aOftMXKa4sF+/QGgo6Ki2Z9HckYEOXpwTFHZxKA=]
X-ClientProxiedBy: TYCPR01CA0092.jpnprd01.prod.outlook.com
 (2603:1096:405:3::32) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID:
 <20240722013937.623685-4-inochiama@outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|CY8PR20MB5403:EE_
X-MS-Office365-Filtering-Correlation-Id: bccce797-7621-4913-e253-08dca9ef3a76
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799006|461199028|19110799003|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	RQckMfUgd6zqrsr9VkLx4ltC/uClm0r01Y1Vd2LVVUyFSWK3dt/Z9j8n5FBbZ2zpwj3bnw6KQSc93sZ2iGmcJPhltcssYjujhLMn/cP+ijay7ZuFo78qWXeLe1VV8bG0uyUxgNrhmMumgK8ENnE4zjS0U4DTv9Hdh/PUa/aqxh8cP8+0k50rOl53TbxgHJt5Wb+onM/XWgv4k8gVmA3ZsfB9P3botljxMT2YyWVlEsGcKCXRb3n27tBQ2OizndT/wuNUUliiM2KyAJIjM+h5QxNywxfkseRkfPpZZ/m0x6kC1296h5VptjkqB8NmPI6+DVo0qpB5XXdskm1AFYf22YIRqiTdArmUG9nZsZe0RK4I+a2VMFEGG4WSHFBhi7kULbA4JmCcGNcFgg7jwjbn0NvUXMGUHbV9urgcDxMQUQg9t3r1MvyxNpD+XgeIpR2aZ8Jt0EX8FigXrm5DJg1TtodPZPsbw/McdeMpcoFRj4TRK/+tSt/IyXRLxMe5LX5VvTgZGdDtZ4mgqGWdaZJ+eqQqBtihZ6lg/1OfdyttisRZ4i9pwgFH6ZmJd2DJkUi+42ryulNH+plu5w18InOA6zDREyFhOVFzP42BVYDhfP8Xefbuaz3Kk6b45NKSFws8MEVG4wKu9emTNhpwx5nySfFGVGHMjxtNapXNcOTORfk=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7eIg6TqLsp69cPTcgCzLn8k58GXTk743lPN4YhYst2SpV7LOQ8Y2gkF7RlSE?=
 =?us-ascii?Q?cF4B2CF36sHcJUMgylEyfkjS1y4MFmuZ9pNntNFMm+KNBKOWxmnSj9LtRLak?=
 =?us-ascii?Q?jfOtgFvadbrUf1IJ3oAjZj9G6M5Wo5Uo23LOWsNfgjp4pL3kHrOP9SM+/5ID?=
 =?us-ascii?Q?8izHvdtZz2XFD7Kl++atWbI6nVW5jN1hD2L4fcRvLF8B/UxHpbBjpWzTHe63?=
 =?us-ascii?Q?K2zDH8eMJni/zmWgMejDwQVvbpLft5UKHjmQcPRHky1bok/rRpsybixwBEFW?=
 =?us-ascii?Q?8+qf/MZZtnt+n4S6LX6yk1LiAFnMlcvoazDRfCQdO8yFHysUHQHhXLfUyd01?=
 =?us-ascii?Q?moT8NpIR4sICQpqIgbfqTGh8+GBQQElII8vmkJufr3I+27Py34/pwU9KD4Rh?=
 =?us-ascii?Q?RyDX93nHrrwH0tn4eLmmLS3mgSjwksuXOFntJF5aM1h54wtly/loe3OCcQdK?=
 =?us-ascii?Q?nCqUIt3Zj11D+3B2ZDnRIXTsw6R6ri8tyfU+/m2cyKs5nIrqYvM6Th15Ihj/?=
 =?us-ascii?Q?d4pTio9979Jo1qSVnreEazOwmo77suV8VPw4ZxGfu3TVTK1WPkxvZgXy6xEE?=
 =?us-ascii?Q?l3kSs+Dl6T01VUwfS9KLwDnr6/ESAURuSBywmPRBwblxIcbf5DPp6MUjf5Ig?=
 =?us-ascii?Q?Su0LFfNq5ts3ySVt4L5kKuUFipk4jM0tIO0poNglDgPSUbgiFVY+GkMSX5Ps?=
 =?us-ascii?Q?ycydqZQPhKB1xLl2ov6eSD3Ym4n5Q3UBaltzsodbed3mK4sVE1E3r3ue7IGZ?=
 =?us-ascii?Q?9nph8FG3Hi2Pb31fmoA8I57aNwcI6fbmNtj3VZKSfW1tGkSa1Gpr4CKLKoRL?=
 =?us-ascii?Q?3+9YdASwtMjeLj+wCvfQIgO/iN49c0dbkhj2EGrY/oi6lcAA/GFlehiHKyEQ?=
 =?us-ascii?Q?UaKqAEmdb2yhw8dfoIP/r5oAqjDYN7lccWmkvs0KHI1Oafw6dPJAe6JQEKBz?=
 =?us-ascii?Q?41W2HsBGWsPZKAL6JmcgkAbjjo6qlCaVxkPzGF5MW7ZDzzyhZVB4rYCxR0vG?=
 =?us-ascii?Q?qifptTspmJLMGAoyEMdbp7ZsOZ1nLmlr9fRq1T9zi7JFrjrd4MFt+NnvSlUQ?=
 =?us-ascii?Q?TNFwZPEM8nYXTZxtUUuWEgMcRD/amI5QHa2RRfNLGAbfzyuzlT8/TZWt7Hib?=
 =?us-ascii?Q?sSUxDNOO8sPjS0G04ljTZYAMjCHE93O9Ymzpsh1M4yZ286FI6QRNIZLbvnC/?=
 =?us-ascii?Q?3vRVyBWFJMd8H0aNHXh3Oaev6Y7H8Wf6Zb8c7B/TdokM5jjzXiNVLl/N/1U+?=
 =?us-ascii?Q?lUsQwwF96Ez/G4oFjnZ5?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bccce797-7621-4913-e253-08dca9ef3a76
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2024 01:40:12.6090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR20MB5403

Add pin definition driver of SG2000.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 drivers/pinctrl/sophgo/Kconfig          |  11 +
 drivers/pinctrl/sophgo/Makefile         |   1 +
 drivers/pinctrl/sophgo/pinctrl-sg2000.c | 771 ++++++++++++++++++++++++
 3 files changed, 783 insertions(+)
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-sg2000.c

diff --git a/drivers/pinctrl/sophgo/Kconfig b/drivers/pinctrl/sophgo/Kconfig
index 1bd0770c1201..000351566fcf 100644
--- a/drivers/pinctrl/sophgo/Kconfig
+++ b/drivers/pinctrl/sophgo/Kconfig
@@ -30,3 +30,14 @@ config PINCTRL_SOPHGO_CV1812H
 	  This pin controller allows selecting the mux function for
 	  each pin. This driver can also be built as a module called
 	  pinctrl-cv1812h.
+
+config PINCTRL_SOPHGO_SG2000
+	tristate "Sophgo SG2000 SoC Pinctrl driver"
+	depends on ARCH_SOPHGO || COMPILE_TEST
+	depends on OF
+	select PINCTRL_SOPHGO_CV18XX
+	help
+	  Say Y to select the pinctrl driver for SG2000 SoC.
+	  This pin controller allows selecting the mux function for
+	  each pin. This driver can also be built as a module called
+	  pinctrl-sg2000.
diff --git a/drivers/pinctrl/sophgo/Makefile b/drivers/pinctrl/sophgo/Makefile
index 571e0a64f29a..16e923e3f77b 100644
--- a/drivers/pinctrl/sophgo/Makefile
+++ b/drivers/pinctrl/sophgo/Makefile
@@ -3,3 +3,4 @@
 obj-$(CONFIG_PINCTRL_SOPHGO_CV18XX)	+= pinctrl-cv18xx.o
 obj-$(CONFIG_PINCTRL_SOPHGO_CV1800B)	+= pinctrl-cv1800b.o
 obj-$(CONFIG_PINCTRL_SOPHGO_CV1812H)	+= pinctrl-cv1812h.o
+obj-$(CONFIG_PINCTRL_SOPHGO_SG2000)	+= pinctrl-sg2000.o
diff --git a/drivers/pinctrl/sophgo/pinctrl-sg2000.c b/drivers/pinctrl/sophgo/pinctrl-sg2000.c
new file mode 100644
index 000000000000..63c05b4dd68f
--- /dev/null
+++ b/drivers/pinctrl/sophgo/pinctrl-sg2000.c
@@ -0,0 +1,771 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Sophgo SG2000 SoC pinctrl driver.
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
+#include <dt-bindings/pinctrl/pinctrl-sg2000.h>
+
+#include "pinctrl-cv18xx.h"
+
+enum SG2000_POWER_DOMAIN {
+	VDD18A_EPHY		= 0,
+	VDD18A_MIPI		= 1,
+	VDDIO18_1		= 2,
+	VDDIO_EMMC		= 3,
+	VDDIO_RTC		= 4,
+	VDDIO_SD0		= 5,
+	VDDIO_SD1		= 6,
+	VDDIO_VIVO		= 7
+};
+
+static const char *const sg2000_power_domain_desc[] = {
+	[VDD18A_EPHY]		= "VDD18A_EPHY",
+	[VDD18A_MIPI]		= "VDD18A_MIPI",
+	[VDDIO18_1]		= "VDDIO18_1",
+	[VDDIO_EMMC]		= "VDDIO_EMMC",
+	[VDDIO_RTC]		= "VDDIO_RTC",
+	[VDDIO_SD0]		= "VDDIO_SD0",
+	[VDDIO_SD1]		= "VDDIO_SD1",
+	[VDDIO_VIVO]		= "VDDIO_VIVO",
+};
+
+static int sg2000_get_pull_up(struct cv1800_pin *pin, const u32 *psmap)
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
+static int sg2000_get_pull_down(struct cv1800_pin *pin, const u32 *psmap)
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
+static const u32 sg2000_1v8_oc_map[] = {
+	12800,
+	25300,
+	37400,
+	49000
+};
+
+static const u32 sg2000_18od33_1v8_oc_map[] = {
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
+static const u32 sg2000_18od33_3v3_oc_map[] = {
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
+static const u32 sg2000_eth_oc_map[] = {
+	15700,
+	17800
+};
+
+static int sg2000_get_oc_map(struct cv1800_pin *pin, const u32 *psmap,
+			     const u32 **map)
+{
+	enum cv1800_pin_io_type type = cv1800_pin_io_type(pin);
+	u32 pstate = psmap[pin->power_domain];
+
+	if (type == IO_TYPE_1V8_ONLY) {
+		*map = sg2000_1v8_oc_map;
+		return ARRAY_SIZE(sg2000_1v8_oc_map);
+	}
+
+	if (type == IO_TYPE_1V8_OR_3V3) {
+		if (pstate == PIN_POWER_STATE_1V8) {
+			*map = sg2000_18od33_1v8_oc_map;
+			return ARRAY_SIZE(sg2000_18od33_1v8_oc_map);
+		} else if (pstate == PIN_POWER_STATE_3V3) {
+			*map = sg2000_18od33_3v3_oc_map;
+			return ARRAY_SIZE(sg2000_18od33_3v3_oc_map);
+		}
+	}
+
+	if (type == IO_TYPE_ETH) {
+		*map = sg2000_eth_oc_map;
+		return ARRAY_SIZE(sg2000_eth_oc_map);
+	}
+
+	return -ENOTSUPP;
+}
+
+static const u32 sg2000_1v8_schmitt_map[] = {
+	0,
+	970000,
+	1040000
+};
+
+static const u32 sg2000_18od33_1v8_schmitt_map[] = {
+	0,
+	1070000
+};
+
+static const u32 sg2000_18od33_3v3_schmitt_map[] = {
+	0,
+	1100000
+};
+
+static int sg2000_get_schmitt_map(struct cv1800_pin *pin, const u32 *psmap,
+				  const u32 **map)
+{
+	enum cv1800_pin_io_type type = cv1800_pin_io_type(pin);
+	u32 pstate = psmap[pin->power_domain];
+
+	if (type == IO_TYPE_1V8_ONLY) {
+		*map = sg2000_1v8_schmitt_map;
+		return ARRAY_SIZE(sg2000_1v8_schmitt_map);
+	}
+
+	if (type == IO_TYPE_1V8_OR_3V3) {
+		if (pstate == PIN_POWER_STATE_1V8) {
+			*map = sg2000_18od33_1v8_schmitt_map;
+			return ARRAY_SIZE(sg2000_18od33_1v8_schmitt_map);
+		} else if (pstate == PIN_POWER_STATE_3V3) {
+			*map = sg2000_18od33_3v3_schmitt_map;
+			return ARRAY_SIZE(sg2000_18od33_3v3_schmitt_map);
+		}
+	}
+
+	return -ENOTSUPP;
+}
+
+static const struct cv1800_vddio_cfg_ops sg2000_vddio_cfg_ops = {
+	.get_pull_up		= sg2000_get_pull_up,
+	.get_pull_down		= sg2000_get_pull_down,
+	.get_oc_map		= sg2000_get_oc_map,
+	.get_schmitt_map		= sg2000_get_schmitt_map,
+};
+
+static const struct pinctrl_pin_desc sg2000_pins[] = {
+	PINCTRL_PIN(PIN_MIPI_TXM4,	"MIPI_TXM4"),
+	PINCTRL_PIN(PIN_MIPIRX0N,	"MIPIRX0N"),
+	PINCTRL_PIN(PIN_MIPIRX3P,	"MIPIRX3P"),
+	PINCTRL_PIN(PIN_MIPIRX4P,	"MIPIRX4P"),
+	PINCTRL_PIN(PIN_VIVO_D2,	"VIVO_D2"),
+	PINCTRL_PIN(PIN_VIVO_D3,	"VIVO_D3"),
+	PINCTRL_PIN(PIN_VIVO_D10,	"VIVO_D10"),
+	PINCTRL_PIN(PIN_USB_VBUS_DET,	"USB_VBUS_DET"),
+	PINCTRL_PIN(PIN_MIPI_TXP3,	"MIPI_TXP3"),
+	PINCTRL_PIN(PIN_MIPI_TXM3,	"MIPI_TXM3"),
+	PINCTRL_PIN(PIN_MIPI_TXP4,	"MIPI_TXP4"),
+	PINCTRL_PIN(PIN_MIPIRX0P,	"MIPIRX0P"),
+	PINCTRL_PIN(PIN_MIPIRX1N,	"MIPIRX1N"),
+	PINCTRL_PIN(PIN_MIPIRX2N,	"MIPIRX2N"),
+	PINCTRL_PIN(PIN_MIPIRX4N,	"MIPIRX4N"),
+	PINCTRL_PIN(PIN_MIPIRX5N,	"MIPIRX5N"),
+	PINCTRL_PIN(PIN_VIVO_D1,	"VIVO_D1"),
+	PINCTRL_PIN(PIN_VIVO_D5,	"VIVO_D5"),
+	PINCTRL_PIN(PIN_VIVO_D7,	"VIVO_D7"),
+	PINCTRL_PIN(PIN_VIVO_D9,	"VIVO_D9"),
+	PINCTRL_PIN(PIN_USB_ID,		"USB_ID"),
+	PINCTRL_PIN(PIN_ETH_RXM,	"ETH_RXM"),
+	PINCTRL_PIN(PIN_MIPI_TXP2,	"MIPI_TXP2"),
+	PINCTRL_PIN(PIN_MIPI_TXM2,	"MIPI_TXM2"),
+	PINCTRL_PIN(PIN_CAM_PD0,	"CAM_PD0"),
+	PINCTRL_PIN(PIN_CAM_MCLK0,	"CAM_MCLK0"),
+	PINCTRL_PIN(PIN_MIPIRX1P,	"MIPIRX1P"),
+	PINCTRL_PIN(PIN_MIPIRX2P,	"MIPIRX2P"),
+	PINCTRL_PIN(PIN_MIPIRX3N,	"MIPIRX3N"),
+	PINCTRL_PIN(PIN_MIPIRX5P,	"MIPIRX5P"),
+	PINCTRL_PIN(PIN_VIVO_CLK,	"VIVO_CLK"),
+	PINCTRL_PIN(PIN_VIVO_D6,	"VIVO_D6"),
+	PINCTRL_PIN(PIN_VIVO_D8,	"VIVO_D8"),
+	PINCTRL_PIN(PIN_USB_VBUS_EN,	"USB_VBUS_EN"),
+	PINCTRL_PIN(PIN_ETH_RXP,	"ETH_RXP"),
+	PINCTRL_PIN(PIN_GPIO_RTX,	"GPIO_RTX"),
+	PINCTRL_PIN(PIN_MIPI_TXP1,	"MIPI_TXP1"),
+	PINCTRL_PIN(PIN_MIPI_TXM1,	"MIPI_TXM1"),
+	PINCTRL_PIN(PIN_CAM_MCLK1,	"CAM_MCLK1"),
+	PINCTRL_PIN(PIN_IIC3_SCL,	"IIC3_SCL"),
+	PINCTRL_PIN(PIN_VIVO_D4,	"VIVO_D4"),
+	PINCTRL_PIN(PIN_ETH_TXM,	"ETH_TXM"),
+	PINCTRL_PIN(PIN_ETH_TXP,	"ETH_TXP"),
+	PINCTRL_PIN(PIN_MIPI_TXP0,	"MIPI_TXP0"),
+	PINCTRL_PIN(PIN_MIPI_TXM0,	"MIPI_TXM0"),
+	PINCTRL_PIN(PIN_CAM_PD1,	"CAM_PD1"),
+	PINCTRL_PIN(PIN_CAM_RST0,	"CAM_RST0"),
+	PINCTRL_PIN(PIN_VIVO_D0,	"VIVO_D0"),
+	PINCTRL_PIN(PIN_ADC1,		"ADC1"),
+	PINCTRL_PIN(PIN_ADC2,		"ADC2"),
+	PINCTRL_PIN(PIN_ADC3,		"ADC3"),
+	PINCTRL_PIN(PIN_AUD_AOUTL,	"AUD_AOUTL"),
+	PINCTRL_PIN(PIN_IIC3_SDA,	"IIC3_SDA"),
+	PINCTRL_PIN(PIN_SD1_D2,		"SD1_D2"),
+	PINCTRL_PIN(PIN_AUD_AOUTR,	"AUD_AOUTR"),
+	PINCTRL_PIN(PIN_SD1_D3,		"SD1_D3"),
+	PINCTRL_PIN(PIN_SD1_CLK,	"SD1_CLK"),
+	PINCTRL_PIN(PIN_SD1_CMD,	"SD1_CMD"),
+	PINCTRL_PIN(PIN_AUD_AINL_MIC,	"AUD_AINL_MIC"),
+	PINCTRL_PIN(PIN_RSTN,		"RSTN"),
+	PINCTRL_PIN(PIN_PWM0_BUCK,	"PWM0_BUCK"),
+	PINCTRL_PIN(PIN_SD1_D1,		"SD1_D1"),
+	PINCTRL_PIN(PIN_SD1_D0,		"SD1_D0"),
+	PINCTRL_PIN(PIN_AUD_AINR_MIC,	"AUD_AINR_MIC"),
+	PINCTRL_PIN(PIN_IIC2_SCL,	"IIC2_SCL"),
+	PINCTRL_PIN(PIN_IIC2_SDA,	"IIC2_SDA"),
+	PINCTRL_PIN(PIN_SD0_CD,		"SD0_CD"),
+	PINCTRL_PIN(PIN_SD0_D1,		"SD0_D1"),
+	PINCTRL_PIN(PIN_UART2_RX,	"UART2_RX"),
+	PINCTRL_PIN(PIN_UART2_CTS,	"UART2_CTS"),
+	PINCTRL_PIN(PIN_UART2_TX,	"UART2_TX"),
+	PINCTRL_PIN(PIN_SD0_CLK,	"SD0_CLK"),
+	PINCTRL_PIN(PIN_SD0_D0,		"SD0_D0"),
+	PINCTRL_PIN(PIN_SD0_CMD,	"SD0_CMD"),
+	PINCTRL_PIN(PIN_CLK32K,		"CLK32K"),
+	PINCTRL_PIN(PIN_UART2_RTS,	"UART2_RTS"),
+	PINCTRL_PIN(PIN_SD0_D3,		"SD0_D3"),
+	PINCTRL_PIN(PIN_SD0_D2,		"SD0_D2"),
+	PINCTRL_PIN(PIN_UART0_RX,	"UART0_RX"),
+	PINCTRL_PIN(PIN_UART0_TX,	"UART0_TX"),
+	PINCTRL_PIN(PIN_JTAG_CPU_TRST,	"JTAG_CPU_TRST"),
+	PINCTRL_PIN(PIN_PWR_ON,		"PWR_ON"),
+	PINCTRL_PIN(PIN_PWR_GPIO2,	"PWR_GPIO2"),
+	PINCTRL_PIN(PIN_PWR_GPIO0,	"PWR_GPIO0"),
+	PINCTRL_PIN(PIN_CLK25M,		"CLK25M"),
+	PINCTRL_PIN(PIN_SD0_PWR_EN,	"SD0_PWR_EN"),
+	PINCTRL_PIN(PIN_SPK_EN,		"SPK_EN"),
+	PINCTRL_PIN(PIN_JTAG_CPU_TCK,	"JTAG_CPU_TCK"),
+	PINCTRL_PIN(PIN_JTAG_CPU_TMS,	"JTAG_CPU_TMS"),
+	PINCTRL_PIN(PIN_PWR_WAKEUP1,	"PWR_WAKEUP1"),
+	PINCTRL_PIN(PIN_PWR_WAKEUP0,	"PWR_WAKEUP0"),
+	PINCTRL_PIN(PIN_PWR_GPIO1,	"PWR_GPIO1"),
+	PINCTRL_PIN(PIN_EMMC_DAT3,	"EMMC_DAT3"),
+	PINCTRL_PIN(PIN_EMMC_DAT0,	"EMMC_DAT0"),
+	PINCTRL_PIN(PIN_EMMC_DAT2,	"EMMC_DAT2"),
+	PINCTRL_PIN(PIN_EMMC_RSTN,	"EMMC_RSTN"),
+	PINCTRL_PIN(PIN_AUX0,		"AUX0"),
+	PINCTRL_PIN(PIN_IIC0_SDA,	"IIC0_SDA"),
+	PINCTRL_PIN(PIN_PWR_SEQ3,	"PWR_SEQ3"),
+	PINCTRL_PIN(PIN_PWR_VBAT_DET,	"PWR_VBAT_DET"),
+	PINCTRL_PIN(PIN_PWR_SEQ1,	"PWR_SEQ1"),
+	PINCTRL_PIN(PIN_PWR_BUTTON1,	"PWR_BUTTON1"),
+	PINCTRL_PIN(PIN_EMMC_DAT1,	"EMMC_DAT1"),
+	PINCTRL_PIN(PIN_EMMC_CMD,	"EMMC_CMD"),
+	PINCTRL_PIN(PIN_EMMC_CLK,	"EMMC_CLK"),
+	PINCTRL_PIN(PIN_IIC0_SCL,	"IIC0_SCL"),
+	PINCTRL_PIN(PIN_GPIO_ZQ,	"GPIO_ZQ"),
+	PINCTRL_PIN(PIN_PWR_RSTN,	"PWR_RSTN"),
+	PINCTRL_PIN(PIN_PWR_SEQ2,	"PWR_SEQ2"),
+	PINCTRL_PIN(PIN_XTAL_XIN,	"XTAL_XIN"),
+};
+
+static const struct cv1800_pin sg2000_pin_data[ARRAY_SIZE(sg2000_pins)] = {
+	CV1800_GENERAL_PIN(PIN_MIPI_TXM4, VDD18A_MIPI,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x194, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc60),
+	CV1800_GENERAL_PIN(PIN_MIPIRX0N, VDD18A_MIPI,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x18c, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc58),
+	CV1800_GENERATE_PIN_MUX2(PIN_MIPIRX3P, VDD18A_MIPI,
+				 IO_TYPE_1V8_ONLY,
+				 CV1800_PINCONF_AREA_SYS, 0x178, 7,
+				 CV1800_PINCONF_AREA_SYS, 0x118, 7,
+				 CV1800_PINCONF_AREA_SYS, 0xc44),
+	CV1800_GENERATE_PIN_MUX2(PIN_MIPIRX4P, VDD18A_MIPI,
+				 IO_TYPE_1V8_ONLY,
+				 CV1800_PINCONF_AREA_SYS, 0x170, 7,
+				 CV1800_PINCONF_AREA_SYS, 0x11c, 7,
+				 CV1800_PINCONF_AREA_SYS, 0xc3c),
+	CV1800_GENERAL_PIN(PIN_VIVO_D2, VDDIO_VIVO,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x154, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc20),
+	CV1800_GENERAL_PIN(PIN_VIVO_D3, VDDIO_VIVO,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x150, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc1c),
+	CV1800_GENERAL_PIN(PIN_VIVO_D10, VDDIO_VIVO,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x134, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc00),
+	CV1800_GENERAL_PIN(PIN_USB_VBUS_DET, VDDIO18_1,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x108, 5,
+			   CV1800_PINCONF_AREA_SYS, 0x820),
+	CV1800_GENERAL_PIN(PIN_MIPI_TXP3, VDD18A_MIPI,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x1a0, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc6c),
+	CV1800_GENERAL_PIN(PIN_MIPI_TXM3, VDD18A_MIPI,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x19c, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc68),
+	CV1800_GENERAL_PIN(PIN_MIPI_TXP4, VDD18A_MIPI,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x198, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc64),
+	CV1800_GENERAL_PIN(PIN_MIPIRX0P, VDD18A_MIPI,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x190, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc5c),
+	CV1800_GENERAL_PIN(PIN_MIPIRX1N, VDD18A_MIPI,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x184, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc50),
+	CV1800_GENERAL_PIN(PIN_MIPIRX2N, VDD18A_MIPI,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x17c, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc48),
+	CV1800_GENERATE_PIN_MUX2(PIN_MIPIRX4N, VDD18A_MIPI,
+				 IO_TYPE_1V8_ONLY,
+				 CV1800_PINCONF_AREA_SYS, 0x16c, 7,
+				 CV1800_PINCONF_AREA_SYS, 0x120, 7,
+				 CV1800_PINCONF_AREA_SYS, 0xc38),
+	CV1800_GENERAL_PIN(PIN_MIPIRX5N, VDD18A_MIPI,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x164, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc30),
+	CV1800_GENERAL_PIN(PIN_VIVO_D1, VDDIO_VIVO,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x158, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc24),
+	CV1800_GENERAL_PIN(PIN_VIVO_D5, VDDIO_VIVO,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x148, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc14),
+	CV1800_GENERAL_PIN(PIN_VIVO_D7, VDDIO_VIVO,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x140, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc0c),
+	CV1800_GENERAL_PIN(PIN_VIVO_D9, VDDIO_VIVO,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x138, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc04),
+	CV1800_GENERAL_PIN(PIN_USB_ID, VDDIO18_1,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x0fc, 3,
+			   CV1800_PINCONF_AREA_SYS, 0x814),
+	CV1800_FUNC_PIN(PIN_ETH_RXM, VDD18A_EPHY,
+			IO_TYPE_ETH,
+			CV1800_PINCONF_AREA_SYS, 0x130, 7),
+	CV1800_GENERAL_PIN(PIN_MIPI_TXP2, VDD18A_MIPI,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x1a8, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc74),
+	CV1800_GENERAL_PIN(PIN_MIPI_TXM2, VDD18A_MIPI,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x1a4, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc70),
+	CV1800_GENERAL_PIN(PIN_CAM_PD0, VDD18A_MIPI,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x004, 4,
+			   CV1800_PINCONF_AREA_SYS, 0xb04),
+	CV1800_GENERAL_PIN(PIN_CAM_MCLK0, VDD18A_MIPI,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x000, 3,
+			   CV1800_PINCONF_AREA_SYS, 0xb00),
+	CV1800_GENERAL_PIN(PIN_MIPIRX1P, VDD18A_MIPI,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x188, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc54),
+	CV1800_GENERAL_PIN(PIN_MIPIRX2P, VDD18A_MIPI,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x180, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc4c),
+	CV1800_GENERATE_PIN_MUX2(PIN_MIPIRX3N, VDD18A_MIPI,
+				 IO_TYPE_1V8_ONLY,
+				 CV1800_PINCONF_AREA_SYS, 0x174, 7,
+				 CV1800_PINCONF_AREA_SYS, 0x114, 7,
+				 CV1800_PINCONF_AREA_SYS, 0xc40),
+	CV1800_GENERAL_PIN(PIN_MIPIRX5P, VDD18A_MIPI,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x168, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc34),
+	CV1800_GENERAL_PIN(PIN_VIVO_CLK, VDDIO_VIVO,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x160, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc2c),
+	CV1800_GENERAL_PIN(PIN_VIVO_D6, VDDIO_VIVO,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x144, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc10),
+	CV1800_GENERAL_PIN(PIN_VIVO_D8, VDDIO_VIVO,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x13c, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc08),
+	CV1800_GENERAL_PIN(PIN_USB_VBUS_EN, VDDIO18_1,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x100, 3,
+			   CV1800_PINCONF_AREA_SYS, 0x818),
+	CV1800_FUNC_PIN(PIN_ETH_RXP, VDD18A_EPHY,
+			IO_TYPE_ETH,
+			CV1800_PINCONF_AREA_SYS, 0x12c, 7),
+	CV1800_GENERAL_PIN(PIN_GPIO_RTX, VDDIO18_1,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x1cc, 5,
+			   CV1800_PINCONF_AREA_SYS, 0xc8c),
+	CV1800_GENERAL_PIN(PIN_MIPI_TXP1, VDD18A_MIPI,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x1b0, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc7c),
+	CV1800_GENERAL_PIN(PIN_MIPI_TXM1, VDD18A_MIPI,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x1ac, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc78),
+	CV1800_GENERAL_PIN(PIN_CAM_MCLK1, VDD18A_MIPI,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x00c, 4,
+			   CV1800_PINCONF_AREA_SYS, 0xb0c),
+	CV1800_GENERAL_PIN(PIN_IIC3_SCL, VDD18A_MIPI,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x014, 3,
+			   CV1800_PINCONF_AREA_SYS, 0xb14),
+	CV1800_GENERAL_PIN(PIN_VIVO_D4, VDDIO_VIVO,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x14c, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc18),
+	CV1800_FUNC_PIN(PIN_ETH_TXM, VDD18A_EPHY,
+			IO_TYPE_ETH,
+			CV1800_PINCONF_AREA_SYS, 0x128, 7),
+	CV1800_FUNC_PIN(PIN_ETH_TXP, VDD18A_EPHY,
+			IO_TYPE_ETH,
+			CV1800_PINCONF_AREA_SYS, 0x124, 7),
+	CV1800_GENERAL_PIN(PIN_MIPI_TXP0, VDD18A_MIPI,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x1b8, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc84),
+	CV1800_GENERAL_PIN(PIN_MIPI_TXM0, VDD18A_MIPI,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x1b4, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc80),
+	CV1800_GENERAL_PIN(PIN_CAM_PD1, VDD18A_MIPI,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x010, 6,
+			   CV1800_PINCONF_AREA_SYS, 0xb10),
+	CV1800_GENERAL_PIN(PIN_CAM_RST0, VDD18A_MIPI,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x008, 6,
+			   CV1800_PINCONF_AREA_SYS, 0xb08),
+	CV1800_GENERAL_PIN(PIN_VIVO_D0, VDDIO_VIVO,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x15c, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc28),
+	CV1800_GENERAL_PIN(PIN_ADC1, VDDIO18_1,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x0f8, 4,
+			   CV1800_PINCONF_AREA_SYS, 0x810),
+	CV1800_GENERAL_PIN(PIN_ADC2, VDDIO18_1,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x0f4, 7,
+			   CV1800_PINCONF_AREA_SYS, 0x80c),
+	CV1800_GENERAL_PIN(PIN_ADC3, VDDIO18_1,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x0f0, 7,
+			   CV1800_PINCONF_AREA_SYS, 0x808),
+	CV1800_FUNC_PIN(PIN_AUD_AOUTL, VDD18A_MIPI,
+			IO_TYPE_AUDIO,
+			CV1800_PINCONF_AREA_SYS, 0x1c4, 5),
+	CV1800_GENERAL_PIN(PIN_IIC3_SDA, VDD18A_MIPI,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x018, 3,
+			   CV1800_PINCONF_AREA_SYS, 0xb18),
+	CV1800_GENERAL_PIN(PIN_SD1_D2, VDDIO_SD1,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x0d4, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x05c),
+	CV1800_FUNC_PIN(PIN_AUD_AOUTR, VDD18A_MIPI,
+			IO_TYPE_AUDIO,
+			CV1800_PINCONF_AREA_SYS, 0x1c8, 6),
+	CV1800_GENERAL_PIN(PIN_SD1_D3, VDDIO_SD1,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x0d0, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x058),
+	CV1800_GENERAL_PIN(PIN_SD1_CLK, VDDIO_SD1,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x0e4, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x06c),
+	CV1800_GENERAL_PIN(PIN_SD1_CMD, VDDIO_SD1,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x0e0, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x068),
+	CV1800_FUNC_PIN(PIN_AUD_AINL_MIC, VDD18A_MIPI,
+			IO_TYPE_AUDIO,
+			CV1800_PINCONF_AREA_SYS, 0x1bc, 5),
+	CV1800_GENERAL_PIN(PIN_RSTN, VDDIO18_1,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x0e8, 0,
+			   CV1800_PINCONF_AREA_SYS, 0x800),
+	CV1800_GENERAL_PIN(PIN_PWM0_BUCK, VDDIO18_1,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x0ec, 3,
+			   CV1800_PINCONF_AREA_SYS, 0x804),
+	CV1800_GENERAL_PIN(PIN_SD1_D1, VDDIO_SD1,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x0d8, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x060),
+	CV1800_GENERAL_PIN(PIN_SD1_D0, VDDIO_SD1,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x0dc, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x064),
+	CV1800_FUNC_PIN(PIN_AUD_AINR_MIC, VDD18A_MIPI,
+			IO_TYPE_AUDIO,
+			CV1800_PINCONF_AREA_SYS, 0x1c0, 6),
+	CV1800_GENERAL_PIN(PIN_IIC2_SCL, VDDIO_RTC,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x0b8, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x040),
+	CV1800_GENERAL_PIN(PIN_IIC2_SDA, VDDIO_RTC,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x0bc, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x044),
+	CV1800_GENERAL_PIN(PIN_SD0_CD, VDDIO_EMMC,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x034, 3,
+			   CV1800_PINCONF_AREA_SYS, 0x900),
+	CV1800_GENERAL_PIN(PIN_SD0_D1, VDDIO_SD0,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x028, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xa0c),
+	CV1800_GENERAL_PIN(PIN_UART2_RX, VDDIO_RTC,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x0c8, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x050),
+	CV1800_GENERAL_PIN(PIN_UART2_CTS, VDDIO_RTC,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x0cc, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x054),
+	CV1800_GENERAL_PIN(PIN_UART2_TX, VDDIO_RTC,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x0c0, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x048),
+	CV1800_GENERAL_PIN(PIN_SD0_CLK, VDDIO_SD0,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x01c, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xa00),
+	CV1800_GENERAL_PIN(PIN_SD0_D0, VDDIO_SD0,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x024, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xa08),
+	CV1800_GENERAL_PIN(PIN_SD0_CMD, VDDIO_SD0,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x020, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xa04),
+	CV1800_GENERAL_PIN(PIN_CLK32K, VDDIO_RTC,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x0b0, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x038),
+	CV1800_GENERAL_PIN(PIN_UART2_RTS, VDDIO_RTC,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x0c4, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x04c),
+	CV1800_GENERAL_PIN(PIN_SD0_D3, VDDIO_SD0,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x030, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xa14),
+	CV1800_GENERAL_PIN(PIN_SD0_D2, VDDIO_SD0,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x02c, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xa10),
+	CV1800_GENERAL_PIN(PIN_UART0_RX, VDDIO_EMMC,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x044, 7,
+			   CV1800_PINCONF_AREA_SYS, 0x910),
+	CV1800_GENERAL_PIN(PIN_UART0_TX, VDDIO_EMMC,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x040, 7,
+			   CV1800_PINCONF_AREA_SYS, 0x90c),
+	CV1800_GENERAL_PIN(PIN_JTAG_CPU_TRST, VDDIO_EMMC,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x06c, 6,
+			   CV1800_PINCONF_AREA_SYS, 0x938),
+	CV1800_GENERAL_PIN(PIN_PWR_ON, VDDIO_RTC,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x09c, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x024),
+	CV1800_GENERAL_PIN(PIN_PWR_GPIO2, VDDIO_RTC,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x0ac, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x034),
+	CV1800_GENERAL_PIN(PIN_PWR_GPIO0, VDDIO_RTC,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x0a4, 4,
+			   CV1800_PINCONF_AREA_RTC, 0x02c),
+	CV1800_GENERAL_PIN(PIN_CLK25M, VDDIO_RTC,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x0b4, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x03c),
+	CV1800_GENERAL_PIN(PIN_SD0_PWR_EN, VDDIO_EMMC,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x038, 3,
+			   CV1800_PINCONF_AREA_SYS, 0x904),
+	CV1800_GENERAL_PIN(PIN_SPK_EN, VDDIO_EMMC,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x03c, 3,
+			   CV1800_PINCONF_AREA_SYS, 0x908),
+	CV1800_GENERAL_PIN(PIN_JTAG_CPU_TCK, VDDIO_EMMC,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x068, 7,
+			   CV1800_PINCONF_AREA_SYS, 0x934),
+	CV1800_GENERAL_PIN(PIN_JTAG_CPU_TMS, VDDIO_EMMC,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x064, 7,
+			   CV1800_PINCONF_AREA_SYS, 0x930),
+	CV1800_GENERAL_PIN(PIN_PWR_WAKEUP1, VDDIO_RTC,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x094, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x01c),
+	CV1800_GENERAL_PIN(PIN_PWR_WAKEUP0, VDDIO_RTC,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x090, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x018),
+	CV1800_GENERAL_PIN(PIN_PWR_GPIO1, VDDIO_RTC,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x0a8, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x030),
+	CV1800_GENERAL_PIN(PIN_EMMC_DAT3, VDDIO_EMMC,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x058, 3,
+			   CV1800_PINCONF_AREA_SYS, 0x924),
+	CV1800_GENERAL_PIN(PIN_EMMC_DAT0, VDDIO_EMMC,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x054, 3,
+			   CV1800_PINCONF_AREA_SYS, 0x920),
+	CV1800_GENERAL_PIN(PIN_EMMC_DAT2, VDDIO_EMMC,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x04c, 3,
+			   CV1800_PINCONF_AREA_SYS, 0x918),
+	CV1800_GENERAL_PIN(PIN_EMMC_RSTN, VDDIO_EMMC,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x048, 4,
+			   CV1800_PINCONF_AREA_SYS, 0x914),
+	CV1800_GENERAL_PIN(PIN_AUX0, VDDIO_EMMC,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x078, 7,
+			   CV1800_PINCONF_AREA_SYS, 0x944),
+	CV1800_GENERAL_PIN(PIN_IIC0_SDA, VDDIO_EMMC,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x074, 7,
+			   CV1800_PINCONF_AREA_SYS, 0x940),
+	CV1800_GENERAL_PIN(PIN_PWR_SEQ3, VDDIO_RTC,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x08c, 3,
+			   CV1800_PINCONF_AREA_RTC, 0x010),
+	CV1800_GENERAL_PIN(PIN_PWR_VBAT_DET, VDDIO_RTC,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x07c, 0,
+			   CV1800_PINCONF_AREA_RTC, 0x000),
+	CV1800_GENERAL_PIN(PIN_PWR_SEQ1, VDDIO_RTC,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x084, 3,
+			   CV1800_PINCONF_AREA_RTC, 0x008),
+	CV1800_GENERAL_PIN(PIN_PWR_BUTTON1, VDDIO_RTC,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x098, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x020),
+	CV1800_GENERAL_PIN(PIN_EMMC_DAT1, VDDIO_EMMC,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x060, 3,
+			   CV1800_PINCONF_AREA_SYS, 0x92c),
+	CV1800_GENERAL_PIN(PIN_EMMC_CMD, VDDIO_EMMC,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x05c, 3,
+			   CV1800_PINCONF_AREA_SYS, 0x928),
+	CV1800_GENERAL_PIN(PIN_EMMC_CLK, VDDIO_EMMC,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x050, 3,
+			   CV1800_PINCONF_AREA_SYS, 0x91c),
+	CV1800_GENERAL_PIN(PIN_IIC0_SCL, VDDIO_EMMC,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x070, 7,
+			   CV1800_PINCONF_AREA_SYS, 0x93c),
+	CV1800_GENERAL_PIN(PIN_GPIO_ZQ, VDDIO_RTC,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x1d0, 4,
+			   CV1800_PINCONF_AREA_RTC, 0x0e0),
+	CV1800_GENERAL_PIN(PIN_PWR_RSTN, VDDIO_RTC,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x080, 0,
+			   CV1800_PINCONF_AREA_RTC, 0x004),
+	CV1800_GENERAL_PIN(PIN_PWR_SEQ2, VDDIO_RTC,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x088, 3,
+			   CV1800_PINCONF_AREA_RTC, 0x00c),
+	CV1800_GENERAL_PIN(PIN_XTAL_XIN, VDDIO_RTC,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x0a0, 0,
+			   CV1800_PINCONF_AREA_RTC, 0x028),
+};
+
+static const struct cv1800_pinctrl_data sg2000_pindata = {
+	.pins		= sg2000_pins,
+	.pindata	= sg2000_pin_data,
+	.pdnames	= sg2000_power_domain_desc,
+	.vddio_ops	= &sg2000_vddio_cfg_ops,
+	.npins		= ARRAY_SIZE(sg2000_pins),
+	.npd		= ARRAY_SIZE(sg2000_power_domain_desc),
+};
+
+static const struct of_device_id sg2000_pinctrl_ids[] = {
+	{ .compatible = "sophgo,sg2000-pinctrl", .data = &sg2000_pindata },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, sg2000_pinctrl_ids);
+
+static struct platform_driver sg2000_pinctrl_driver = {
+	.probe	= cv1800_pinctrl_probe,
+	.driver	= {
+		.name			= "sg2000-pinctrl",
+		.suppress_bind_attrs	= true,
+		.of_match_table		= sg2000_pinctrl_ids,
+	},
+};
+module_platform_driver(sg2000_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for the SG2000 series SoC");
+MODULE_LICENSE("GPL");
--
2.45.2


