Return-Path: <linux-gpio+bounces-8406-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F273E93EA69
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 03:03:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56795B21262
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 01:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61BA8320D;
	Mon, 29 Jul 2024 01:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="ZQDua/zS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02olkn2084.outbound.protection.outlook.com [40.92.43.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B387C8F4E;
	Mon, 29 Jul 2024 01:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.43.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722214995; cv=fail; b=dkDX7UCrur5WxX6eF+yRDiS3AZMn3YGR6Zcdk1fcJZy9qLDQkIfFMjfOPa5gU/7JDLcOjBKjcM2OD2Fzc78+r3nnvkMNmYdoE0WR8NOPMUGMXCvZrrahFesk/uXZjZygCUW6e8V64A6rFu1NtoNRF5MZ1GLwHBVpy7STNKJjma4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722214995; c=relaxed/simple;
	bh=/Deg7Gvp2paK6Cf+IDHZBn6peSKHO9NBOGdZ7c0Zp6o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Bm9kxSBzKpGQEYZiVRb2QdPG29vIdc7REEfVuUULAL5L48wcpENeqDro4Op+o7hCfphJhru3YIfBbHrNtnVrYdyIcVoeLtAdtofUF0l8I7Jjs/Jdf6//wyZD5YCGR5xMe8t/u3J192OBRYcH4TfMv9gfiiOyFmelXpPfIPMZXAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=ZQDua/zS; arc=fail smtp.client-ip=40.92.43.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GzDEWwLsVgw4xQAFXJB4exxcyrhmaZ/f50vmrVYhDSReoO1iGYPdiM4yj52XbooqDzBlvwV1WLSxUuAZ3YnaC4I2Gbo9IgZe1+7s6fvQZ/9upVERqlkqCMq7TSty3H9JyBEzhxEy9SfCIBGgi0I329THWWUSeKD29lu+CnaRnlCbvGiqiBl1szR6Wjavoimi0rO1/Ch5tsPhK7VDFpqO1vkkVGduiGhW7tR+4mWUkn/cdbooQqTQu08u18AC+rdRiRictQ3qstYgOqJv6Tghu9nE3P3MZeGkmkvwRvCoJwYww1Fr+Bw7t0rMKKRIDF9yk3IqxXchWpA0caoJUa2vRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ENr+b//9VMyXyGgoee1on/wPWS5M5PHeLFPpSrq9uPU=;
 b=DIJaj8KzcCuzjx/VDwj5veCfoePQfjRwTjORqzCNvbP29CLzewSUxHarGncpcfEhpZHYJHmAlQVMn0bPB6vplteSNiAP48yTOU0oBbMmsKhzQL9ekPWrgMKCgLZDnb9hLEh0WEnI5fgmkmP4EYHCEAIrCz7PyQuwU5XMrfH2QY9dduq/qIkTdnyc8o16qphd/j3ehTH3zWlsXw1+IbD3UrqchXwHj2pTM/ffbWrs35Gs2WGrfnnjLq7lhr3Xp+OeSplsRLHoXZd796SzoWPhZu/CgqVMfvoeIXYaYfkaAMaIlpKMcpc3Q7Y0JQVhzxf8FXWUomeNH52ENNayp5os0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ENr+b//9VMyXyGgoee1on/wPWS5M5PHeLFPpSrq9uPU=;
 b=ZQDua/zSjAfjGeeuetGf0t7HqDTXtO3FE6W60IcINlwLFx0skVXhavCaVXaLiX2xUrk15C/RShtpDLpBZaPcy78eeN56GIkuduT2kY9Cl+fG4aC0UqqRkyi9yXwiyBh181CO3kq+yWl3SEqRRNNAQ8IXlvlc9jjsmlmtPiVY2Btj0BKr8bmXFhTV9GoeP3BlJ+JbX3hdQPA7prZKp3fK3QmJG2kaQxaudpqc+9mU6EAaKOa1XAB32hDisn96ZBXhKBbFt2PM98kZJhIKmi00DwgR9BAmq2cKe+QPN4VDsVl4nbJWnaQzxdidGEYKF61r53F4WWwjYwF9EChisUKj+Q==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by LV8PR20MB7300.namprd20.prod.outlook.com (2603:10b6:408:232::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Mon, 29 Jul
 2024 01:03:10 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%5]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 01:03:10 +0000
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
Cc: Yixun Lan <dlan@gentoo.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 3/7] pinctrl: sophgo: add support for CV1812H SoC
Date: Mon, 29 Jul 2024 09:02:29 +0800
Message-ID:
 <IA1PR20MB495312EBD8D304659FB9838CBBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <IA1PR20MB4953B8B0014FA82A8E141CB0BBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953B8B0014FA82A8E141CB0BBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [l5gv037zFEEelPm3F0tw++KOV26j9mmwL2PcNZyRh3Q=]
X-ClientProxiedBy: TYCP286CA0232.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::18) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID:
 <20240729010237.650411-3-inochiama@outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|LV8PR20MB7300:EE_
