Return-Path: <linux-gpio+bounces-8031-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C7A926F08
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2024 07:47:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1314DB21E78
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Jul 2024 05:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AE8B1A070E;
	Thu,  4 Jul 2024 05:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="sDYp22R3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10olkn2032.outbound.protection.outlook.com [40.92.41.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC191A01D8;
	Thu,  4 Jul 2024 05:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.41.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720072054; cv=fail; b=UIK2L729uVxnd842En9VJIe+wXBGfLzZWFKDmMriHf104LAVVfmBClF/6Zq2TqN5qFPwmUtz9VkN7nDyU6fLLeTAkvovbDF8gsdIEgIUUxXQE5nVScR1icGYEFyGAOAE+g1KeohOEGVSUo3q4Swa90JHsMNBiCpmC4/RoFfBG2k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720072054; c=relaxed/simple;
	bh=I6rkhK4UR99sS20FwaKXZ40kfGNwlZfah3+CYkiPLUc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aLXJw5bh9Qq/6Jtq72f8+DfaRDPAwvEfYhQ5Fn/RK929b+JD4/7a86Ck/cbpXGh8jNJDGKcv1XXReoVRNjNQfg0f08J0pttLP4wB6UGqB65XeeVNW/t7eAfuFB3k46nyi2W12dGJOOSRx2YBIh7rYVJCNEb4VxZhhfBCbqnKitU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=sDYp22R3; arc=fail smtp.client-ip=40.92.41.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gkhESY1Gg/lMNmQ21c0bIz8se22aHtXW0lmyx2EyF01ahn+5wZF/zsaPd9lIrNU4BWBauoJBdyPiD468NrvAue/gvc7zO9WBCFI725+bdR763bhD92jl2siR7y2GzGi8Kyx/gdVw7xpvdBXplrbRvFhy4o2sDGAqw/Aqr15RVWwSAz/qN9FeiAoZQmQ65aKT3MD1+dt9ApuBByBIyhUksjntwLju39iEr9rigALu6scdO5/InZsewbjR7uhNM2UE10gjuZZYvn6dNH3/wyrH/YJQaO8qRLXR89sKOF1pSzSSdXaj+ttR2uO/fatyY0DUxdQg8AzyhV7Mfd5l0hJiVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y9kjtT1F0NUHr0XUctm7cyAThPA5MAFAlvQd3a/dS5g=;
 b=CojJ93e3DXjE9fddECKSbpum1Nzcmxu1t+qxi6yuEUZHvo4/SXP09rGPnRaI2kdnGHNbDrd77jxM+YCgiIM6H7lOzCKMp/0w8em+XaVOqnDCXITA7KjMFoVzRGQzsocGN9aSMW29tkhj0FkJGZT+HZtLv66GpbUfDGa5YvBLO2U9eqUW0GstrcjNXqvtMgnE83yrZFHsatr5Oh8EBDNz/gPoeEioLC9fYA2fqqpe8yq2J9hzBic+RFTETf3BAIwVqzvzc/AhSapB7xis2uvThuFlzhkqMXh50mJA4W2Li3vGnfrWWBwiYmBU7sPlkajJmV4RoeLh9mznJaBLG6ZgKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y9kjtT1F0NUHr0XUctm7cyAThPA5MAFAlvQd3a/dS5g=;
 b=sDYp22R3qCcv9//qBYKlC6equKcX/X+WHH4/8ml+FrtSyxltOyaL0Uz8ugMzmhB5oPmLkecj5v1X9VWpupOdssHRzvlISOIRfEBo8nhfuw25eXk4goQrOlFGUQL8k3GLK0emDFRxpxNVgsjNC0r+UlDlbw240FTpaHngUiQUE9v4y96wUstypR0DdEFgTlQ//6qLxPX3+sBNme3r5YjyuEpLwPfS4UaqqAByYPNst9GWttIN++JEUN8WzZwhgFcJtjKoPm8gCSXqczCAbG+boJG5ZBfey/xxzmXI+nNBt/oXkP8BrVtM7ZhXTdhwSd8c5HfrOOUIueKYFXYjcIcJgg==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by MW4PR20MB4293.namprd20.prod.outlook.com (2603:10b6:303:184::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33; Thu, 4 Jul
 2024 05:47:28 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%6]) with mapi id 15.20.7741.017; Thu, 4 Jul 2024
 05:47:28 +0000
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
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 2/7] pinctrl: sophgo: add support for CV1800B SoC
Date: Thu,  4 Jul 2024 13:46:38 +0800
Message-ID:
 <IA1PR20MB4953BB3EE164E9D0DCE5525EBBDE2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <IA1PR20MB49530F0476B98DBB835B344FBBDE2@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49530F0476B98DBB835B344FBBDE2@IA1PR20MB4953.namprd20.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [AUd6glbqjuMO2ajXfd5S6d07wO1DKwf6sV19nULiR3g=]
X-ClientProxiedBy: SI2PR04CA0005.apcprd04.prod.outlook.com
 (2603:1096:4:197::16) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID:
 <20240704054647.1747392-2-inochiama@outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|MW4PR20MB4293:EE_
