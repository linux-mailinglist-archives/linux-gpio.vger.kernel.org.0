Return-Path: <linux-gpio+bounces-8532-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A297C945583
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Aug 2024 02:36:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C72951C21427
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Aug 2024 00:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8682E11CB8;
	Fri,  2 Aug 2024 00:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="vAKmCnvF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10olkn2052.outbound.protection.outlook.com [40.92.42.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC233EAE9;
	Fri,  2 Aug 2024 00:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.42.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722558971; cv=fail; b=EwpPcPIreIATZYsTB5H6QaDE9DB7GcCq49rUnt5UP9JgV7tgdf42m8OXJHytr8gvUa/1xe6FdycKLB2ngn7aWSbnf83yraXdVwnCvuKLXL3YWk/A2rrP08MShw0d2TKdT35rmUqK8FF26BfXnnXKyhKvDiPWURd4iaUwrGgmSCQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722558971; c=relaxed/simple;
	bh=EjH0VSVaWzRtKaiz0QBnQ+xow9Toy2MkTxdkHnZdYFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fpEqLKehYwDwsN2xpW51kseIWnhn12iN/KFKqrNrUl1BI6bstE0rKiE6fcQpyLvqXOb7QYkCbYzcnOJGCO6mM6mMgX/DHD11iyHVlJX56/GHNirGfLDPCUokUE934txcu7INAmQn13UOkIHoYRYZe8kHf3KWx25cGlSQKUVBcSQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=vAKmCnvF; arc=fail smtp.client-ip=40.92.42.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RF9f13XM+xQJUYgvF76wqXcyfmr9C7HI7HxPVW+oKkImZQkKcCt1TOun2AluAl/wzlleszkDUI/gTZxAyco0fn3pvYglK8KbPj9Qa1OoRvGpFP+GNWeoqNLYKN6eMwx/hXcS9WozcMY6hh+pcoy2n6+rZD21/AwWGDQt/zcdlS79WYHiYdtUb5gFcLGSWBvnBN3Y4l17Dnqyz5OWBAbe2qe4Iu0mmPZCJxoG4g3w0NGatBRUaPrhD8fDd/kxuS0pLc5c0tnYSfE8ClUyf8RmeVkF9hYEklOwRx6Shy55cDr2fTncziAKdNnt0pT+PehbaUGw0B3N889abiQTUfRlzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RngHhXQRXS0SjcbNLl2X8zKGPWtsHaFzB9Xxmdy0mwc=;
 b=cObztRbs5kdHDnCV+pKo0TPkEIT7suirN4aLA8YjpePT0p6XbWcQepH+xNCOSdO2tajs7gGtvwtBabotJ4CnpuTqNblj5LBpUQy+bZhSDqTHLII165iFZ/RXeQFHfOWR8KiCycDlVMmHIcofzsxo4aqUFixJetvUBkEqFI7+zVknl05KsDuHQvuDR+s3c3BJ0abj/MapI6hO5N1qwyF1n7FCn9qijYN8rgeJ+uE5K+Et2Nwccxw5KjRMcDIGojdBktcxhUsJwjKijATuiAtg5X8GZ3SyMN75lfdVevjn+EB8OkN0FJnLBDOHPLap/AVNPwwO+rl94GRhC1jVlMNCHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RngHhXQRXS0SjcbNLl2X8zKGPWtsHaFzB9Xxmdy0mwc=;
 b=vAKmCnvFH1vBIUfYS3oXVc/6fsFbyrSlG5tpMMfJPJgC1K+PU3p/IK6d2/6Yfb2hpqoGScp1anm9G5YOlcnAV7pbY53/0N2BHneBhj37Bj+pnrb59EMrDFw2L0xmbw0BCc0nyffIzKQekS7vijHPUTnP0Nfa+p57OIDUVxoWBSTohFg6xYfTaZkv7M52KdOYbMun27W9SSWuvvpuArI9UsxQCSe+MWsmtRirr9DIlSEKrIG4VHVZrYgBKTXCvV7WW3zuKyfCrLXmx7q4XJ7BY76/EoFNp8fxLnTp5o04E31hy1dmWKVKNpdZ3VqcWfkq08/RU5vMVubgtkXlvij2Ow==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by IA1PR20MB4954.namprd20.prod.outlook.com (2603:10b6:208:3ae::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Fri, 2 Aug
 2024 00:36:06 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%4]) with mapi id 15.20.7828.023; Fri, 2 Aug 2024
 00:36:06 +0000
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
	Drew Fustini <dfustini@baylibre.com>,
	Haylen Chu <heylenay@outlook.com>
