Return-Path: <linux-gpio+bounces-8533-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CC394558D
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Aug 2024 02:37:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3276BB23107
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Aug 2024 00:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B438947A76;
	Fri,  2 Aug 2024 00:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="VkdLyzWq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10olkn2047.outbound.protection.outlook.com [40.92.41.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CD01C693;
	Fri,  2 Aug 2024 00:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.41.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722558979; cv=fail; b=DZ9MPN5tZI2pY/sTzAx47iLSyoc88bDMiFUREjOHHa9i0kbsvlKGZAYOWS1rJn4dfUgItZpTi45IxKfNqjTKbWnEVMjZZrUkcsMJzHdpm6TcE7zrAfd4HkPNcbPkp4bHggMIrDs4Otx404IgX6dPnTfuNoT9n/k0Nn3tYwbeEDI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722558979; c=relaxed/simple;
	bh=BkI3MZ6lYdApeJQ6ovVY2GSxuX2FmZYzFYiGzkJuBwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mnynynfdXl8ndpHG8ViGv/PUbl6RqboprOdSzpCGpHX6lEh8NYFFnnVVCHmZccn3UcNPTY5OFxiKs9W5PqAM3rsneUXUs1ZcQiBTMSQ0xTubmspp41EhQC2+iCwSoS0R9p+D7IweDddKETeupip6AKmdPsyd8lvq5q6EeHw7Kyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=VkdLyzWq; arc=fail smtp.client-ip=40.92.41.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MFnnyW7ot0BeTwXchoglKSF7Wb+dhIoqwqQZCn+yS42H+vfF1RrCSuTe8XWcFOctc3PepXo+S/q9yWqDnoCUfYkQ7RvQrmQA5ChCxXZb5WV5SYF+WGvxojVpVVNGYZSnLWp+zvKzFefBuMi/WFFKxVR7sO3STmQPGftIyYErz4WcUHiw4NTkYJv+t4bRtk7ns3FgL86aIT3oK1ih0AEZPePoqP9uNqXM8fUMRfzz0u7Ok374Lx3GJfSJtAi5/3NkM/0UtwPFFvhtyBNRjQHY2RnUyVQ2gdAgiMNBwJgiBij4PqRrcgVpCyQGJocWgXARLqhKEjxVbsaCcLmSF5iYEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KUQaP9AHGWiaOiN8VY7gs4i9wKOGemdKEUQR5VRw1Ak=;
 b=aiaud/WrEX3Es2tmwOTf/fb1xFDoNQvYGNq989Hjl8uXmuPpdUlJGBSwifu2RWhSvkMM5pcmuAPBGz3vgGIpqigZXNjH6HKfGdBV12STCQ88F6rJZlOyVE0beV7+O2nM07vnTwr5QLMQzbe1VQ6lFNVJmJXTWZxFez8+vnhzUBuxqdfT5Okb1j/xQUa6coBWN2iDQPfzGAd6FbvHwuJtLqxR6IISu5eIX19COSDcCCEjQo/uWBC1rA0mG3Gc174CtL9G9+yvKh8NvaGvOJsOqD9TIApFlpHnkM4K6DOF1MTTY18NZ4W4TDNGn6v8fPvK1/56XzL5vF1sYq6oLV0tsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KUQaP9AHGWiaOiN8VY7gs4i9wKOGemdKEUQR5VRw1Ak=;
 b=VkdLyzWqYxUDbZamWzRlpm6l6VQLZEPIRzx4J/hAlOi7z1upOT40k2hgQlokcesgcIyr6LnX+ijK/piwAEQRtMwec66pXODvCQVIPEr3HCuhAq2XGyTeq0t60QbKbY4iX9jw+n3A73inTy+yr9D4UgYUlm1Lb+T+7jXPMPHCC1X2zuGPyqTg1uxUDJaViR8Ksg5hFmacEVLoHUW1+d5P+sz6QeR5VEGaE3ljpwfVxyaYpf2X8VryV4jp4WqYbYerxcBKfF/asfOs5+KYfry3kZi3J120pDtL9d84pY6KxomdsQTGA5xBtWxFCvTpG+aBTnyDc8uTbDG+7a8rtaWs2w==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by IA1PR20MB4954.namprd20.prod.outlook.com (2603:10b6:208:3ae::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Fri, 2 Aug
 2024 00:36:12 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%4]) with mapi id 15.20.7828.023; Fri, 2 Aug 2024
 00:36:12 +0000
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
Subject: [PATCH v4 4/7] pinctrl: sophgo: add support for SG2000 SoC
Date: Fri,  2 Aug 2024 08:35:19 +0800
Message-ID:
 <IA1PR20MB495339CB8E9CB4FCAAE4886BBBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <IA1PR20MB4953DC78BB0FE0C57EA94F91BBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953DC78BB0FE0C57EA94F91BBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [rJWdE4iiu2S15pyY7CZejjDwGnbsKkA8V4gGC2K9nP4=]