X-MS-Office365-Filtering-Correlation-Id: 0975fbc2-7a61-41ec-2eb7-08dc9becc99d
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799006|461199028|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	aWpVtBwY0SneVnjPky3/sFfrlotn3lzAR1/mCRY2K11xhJzw7M6aRlgnxtiR3DEqweiXArGabKDJQj6jd1zutMw9zLzigLv9YMJnp7zctMIVvct/xiihkOomWoK4H4IX/5TVpkbh+2IVHLHha2l/43L5tjOmJSohSQV7AyiCr1yXXtSqBCy1piDV7d/SK8Kac6Z3Rm1Sba39BcvrkZi0xbbqF6mtv5I+O4UaZNa0x5ohRDeoCLd+iLttpChJ4u6Aq71dG52cp3/RKCBSpAz51FH54VM977z48dVbh0y67+69q0Un7BfhU8urxYVbT+DH7PotRMPC7754P0NuqaE/i7Wf6XaZ4+pxR/rlCb3NeidamK4Egh1FP9vJxC+HwEjQ6VSxEUkehqOM/82M1JOZpWaxsoHYFxtkkVxDKs6c2jPi2WY9gLCvJ84vajBKcpIymJRHq683AtJGYqkvjLCslphvu9B3KvOK+6VoB3mlqYRzZ0NnUS+htc4sA4zGcJSHz48KWzQ3YsQfIATG7Edz68bQnSg/6rwNzfHvkJX6kizboxBRq7oq7ABQd/O9YmXjYM71xLgm+GVt+VJIxaeMK9+N/1CDAO8ojU1KtAmUFCyUJ7UhmrHiSgtMAuBt47RgGaFpMFK3MEAye5EDtRWHAA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZV+4ya1LmCR01INFJV+x5xs9Nh6NDJfVyODlB6o7KoYLbetbGBsqL/u8k1vx?=
 =?us-ascii?Q?18z+xfzKfmT+43AzhghCTJ+AVxwlp9yzjXzoex9s6JZ9lO9zutzL4F0QS3GL?=
 =?us-ascii?Q?9bcAcUEyT87j2pf1thsGa2qgGzOd/w5oergWnoOaj7iYnLqCeKpU4NsG5FBm?=
 =?us-ascii?Q?M3aWJqHREjSj1iKJIJj/MiXaTc0PBfrMBVQGYORit3WUx9nID12Bm8OSUTmw?=
 =?us-ascii?Q?wgPDQw4YePIkR032AlgyPx5gvRaWJEf7fT8T2SaenvxAov5hzdAsOnYNlIRG?=
 =?us-ascii?Q?owA7q8+hvt2/R5UTO1vRiz5RlxmPC/DdFOSzr+nAHUNhjycCamjnZ5rjX9eV?=
 =?us-ascii?Q?Vy8yr8Fie08IisZYKnnfh83QSzf3TjNNv4pZ0qhXFfLzkz42GzvVE7DA5/os?=
 =?us-ascii?Q?yHth4mHjiXUClapdTwwryd1zXMUlF90HLz/iiXqgcsaT/u35Nd21aH7GiKlU?=
 =?us-ascii?Q?bYep9rtmYIyn0YKoJQXbChZKAJ1F1455ZF6iWrJGrSsCx2uJwBGlw+6/X/Jr?=
 =?us-ascii?Q?0mg8ddZk4Og3thTw7TZlYyj0m9iV/C9yRuwXiW2EYqWq68bMABcS+odGu5mD?=
 =?us-ascii?Q?/ceuvy8OgFq7nlnYqFH5QoAdh7vFn8G6IJMMLxNNLhiVfD7xOJ9Auz1IV4AN?=
 =?us-ascii?Q?nJce7l6I7X1mKkXr5ubrC3Xs+y41W/3mZ8q7FEpkyHnFp5k711xSZYXOdQ0F?=
 =?us-ascii?Q?yU/KV2vYl3n9KwFALdXZMkyeZzU2fC3IuVZdlPKRBf3Dxz6yCGYgRPXkxvfk?=
 =?us-ascii?Q?5KXvvzx1XQA4YS+LIHYEHk7DfDwMbunPXXffwEBwrK4NaoR8v7zFH5+16MxM?=
 =?us-ascii?Q?CoYQaJwkwd+bO8yJ0F/ge8xUpfAwXqm94Vu91l5c9NkNNIlhNVv6jDue9TV3?=
 =?us-ascii?Q?cQPKDVyUQCF3PtgMOVc324TWJhUHMu2MO7mEp779Ybr7yItdZfox9CbVWRKf?=
 =?us-ascii?Q?uQH2cd1B+WQmwfAQDV3g+O5oJrP6oFGjQ3TUm/dJBiAFusz/3dH5Qj7aAEIS?=
 =?us-ascii?Q?aLdcBl9brwfVDh1C2EGwW5zI/k2nrREBDk65DGeJtDLkaYtgZiNCFwEUO4gO?=
 =?us-ascii?Q?x4Wu6RRnRkpVvFq7EUj2teCAMdnfmngpCb7r76KNDxDTkt/0712O/ofcgqIV?=
 =?us-ascii?Q?WVMHHDBXEc6En+pd7AfRyHd/MoM0YFM2K/xk5nDbrBSNTuOEiEqhBxgDZv2R?=
 =?us-ascii?Q?gVMMaPe837BJ9zmmncLNe5MKcszxGJhuqYKqZ9axrOOJ94uGQjBGrCNiPnkg?=
 =?us-ascii?Q?p7K/gU6ET0uuEjABu5i+?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0975fbc2-7a61-41ec-2eb7-08dc9becc99d
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 05:47:28.1303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR20MB4293

Sophgo CV1800 series SoCs share common control logic but have
different register mapping. For maintenance, split the driver
and pin definition of the SoC.

Add base driver for CV1800 series SoC and pin definition of
CV1800B.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 drivers/pinctrl/Kconfig                  |   1 +
 drivers/pinctrl/Makefile                 |   1 +
 drivers/pinctrl/sophgo/Kconfig           |  21 +
 drivers/pinctrl/sophgo/Makefile          |   4 +
 drivers/pinctrl/sophgo/pinctrl-cv1800b.c | 293 +++++++++++
 drivers/pinctrl/sophgo/pinctrl-cv18xx.c  | 642 +++++++++++++++++++++++
 drivers/pinctrl/sophgo/pinctrl-cv18xx.h  | 126 +++++
 7 files changed, 1088 insertions(+)
 create mode 100644 drivers/pinctrl/sophgo/Kconfig
 create mode 100644 drivers/pinctrl/sophgo/Makefile
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-cv1800b.c
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-cv18xx.c
 create mode 100644 drivers/pinctrl/sophgo/pinctrl-cv18xx.h

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 7e4f93a3bc7a..9c5def3268b7 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -583,6 +583,7 @@ source "drivers/pinctrl/qcom/Kconfig"
 source "drivers/pinctrl/realtek/Kconfig"
 source "drivers/pinctrl/renesas/Kconfig"
 source "drivers/pinctrl/samsung/Kconfig"
+source "drivers/pinctrl/sophgo/Kconfig"
 source "drivers/pinctrl/spear/Kconfig"
 source "drivers/pinctrl/sprd/Kconfig"
 source "drivers/pinctrl/starfive/Kconfig"
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index cc809669405a..a4d45051a49f 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -73,6 +73,7 @@ obj-y				+= qcom/
 obj-$(CONFIG_ARCH_REALTEK)      += realtek/
 obj-$(CONFIG_PINCTRL_RENESAS)	+= renesas/
 obj-$(CONFIG_PINCTRL_SAMSUNG)	+= samsung/
+obj-y				+= sophgo/
 obj-$(CONFIG_PINCTRL_SPEAR)	+= spear/
 obj-y				+= sprd/
 obj-$(CONFIG_SOC_STARFIVE)	+= starfive/