Cc: Liu Gui <kenneth.liu@sophgo.com>,
	Yixun Lan <dlan@gentoo.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 3/7] pinctrl: sophgo: add support for CV1812H SoC
Date: Fri,  2 Aug 2024 08:35:18 +0800
Message-ID:
 <IA1PR20MB495355EDA2E04FA3E2794978BBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <IA1PR20MB4953DC78BB0FE0C57EA94F91BBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953DC78BB0FE0C57EA94F91BBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [bh3oyyoWp+Rwdcv9r7exvoN9EZFn0RWvouHNuGZTnjk=]
X-ClientProxiedBy: SI2PR01CA0051.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::6) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID:
 <20240802003525.260055-3-inochiama@outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|IA1PR20MB4954:EE_
X-MS-Office365-Filtering-Correlation-Id: bedbbb99-4466-40b2-bade-08dcb28b183f
X-MS-Exchange-SLBlob-MailProps:
	0wLWl8rLpvthC+8xu8Kgdf6q4p/Zg4G3MzzwdOs9z/ND495ltim1xQJxrthoQ58d+CrPxWynZ54bLrGv00gPKxFczFPaE086LPCgCCQ1OI0FhuRYx5romtKwQXVGfW9zJdPyuZUTDR4m6fxYsxKnbI+1egNWDEpfjjU/V0NKRo8dxAqZMtpMw8aNlocqEvUBm8lD9Hmg+3D3PHLfe1hOY1C3w8EDWiXKaq7Otdf/c3sgIB4e6QSBy0+dOnW3BpTihbSy2gTiielz+8oNgq5odngOe6E5jBuUDe8aMNWXGdjgoUMH1mv+4Hjrh0ZRlIAN/HKkW86j8awrd/NnDfCmcYKFd08Ul/A05KZ3IG7L1bVaK3V1rmBnTWr545Fn3wMP21k7UAvv3eBoh26WSlDa7IJ0PGl5koARxK0qp7cVD9Ao+3Ox5WlT+fk6oj8UoPFZ7Cw57mzJDqolv6LRlXCWHyPTNyFO5vJawhCUXWv0k75yFHEQN6VRvXANnbLbwCiFu/YYe6FgxMY8yme4/RgtO443nzn6WyZa3pTbC+PVUNZdshJlrVZ6iqD8oR7xoxBSZRd2p8x440buYdLRlC+Um2Eev9fY3pXVn28mhsQBZoiggS+j7rqh5J4QCch/zvp6P+r+TZghF107H47bUHDrqmGLVo5pEqC0/M3/Rl0fVa0IS89eIlVGnMS+sdnGFGOCpzJIZTmDGa0s6Oyp33cDSIhG7F1Xtso2j5R+7T8TMYN7iczyjWutgQtHhQ/Lp9RDia8SMR1BeME=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799003|5072599009|8060799006|461199028|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	wqFYPxg4pwt6zWk3Uz/GM8jOXa8G1tEUgrJ+ZNSlclvhNKP5G1P+yD9GbbvBUw/Y66DaCx1CN3AyUMDkdCXphEZfT59+NKyrZcQSLaIpuNqEaH+dLb8RYUeVjcZ5Ut+KIYaMAlNyDiB3iCE3qnqRBj8t6iEYInTw6P6wgdoDOokicO+AVB6ddlOHtQ53X48GCiqe24zuUeqEGjmhSRLQXFhK7moz/7CPJxoyxToz7HCD+ukOPTjwfDrUmL8cvukfofTxZXYAMEdtm703uDZ2M+ZdpUZLQw/UwRPp2eo7l6kfgV617V9GNL+uDqo5OE0r4qfy/ukNl9B0BYpav46JfryiqUJtOa6zBtc8u1Ob2na8ITvDeOlFyxur/AyYlSamd7Pu56YE903yrb1doEZfhJ+1+DRXUztxJgDBAnCz5YOi1O17kgG3RMfjNWic0Frw40lLWN4c9nCNAnwRPEk4zI09NIz9Av2ZNZB6Q71Rgzz31yV0dKhME8x7wjKO+cZxjx70/1pl1FpuMYRnoYIeRTC/tuExIFl6xLSC4VbEfVehd7lOEfdUDdVbftlte8UroZcr2SsQ+TSWXa+/n9NuX/p2ojEnTsmzJ4eyVmZfZBIeHdE/iNcqVmA3uf5LqSlGUyPlCp2Xwjt/BeX5fqKZokLrQq/2WS3tPIVe75x6dDpdTr0pN3hU1r/Op6Cz11qyR3SqX+GLZq+cSi40jaUHsg==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DcxGcoweWXVSZpdLo9MggkHfz0bIs13BrG9egXfrIkEyfGCptZYivtHfZsVO?=
 =?us-ascii?Q?+axZg1+MDJ3FU44b4gycK9NWUFjkUIXAp9BwPobW0ifP0IZytuTCUgvk039i?=
 =?us-ascii?Q?4w+bb99tWct7H/BhvLeAeMV8WX6wWDCeGDg0OHrVDXUzPT3K6ogNv2WlePnm?=
 =?us-ascii?Q?vwUNfv81sjEI8sIwQBckRnLV2YI0tMrALSLHR9TvUj39pYclPR6ckbIVBE3g?=
 =?us-ascii?Q?tRpN/8raChjOnUAH6ywr1GJ3wcg51ew+tJo9EyFxnJBYKSXvlUsoFwnTn3lv?=
 =?us-ascii?Q?Rcw1V4eS8/ESM5VQzkZEFNG38d+vjrmCj8NVckitGjDmCM/g+LYkp2ul8j8g?=
 =?us-ascii?Q?BzGVRwgZSLj4oLnJwRATHvOvZNagAzqw6h8Av7mrjqbqeC3/t2Qp8kkWW9hi?=
 =?us-ascii?Q?pJD/BdtnlDaAXzYzF9FZt3JTc77+J0ufyypf5ibxfnwcAmqQjYZh4QwW1uKc?=
 =?us-ascii?Q?xPXrk3S4Ra+UFhSdADvlBJsvp1Kp22uzCtkQxxczxswnOAT2/FbBQDtNFNOb?=
 =?us-ascii?Q?xYJY8LmO5gGABNxM7/EbzfTTo3w20aKzBgnT+E7Wsptfeha9YxnF+Dpoy9A6?=
 =?us-ascii?Q?T8FGtEcb3csM34/2QBLbpvp8s9+e9kfZEfT1vn/mfWaaOtavNpVmXcS8+dYd?=
 =?us-ascii?Q?t7axcxDXYLa0oKfLLnnAQX2rSq5D1eN2jS4nf0AeKLVsNLrKOZmEELkRQZqd?=
 =?us-ascii?Q?dOiwdL/Yk3V5KxPkEAfR+avibU2Yw6sPcVFKWcB4EoBSesoTWIXJAaa3sjOp?=
 =?us-ascii?Q?VrrHGZqyqVakJlXVhAVE8x8hnL3UkEzVg/NAVhWBN6narWbOBJOlRKsoa1kl?=
 =?us-ascii?Q?lQ8yfaj46/1siyWboDJqlBtkmkl8lpeYYdVjkbpqEIDPXVyPqn1elYPP4Bpd?=
 =?us-ascii?Q?/Ms0uZCiK/8acL/b4HyO9K4aKRwaZl48PPxxFZCFF+GJ5Pv4L0cABWQviT6I?=
 =?us-ascii?Q?7OprIHqzKt5CkJbhcYIugGMWs1iAaA0J0GGB5hfodzkEyZM7BPvEUxvrWyfK?=
 =?us-ascii?Q?y8/X8c/eBAkpPQERUu88ieAgfD9OTnLZJ9eg5gv4hYe2QeA/8SWi0LzYfmuU?=
 =?us-ascii?Q?Ym71DTNvu/2tsF7E7l7zDk0d0UAy/SpIYaapRggighJhESJY06pn4tONxlar?=
 =?us-ascii?Q?x1wVKicBos35Ps0srByA1DJYRUMpo2UlkiJcc2UAs1DBl4d6yw+Lkv84idbE?=
 =?us-ascii?Q?8kVIQ41ApXAtjcJ8vqGBoDsj+k8CUxHI1P7lVDRkCm8muHJYXhqZ+U+R4POI?=
 =?us-ascii?Q?qRIViHNZY82qAOQXZRjZ?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bedbbb99-4466-40b2-bade-08dcb28b183f
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 00:36:06.1581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR20MB4954

