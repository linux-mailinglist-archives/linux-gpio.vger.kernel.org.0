Return-Path: <linux-gpio+bounces-8405-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC4593EA66
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 03:03:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 867F2B20923
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 01:03:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0C02882B;
	Mon, 29 Jul 2024 01:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="JF5C8Gwm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10olkn2098.outbound.protection.outlook.com [40.92.40.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611954C6B;
	Mon, 29 Jul 2024 01:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.40.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722214991; cv=fail; b=Y04YL12AxsgBTiNX4b4Xq3T9wxZr62umGFWnb3kfcNaZ7vm6k27lo9NPkSU8Ab7G23xrAJ9RdbHk9CB/j4B5dhF+GLVCJSKf/0yhevHFwARmPUrlOUkbN+UXCpV4ad8sYYHh07lf8lX+Xa96QdwIFYEQiStKHurqVjx94PAYhYE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722214991; c=relaxed/simple;
	bh=8gENHNSZVP22/BwvBVbhRo46UI2ZLy3rqcAwGya0djc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WOH9PI9gayWkAek2NLTyrku2ObWyIHFMBB3rm8k6HDH6rzgSc57/NjwG02SwjEb/1fckaGb61ILON3QV/ve1/BTqzUE/UxvkUOdNaRfLgV0GZ1wt2ERIJtjogLlE0ryED467hX+sVizFEmV/ZFqmy3ftsm56u7JnW4WmTw/ktCk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=JF5C8Gwm; arc=fail smtp.client-ip=40.92.40.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x98WZv8ZCFMzuJu4z5DZilbCoGLUJljhX4sAuNXUxnz1hqusmZPNATGX9X+BNAQBDMQaaHv9cBh/oGxsOo5oGto9H/TUuEkQ+hIwwwwj2SpGriCtjuhHiSGhdyar59tiqFbRj5Z67J/u0RuQBZD05+F9E8FXdZvU7DIUCLnWKKxZ6gac3ual98DLIMtoKCF3pTDQWdFSLav8WJ5f4Z81vaNxC/OBQgP+He6jY2b2pA789SiR4j2vr+WDVJNWM7y8/BWed60Q5k/c3twndtKilHen0HAus6BBlI8vhLH6xY5dNgYW95AeuRWnObHk/8kUpE2lmU+JxLjC+pYt/YqAWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j9VzZoHCW676ygfACv8VbxmM6f+/RC0RoifJvj6w2oI=;
 b=cPkoyymHtZxSYw5GaAqgoyiGQGdVOvrl/yIj4EVyztKO9jI0yJMeJ+q9SQedw0hp+bM1/vLXdDu3ttvHNNlWGwzwz0kXDnDgazClsfml8BwcxtU1iVNHZvmQMAt9PDREZOiVJUUlRWXBcTbTPm5QOstAtMoxm9KXnClnQrdVwqdSNJoH9uKHHcUJMi3J5WzM316uY67UNnKrJ2T2KWIDq95gAdLys2al++C5z26h4lVeTC3odbePtnHDPwCpNkQdm3rOuaQKSK/V36klDzsSVVO7GjDGSA3VAMLowm7frImXn3gVzxEENEU8jRwpJGbFEvra2b4kOfIPBPJACa1ZOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9VzZoHCW676ygfACv8VbxmM6f+/RC0RoifJvj6w2oI=;
 b=JF5C8Gwmffp/sroY2VN2OYbA168OI/VBfUQH8itiQ5nQj5RQpCFn7Jeke2Bk8bSFeG6l6/FQ7Dcikr8x+ssxJmhDJk135md3UwSNPfpLADpsoYci9yEdbz7BEqujtrrOLjsiNZN+V6dK5ffKUgS5bACqz9xONAlkmAaXL6mcTN8FI6DsucTw8JCMjzDaiWRAodDwrzgwf0CnJkPNAbixpy2FC7ih5lfajhGEHxfijFClBOXP4OwvtdaslbFcHCAhEJ3eP9TojL58f0wpCMoXW0tQRu4yl75QwWZTR9fW9PQ4RxYsXePxfRMe99Iospyiw0mLItAjyCxdwkL+ebWfpw==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by LV8PR20MB7300.namprd20.prod.outlook.com (2603:10b6:408:232::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Mon, 29 Jul
 2024 01:03:05 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%5]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 01:03:05 +0000
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
Subject: [PATCH v3 2/7] pinctrl: sophgo: add support for CV1800B SoC
Date: Mon, 29 Jul 2024 09:02:28 +0800
Message-ID:
 <IA1PR20MB495316C4F4906D39E916C98ABBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <IA1PR20MB4953B8B0014FA82A8E141CB0BBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953B8B0014FA82A8E141CB0BBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TMN: [aULGvPx+jvZ/rpGrrxNhbtRmFFII6IYsu7eyq7eko7I=]
X-ClientProxiedBy: TYCP286CA0235.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::13) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID:
 <20240729010237.650411-2-inochiama@outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|LV8PR20MB7300:EE_