diff --git a/drivers/pinctrl/sophgo/Kconfig b/drivers/pinctrl/sophgo/Kconfig
new file mode 100644
index 000000000000..d91dcdf13e60
--- /dev/null
+++ b/drivers/pinctrl/sophgo/Kconfig
@@ -0,0 +1,21 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Sophgo SoC PINCTRL drivers
+#
+
+config PINCTRL_SOPHGO_CV18XX
+	bool
+	select GENERIC_PINCTRL_GROUPS
+	select GENERIC_PINMUX_FUNCTIONS
+	select GENERIC_PINCONF
+
+config PINCTRL_SOPHGO_CV1800B
+	tristate "Sophgo CV1800B SoC Pinctrl driver"
+	depends on ARCH_SOPHGO || COMPILE_TEST
+	depends on OF
+	select PINCTRL_SOPHGO_CV18XX
+	help
+	  Say Y to select the pinctrl driver for CV1800B SoC.
+	  This pin controller allows selecting the mux function for
+	  each pin. This driver can also be built as a module called
+	  pinctrl-cv1800b.
diff --git a/drivers/pinctrl/sophgo/Makefile b/drivers/pinctrl/sophgo/Makefile
new file mode 100644
index 000000000000..1add0d794122
--- /dev/null
+++ b/drivers/pinctrl/sophgo/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_PINCTRL_SOPHGO_CV18XX)	+= pinctrl-cv18xx.o
+obj-$(CONFIG_PINCTRL_SOPHGO_CV1800B)	+= pinctrl-cv1800b.o
diff --git a/drivers/pinctrl/sophgo/pinctrl-cv1800b.c b/drivers/pinctrl/sophgo/pinctrl-cv1800b.c
new file mode 100644
index 000000000000..c8ebcce773d3
--- /dev/null
+++ b/drivers/pinctrl/sophgo/pinctrl-cv1800b.c
@@ -0,0 +1,293 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Sophgo CV1800B SoC pinctrl driver.
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
+#include <dt-bindings/pinctrl/pinctrl-cv1800b.h>
+
+#include "pinctrl-cv18xx.h"
+
+static const struct pinctrl_pin_desc cv1800b_pins[] = {
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
+	PINCTRL_PIN(PIN_SPINOR_HOLD_X,	"SPINOR_HOLD_X"),
+	PINCTRL_PIN(PIN_SPINOR_SCK,	"SPINOR_SCK"),
+	PINCTRL_PIN(PIN_SPINOR_MOSI,	"SPINOR_MOSI"),
+	PINCTRL_PIN(PIN_SPINOR_WP_X,	"SPINOR_WP_X"),
+	PINCTRL_PIN(PIN_SPINOR_MISO,	"SPINOR_MISO"),
+	PINCTRL_PIN(PIN_SPINOR_CS_X,	"SPINOR_CS_X"),
+	PINCTRL_PIN(PIN_IIC0_SCL,	"IIC0_SCL"),
+	PINCTRL_PIN(PIN_IIC0_SDA,	"IIC0_SDA"),
+	PINCTRL_PIN(PIN_AUX0,		"AUX0"),
+	PINCTRL_PIN(PIN_PWR_VBAT_DET,	"PWR_VBAT_DET"),
+	PINCTRL_PIN(PIN_PWR_SEQ2,	"PWR_SEQ2"),
+	PINCTRL_PIN(PIN_XTAL_XIN,	"XTAL_XIN"),
+	PINCTRL_PIN(PIN_SD1_GPIO0,	"SD1_GPIO0"),
+	PINCTRL_PIN(PIN_SD1_GPIO1,	"SD1_GPIO1"),
+	PINCTRL_PIN(PIN_SD1_D3,		"SD1_D3"),
+	PINCTRL_PIN(PIN_SD1_D2,		"SD1_D2"),
+	PINCTRL_PIN(PIN_SD1_D1,		"SD1_D1"),
+	PINCTRL_PIN(PIN_SD1_D0,		"SD1_D0"),
+	PINCTRL_PIN(PIN_SD1_CMD,	"SD1_CMD"),
+	PINCTRL_PIN(PIN_SD1_CLK,	"SD1_CLK"),
+	PINCTRL_PIN(PIN_ADC1,		"ADC1"),
+	PINCTRL_PIN(PIN_USB_VBUS_DET,	"USB_VBUS_DET"),
+	PINCTRL_PIN(PIN_ETH_TXP,	"ETH_TXP"),
+	PINCTRL_PIN(PIN_ETH_TXM,	"ETH_TXM"),
+	PINCTRL_PIN(PIN_ETH_RXP,	"ETH_RXP"),
+	PINCTRL_PIN(PIN_ETH_RXM,	"ETH_RXM"),
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
+	PINCTRL_PIN(PIN_AUD_AINL_MIC,	"AUD_AINL_MIC"),
+};
+
+static const struct cv1800_pin cv1800b_pin_data[ARRAY_SIZE(cv1800b_pins)] = {
+	CV1800_FUNC_PIN(PIN_AUD_AOUTR, "VDD18A_AUD",
+			IO_TYPE_AUDIO,
+			CV1800_PINCONF_AREA_SYS, 0x12c, 6),
+	CV1800_GENERAL_PIN(PIN_SD0_CLK, "VDDIO_SD0_SPI",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x000, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xa00),
+	CV1800_GENERAL_PIN(PIN_SD0_CMD, "VDDIO_SD0_SPI",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x004, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xa04),
+	CV1800_GENERAL_PIN(PIN_SD0_D0, "VDDIO_SD0_SPI",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x008, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xa08),
+	CV1800_GENERAL_PIN(PIN_SD0_D1, "VDDIO_SD0_SPI",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x00c, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xa0c),
+	CV1800_GENERAL_PIN(PIN_SD0_D2, "VDDIO_SD0_SPI",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x010, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xa10),
+	CV1800_GENERAL_PIN(PIN_SD0_D3, "VDDIO_SD0_SPI",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x014, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xa14),
+	CV1800_GENERAL_PIN(PIN_SD0_CD, "VDDIO_SD0_SPI",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x018, 3,
+			   CV1800_PINCONF_AREA_SYS, 0x900),
+	CV1800_GENERAL_PIN(PIN_SD0_PWR_EN, "VDDIO_SD0_SPI",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x01c, 3,
+			   CV1800_PINCONF_AREA_SYS, 0x904),
+	CV1800_GENERAL_PIN(PIN_SPK_EN, "VDDIO_SD0_SPI",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x020, 3,
+			   CV1800_PINCONF_AREA_SYS, 0x908),
+	CV1800_GENERAL_PIN(PIN_UART0_TX, "VDDIO_SD0_SPI",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x024, 7,
+			   CV1800_PINCONF_AREA_SYS, 0x90c),
+	CV1800_GENERAL_PIN(PIN_UART0_RX, "VDDIO_SD0_SPI",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x028, 7,
+			   CV1800_PINCONF_AREA_SYS, 0x910),
+	CV1800_GENERAL_PIN(PIN_SPINOR_HOLD_X, "VDDIO_SD0_SPI",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x02c, 3,
+			   CV1800_PINCONF_AREA_SYS, 0x914),
+	CV1800_GENERAL_PIN(PIN_SPINOR_SCK, "VDDIO_SD0_SPI",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x030, 3,
+			   CV1800_PINCONF_AREA_SYS, 0x918),
+	CV1800_GENERAL_PIN(PIN_SPINOR_MOSI, "VDDIO_SD0_SPI",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x034, 3,
+			   CV1800_PINCONF_AREA_SYS, 0x91c),
+	CV1800_GENERAL_PIN(PIN_SPINOR_WP_X, "VDDIO_SD0_SPI",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x038, 3,
+			   CV1800_PINCONF_AREA_SYS, 0x920),
+	CV1800_GENERAL_PIN(PIN_SPINOR_MISO, "VDDIO_SD0_SPI",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x03c, 3,
+			   CV1800_PINCONF_AREA_SYS, 0x924),
+	CV1800_GENERAL_PIN(PIN_SPINOR_CS_X, "VDDIO_SD0_SPI",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x040, 3,
+			   CV1800_PINCONF_AREA_SYS, 0x928),
+	CV1800_GENERAL_PIN(PIN_IIC0_SCL, "VDDIO_SD0_SPI",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x04c, 7,
+			   CV1800_PINCONF_AREA_SYS, 0x934),
+	CV1800_GENERAL_PIN(PIN_IIC0_SDA, "VDDIO_SD0_SPI",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x050, 7,
+			   CV1800_PINCONF_AREA_SYS, 0x938),
+	CV1800_GENERAL_PIN(PIN_AUX0, "VDDIO_SD0_SPI",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x054, 7,
+			   CV1800_PINCONF_AREA_SYS, 0x93c),
+	CV1800_GENERAL_PIN(PIN_PWR_VBAT_DET, "VDDIO_RTC",
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x05c, 0,
+			   CV1800_PINCONF_AREA_RTC, 0x004),
+	CV1800_GENERAL_PIN(PIN_PWR_SEQ2, "VDDIO_RTC",
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x068, 3,
+			   CV1800_PINCONF_AREA_RTC, 0x010),
+	CV1800_GENERAL_PIN(PIN_XTAL_XIN, "VDDIO_RTC",
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x074, 0,
+			   CV1800_PINCONF_AREA_RTC, 0x020),
+	CV1800_GENERAL_PIN(PIN_SD1_GPIO0, "VDD33A_ETH_USB_SD1",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x088, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x034),
+	CV1800_GENERAL_PIN(PIN_SD1_GPIO1, "VDD33A_ETH_USB_SD1",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x084, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x030),
+	CV1800_GENERAL_PIN(PIN_SD1_D3, "VDD33A_ETH_USB_SD1",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x08c, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x038),
+	CV1800_GENERAL_PIN(PIN_SD1_D2, "VDD33A_ETH_USB_SD1",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x090, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x03c),
+	CV1800_GENERAL_PIN(PIN_SD1_D1, "VDD33A_ETH_USB_SD1",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x094, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x040),
+	CV1800_GENERAL_PIN(PIN_SD1_D0, "VDD33A_ETH_USB_SD1",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x098, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x044),
+	CV1800_GENERAL_PIN(PIN_SD1_CMD, "VDD33A_ETH_USB_SD1",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x09c, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x048),
+	CV1800_GENERAL_PIN(PIN_SD1_CLK, "VDD33A_ETH_USB_SD1",
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x0a0, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x04c),
+	CV1800_GENERAL_PIN(PIN_ADC1, "VDD18A_USB_PLL_ETH_CSI",
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x0a8, 6,
+			   CV1800_PINCONF_AREA_SYS, 0x804),
+	CV1800_GENERAL_PIN(PIN_USB_VBUS_DET, "VDD18A_USB_PLL_ETH_CSI",
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x0ac, 6,
+			   CV1800_PINCONF_AREA_SYS, 0x808),
+	CV1800_FUNC_PIN(PIN_ETH_TXP, "VDD18A_USB_PLL_ETH_CSI",
+			IO_TYPE_ETH,
+			CV1800_PINCONF_AREA_SYS, 0x0c0, 7),
+	CV1800_FUNC_PIN(PIN_ETH_TXM, "VDD18A_USB_PLL_ETH_CSI",
+			IO_TYPE_ETH,
+			CV1800_PINCONF_AREA_SYS, 0x0c4, 7),
+	CV1800_FUNC_PIN(PIN_ETH_RXP, "VDD18A_USB_PLL_ETH_CSI",
+			IO_TYPE_ETH,
+			CV1800_PINCONF_AREA_SYS, 0x0c8, 7),
+	CV1800_FUNC_PIN(PIN_ETH_RXM, "VDD18A_USB_PLL_ETH_CSI",
+			IO_TYPE_ETH,
+			CV1800_PINCONF_AREA_SYS, 0x0cc, 7),
+	CV1800_GENERATE_PIN_MUX2(PIN_MIPIRX4N, "VDD18A_USB_PLL_ETH_CSI",
+				 IO_TYPE_1V8_ONLY,
+				 CV1800_PINCONF_AREA_SYS, 0x0d4, 7,
+				 CV1800_PINCONF_AREA_SYS, 0x0bc, 7,
+				 CV1800_PINCONF_AREA_SYS, 0xc04),
+	CV1800_GENERATE_PIN_MUX2(PIN_MIPIRX4P, "VDD18A_USB_PLL_ETH_CSI",
+				 IO_TYPE_1V8_ONLY,
+				 CV1800_PINCONF_AREA_SYS, 0x0d8, 7,
+				 CV1800_PINCONF_AREA_SYS, 0x0b8, 7,
+				 CV1800_PINCONF_AREA_SYS, 0xc08),
+	CV1800_GENERATE_PIN_MUX2(PIN_MIPIRX3N, "VDD18A_USB_PLL_ETH_CSI",
+				 IO_TYPE_1V8_ONLY,
+				 CV1800_PINCONF_AREA_SYS, 0x0dc, 7,
+				 CV1800_PINCONF_AREA_SYS, 0x0b0, 7,
+				 CV1800_PINCONF_AREA_SYS, 0xc0c),
+	CV1800_GENERATE_PIN_MUX2(PIN_MIPIRX3P, "VDD18A_USB_PLL_ETH_CSI",
+				 IO_TYPE_1V8_ONLY,
+				 CV1800_PINCONF_AREA_SYS, 0x0e0, 7,
+				 CV1800_PINCONF_AREA_SYS, 0x0b4, 7,
+				 CV1800_PINCONF_AREA_SYS, 0xc10),
+	CV1800_GENERAL_PIN(PIN_MIPIRX2N, "VDD18A_USB_PLL_ETH_CSI",
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x0e4, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc14),
+	CV1800_GENERAL_PIN(PIN_MIPIRX2P, "VDD18A_USB_PLL_ETH_CSI",
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x0e8, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc18),
+	CV1800_GENERAL_PIN(PIN_MIPIRX1N, "VDD18A_USB_PLL_ETH_CSI",
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x0ec, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc1c),
+	CV1800_GENERAL_PIN(PIN_MIPIRX1P, "VDD18A_USB_PLL_ETH_CSI",
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x0f0, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc20),
+	CV1800_GENERAL_PIN(PIN_MIPIRX0N, "VDD18A_USB_PLL_ETH_CSI",
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x0f4, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc24),
+	CV1800_GENERAL_PIN(PIN_MIPIRX0P, "VDD18A_USB_PLL_ETH_CSI",
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x0f8, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc28),
+	CV1800_FUNC_PIN(PIN_AUD_AINL_MIC, "VDD18A_AUD",
+			IO_TYPE_AUDIO,
+			CV1800_PINCONF_AREA_SYS, 0x120, 5),
+};
+
+static const struct cv1800_pinctrl_data cv1800b_pindata = {
+	.pins = cv1800b_pins,
+	.pindata = cv1800b_pin_data,
+	.npins = ARRAY_SIZE(cv1800b_pins),
+};
+
+static const struct of_device_id cv1800b_pinctrl_ids[] = {
+	{ .compatible = "sophgo,cv1800b-pinctrl", .data = &cv1800b_pindata },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, cv1800b_pinctrl_ids);
+
+static struct platform_driver cv1800b_pinctrl_driver = {
+	.probe	= cv1800_pinctrl_probe,
+	.driver	= {
+		.name			= "cv1800b-pinctrl",
+		.suppress_bind_attrs	= true,
+		.of_match_table		= cv1800b_pinctrl_ids,
+	},
+};
+module_platform_driver(cv1800b_pinctrl_driver);
+
+MODULE_DESCRIPTION("Pinctrl driver for the CV1800B series SoC");
+MODULE_LICENSE("GPL");
diff --git a/drivers/pinctrl/sophgo/pinctrl-cv18xx.c b/drivers/pinctrl/sophgo/pinctrl-cv18xx.c
new file mode 100644
index 000000000000..49e1c7760646
--- /dev/null
+++ b/drivers/pinctrl/sophgo/pinctrl-cv18xx.c
@@ -0,0 +1,642 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Sophgo CV18XX SoCs pinctrl driver.
+ *
+ * Copyright (C) 2024 Inochi Amaoto <inochiama@outlook.com>
+ *
+ */
+
+#include <linux/bitfield.h>
+#include <linux/export.h>
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/bsearch.h>
+#include <linux/seq_file.h>
+#include <linux/spinlock.h>
+
+#include <linux/pinctrl/consumer.h>
+#include <linux/pinctrl/machine.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/pinctrl/pinconf.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+
+#include <dt-bindings/pinctrl/pinctrl-cv18xx.h>
+
+#include "../core.h"
+#include "../pinctrl-utils.h"
+#include "../pinconf.h"
+#include "../pinmux.h"
+#include "pinctrl-cv18xx.h"
+
+struct cv1800_pinctrl {
+	struct device				*dev;
+	struct pinctrl_dev			*pctl_dev;
+	const struct cv1800_pinctrl_data	*data;
+	struct pinctrl_desc			pdesc;
+
+	struct mutex				mutex;
+	raw_spinlock_t				lock;
+
+	void __iomem				*regs[2];
+};
+
+struct cv1800_pin_mux_config {
+	struct cv1800_pin	*pin;
+	u32			config;
+};
+
+static unsigned int cv1800_dt_get_pin(u32 value)
+{
+	return value & GENMASK(15, 0);
+}
+
+static unsigned int cv1800_dt_get_pin_mux(u32 value)
+{
+	return (value >> 16) & GENMASK(7, 0);
+}
+
+static unsigned int cv1800_dt_get_pin_mux2(u32 value)
+{
+	return (value >> 24) & GENMASK(7, 0);
+}
+
+#define cv1800_pinctrl_get_component_addr(pctrl, _comp)		\
+	((pctrl)->regs[(_comp)->area] + (_comp)->offset)
+
+static int cv1800_cmp_pin(const void *key, const void *pivot)
+{
+	const struct cv1800_pin *pin = pivot;
+	int pin_id = (long)key;
+	int pivid = pin->pin;
+
+	return pin_id - pivid;
+}
+
+static struct cv1800_pin *cv1800_get_pin(struct cv1800_pinctrl *pctrl,
+					 unsigned long pin)
+{
+	return bsearch((void *)pin, pctrl->data->pindata, pctrl->data->npins,
+		       sizeof(struct cv1800_pin), cv1800_cmp_pin);
+}
+
+static enum cv1800_pin_io_type cv1800_pin_io_type(struct cv1800_pin *pin)
+{
+	return FIELD_GET(CV1800_PIN_IO_TYPE, pin->flags);
+}
+
+#define PIN_BGA_ID_OFFSET		8
+#define PIN_BGA_ID_MASK			0xff
+
+static const char * const io_type_desc[] = {
+	"1V8",
+	"18OD33",
+	"AUDIO",
+	"ETH"
+};
+
+static void cv1800_pctrl_dbg_show(struct pinctrl_dev *pctldev,
+				  struct seq_file *seq, unsigned int pin_id)
+{
+	struct cv1800_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	struct cv1800_pin *pin = cv1800_get_pin(pctrl, pin_id);
+	enum cv1800_pin_io_type type = cv1800_pin_io_type(pin);
+	u32 value;
+	void *reg;
+
+	if (pin->pin >> PIN_BGA_ID_OFFSET)
+		seq_printf(seq, "pos: %c%u ",
+				'A' + (pin->pin >> PIN_BGA_ID_OFFSET) - 1,
+				pin->pin & PIN_BGA_ID_MASK);
+	else
+		seq_printf(seq, "pos: %u ", pin->pin);
+
+	seq_printf(seq, "power-domain: %s ", pin->pd);
+	seq_printf(seq, "type: %s ", io_type_desc[type]);
+
+	reg = cv1800_pinctrl_get_component_addr(pctrl, &pin->mux);
+	value = readl(reg);
+	seq_printf(seq, "mux: 0x%08x ", value);
+
+	if (pin->flags & CV1800_PIN_HAVE_MUX2) {
+		reg = cv1800_pinctrl_get_component_addr(pctrl, &pin->mux2);
+		value = readl(reg);
+		seq_printf(seq, "mux2: 0x%08x ", value);
+	}
+
+	if (type == IO_TYPE_1V8_ONLY || type == IO_TYPE_1V8_OR_3V3) {
+		reg = cv1800_pinctrl_get_component_addr(pctrl, &pin->conf);
+		value = readl(reg);
+		seq_printf(seq, "conf: 0x%08x ", value);
+	}
+}
+
+static int cv1800_verify_pinmux_config(const struct cv1800_pin_mux_config *config)
+{
+	unsigned int mux = cv1800_dt_get_pin_mux(config->config);
+	unsigned int mux2 = cv1800_dt_get_pin_mux2(config->config);
+
+	if (mux > config->pin->mux.max)
+		return -EINVAL;
+
+	if (config->pin->flags & CV1800_PIN_HAVE_MUX2) {
+		if (mux != config->pin->mux2.pfunc)
+			return -EINVAL;
+
+		if (mux2 > config->pin->mux2.max)
+			return -EINVAL;
+	} else {
+		if (mux2 != PIN_MUX_INVALD)
+			return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static int cv1800_pin_max_drive(enum cv1800_pin_io_type type)
+{
+	switch (type) {
+	case IO_TYPE_1V8_ONLY:
+		return 3;
+	case IO_TYPE_1V8_OR_3V3:
+		return 7;
+	default:
+		return -1;
+	}
+}
+
+static int cv1800_pin_max_scmitt(enum cv1800_pin_io_type type)
+{
+	switch (type) {
+	case IO_TYPE_1V8_ONLY:
+		return 3;
+	case IO_TYPE_1V8_OR_3V3:
+		return 1;
+	default:
+		return -1;
+	}
+}
+
+static int cv1800_verify_pin_config(const struct cv1800_pin_mux_config *mux,
+				    unsigned long npins,
+				    const unsigned long *configs,
+				    unsigned long nconfigs)
+{
+	int i, j;
+
+	for (i = 0; i < npins; i++) {
+		enum cv1800_pin_io_type type = cv1800_pin_io_type(mux[i].pin);
+
+		if ((type == IO_TYPE_AUDIO || type == IO_TYPE_ETH) && nconfigs)
+			return -EINVAL;
+
+		for (j = 0; j < nconfigs; j++) {
+			int param = pinconf_to_config_param(configs[i]);
+			int arg = pinconf_to_config_argument(configs[i]);
+
+			if (param == PIN_CONFIG_DRIVE_STRENGTH) {
+				if (arg > cv1800_pin_max_drive(type))
+					return -EINVAL;
+			} else if (param == PIN_CONFIG_INPUT_SCHMITT) {
+				if (arg > cv1800_pin_max_scmitt(type))
+					return -EINVAL;
+			}
+		}
+	}
+
+	return 0;
+}
+
+static int cv1800_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
+				       struct device_node *np,
+				       struct pinctrl_map **maps,
+				       unsigned int *num_maps)
+{
+	struct cv1800_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	struct device *dev = pctrl->dev;
+	struct device_node *child;
+	struct pinctrl_map *map;
+	const char **grpnames;
+	const char *grpname;
+	int ngroups = 0;
+	int nmaps = 0;
+	int ret;
+
+	for_each_available_child_of_node(np, child)
+		ngroups += 1;
+
+	grpnames = devm_kcalloc(dev, ngroups, sizeof(*grpnames), GFP_KERNEL);
+	if (!grpnames)
+		return -ENOMEM;
+
+	map = devm_kcalloc(dev, ngroups * 2, sizeof(*map), GFP_KERNEL);
+	if (!map)
+		return -ENOMEM;
+
+	ngroups = 0;
+	mutex_lock(&pctrl->mutex);
+	for_each_available_child_of_node(np, child) {
+		int npins = of_property_count_u32_elems(child, "pinmux");
+		unsigned int *pins;
+		struct cv1800_pin_mux_config *pinmuxs;
+		u32 config;
+		int i;
+
+		if (npins < 1) {
+			dev_err(dev, "invalid pinctrl group %pOFn.%pOFn\n",
+				np, child);
+			ret = -EINVAL;
+			goto dt_failed;
+		}
+
+		grpname = devm_kasprintf(dev, GFP_KERNEL, "%pOFn.%pOFn",
+					 np, child);
+		if (!grpname) {
+			ret = -ENOMEM;
+			goto dt_failed;
+		}
+
+		grpnames[ngroups++] = grpname;
+
+		pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
+		if (!pins) {
+			ret = -ENOMEM;
+			goto dt_failed;
+		}
+
+		pinmuxs = devm_kcalloc(dev, npins, sizeof(*pinmuxs), GFP_KERNEL);
+		if (!pinmuxs) {
+			ret = -ENOMEM;
+			goto dt_failed;
+		}
+
+		for (i = 0; i < npins; i++) {
+			ret = of_property_read_u32_index(child, "pinmux",
+							 i, &config);
+			if (ret)
+				goto dt_failed;
+
+			pins[i] = cv1800_dt_get_pin(config);
+			pinmuxs[i].config = config;
+			pinmuxs[i].pin = cv1800_get_pin(pctrl, pins[i]);
+
+			if (!pinmuxs[i].pin) {
+				dev_err(dev, "failed to get pin %d\n", pins[i]);
+				ret = -ENODEV;
+				goto dt_failed;
+			}
+
+			ret = cv1800_verify_pinmux_config(&pinmuxs[i]);
+			if (ret) {
+				dev_err(dev, "group %s pin %d is invalid\n",
+					grpname, i);
+				goto dt_failed;
+			}
+		}
+
+		map[nmaps].type = PIN_MAP_TYPE_MUX_GROUP;
+		map[nmaps].data.mux.function = np->name;
+		map[nmaps].data.mux.group = grpname;
+		nmaps += 1;
+
+		ret = pinctrl_generic_add_group(pctldev, grpname,
+						pins, npins, pinmuxs);
+		if (ret < 0) {
+			dev_err(dev, "failed to add group %s: %d\n", grpname, ret);
+			goto dt_failed;
+		}
+
+		ret = pinconf_generic_parse_dt_config(child, pctldev,
+						      &map[nmaps].data.configs.configs,
+						      &map[nmaps].data.configs.num_configs);
+		if (ret) {
+			dev_err(dev, "failed to parse pin config of group %s: %d\n",
+				grpname, ret);
+			goto dt_failed;
+		}
+
+		ret = cv1800_verify_pin_config(pinmuxs, npins,
+					       map[nmaps].data.configs.configs,
+					       map[nmaps].data.configs.num_configs);
+		if (ret) {
+			dev_err(dev, "pin config of group %s is invalid\n",
+				grpname);
+			goto dt_failed;
+		}
+
+		/* don't create a map if there are no pinconf settings */
+		if (map[nmaps].data.configs.num_configs == 0)
+			continue;
+
+		map[nmaps].type = PIN_MAP_TYPE_CONFIGS_GROUP;
+		map[nmaps].data.configs.group_or_pin = grpname;
+		nmaps += 1;
+	}
+
+	ret = pinmux_generic_add_function(pctldev, np->name,
+					  grpnames, ngroups, NULL);
+	if (ret < 0) {
+		dev_err(dev, "error adding function %s: %d\n", np->name, ret);
+		goto function_failed;
+	}
+
+	*maps = map;
+	*num_maps = nmaps;
+	mutex_unlock(&pctrl->mutex);
+
+	return 0;
+
+dt_failed:
+	of_node_put(child);
+function_failed:
+	pinctrl_utils_free_map(pctldev, map, nmaps);
+	mutex_unlock(&pctrl->mutex);
+	return ret;
+}
+
+static const struct pinctrl_ops cv1800_pctrl_ops = {
+	.get_groups_count	= pinctrl_generic_get_group_count,
+	.get_group_name		= pinctrl_generic_get_group_name,
+	.get_group_pins		= pinctrl_generic_get_group_pins,
+	.pin_dbg_show		= cv1800_pctrl_dbg_show,
+	.dt_node_to_map		= cv1800_pctrl_dt_node_to_map,
+	.dt_free_map		= pinctrl_utils_free_map,
+};
+
+static int cv1800_pmx_set_mux(struct pinctrl_dev *pctldev,
+			      unsigned int fsel, unsigned int gsel)
+{
+	struct cv1800_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	const struct group_desc *group;
+	const struct cv1800_pin_mux_config *configs;
+	unsigned int i;
+
+	group = pinctrl_generic_get_group(pctldev, gsel);
+	if (!group)
+		return -EINVAL;
+
+	configs = group->data;
+
+	for (i = 0; i < group->grp.npins; i++) {
+		const struct cv1800_pin *pin = configs[i].pin;
+		u32 value = configs[i].config;
+		void __iomem *reg_mux;
+		void __iomem *reg_mux2;
+		unsigned long flags;
+		u32 mux;
+		u32 mux2;
+
+		reg_mux = cv1800_pinctrl_get_component_addr(pctrl, &pin->mux);
+		reg_mux2 = cv1800_pinctrl_get_component_addr(pctrl, &pin->mux2);
+		mux = cv1800_dt_get_pin_mux(value);
+		mux2 = cv1800_dt_get_pin_mux2(value);
+
+		raw_spin_lock_irqsave(&pctrl->lock, flags);
+		writel_relaxed(mux, reg_mux);
+		if (mux2 != PIN_MUX_INVALD)
+			writel_relaxed(mux2, reg_mux2);
+		raw_spin_unlock_irqrestore(&pctrl->lock, flags);
+	}
+
+	return 0;
+}
+
+static const struct pinmux_ops cv1800_pmx_ops = {
+	.get_functions_count	= pinmux_generic_get_function_count,
+	.get_function_name	= pinmux_generic_get_function_name,
+	.get_function_groups	= pinmux_generic_get_function_groups,
+	.set_mux		= cv1800_pmx_set_mux,
+	.strict			= true,
+};
+
+#define PIN_CONFIG_CV1800_BUS_HOLDER	(PIN_CONFIG_END + 1)
+
+#define PIN_IO_PULLUP		BIT(2)
+#define PIN_IO_PULLDOWN		BIT(3)
+#define PIN_IO_DRIVE		GENMASK(7, 5)
+#define PIN_IO_SCHMITT		GENMASK(9, 8)
+#define PIN_IO_BUS_HOLDER	BIT(10)
+#define PIN_IO_OUT_FAST_SLEW	BIT(11)
+
+static const struct pinconf_generic_params cv1800_pinconf_custom_params[] = {
+	{ "sophgo,bus-holder", PIN_CONFIG_CV1800_BUS_HOLDER, 1 },
+};
+
+static int cv1800_pconf_get(struct pinctrl_dev *pctldev,
+			    unsigned int pin_id, unsigned long *config)
+{
+	struct cv1800_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	int param = pinconf_to_config_param(*config);
+	struct cv1800_pin *pin = cv1800_get_pin(pctrl, pin_id);
+	u32 value;
+	u32 arg;
+
+	if (!pin)
+		return -EINVAL;
+
+	value = readl(cv1800_pinctrl_get_component_addr(pctrl, &pin->conf));
+
+	switch (param) {
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		arg = FIELD_GET(PIN_IO_PULLDOWN, value);
+		break;
+	case PIN_CONFIG_BIAS_PULL_UP:
+		arg = FIELD_GET(PIN_IO_PULLUP, value);
+		break;
+	case PIN_CONFIG_DRIVE_STRENGTH:
+		arg = FIELD_GET(PIN_IO_DRIVE, value);
+		break;
+	case PIN_CONFIG_INPUT_SCHMITT:
+		arg = FIELD_GET(PIN_IO_SCHMITT, value);
+		break;
+	case PIN_CONFIG_SLEW_RATE:
+		arg = FIELD_GET(PIN_IO_OUT_FAST_SLEW, value);
+		break;
+	case PIN_CONFIG_CV1800_BUS_HOLDER:
+		arg = FIELD_GET(PIN_IO_BUS_HOLDER, value);
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	*config = pinconf_to_config_packed(param, arg);
+
+	return 0;
+}
+
+static int cv1800_pinconf_compute_config(unsigned long *configs,
+					 unsigned int num_configs,
+					 u32 *value)
+{
+	int i;
+	u32 v = 0;
+
+	for (i = 0; i < num_configs; i++) {
+		int param = pinconf_to_config_param(configs[i]);
+		u32 arg = pinconf_to_config_argument(configs[i]);
+
+		switch (param) {
+		case PIN_CONFIG_BIAS_PULL_DOWN:
+			v &= ~PIN_IO_PULLDOWN;
+			v |= FIELD_PREP(PIN_IO_PULLDOWN, arg);
+			break;
+		case PIN_CONFIG_BIAS_PULL_UP:
+			v &= ~PIN_IO_PULLUP;
+			v |= FIELD_PREP(PIN_IO_PULLUP, arg);
+			break;
+		case PIN_CONFIG_DRIVE_STRENGTH:
+			v &= ~PIN_IO_DRIVE;
+			v |= FIELD_PREP(PIN_IO_DRIVE, arg);
+			break;
+		case PIN_CONFIG_INPUT_SCHMITT:
+			v &= ~PIN_IO_SCHMITT;
+			v |= FIELD_PREP(PIN_IO_SCHMITT, arg);
+			break;
+		case PIN_CONFIG_SLEW_RATE:
+			v &= ~PIN_IO_OUT_FAST_SLEW;
+			v |= FIELD_PREP(PIN_IO_OUT_FAST_SLEW, arg);
+			break;
+		case PIN_CONFIG_CV1800_BUS_HOLDER:
+			v &= ~PIN_IO_BUS_HOLDER;
+			v |= FIELD_PREP(PIN_IO_BUS_HOLDER, arg);
+			break;
+		default:
+			return -EOPNOTSUPP;
+		}
+	}
+
+	*value = v;
+
+	return 0;
+}
+
+static int cv1800_pin_set_config(struct cv1800_pinctrl *pctrl,
+				 unsigned int pin_id,
+				 u32 value)
+{
+	struct cv1800_pin *pin = cv1800_get_pin(pctrl, pin_id);
+	unsigned long flags;
+	void __iomem *addr;
+
+	if (!pin)
+		return -EINVAL;
+
+	addr = cv1800_pinctrl_get_component_addr(pctrl, &pin->conf);
+
+	raw_spin_lock_irqsave(&pctrl->lock, flags);
+	writel(value, addr);
+	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
+
+	return 0;
+}
+
+static int cv1800_pconf_set(struct pinctrl_dev *pctldev,
+			    unsigned int pin, unsigned long *configs,
+			    unsigned int num_configs)
+{
+	struct cv1800_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	u32 value;
+
+	if (cv1800_pinconf_compute_config(configs, num_configs, &value))
+		return -EOPNOTSUPP;
+
+	return cv1800_pin_set_config(pctrl, pin, value);
+}
+
+static int cv1800_pconf_group_set(struct pinctrl_dev *pctldev,
+				  unsigned int gsel,
+				  unsigned long *configs,
+				  unsigned int num_configs)
+{
+	struct cv1800_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	const struct group_desc *group;
+	u32 value;
+	int i;
+
+	group = pinctrl_generic_get_group(pctldev, gsel);
+	if (!group)
+		return -EINVAL;
+
+	if (cv1800_pinconf_compute_config(configs, num_configs, &value))
+		return -EOPNOTSUPP;
+
+	for (i = 0; i < group->grp.npins; i++)
+		cv1800_pin_set_config(pctrl, group->grp.pins[i], value);
+
+	return 0;
+}
+
+static void cv1800_pinconf_dbg_show(struct pinctrl_dev *pctldev,
+				    struct seq_file *seq, unsigned int pin_id)
+{
+	struct cv1800_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	struct cv1800_pin *pin = cv1800_get_pin(pctrl, pin_id);
+	enum cv1800_pin_io_type type = cv1800_pin_io_type(pin);
+	void *reg;
+
+	if (type == IO_TYPE_ETH || type == IO_TYPE_AUDIO)
+		return;
+
+	reg = cv1800_pinctrl_get_component_addr(pctrl, &pin->conf);
+	seq_printf(seq, "reg=%u\n", readl(reg));
+}
+
+static const struct pinconf_ops cv1800_pconf_ops = {
+	.pin_config_get			= cv1800_pconf_get,
+	.pin_config_set			= cv1800_pconf_set,
+	.pin_config_group_set		= cv1800_pconf_group_set,
+	.pin_config_dbg_show		= cv1800_pinconf_dbg_show,
+	.is_generic			= true,
+};
+
+int cv1800_pinctrl_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct cv1800_pinctrl *pctrl;
+	const struct cv1800_pinctrl_data *pctrl_data;
+	int ret;
+
+	pctrl_data = device_get_match_data(dev);
+	if (!pctrl_data)
+		return -ENODEV;
+
+	if (pctrl_data->npins == 0)
+		return dev_err_probe(dev, -EINVAL, "invalid pin data\n");
+
+	pctrl = devm_kzalloc(dev, sizeof(*pctrl), GFP_KERNEL);
+	if (!pctrl)
+		return -ENOMEM;
+
+	pctrl->regs[0] = devm_platform_ioremap_resource_byname(pdev, "sys");
+	if (IS_ERR(pctrl->regs[0]))
+		return PTR_ERR(pctrl->regs[0]);
+
+	pctrl->regs[1] = devm_platform_ioremap_resource_byname(pdev, "rtc");
+	if (IS_ERR(pctrl->regs[1]))
+		return PTR_ERR(pctrl->regs[1]);
+
+	pctrl->pdesc.name = dev_name(dev);
+	pctrl->pdesc.pins = pctrl_data->pins;
+	pctrl->pdesc.npins = pctrl_data->npins;
+	pctrl->pdesc.pctlops = &cv1800_pctrl_ops;
+	pctrl->pdesc.pmxops = &cv1800_pmx_ops;
+	pctrl->pdesc.confops = &cv1800_pconf_ops;
+	pctrl->pdesc.owner = THIS_MODULE;
+
+	pctrl->data = pctrl_data;
+	pctrl->dev = dev;
+	raw_spin_lock_init(&pctrl->lock);
+	mutex_init(&pctrl->mutex);
+
+	platform_set_drvdata(pdev, pctrl);
+
+	ret = devm_pinctrl_register_and_init(dev, &pctrl->pdesc,
+					     pctrl, &pctrl->pctl_dev);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "fail to register pinctrl driver\n");
+
+	return pinctrl_enable(pctrl->pctl_dev);
+}
+EXPORT_SYMBOL_GPL(cv1800_pinctrl_probe);
diff --git a/drivers/pinctrl/sophgo/pinctrl-cv18xx.h b/drivers/pinctrl/sophgo/pinctrl-cv18xx.h
new file mode 100644
index 000000000000..8ae320ea9374
--- /dev/null
+++ b/drivers/pinctrl/sophgo/pinctrl-cv18xx.h
@@ -0,0 +1,126 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2024 Inochi Amaoto <inochiama@outlook.com>
+ */
+
+#ifndef _PINCTRL_SOPHGO_CV18XX_H
+#define _PINCTRL_SOPHGO_CV18XX_H
+
+#include <linux/bits.h>
+#include <linux/bitfield.h>
+#include <linux/device.h>
+#include <linux/mutex.h>
+#include <linux/spinlock.h>
+#include <linux/platform_device.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinconf.h>
+
+enum cv1800_pin_io_type {
+	IO_TYPE_1V8_ONLY = 0,
+	IO_TYPE_1V8_OR_3V3 = 1,
+	IO_TYPE_AUDIO = 2,
+	IO_TYPE_ETH = 3
+};
+
+#define CV1800_PINCONF_AREA_SYS		0
+#define CV1800_PINCONF_AREA_RTC		1
+
+struct cv1800_pinmux {
+	u16	offset;
+	u8	area;
+	u8	max;
+};
+
+struct cv1800_pinmux2 {
+	u16	offset;
+	u8	area;
+	u8	max;
+	u8	pfunc;
+};
+
+struct cv1800_pinconf {
+	u16	offset;
+	u8	area;
+};
+
+#define	CV1800_PIN_HAVE_MUX2		BIT(0)
+#define CV1800_PIN_IO_TYPE		GENMASK(2, 1)
+
+#define CV1800_PIN_FLAG_IO_TYPE(type)		\
+	FIELD_PREP_CONST(CV1800_PIN_IO_TYPE, type)
+
+struct cv1800_pin {
+	u16				pin;
+	u16				flags;
+	const char			*pd;
+	struct cv1800_pinmux		mux;
+	struct cv1800_pinmux2		mux2;
+	struct cv1800_pinconf		conf;
+};
+
+struct cv1800_pinctrl_data {
+	const struct pinctrl_pin_desc   *pins;
+	const struct cv1800_pin		*pindata;
+	u16				npins;
+};
+
+int cv1800_pinctrl_probe(struct platform_device *pdev);
+
+#define CV1800_FUNC_PIN(_id, _pd, _type,				\
+			_mux_area, _mux_offset, _mux_func_max)		\
+	{								\
+		.pin = (_id),						\
+		.pd = (_pd),						\
+		.flags = CV1800_PIN_FLAG_IO_TYPE(_type),		\
+		.mux = {						\
+			.area = (_mux_area),				\
+			.offset = (_mux_offset),			\
+			.max = (_mux_func_max),				\
+		},							\
+	}
+
+#define CV1800_GENERAL_PIN(_id, _pd, _type,				\
+			   _mux_area, _mux_offset, _mux_func_max,	\
+			   _conf_area, _conf_offset)			\
+	{								\
+		.pin = (_id),						\
+		.pd = (_pd),						\
+		.flags = CV1800_PIN_FLAG_IO_TYPE(_type),		\
+		.mux = {						\
+			.area = (_mux_area),				\
+			.offset = (_mux_offset),			\
+			.max = (_mux_func_max),				\
+		},							\
+		.conf = {						\
+			.area = (_conf_area),				\
+			.offset = (_conf_offset),			\
+		},							\
+	}
+
+#define CV1800_GENERATE_PIN_MUX2(_id, _pd, _type,			\
+				 _mux_area, _mux_offset, _mux_func_max,	\
+				 _mux2_area, _mux2_offset,		\
+				 _mux2_func_max,			\
+				 _conf_area, _conf_offset)		\
+	{								\
+		.pin = (_id),						\
+		.pd = (_pd),						\
+		.flags = CV1800_PIN_FLAG_IO_TYPE(_type) |		\
+				CV1800_PIN_HAVE_MUX2,			\
+		.mux = {						\
+			.area = (_mux_area),				\
+			.offset = (_mux_offset),			\
+			.max = (_mux_func_max),				\
+		},							\
+		.mux2 = {						\
+			.area = (_mux2_area),				\
+			.offset = (_mux2_offset),			\
+			.max = (_mux2_func_max),			\
+		},							\
+		.conf = {						\
+			.area = (_conf_area),				\
+			.offset = (_conf_offset),			\
+		},							\
+	}
+
+#endif
--
2.45.2