Add pin definition driver of CV1812H.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 drivers/pinctrl/sophgo/Kconfig           |  11 +
 drivers/pinctrl/sophgo/Makefile          |   1 +
 drivers/pinctrl/sophgo/pinctrl-cv1812h.c | 771 +++++++++++++++++++++++
 3 files changed, 783 insertions(+)
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-cv1812h.c

diff --git a/drivers/pinctrl/sophgo/Kconfig b/drivers/pinctrl/sophgo/Kconfig
index d91dcdf13e60..1bd0770c1201 100644
--- a/drivers/pinctrl/sophgo/Kconfig
+++ b/drivers/pinctrl/sophgo/Kconfig
@@ -19,3 +19,14 @@ config PINCTRL_SOPHGO_CV1800B
 	  This pin controller allows selecting the mux function for
 	  each pin. This driver can also be built as a module called
 	  pinctrl-cv1800b.
+
+config PINCTRL_SOPHGO_CV1812H
+	tristate "Sophgo CV1812H SoC Pinctrl driver"
+	depends on ARCH_SOPHGO || COMPILE_TEST
+	depends on OF
+	select PINCTRL_SOPHGO_CV18XX
+	help
+	  Say Y to select the pinctrl driver for CV1812H SoC.
+	  This pin controller allows selecting the mux function for
+	  each pin. This driver can also be built as a module called
+	  pinctrl-cv1812h.
diff --git a/drivers/pinctrl/sophgo/Makefile b/drivers/pinctrl/sophgo/Makefile
index 1add0d794122..571e0a64f29a 100644
--- a/drivers/pinctrl/sophgo/Makefile
+++ b/drivers/pinctrl/sophgo/Makefile
@@ -2,3 +2,4 @@

 obj-$(CONFIG_PINCTRL_SOPHGO_CV18XX)	+= pinctrl-cv18xx.o
 obj-$(CONFIG_PINCTRL_SOPHGO_CV1800B)	+= pinctrl-cv1800b.o