X-MS-Office365-Filtering-Correlation-Id: da83895a-2d65-4ba6-a388-08dcaf6a3679
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599006|8060799006|461199028|19110799003|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	T2Zz+F49zFEvhZuwwXM66iid+2Kwxg3lP62e0JnmXZ8ebQMRdXheF1iHvn7bf0cHKEQzuSrNRV5vdEHtSuPJ5oW/ivL8pZnE9v+/TBKGWZXKwMXCgSS8qVYGaiiDnWYAtYgfhmL0Cs4ilg3VRHszq0wwKBRLvUMNl6rmS8E+rxWZdwKn35Uw7ahmJnvCMKcDlTSC7/ehZHbbr6Bp8cd7t/1eVeQVdguPwr7cDBpu03RkhKAmBMkCc3Awnw99erkj8dw4VYf1nKWBRYcp2epIw6jLUa1bOi6yQyuCLGGa25NlNiPmLNb+UAzPp4Ej6C+SqDbS3rC/O5WpEQP30viYytABTUcWGYyjzihKtSDk5PfW9JGrDWJxgnu4bEAW98TOSMlgpAngWYPVLFW1HjYDJimMeYFiqFsji3/Aalfg6UhNw2aM2tfCvxPFDsydTKOhOw0Q52k9/245VOOvhJ2d3Qr1/1I+R32HwG2dgaPgozLK4d8+Zg6M1vwmTrm36Z2Ram87A/ie+Kj+OUtuGVEImd3KBzVU6VpdTYhrR4ffMrTpunigMMDydqcF+gZ9yl26H0nPkUsSKgBlY8dYVgu62QE2A4UoMqS4MqR7WQiIW8kFd+SfETdcZOwq3UVDT6z22u+iRXqg2+GctrfYBZqE9njjWhOg9ffvL3RSOvYB5sJAQCLYwJjxa+6vRx2Veja+51/5nl/uDKGn91v6tY9feA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RiiY55dr5HSXwBTmsBDgYfQeu3+tvf4BigNTXXf9GYEiFZYDfKffetK+d6Oq?=
 =?us-ascii?Q?Lt/Pcq1Hc0YN1+euLsygEIsPBT7aphiLqsBo+mucbQvCCsNvoRTxRd/FkTeX?=
 =?us-ascii?Q?mX+D342Qfkg8N3roLaEqTUvzPLp5fqnbMPy2eBe1idKxH9EzwNbNFPAWz8rB?=
 =?us-ascii?Q?sYNe/yubl6Td0KdSSc9TcLQ/xO1P+4RBspE3F8ad+ju0K2XXUZuFkLWtGCAZ?=
 =?us-ascii?Q?whxLZxJ4RicE9Dz5n3Gg2zLlh0FwhIasJrWt69OzXZQIfhYemAWawfhwPArs?=
 =?us-ascii?Q?cECeqMPY4quiFTMz5aWb1kTiQVVbvrZ04q0xTYG0pVhmuzh7baydNtj8B8+x?=
 =?us-ascii?Q?+eKV+z26TkZ/z0gl8Lcg5fSO7Pxv5iTTdHL8aggN63582gyohl6uvJqU2q2a?=
 =?us-ascii?Q?gk8tkjZVc2q2Sm/7YQG5UqxOB2F7rj5EW9qWqvSjm9z5GfSs2d0a/uguZ4p3?=
 =?us-ascii?Q?zf3v0re1w96CGJs+saTYnkuZaB904MYZxHtmMV6MFl4O5Lck3Z64fpIQWjh/?=
 =?us-ascii?Q?wbcqweLFHRM9+zMn04fWFhh1NpcIxa2nj7hLjCKle8dfJXyRIJETGJudPbkm?=
 =?us-ascii?Q?VKQfhZnCZKs3QFQdOLpLxDwsyqnqCfCzk0LjzQgOASv2R/qphU2ptM2N6h17?=
 =?us-ascii?Q?zajas+4x/afLnT06+uGXG2v0eH/HUq/02Ho6EHGfC9xkZENi4DV75H79eLGi?=
 =?us-ascii?Q?uYDgXt7bJkoMO3UJr6UNiy5IMywksFFooTy+Ub8TnR1nIJuF03PvJq1oRFQA?=
 =?us-ascii?Q?riilTtZ9ry57p5qWDvARL58UdQ8b+42yBxLe9LffB4Ccg5L7TSD6zpkmBg+Q?=
 =?us-ascii?Q?YSDh4Hzdj7twUAzQ3ohvd2/gpfLmXBgZNsSaQI4U+CWLRPORHbqE9gb6l8wW?=
 =?us-ascii?Q?4vFGFtMsp93DApjn0IThKTgHSSD/8bjHmVpE7hG1eqOu4BDoyfKakMsRBoUw?=
 =?us-ascii?Q?ugRG7EdrZr2jTd19JuuhL9C7BAGP4WuJXJ4hfDufjaBIckygJiFXqb7AV5Qd?=
 =?us-ascii?Q?9ZBgY2uZB+iwqHeSNsvKCgr72Zb34/HCxnxItoQM7kDKyXeQq0EYAGMLrSpI?=
 =?us-ascii?Q?dpgQiJBqROyhTEGYXMWcKyU92HDjLpbgsYUY4cU3iRhRBBU5SJBRqzwk3Sgn?=
 =?us-ascii?Q?5wF9lTOLTCB4hmuZwOv35sIWQyPIA91a+yxBmCQ2ZyXfBjJuLpQUTA0UDb1M?=
 =?us-ascii?Q?ESd0gTvxY3VEjW31cuHo2XAasqHknOVZF/Usib40Vjai0hGKR+aKU9qCs+MJ?=
 =?us-ascii?Q?YEmhl6FP7uMa8W5QwGOP?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da83895a-2d65-4ba6-a388-08dcaf6a3679
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 01:03:09.8850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR20MB7300

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
2.45.2