X-ClientProxiedBy: SI1PR02CA0050.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::12) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID:
 <20240802003525.260055-4-inochiama@outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|IA1PR20MB4954:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fb89f57-4b5c-49ee-16ad-08dcb28b1bcb
X-MS-Exchange-SLBlob-MailProps:
	0wLWl8rLpvthC+8xu8Kgdf6q4p/Zg4G3MzzwdOs9z/NzBoU6fPzvbBCsj8hedTwo2Y6Got/Z98LFagkzHBkDE+asqcUF+cPl6qeTi6faWtAYsUz7J4obZ2/3MuTqAu9ctO7z1eNYyteGms6LsavHXCctbit6hJ5fI5P6Ldwv8qse1Xdg2MzZ9F6kf3jlnJx+pNU4XMnajbPJKLh34KcnVbgyBuGU/qPp175ogc0SQzNGVO3mP6S+Yy8/I88k3PrAYGJ73PLWZ+WbHHyD7m8VaXhg02Tbxif1UJ0hiYNAVWS0U60aXhaC/r/MnUEBpL0tPwBaR9y5gfmhK507jW31HN8fRQRCZsW2A2M37uDeVe26hDy4PvjYAAImGtTHM7WXl7tyWxXz+4XssLAoiiac3jjV07xruQzKtCg47d6w4yUTPlFCGGzOj2RXYQud/xn+WYn82vPO9FDmPpr+0nIJg1p1Wc1lszRKqaIQjBWnEVmDORYdeOQF1aNgCTVpofe6eiwIa4tkZiGdUvFGpUWyEzzNL+Phuu+HJWyv8TgLWQTyi/MPlt6jMbbxs1yBE0qtWTj9xfal+IK1jIzI65ELVJ5+xfJkit2hasrgX5AMF7GcEGUyai74S9XH0cExNclLqJZjPV8zkWxH7/HgXUw8sZrsh/HvVCXbK5AiO4oS8nu6NfkgU1yHWDkb1E3nslze0E1e0c9Is+Dkn4qAJeletAh6dfbTL3a3br9FHObsbue5jVPOyTlcIKZrjy1oUs6zwYLAj+1btWI=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799003|5072599009|8060799006|461199028|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	2Bt3yi56qZuo/oJ/ksFaOWAPf91AOYxh2LHDaInjz7zWyCzJi0a26dxV+wjXVv77apT4RKZnBOexILYVNqRWVoatMCImblBW44onfoQHvDC7sQlAifCKxm1KK/AxoOMG4DB9m1evos6I5awakZJ8z6fHmqnllOu9AlFVTh/bYcqy2mnZpTBKNxTIgJ2wj7j3ViYhrQBCmdECZRuQk4M4RbDpBcQPA8LpC8T6/Z7rAJarLCCEVkh7QsCOOlv5woyvO9iatRr+3SdRRnADxdrntOV7JMDMQBWRbQ5fUz0dq4jO49yqO/x8Ja4mJGmN3B5GtbA3PSlkp16BqV4ZeaW7EHkZ6MjimdNobrBl03XSNY5N/z77zn4R4zUBs3sF/L1r/oZMrDFdoJkGqM0JSZl6l7XSj6KZ8rYJXKXjY5FfTN7tZFkptzuG6YcPS5nh/nfYTy8Km9GJenFgNI1kDwp7MQGSSSGyRo9QRy0+vq/2AjG+AuqCgwLu0aOtJGhmS8YSctnRWUSTPb6l2Q9z+ZadM3K1BBwbhYiuH6rsY6Hm8WFTa9MWUVNGSSIEU7VFJErlOzc3uQTxF6RTwcgLqC8KwmkkI71VNGM4jW10IeWGH/opADju5zrm/8n7EtZHP7GqEdc51ZARmLj8X+OuJGCNBoYVRhEdoXEs+unh7dbJoLGVRplTpsfn3d1Of9irTsQo+o3VSpTvjrN5sh0V4ZlLrA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UksCohc/AaXOrsHvRv3erHVNkPyivyy6ZmuVWMeE3b3xAKwgjio5aGaN8Zwl?=
 =?us-ascii?Q?OXoFE263153qmOfvWyaoBbn4TsQn8kZyiZBw8RNucAMUGLzpZ+1rWob73PSZ?=
 =?us-ascii?Q?f3EdMyRRpcr6MSAvyVV6iyxH98L9vHudOlxSfNWC16uykbKcrBXi4lnJk0Yx?=
 =?us-ascii?Q?CQBmcYNyHbzEkumh/nbivGuWdkgvNKdCdkQ/TM3NTAy475UvEjqs39yCrCV1?=
 =?us-ascii?Q?Oso4U117ymCLdPlzDQkqVJz/S/iOecqy7fEsEXK/skPtn47PT1Kf/2my8k5t?=
 =?us-ascii?Q?SURcnRYxzwbO3duxo9g0YTEZplRkHWouMyEv+3LwluGLJcPqoqueGiP+4oJm?=
 =?us-ascii?Q?Go38p3LNXMIL1O45OSyZ0DM+IUzCtFL4v1yl58K+FMVxaiHMwVmS16Wt2emL?=
 =?us-ascii?Q?Orgq6D4PxlxczIEJ6S17dh2j2PjC0mOBlsnQwUI0FsXk7lpG01+d6p20rq3L?=
 =?us-ascii?Q?uq2B/nOXqngvsMcGzhsEbe2VrK/RmE6o+ldc6mSq8K/uZb7XITSiazaCBqFn?=
 =?us-ascii?Q?4fm7KgZ4yJZjS6xsriEPFLGzNgTWo41e2DDZiagiTFZLd64bVtN3OT6xzR9h?=
 =?us-ascii?Q?MIHe1axWnlK2SzeeYGpkwmQ8a1iSam79ZKG9cJwRvs7Fsn+OwdIrj+BgoL2l?=
 =?us-ascii?Q?Xo8Fr3iP+Yc8ox312dWFZWTjhT0+0lfsemw+TGc+4uHNaFoxso1J2ngpF/Ed?=
 =?us-ascii?Q?AgnlGypRvXce8vvybCI8SXzqsjmRqDgNkdXTAdmP62AjbHSuJIaofiJlLor7?=
 =?us-ascii?Q?gwvc+Gt3PJNmroPlQwHno9/OqyrPTplSTLWuS33hMeoqcZbdw8DSoJ4hd1yx?=
 =?us-ascii?Q?KCzu/+Knjm6zhSh9OSSvsc2MhiPez+C0JzFMAY7TizirnwRjrBIaSQRaSwP2?=
 =?us-ascii?Q?ByNbZRrL1tljhqIlUEmKCje6S+FW7bpo2NP1Qz9UX+Cy6d8h3UYToPrcexqX?=
 =?us-ascii?Q?R5ouL9PFYfRO8Q8TFNQPslrcmYvjG8+FuAXL/JcOPk4owIeAmp2A6Jb4plcg?=
 =?us-ascii?Q?nhio89EXNZYek+yOzoTjPCVdpFoiBJ3Kzae6tu5XD7JWBbvu8K3hGODm/5ph?=
 =?us-ascii?Q?NBSMS5NTizxXB+l1QH5eN0yF5S0uR4ChRprp0HUfgmkoj1ZIXVmjghFMwXV4?=
 =?us-ascii?Q?4oAEPUnGNblol+XpM/BSeZW5r/7mbMuqdlJez0lOeQtU+xUgyrcvdzRWLVEW?=
 =?us-ascii?Q?Mq5PXG6miX+8Mm9g24z1BFmmbdq4geOORqx8LZZ+MgWFCT+AMNFoCjg1dwrE?=
 =?us-ascii?Q?2dQvBa1eMN8SwjcpsWA/?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fb89f57-4b5c-49ee-16ad-08dcb28b1bcb
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 00:36:12.1224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR20MB4954

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
2.46.0