+obj-$(CONFIG_PINCTRL_SOPHGO_CV1812H)	+= pinctrl-cv1812h.o
diff --git a/drivers/pinctrl/sophgo/pinctrl-cv1812h.c b/drivers/pinctrl/sophgo/pinctrl-cv1812h.c
new file mode 100644
index 000000000000..5632290b46fa
--- /dev/null
+++ b/drivers/pinctrl/sophgo/pinctrl-cv1812h.c
@@ -0,0 +1,771 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Sophgo CV1812H SoC pinctrl driver.
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
+#include <dt-bindings/pinctrl/pinctrl-cv1812h.h>
+
+#include "pinctrl-cv18xx.h"
+
+enum CV1812H_POWER_DOMAIN {
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
+static const char *const cv1812h_power_domain_desc[] = {
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
+static int cv1812h_get_pull_up(struct cv1800_pin *pin, const u32 *psmap)
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
+static int cv1812h_get_pull_down(struct cv1800_pin *pin, const u32 *psmap)
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
+static const u32 cv1812h_1v8_oc_map[] = {
+	12800,
+	25300,
+	37400,
+	49000
+};
+
+static const u32 cv1812h_18od33_1v8_oc_map[] = {
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
+static const u32 cv1812h_18od33_3v3_oc_map[] = {
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
+static const u32 cv1812h_eth_oc_map[] = {
+	15700,
+	17800
+};
+
+static int cv1812h_get_oc_map(struct cv1800_pin *pin, const u32 *psmap,
+			      const u32 **map)
+{
+	enum cv1800_pin_io_type type = cv1800_pin_io_type(pin);
+	u32 pstate = psmap[pin->power_domain];
+
+	if (type == IO_TYPE_1V8_ONLY) {
+		*map = cv1812h_1v8_oc_map;
+		return ARRAY_SIZE(cv1812h_1v8_oc_map);
+	}
+
+	if (type == IO_TYPE_1V8_OR_3V3) {
+		if (pstate == PIN_POWER_STATE_1V8) {
+			*map = cv1812h_18od33_1v8_oc_map;
+			return ARRAY_SIZE(cv1812h_18od33_1v8_oc_map);
+		} else if (pstate == PIN_POWER_STATE_3V3) {
+			*map = cv1812h_18od33_3v3_oc_map;
+			return ARRAY_SIZE(cv1812h_18od33_3v3_oc_map);
+		}
+	}
+
+	if (type == IO_TYPE_ETH) {
+		*map = cv1812h_eth_oc_map;
+		return ARRAY_SIZE(cv1812h_eth_oc_map);
+	}
+
+	return -ENOTSUPP;
+}
+
+static const u32 cv1812h_1v8_schmitt_map[] = {
+	0,
+	970000,
+	1040000
+};
+
+static const u32 cv1812h_18od33_1v8_schmitt_map[] = {
+	0,
+	1070000
+};
+
+static const u32 cv1812h_18od33_3v3_schmitt_map[] = {
+	0,
+	1100000
+};
+
+static int cv1812h_get_schmitt_map(struct cv1800_pin *pin, const u32 *psmap,
+				   const u32 **map)
+{
+	enum cv1800_pin_io_type type = cv1800_pin_io_type(pin);
+	u32 pstate = psmap[pin->power_domain];
+
+	if (type == IO_TYPE_1V8_ONLY) {
+		*map = cv1812h_1v8_schmitt_map;
+		return ARRAY_SIZE(cv1812h_1v8_schmitt_map);
+	}
+
+	if (type == IO_TYPE_1V8_OR_3V3) {
+		if (pstate == PIN_POWER_STATE_1V8) {
+			*map = cv1812h_18od33_1v8_schmitt_map;
+			return ARRAY_SIZE(cv1812h_18od33_1v8_schmitt_map);
+		} else if (pstate == PIN_POWER_STATE_3V3) {
+			*map = cv1812h_18od33_3v3_schmitt_map;
+			return ARRAY_SIZE(cv1812h_18od33_3v3_schmitt_map);
+		}
+	}
+
+	return -ENOTSUPP;
+}
+
+static const struct cv1800_vddio_cfg_ops cv1812h_vddio_cfg_ops = {
+	.get_pull_up		= cv1812h_get_pull_up,
+	.get_pull_down		= cv1812h_get_pull_down,
+	.get_oc_map		= cv1812h_get_oc_map,
+	.get_schmitt_map		= cv1812h_get_schmitt_map,
+};
+
+static const struct pinctrl_pin_desc cv1812h_pins[] = {
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
+static const struct cv1800_pin cv1812h_pin_data[ARRAY_SIZE(cv1812h_pins)] = {
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
+static const struct cv1800_pinctrl_data cv1812h_pindata = {
+	.pins		= cv1812h_pins,
+	.pindata	= cv1812h_pin_data,
+	.pdnames	= cv1812h_power_domain_desc,
+	.vddio_ops	= &cv1812h_vddio_cfg_ops,
+	.npins		= ARRAY_SIZE(cv1812h_pins),
+	.npd		= ARRAY_SIZE(cv1812h_power_domain_desc),
+};
+
+static const struct of_device_id cv1812h_pinctrl_ids[] = {
+	{ .compatible = "sophgo,cv1812h-pinctrl", .data = &cv1812h_pindata },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, cv1812h_pinctrl_ids);
+
+static struct platform_driver cv1812h_pinctrl_driver = {
+	.probe	= cv1800_pinctrl_probe,
+	.driver	= {
+		.name			= "cv1812h-pinctrl",
+		.suppress_bind_attrs	= true,
+		.of_match_table		= cv1812h_pinctrl_ids,
+	},
+};
+module_platform_driver(cv1812h_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for the CV1812H series SoC");
+MODULE_LICENSE("GPL");
--
2.46.0