X-MS-Office365-Filtering-Correlation-Id: b0cb86cb-0b4d-45ad-bb83-08dcaf6a3397
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599006|8060799006|461199028|19110799003|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	4AVuVwSB2GXhZ2g6c5JNRkTb6YZ1C/olX3qcv7QxChA53ROP4XC9NF/7nBNcmUA5s4Q8bEXz042xcsnSry5fW4SD342KyGpFAElkVvw5P6zw9+bF/aDsIugdXowgvZaQYXosdnWwt7jIUfS7pakXFmQkM4Qm5JIdTKfc84dJMi5zDBp+zTFa9orQISntbd4OvOPv/oKUvlpWU7ZzJJg4ucMVDK5kYZstA7T239aILNmGzFYeFTuWJ7c2HsK5xLvgaUff9xgxHwgXM27kMxi2J9Vb/G8lU64Mj6gaFvzVyVvCSIk+CPKQwo31X0l5lE885JK9PC/MO0rM70RdRDC/sgYuJdBa8JgIqBZxJPbgEdhq0VziQuFNBmwixIYXuNxMx5nmuZdZwpBBmWgPdTvw6wy0Hk35X5lFcjq2iIR+Sh+iq3XY1iagoeny0edMXmpCGoig5tAW0/pi4hChSj20H1fyZ4RisXur/Ye3HxOFI28tUslSAUxzieLgfk3aFsmPobDvYpDjECjFq9r26aDlxrJKEfyK/yOUv+HhKgvIuPxERbdF0Y+hYZ3Y87ZmyqdngRfTvQEcJkHM4reXCJrpRPZXIV+dvqfvRxr16STha+EcsDLzg0akF4YbRlyIGLcwGLPzqvkP4S+hHxEkkU09JfFDkUQcyU/JBAF6apTVKmL1afI8xaNugfIm/G/bdXwoLw+/jZ9Tm9bZ4JWIlTZzgQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cllRZlhYRTJtM0Q4eCs2dFd5ejNjcVcwSjRnWElseGZGZnA2VGdBZ3JheGhY?=
 =?utf-8?B?MzBqNUhPc1ZRQzVvMDQ3cTdXOVBtcUF0UnlPY1pvZjUvZm5sQll2bG83QSs5?=
 =?utf-8?B?K05UM0E1UXE4OFAveUpESTArWjFsRFJvVEkyVXUxRzFZRjVqSENJL0MxUEtN?=
 =?utf-8?B?bXljaG52TnNKU0d5N3ZxZHRweks2a2xQbEI0UzdzZWtWdTJ0OEVCLzFGVnVj?=
 =?utf-8?B?ZzhRTll5cERnLzY2NE5uY21JUDIxbHdzdy92VDVUQ1lJTWlpb2I1WU1XYlRY?=
 =?utf-8?B?YkNRR0FEOFVYM0hkLzFzaERBNUpZdWcwRTNXUGZ2K2s4Zjc4dU9Md1NkUHZu?=
 =?utf-8?B?M2pPUHg1NlZmcldaZU1JRmpTRG04dUgzcHc3TUNYdU92VS9VMWM5VGlmYkZ0?=
 =?utf-8?B?NU5SYnljeXNPSW40RmhvUTNtTVIzYjRHZ29vL3JIQWlVWFdHc2J2NFZUNy82?=
 =?utf-8?B?NmxUTER3VWNlNlZYTm95bTFMVEJVWjZ6MmhSZ0ZoaDYyWTJrSVpLdWs0Z0FJ?=
 =?utf-8?B?dUpiS3dmV2paNkJKWlRNTFlCajBmUTdVRU8xeGZDOEFjK213eEhvL245OTc0?=
 =?utf-8?B?NDdmQi9ENU4yZ2EzQjBKbDVJS1N6QUZiVk04ZnkyN0I5eHVqUzVPTU1qSTJ6?=
 =?utf-8?B?UG1iMVAyWFI5aFRPTnh4UzZjbkgvZEdWK1lyTGNheXNNMjNrZ3JOazBidjRF?=
 =?utf-8?B?MFA2M3VxcHVJUTV1Ukk5ako3L1ZDWGQ2SzU4eTYrK0VtSVFhekhqMkNIdXpI?=
 =?utf-8?B?M01vd3hXTHZraC9GYytkbkJGVTM1cXU2dU9GRUxNM0loMnlRVklHZVFKZUpk?=
 =?utf-8?B?ZmJxOXZHdCtnaG1keVROWUE4RlVjQWY3KzluUU5CbGx3M0R4MlVqTmdrU1Rs?=
 =?utf-8?B?ZVlOUjhad29VeHRvdk1LeEh0ak5GemNYaE80SG9pVjFKOVpBUll1NmgvbUI5?=
 =?utf-8?B?L3dLSXBvVnA5b0s5Ly9zRzhkd1hCZnRiUk10RmJUMUZxaUgvREYrRnFRY1FY?=
 =?utf-8?B?anZOUEt1djFSbkZ0K3RPdmRzYWVOK1FueTlWSGwxTUtCei9nMjNkd1JEdlFp?=
 =?utf-8?B?aitudGNCOUxTRkpTWU5mNUE5LzArNUJXdDJmb2xKQzNTK05vMnZxUFBOc2ZT?=
 =?utf-8?B?eUxQRzQvekxrMFBUSWZ0RXdFdEh2WTdrSWVnVGdiK0tBc3JYczAyNEE4emk3?=
 =?utf-8?B?UHhKZTIycXZBZ1oyRGdYS29QZnFhbjg5bjZSSnlNZTN5SFhYVjV1dm9NdEI0?=
 =?utf-8?B?SGlzbWwwWElrV3JXc2RQM3RUZ2QzdzNxeG10WmJUclpCdWRsUlo3TSsrZWpG?=
 =?utf-8?B?dmxYMm1acVZVZHJzOGx6NjFvWGVQRm1DNzhDUjBLSlFWOU40ZzF1VEtKVXVE?=
 =?utf-8?B?SmVyNU0zYlFGcnVoU1dya3ZaVTJTRUpKWlBOR3d5ekNEUmZxODFHZ1ExN3Ey?=
 =?utf-8?B?M1BBZVY2SkxuZUpJMmRVUzFvRFVRc0ZHbHNoZitiT1dEbUYxUHdJQVA5ei9B?=
 =?utf-8?B?MFBRNW1ja25mbExIaUlXbURZWVdOZFBYN1g2ZkpEUXgxdFRBTE1QMk1UQ3c2?=
 =?utf-8?B?Zjh1Qk9lUWpYN2VxVng1NzZxQ2pDTFVaaXdsNEFIbEMzdXV1YVp4REdxTUFP?=
 =?utf-8?B?ejlxSmZQMFl5U2x2MHg1bnI4OFN4S1NUMHE2TXhlNWJkMzR2a0NjUnBySzVS?=
 =?utf-8?Q?xhVdQfZiDmmJJ3l1OVjV?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0cb86cb-0b4d-45ad-bb83-08dcaf6a3397
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 01:03:05.0544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR20MB7300

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
 drivers/pinctrl/sophgo/pinctrl-cv1800b.c | 462 ++++++++++++++
 drivers/pinctrl/sophgo/pinctrl-cv18xx.c  | 765 +++++++++++++++++++++++
 drivers/pinctrl/sophgo/pinctrl-cv18xx.h  | 155 +++++
 7 files changed, 1409 insertions(+)
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
index 000000000000..3322906689e7
--- /dev/null
+++ b/drivers/pinctrl/sophgo/pinctrl-cv1800b.c
@@ -0,0 +1,462 @@
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
+enum CV1800B_POWER_DOMAIN {
+	VDD18A_AUD		= 0,
+	VDD18A_USB_PLL_ETH_CSI	= 1,
+	VDD33A_ETH_USB_SD1	= 2,
+	VDDIO_RTC		= 3,
+	VDDIO_SD0_SPI		= 4
+};
+
+static const char *const cv1800b_power_domain_desc[] = {
+	[VDD18A_AUD]			= "VDD18A_AUD",
+	[VDD18A_USB_PLL_ETH_CSI]	= "VDD18A_USB_PLL_ETH_CSI",
+	[VDD33A_ETH_USB_SD1]		= "VDD33A_ETH_USB_SD1",
+	[VDDIO_RTC]			= "VDDIO_RTC",
+	[VDDIO_SD0_SPI]			= "VDDIO_SD0_SPI",
+};
+
+static int cv1800b_get_pull_up(struct cv1800_pin *pin, const u32 *psmap)
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
+static int cv1800b_get_pull_down(struct cv1800_pin *pin, const u32 *psmap)
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
+static const u32 cv1800b_1v8_oc_map[] = {
+	12800,
+	25300,
+	37400,
+	49000
+};
+
+static const u32 cv1800b_18od33_1v8_oc_map[] = {
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
+static const u32 cv1800b_18od33_3v3_oc_map[] = {
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
+static const u32 cv1800b_eth_oc_map[] = {
+	15700,
+	17800
+};
+
+static int cv1800b_get_oc_map(struct cv1800_pin *pin, const u32 *psmap,
+			      const u32 **map)
+{
+	enum cv1800_pin_io_type type = cv1800_pin_io_type(pin);
+	u32 pstate = psmap[pin->power_domain];
+
+	if (type == IO_TYPE_1V8_ONLY) {
+		*map = cv1800b_1v8_oc_map;
+		return ARRAY_SIZE(cv1800b_1v8_oc_map);
+	}
+
+	if (type == IO_TYPE_1V8_OR_3V3) {
+		if (pstate == PIN_POWER_STATE_1V8) {
+			*map = cv1800b_18od33_1v8_oc_map;
+			return ARRAY_SIZE(cv1800b_18od33_1v8_oc_map);
+		} else if (pstate == PIN_POWER_STATE_3V3) {
+			*map = cv1800b_18od33_3v3_oc_map;
+			return ARRAY_SIZE(cv1800b_18od33_3v3_oc_map);
+		}
+	}
+
+	if (type == IO_TYPE_ETH) {
+		*map = cv1800b_eth_oc_map;
+		return ARRAY_SIZE(cv1800b_eth_oc_map);
+	}
+
+	return -ENOTSUPP;
+}
+
+static const u32 cv1800b_1v8_schmitt_map[] = {
+	0,
+	970000,
+	1040000
+};
+
+static const u32 cv1800b_18od33_1v8_schmitt_map[] = {
+	0,
+	1070000
+};
+
+static const u32 cv1800b_18od33_3v3_schmitt_map[] = {
+	0,
+	1100000
+};
+
+static int cv1800b_get_schmitt_map(struct cv1800_pin *pin, const u32 *psmap,
+				   const u32 **map)
+{
+	enum cv1800_pin_io_type type = cv1800_pin_io_type(pin);
+	u32 pstate = psmap[pin->power_domain];
+
+	if (type == IO_TYPE_1V8_ONLY) {
+		*map = cv1800b_1v8_schmitt_map;
+		return ARRAY_SIZE(cv1800b_1v8_schmitt_map);
+	}
+
+	if (type == IO_TYPE_1V8_OR_3V3) {
+		if (pstate == PIN_POWER_STATE_1V8) {
+			*map = cv1800b_18od33_1v8_schmitt_map;
+			return ARRAY_SIZE(cv1800b_18od33_1v8_schmitt_map);
+		} else if (pstate == PIN_POWER_STATE_3V3) {
+			*map = cv1800b_18od33_3v3_schmitt_map;
+			return ARRAY_SIZE(cv1800b_18od33_3v3_schmitt_map);
+		}
+	}
+
+	return -ENOTSUPP;
+}
+
+static const struct cv1800_vddio_cfg_ops cv1800b_vddio_cfg_ops = {
+	.get_pull_up		= cv1800b_get_pull_up,
+	.get_pull_down		= cv1800b_get_pull_down,
+	.get_oc_map		= cv1800b_get_oc_map,
+	.get_schmitt_map		= cv1800b_get_schmitt_map,
+};
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
+	CV1800_FUNC_PIN(PIN_AUD_AOUTR, VDD18A_AUD,
+			IO_TYPE_AUDIO,
+			CV1800_PINCONF_AREA_SYS, 0x12c, 6),
+	CV1800_GENERAL_PIN(PIN_SD0_CLK, VDDIO_SD0_SPI,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x000, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xa00),
+	CV1800_GENERAL_PIN(PIN_SD0_CMD, VDDIO_SD0_SPI,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x004, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xa04),
+	CV1800_GENERAL_PIN(PIN_SD0_D0, VDDIO_SD0_SPI,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x008, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xa08),
+	CV1800_GENERAL_PIN(PIN_SD0_D1, VDDIO_SD0_SPI,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x00c, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xa0c),
+	CV1800_GENERAL_PIN(PIN_SD0_D2, VDDIO_SD0_SPI,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x010, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xa10),
+	CV1800_GENERAL_PIN(PIN_SD0_D3, VDDIO_SD0_SPI,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x014, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xa14),
+	CV1800_GENERAL_PIN(PIN_SD0_CD, VDDIO_SD0_SPI,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x018, 3,
+			   CV1800_PINCONF_AREA_SYS, 0x900),
+	CV1800_GENERAL_PIN(PIN_SD0_PWR_EN, VDDIO_SD0_SPI,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x01c, 3,
+			   CV1800_PINCONF_AREA_SYS, 0x904),
+	CV1800_GENERAL_PIN(PIN_SPK_EN, VDDIO_SD0_SPI,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x020, 3,
+			   CV1800_PINCONF_AREA_SYS, 0x908),
+	CV1800_GENERAL_PIN(PIN_UART0_TX, VDDIO_SD0_SPI,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x024, 7,
+			   CV1800_PINCONF_AREA_SYS, 0x90c),
+	CV1800_GENERAL_PIN(PIN_UART0_RX, VDDIO_SD0_SPI,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x028, 7,
+			   CV1800_PINCONF_AREA_SYS, 0x910),
+	CV1800_GENERAL_PIN(PIN_SPINOR_HOLD_X, VDDIO_SD0_SPI,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x02c, 3,
+			   CV1800_PINCONF_AREA_SYS, 0x914),
+	CV1800_GENERAL_PIN(PIN_SPINOR_SCK, VDDIO_SD0_SPI,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x030, 3,
+			   CV1800_PINCONF_AREA_SYS, 0x918),
+	CV1800_GENERAL_PIN(PIN_SPINOR_MOSI, VDDIO_SD0_SPI,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x034, 3,
+			   CV1800_PINCONF_AREA_SYS, 0x91c),
+	CV1800_GENERAL_PIN(PIN_SPINOR_WP_X, VDDIO_SD0_SPI,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x038, 3,
+			   CV1800_PINCONF_AREA_SYS, 0x920),
+	CV1800_GENERAL_PIN(PIN_SPINOR_MISO, VDDIO_SD0_SPI,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x03c, 3,
+			   CV1800_PINCONF_AREA_SYS, 0x924),
+	CV1800_GENERAL_PIN(PIN_SPINOR_CS_X, VDDIO_SD0_SPI,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x040, 3,
+			   CV1800_PINCONF_AREA_SYS, 0x928),
+	CV1800_GENERAL_PIN(PIN_IIC0_SCL, VDDIO_SD0_SPI,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x04c, 7,
+			   CV1800_PINCONF_AREA_SYS, 0x934),
+	CV1800_GENERAL_PIN(PIN_IIC0_SDA, VDDIO_SD0_SPI,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x050, 7,
+			   CV1800_PINCONF_AREA_SYS, 0x938),
+	CV1800_GENERAL_PIN(PIN_AUX0, VDDIO_SD0_SPI,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x054, 7,
+			   CV1800_PINCONF_AREA_SYS, 0x93c),
+	CV1800_GENERAL_PIN(PIN_PWR_VBAT_DET, VDDIO_RTC,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x05c, 0,
+			   CV1800_PINCONF_AREA_RTC, 0x004),
+	CV1800_GENERAL_PIN(PIN_PWR_SEQ2, VDDIO_RTC,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x068, 3,
+			   CV1800_PINCONF_AREA_RTC, 0x010),
+	CV1800_GENERAL_PIN(PIN_XTAL_XIN, VDDIO_RTC,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x074, 0,
+			   CV1800_PINCONF_AREA_RTC, 0x020),
+	CV1800_GENERAL_PIN(PIN_SD1_GPIO0, VDD33A_ETH_USB_SD1,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x088, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x034),
+	CV1800_GENERAL_PIN(PIN_SD1_GPIO1, VDD33A_ETH_USB_SD1,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x084, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x030),
+	CV1800_GENERAL_PIN(PIN_SD1_D3, VDD33A_ETH_USB_SD1,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x08c, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x038),
+	CV1800_GENERAL_PIN(PIN_SD1_D2, VDD33A_ETH_USB_SD1,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x090, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x03c),
+	CV1800_GENERAL_PIN(PIN_SD1_D1, VDD33A_ETH_USB_SD1,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x094, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x040),
+	CV1800_GENERAL_PIN(PIN_SD1_D0, VDD33A_ETH_USB_SD1,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x098, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x044),
+	CV1800_GENERAL_PIN(PIN_SD1_CMD, VDD33A_ETH_USB_SD1,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x09c, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x048),
+	CV1800_GENERAL_PIN(PIN_SD1_CLK, VDD33A_ETH_USB_SD1,
+			   IO_TYPE_1V8_OR_3V3,
+			   CV1800_PINCONF_AREA_SYS, 0x0a0, 7,
+			   CV1800_PINCONF_AREA_RTC, 0x04c),
+	CV1800_GENERAL_PIN(PIN_ADC1, VDD18A_USB_PLL_ETH_CSI,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x0a8, 6,
+			   CV1800_PINCONF_AREA_SYS, 0x804),
+	CV1800_GENERAL_PIN(PIN_USB_VBUS_DET, VDD18A_USB_PLL_ETH_CSI,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x0ac, 6,
+			   CV1800_PINCONF_AREA_SYS, 0x808),
+	CV1800_FUNC_PIN(PIN_ETH_TXP, VDD18A_USB_PLL_ETH_CSI,
+			IO_TYPE_ETH,
+			CV1800_PINCONF_AREA_SYS, 0x0c0, 7),
+	CV1800_FUNC_PIN(PIN_ETH_TXM, VDD18A_USB_PLL_ETH_CSI,
+			IO_TYPE_ETH,
+			CV1800_PINCONF_AREA_SYS, 0x0c4, 7),
+	CV1800_FUNC_PIN(PIN_ETH_RXP, VDD18A_USB_PLL_ETH_CSI,
+			IO_TYPE_ETH,
+			CV1800_PINCONF_AREA_SYS, 0x0c8, 7),
+	CV1800_FUNC_PIN(PIN_ETH_RXM, VDD18A_USB_PLL_ETH_CSI,
+			IO_TYPE_ETH,
+			CV1800_PINCONF_AREA_SYS, 0x0cc, 7),
+	CV1800_GENERATE_PIN_MUX2(PIN_MIPIRX4N, VDD18A_USB_PLL_ETH_CSI,
+				 IO_TYPE_1V8_ONLY,
+				 CV1800_PINCONF_AREA_SYS, 0x0d4, 7,
+				 CV1800_PINCONF_AREA_SYS, 0x0bc, 7,
+				 CV1800_PINCONF_AREA_SYS, 0xc04),
+	CV1800_GENERATE_PIN_MUX2(PIN_MIPIRX4P, VDD18A_USB_PLL_ETH_CSI,
+				 IO_TYPE_1V8_ONLY,
+				 CV1800_PINCONF_AREA_SYS, 0x0d8, 7,
+				 CV1800_PINCONF_AREA_SYS, 0x0b8, 7,
+				 CV1800_PINCONF_AREA_SYS, 0xc08),
+	CV1800_GENERATE_PIN_MUX2(PIN_MIPIRX3N, VDD18A_USB_PLL_ETH_CSI,
+				 IO_TYPE_1V8_ONLY,
+				 CV1800_PINCONF_AREA_SYS, 0x0dc, 7,
+				 CV1800_PINCONF_AREA_SYS, 0x0b0, 7,
+				 CV1800_PINCONF_AREA_SYS, 0xc0c),
+	CV1800_GENERATE_PIN_MUX2(PIN_MIPIRX3P, VDD18A_USB_PLL_ETH_CSI,
+				 IO_TYPE_1V8_ONLY,
+				 CV1800_PINCONF_AREA_SYS, 0x0e0, 7,
+				 CV1800_PINCONF_AREA_SYS, 0x0b4, 7,
+				 CV1800_PINCONF_AREA_SYS, 0xc10),
+	CV1800_GENERAL_PIN(PIN_MIPIRX2N, VDD18A_USB_PLL_ETH_CSI,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x0e4, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc14),
+	CV1800_GENERAL_PIN(PIN_MIPIRX2P, VDD18A_USB_PLL_ETH_CSI,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x0e8, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc18),
+	CV1800_GENERAL_PIN(PIN_MIPIRX1N, VDD18A_USB_PLL_ETH_CSI,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x0ec, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc1c),
+	CV1800_GENERAL_PIN(PIN_MIPIRX1P, VDD18A_USB_PLL_ETH_CSI,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x0f0, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc20),
+	CV1800_GENERAL_PIN(PIN_MIPIRX0N, VDD18A_USB_PLL_ETH_CSI,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x0f4, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc24),
+	CV1800_GENERAL_PIN(PIN_MIPIRX0P, VDD18A_USB_PLL_ETH_CSI,
+			   IO_TYPE_1V8_ONLY,
+			   CV1800_PINCONF_AREA_SYS, 0x0f8, 7,
+			   CV1800_PINCONF_AREA_SYS, 0xc28),
+	CV1800_FUNC_PIN(PIN_AUD_AINL_MIC, VDD18A_AUD,
+			IO_TYPE_AUDIO,
+			CV1800_PINCONF_AREA_SYS, 0x120, 5),
+};
+
+static const struct cv1800_pinctrl_data cv1800b_pindata = {
+	.pins		= cv1800b_pins,
+	.pindata	= cv1800b_pin_data,
+	.pdnames	= cv1800b_power_domain_desc,
+	.vddio_ops	= &cv1800b_vddio_cfg_ops,
+	.npins		= ARRAY_SIZE(cv1800b_pins),
+	.npd		= ARRAY_SIZE(cv1800b_power_domain_desc),
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
index 000000000000..e63cfcc37377
--- /dev/null
+++ b/drivers/pinctrl/sophgo/pinctrl-cv18xx.c
@@ -0,0 +1,765 @@
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
+	u32					*power_cfg;
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
+static int cv1800_set_power_cfg(struct cv1800_pinctrl *pctrl,
+				u8 domain, u32 cfg)
+{
+	if (domain >= pctrl->data->npd)
+		return -ENOTSUPP;
+
+	if (pctrl->power_cfg[domain] && pctrl->power_cfg[domain] != cfg)
+		return -EINVAL;
+
+	pctrl->power_cfg[domain] = cfg;
+
+	return 0;
+}
+
+static int cv1800_get_power_cfg(struct cv1800_pinctrl *pctrl,
+				u8 domain)
+{
+	return pctrl->power_cfg[domain];
+}
+
+static struct cv1800_pin *cv1800_get_pin(struct cv1800_pinctrl *pctrl,
+					 unsigned long pin)
+{
+	return bsearch((void *)pin, pctrl->data->pindata, pctrl->data->npins,
+		       sizeof(struct cv1800_pin), cv1800_cmp_pin);
+}
+
+#define PIN_BGA_ID_OFFSET		8
+#define PIN_BGA_ID_MASK			0xff
+
+static const char *const io_type_desc[] = {
+	"1V8",
+	"18OD33",
+	"AUDIO",
+	"ETH"
+};
+
+static const char *cv1800_get_power_cfg_desc(struct cv1800_pinctrl *pctrl,
+					     u8 domain)
+{
+	return pctrl->data->pdnames[domain];
+}
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
+			   'A' + (pin->pin >> PIN_BGA_ID_OFFSET) - 1,
+			   pin->pin & PIN_BGA_ID_MASK);
+	else
+		seq_printf(seq, "pos: %u ", pin->pin);
+
+	seq_printf(seq, "power-domain: %s ",
+		   cv1800_get_power_cfg_desc(pctrl, pin->power_domain));
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
+			return -ENOTSUPP;
+	}
+
+	return 0;
+}
+
+static int cv1800_verify_pin_group(const struct cv1800_pin_mux_config *mux,
+				   unsigned long npins)
+{
+	enum cv1800_pin_io_type type;
+	u8 power_domain;
+	int i;
+
+	if (npins == 1)
+		return 0;
+
+	type = cv1800_pin_io_type(mux[0].pin);
+	power_domain = mux[0].pin->power_domain;
+
+	for (i = 0; i < npins; i++) {
+		if (type != cv1800_pin_io_type(mux[i].pin) ||
+		    power_domain != mux[i].pin->power_domain)
+			return -ENOTSUPP;
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
+		u32 config, power;
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
+		ret = cv1800_verify_pin_group(pinmuxs, npins);
+		if (ret) {
+			dev_err(dev, "group %s is invalid\n", grpname);
+			goto dt_failed;
+		}
+
+		ret = of_property_read_u32(child, "power-source", &power);
+		if (ret)
+			goto dt_failed;
+
+		if (!(power == PIN_POWER_STATE_3V3 || power == PIN_POWER_STATE_1V8)) {
+			dev_err(dev, "group %s have unsupported power: %u\n",
+				grpname, power);
+			ret = -ENOTSUPP;
+			goto dt_failed;
+		}
+
+		ret = cv1800_set_power_cfg(pctrl, pinmuxs[0].pin->power_domain,
+					   power);
+		if (ret)
+			goto dt_failed;
+
+		map[nmaps].type = PIN_MAP_TYPE_MUX_GROUP;
+		map[nmaps].data.mux.function = np->name;
+		map[nmaps].data.mux.group = grpname;
+		nmaps += 1;
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
+		ret = pinctrl_generic_add_group(pctldev, grpname,
+						pins, npins, pinmuxs);
+		if (ret < 0) {
+			dev_err(dev, "failed to add group %s: %d\n", grpname, ret);
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
+#define PIN_IO_PULLUP		BIT(2)
+#define PIN_IO_PULLDOWN		BIT(3)
+#define PIN_IO_DRIVE		GENMASK(7, 5)
+#define PIN_IO_SCHMITT		GENMASK(9, 8)
+#define PIN_IO_BUS_HOLD		BIT(10)
+#define PIN_IO_OUT_FAST_SLEW	BIT(11)
+
+static u32 cv1800_pull_down_typical_resistor(struct cv1800_pinctrl *pctrl,
+					     struct cv1800_pin *pin)
+{
+	return pctrl->data->vddio_ops->get_pull_down(pin, pctrl->power_cfg);
+}
+
+static u32 cv1800_pull_up_typical_resistor(struct cv1800_pinctrl *pctrl,
+					   struct cv1800_pin *pin)
+{
+	return pctrl->data->vddio_ops->get_pull_up(pin, pctrl->power_cfg);
+}
+
+static int cv1800_pinctrl_oc2reg(struct cv1800_pinctrl *pctrl,
+				 struct cv1800_pin *pin, u32 target)
+{
+	const u32 *map;
+	int i, len;
+
+	len = pctrl->data->vddio_ops->get_oc_map(pin, pctrl->power_cfg, &map);
+	if (len < 0)
+		return len;
+
+	for (i = 0; i < len; i++) {
+		if (map[i] >= target)
+			return i;
+	}
+
+	return -EINVAL;
+}
+
+static int cv1800_pinctrl_reg2oc(struct cv1800_pinctrl *pctrl,
+				 struct cv1800_pin *pin, u32 reg)
+{
+	const u32 *map;
+	int len;
+
+	len = pctrl->data->vddio_ops->get_oc_map(pin, pctrl->power_cfg, &map);
+	if (len < 0)
+		return len;
+
+	if (reg >= len)
+		return -EINVAL;
+
+	return map[reg];
+}
+
+static int cv1800_pinctrl_schmitt2reg(struct cv1800_pinctrl *pctrl,
+				      struct cv1800_pin *pin, u32 target)
+{
+	const u32 *map;
+	int i, len;
+
+	len = pctrl->data->vddio_ops->get_schmitt_map(pin, pctrl->power_cfg,
+						      &map);
+	if (len < 0)
+		return len;
+
+	for (i = 0; i < len; i++) {
+		if (map[i] == target)
+			return i;
+	}
+
+	return -EINVAL;
+}
+
+static int cv1800_pinctrl_reg2schmitt(struct cv1800_pinctrl *pctrl,
+				      struct cv1800_pin *pin, u32 reg)
+{
+	const u32 *map;
+	int len;
+
+	len = pctrl->data->vddio_ops->get_schmitt_map(pin, pctrl->power_cfg,
+						      &map);
+	if (len < 0)
+		return len;
+
+	if (reg >= len)
+		return -EINVAL;
+
+	return map[reg];
+}
+
+static int cv1800_pconf_get(struct pinctrl_dev *pctldev,
+			    unsigned int pin_id, unsigned long *config)
+{
+	struct cv1800_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	int param = pinconf_to_config_param(*config);
+	struct cv1800_pin *pin = cv1800_get_pin(pctrl, pin_id);
+	enum cv1800_pin_io_type type;
+	u32 value;
+	u32 arg;
+	bool enabled;
+	int ret;
+
+	if (!pin)
+		return -EINVAL;
+
+	type = cv1800_pin_io_type(pin);
+	if (type == IO_TYPE_ETH || type == IO_TYPE_AUDIO)
+		return -ENOTSUPP;
+
+	value = readl(cv1800_pinctrl_get_component_addr(pctrl, &pin->conf));
+
+	switch (param) {
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		enabled = FIELD_GET(PIN_IO_PULLDOWN, value);
+		arg = cv1800_pull_down_typical_resistor(pctrl, pin);
+		break;
+	case PIN_CONFIG_BIAS_PULL_UP:
+		enabled = FIELD_GET(PIN_IO_PULLUP, value);
+		arg = cv1800_pull_up_typical_resistor(pctrl, pin);
+		break;
+	case PIN_CONFIG_DRIVE_STRENGTH_UA:
+		enabled = true;
+		arg = FIELD_GET(PIN_IO_DRIVE, value);
+		ret = cv1800_pinctrl_reg2oc(pctrl, pin, arg);
+		if (ret < 0)
+			return ret;
+		arg = ret;
+		break;
+	case PIN_CONFIG_INPUT_SCHMITT_UV:
+		arg = FIELD_GET(PIN_IO_SCHMITT, value);
+		ret = cv1800_pinctrl_reg2schmitt(pctrl, pin, arg);
+		if (ret < 0)
+			return ret;
+		arg = ret;
+		enabled = arg != 0;
+		break;
+	case PIN_CONFIG_POWER_SOURCE:
+		enabled = true;
+		arg = cv1800_get_power_cfg(pctrl, pin->power_domain);
+		break;
+	case PIN_CONFIG_SLEW_RATE:
+		enabled = true;
+		arg = FIELD_GET(PIN_IO_OUT_FAST_SLEW, value);
+		break;
+	case PIN_CONFIG_BIAS_BUS_HOLD:
+		arg = FIELD_GET(PIN_IO_BUS_HOLD, value);
+		enabled = arg != 0;
+		break;
+	default:
+		return -ENOTSUPP;
+	}
+
+	*config = pinconf_to_config_packed(param, arg);
+
+	return enabled ? 0 : -EINVAL;
+}
+
+static int cv1800_pinconf_compute_config(struct cv1800_pinctrl *pctrl,
+					 struct cv1800_pin *pin,
+					 unsigned long *configs,
+					 unsigned int num_configs,
+					 u32 *value)
+{
+	int i;
+	u32 v = 0;
+	enum cv1800_pin_io_type type;
+	int ret;
+
+	if (!pin)
+		return -EINVAL;
+
+	type = cv1800_pin_io_type(pin);
+	if (type == IO_TYPE_ETH || type == IO_TYPE_AUDIO)
+		return -ENOTSUPP;
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
+		case PIN_CONFIG_DRIVE_STRENGTH_UA:
+			ret = cv1800_pinctrl_oc2reg(pctrl, pin, arg);
+			if (ret < 0)
+				return ret;
+			v &= ~PIN_IO_DRIVE;
+			v |= FIELD_PREP(PIN_IO_DRIVE, ret);
+			break;
+		case PIN_CONFIG_INPUT_SCHMITT_UV:
+			ret = cv1800_pinctrl_schmitt2reg(pctrl, pin, arg);
+			if (ret < 0)
+				return ret;
+			v &= ~PIN_IO_SCHMITT;
+			v |= FIELD_PREP(PIN_IO_SCHMITT, ret);
+			break;
+		case PIN_CONFIG_POWER_SOURCE:
+			/* Ignore power source as it is always fixed */
+			break;
+		case PIN_CONFIG_SLEW_RATE:
+			v &= ~PIN_IO_OUT_FAST_SLEW;
+			v |= FIELD_PREP(PIN_IO_OUT_FAST_SLEW, arg);
+			break;
+		case PIN_CONFIG_BIAS_BUS_HOLD:
+			v &= ~PIN_IO_BUS_HOLD;
+			v |= FIELD_PREP(PIN_IO_BUS_HOLD, arg);
+			break;
+		default:
+			return -ENOTSUPP;
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
+			    unsigned int pin_id, unsigned long *configs,
+			    unsigned int num_configs)
+{
+	struct cv1800_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	struct cv1800_pin *pin = cv1800_get_pin(pctrl, pin_id);
+	u32 value;
+
+	if (!pin)
+		return -ENODEV;
+
+	if (cv1800_pinconf_compute_config(pctrl, pin,
+					  configs, num_configs, &value))
+		return -ENOTSUPP;
+
+	return cv1800_pin_set_config(pctrl, pin_id, value);
+}
+
+static int cv1800_pconf_group_set(struct pinctrl_dev *pctldev,
+				  unsigned int gsel,
+				  unsigned long *configs,
+				  unsigned int num_configs)
+{
+	struct cv1800_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	const struct group_desc *group;
+	const struct cv1800_pin_mux_config *pinmuxs;
+	u32 value;
+	int i;
+
+	group = pinctrl_generic_get_group(pctldev, gsel);
+	if (!group)
+		return -EINVAL;
+
+	pinmuxs = group->data;
+
+	if (cv1800_pinconf_compute_config(pctrl, pinmuxs[0].pin,
+					  configs, num_configs, &value))
+		return -ENOTSUPP;
+
+	for (i = 0; i < group->grp.npins; i++)
+		cv1800_pin_set_config(pctrl, group->grp.pins[i], value);
+
+	return 0;
+}
+
+static const struct pinconf_ops cv1800_pconf_ops = {
+	.pin_config_get			= cv1800_pconf_get,
+	.pin_config_set			= cv1800_pconf_set,
+	.pin_config_group_set		= cv1800_pconf_group_set,
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
+	if (pctrl_data->npins == 0 || pctrl_data->npd == 0)
+		return dev_err_probe(dev, -EINVAL, "invalid pin data\n");
+
+	pctrl = devm_kzalloc(dev, sizeof(*pctrl), GFP_KERNEL);
+	if (!pctrl)
+		return -ENOMEM;
+
+	pctrl->power_cfg = devm_kcalloc(dev, pctrl_data->npd,
+					sizeof(u32), GFP_KERNEL);
+	if (!pctrl->power_cfg)
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
index 000000000000..1a9998abb3b7
--- /dev/null
+++ b/drivers/pinctrl/sophgo/pinctrl-cv18xx.h
@@ -0,0 +1,155 @@
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
+struct cv1800_pin {
+	u16				pin;
+	u16				flags;
+	u8				power_domain;
+	struct cv1800_pinmux		mux;
+	struct cv1800_pinmux2		mux2;
+	struct cv1800_pinconf		conf;
+};
+
+#define PIN_POWER_STATE_1V8		1800
+#define PIN_POWER_STATE_3V3		3300
+
+/**
+ * struct cv1800_vddio_cfg_ops - pin vddio operations
+ *
+ * @get_pull_up: get resistor for pull up;
+ * @get_pull_down: get resistor for pull down.
+ * @get_oc_map: get mapping for typical low level output current value to
+ *	register value map.
+ * @get_schmitt_map: get mapping for register value to typical schmitt
+ *	threshold.
+ */
+struct cv1800_vddio_cfg_ops {
+	int (*get_pull_up)(struct cv1800_pin *pin, const u32 *psmap);
+	int (*get_pull_down)(struct cv1800_pin *pin, const u32 *psmap);
+	int (*get_oc_map)(struct cv1800_pin *pin, const u32 *psmap,
+			  const u32 **map);
+	int (*get_schmitt_map)(struct cv1800_pin *pin, const u32 *psmap,
+			       const u32 **map);
+};
+
+struct cv1800_pinctrl_data {
+	const struct pinctrl_pin_desc		*pins;
+	const struct cv1800_pin			*pindata;
+	const char				* const *pdnames;
+	const struct cv1800_vddio_cfg_ops	*vddio_ops;
+	u16					npins;
+	u16					npd;
+};
+
+static inline enum cv1800_pin_io_type cv1800_pin_io_type(struct cv1800_pin *pin)
+{
+	return FIELD_GET(CV1800_PIN_IO_TYPE, pin->flags);
+};
+
+int cv1800_pinctrl_probe(struct platform_device *pdev);
+
+#define CV1800_FUNC_PIN(_id, _power_domain, _type,			\
+			_mux_area, _mux_offset, _mux_func_max)		\
+	{								\
+		.pin = (_id),						\
+		.power_domain = (_power_domain),			\
+		.flags = CV1800_PIN_FLAG_IO_TYPE(_type),		\
+		.mux = {						\
+			.area = (_mux_area),				\
+			.offset = (_mux_offset),			\
+			.max = (_mux_func_max),				\
+		},							\
+	}
+
+#define CV1800_GENERAL_PIN(_id, _power_domain, _type,			\
+			   _mux_area, _mux_offset, _mux_func_max,	\
+			   _conf_area, _conf_offset)			\
+	{								\
+		.pin = (_id),						\
+		.power_domain = (_power_domain),			\
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
+#define CV1800_GENERATE_PIN_MUX2(_id, _power_domain, _type,		\
+				 _mux_area, _mux_offset, _mux_func_max,	\
+				 _mux2_area, _mux2_offset,		\
+				 _mux2_func_max,			\
+				 _conf_area, _conf_offset)		\
+	{								\
+		.pin = (_id),						\
+		.power_domain = (_power_domain),			\
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


