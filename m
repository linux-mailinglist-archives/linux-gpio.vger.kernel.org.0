Return-Path: <linux-gpio+bounces-32216-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AV60GnchoGkWfwQAu9opvQ
	(envelope-from <linux-gpio+bounces-32216-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 11:33:27 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C71A71A454E
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 11:33:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 644E43047428
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Feb 2026 10:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0261389E09;
	Thu, 26 Feb 2026 10:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="AzLk2tvs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010025.outbound.protection.outlook.com [52.101.84.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7B6396D24;
	Thu, 26 Feb 2026 10:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772101896; cv=fail; b=pVDWrt/AbnigciROu7Xq1DIA3h3UmyTdRpvFUWw6FPSQHupNYwf5s71L3yMRUZ2v08fCXYiKonwhi4aYzDS9M6MBvLmFMmPFDt8dmZ5vHeDBNQ29zPw2F1FkoDvJXJE9RDnWsx9dHq3Y95yJpxc1CTfQrPz+zcsQHOt0CnB6Imo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772101896; c=relaxed/simple;
	bh=voNT67P45cV3ggKCcpPghz1Q8QpjdbNHu/dJejF8RX4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=CI2F6Pdb0my+q+hUX/3SfQnbrPtP9LPPjrH04qokq7YZN7gk8AtmjLw8E5CYWFeIgThcWIMDV6g9yZP+cRHALZP9XaZKwUvca03wIm4OxqD9uPf9yPwiFIhmELKhpnOvy8hLlMGq6ejR7cXlWQsWiBPnjAU6eBGUqAsf8+5nPgo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=AzLk2tvs; arc=fail smtp.client-ip=52.101.84.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ox+IXZO/3i0NrPhY3uphHaP4bNpGISvXBQLfgdT17uu2UAGirGIsf14ICE6OdLhZOY9VNsCSe5UuVJK3j/qnbWQYiawkqBujhV8kFQlI9pC1+3rI0yZ6T4Mz50v60G2A4pkQhRbTYB6sZam06H4aCsJMYpn8uRxwwBFKgR3ZKeDC+TWh4BnciasSZXupj8zseb5Q8CZJjC5Kx5RDaj/hxSpucY4C9DAEr/SW/M4WSUQSU3aEczrOg4jsGRhahSTrtJ5FPHV9BS0M9waPh9DAcpCHWAw50NjBOemHFoyFESuLhSTrSWX/+MgoKiPTzWekRv1//HI/vZcW3yDx2+9WjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SdKIhk7U3sLJJE2iThCG5Dd6q29oLaiE8wGlfuAPuAo=;
 b=lx/IpzjFmdscUDRkozD3qdBoAa5+IS+EP/waqAOSsqAJ7f8PQpnroYlOWUpsp1rWYeti2VwLIX4TUPRll9DxvsnVIjF3+8sjPNNs4Pm+xqDm3peY3VlfaVFFSuoMWJwbDZA4boshrJWh68bq09Vis1J9tnmWH6XxnrcBJidAzeP2EjuhIf4RzDAhCCVzKBgTIAyfY+w0OmWExvRi+49k1pHHbhHc9w6DBYzwB+3zm2Kn5OKb7UKLOwCf6Ejg1WtkmWsWlPIR1XoEdTVQiMIPnBM8u9ws412A58e/ftEOjaa7tKFE3d/pzeZZBeFvXHabThExzuDaXHSLWCYAcY3LRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SdKIhk7U3sLJJE2iThCG5Dd6q29oLaiE8wGlfuAPuAo=;
 b=AzLk2tvsNGKOM3ZmAoFShRf44Oux4KYFli/Sz9zG0g+y6c33y/Z4Ge4fKaH499p1uLgJpwh7Wjg0WLIlYj1CRkhWlxusAh0cFCi4+yrIwzoTsom6TZONXj+PTzC8vK7dSfLOTvAShtQ2dDD6OSmq0mCXdNBQ90PpkBFjr2CeoRommRocqYGQtb30RYQGeW6DgbOK3/0KUbMY4lVhz9TAfTLJlBFfszkwowYkupM+4TfEY/BxXc9aqQ5Fif8FiUtkNvdopBVKlAI8SeBnUcBJ+2dOVhW9P2RUdGoWt6Zlp0wPQ9kS2zpCZDxKRKpE33YFDkDX3E9V5V0Asyg9wSf3Pw==
Received: from AS4P250CA0026.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5e3::14)
 by VI0PR10MB8335.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:238::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Thu, 26 Feb
 2026 10:31:26 +0000
Received: from AM3PEPF00009B9B.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e3:cafe::45) by AS4P250CA0026.outlook.office365.com
 (2603:10a6:20b:5e3::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Thu,
 26 Feb 2026 10:31:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF00009B9B.mail.protection.outlook.com (10.167.16.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 10:31:26 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Feb
 2026 11:33:34 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Feb
 2026 11:31:25 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Thu, 26 Feb 2026 11:30:21 +0100
Subject: [PATCH v6 06/12] drivers: bus: add the stm32 debug bus driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260226-debug_bus-v6-6-5d794697798d@foss.st.com>
References: <20260226-debug_bus-v6-0-5d794697798d@foss.st.com>
In-Reply-To: <20260226-debug_bus-v6-0-5d794697798d@foss.st.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan
	<leo.yan@linux.dev>, =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<legoffic.clement@gmail.com>, Linus Walleij <linusw@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, <cristian.marussi@arm.com>,
	<jens.wiklander@linaro.org>, <etienne.carriere@foss.st.com>, Sudeep Holla
	<sudeep.holla@kernel.org>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009B9B:EE_|VI0PR10MB8335:EE_
X-MS-Office365-Filtering-Correlation-Id: b3e80991-0e32-4960-48ea-08de75223246
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	8L+2oe0g64fIbiK91pv4sf+DGiokeG5S3pYcLMdtiumxmN62dMgpPlEUXOp2BSGqvGMrYcHO54dQa9aAbTNN7Umlm6hzAcpq3N7vfjlhC20BPfDA8GsnMyyvMLdY+UYMa6QK7H0clGLsUlvKKfQdtpKIlh1aqsH3Gjf9XplWDr+nV60jb8nhHS7MmQBiCsvCdeXdRk8zofh0YwkIuSDVHUvTyNrmRpjEkggJkZth5tdDXENc49knp9uPFhxIj88z8JvPEeEv2jaic2YdE7kJWUzwOVlwzFaSoA5Ra1oiUXKOYlWLJeRWJ8NZiA15bXc0oF5zt5MiIcQ+O/hCQs+Vwc60fc2cv2HVTQBoCprpF0XwAyHHw8VBGklz06eAkuO41w4O2Yalc5pE1+iM2ZSFXL+xnZ4p9zRwMBE8W7t5U3QasncGCAeBIyK0Gynlfl+UBSB+S30fQdbwiA6uZ6GjOur+bZv5pMS8lrOYHZBJxINc1K/rSTMEXSO+HvkFpcOTBirDzlgx5B7tm2V8AAtxpRby4uRAlW70fNVqB2fK7ojy44yTcQmxnGFOhbUkEJFB217JTvUuV9BYUmgp8UP9PowRaGPxWAmsIlqT2rP7cKdpcjmu2Lo2DsDCOcQJrZy3RHKyaxTRSVKDpsfcfUTGBbU6WlS05UnOc2SEONJ0b3aFpw8XgpjFGsLxwe8bgcFJ031YMq/nW3f5YI8wJ07AR4xopcrWNu+Tav2In+8uB+Y7JKtv1ljNRWGPVzNlBgcUpnlajXi8s7yAV9lHZoDf6GEbPSdAfP243g6Za1PoGUVgrUmJydrtgYXl1mJHEkBqleCpWUc6O9qxQ1wbrOXVgWyMXuMdErZlWbsyS23diIE=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700013)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	i4Z4+UXp0X0pJWUAL1p9IdRuNrQP+2NOSuG3ZxqqFoM1CYd9JeHb5kHwzwO16AEXsqMJ9pWw7BHjBqDzvXdPQL+vKBnqyY4L0zdmaZBLb1TQ3Gn9gr7PKIFr9fyfpD103pLZe/yAahrAmpJBifEgRUW3IverHtAdfNmqIhXEWotG0VwYEE7pSUahX68Om70L25Qgog4vkSv+gnU3kn7Mf/SmUPxe0CFtkPlVjXcnUDA2Cma6t2xH5Ce9/a8fUovqL1ZdYsmHU+fNMTFEQg+oOFojtNoNyUlaaoiwP7t9XyVRGBKtFEBcV3VkSh0fWSXPFkakQg9C4WaDmSS8yej8Kcw08DHTsd+1H6epK+mNNGkpKS4h8bq+1NFL0HAhxFcCddxBi/91QdXglXpuREdYMt8YqFGKVWLFQmYwFIYP/hsFOMmhpa4JFFaUY/jqZiVd
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 10:31:26.5235
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3e80991-0e32-4960-48ea-08de75223246
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009B9B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8335
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32216-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[arm.com,linaro.org,kernel.org,linux.dev,gmail.com,foss.st.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,foss.st.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,st.com:email];
	DKIM_TRACE(0.00)[foss.st.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C71A71A454E
X-Rspamd-Action: no action

Add the stm32 debug bus driver that is responsible of checking the
debug subsystem accessibility before probing the related peripheral
drivers.

This driver is OP-TEE dependent and relies on the STM32 debug access
PTA.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 MAINTAINERS                 |   1 +
 drivers/bus/Kconfig         |  10 ++
 drivers/bus/Makefile        |   1 +
 drivers/bus/stm32_dbg_bus.c | 251 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 263 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 55af015174a5..63f59748d661 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25009,6 +25009,7 @@ F:	drivers/hwmon/pmbus/stef48h28.c
 ST STM32 FIREWALL
 M:	Gatien Chevallier <gatien.chevallier@foss.st.com>
 S:	Maintained
+F:	drivers/bus/stm32_dbg_bus.c
 F:	drivers/bus/stm32_etzpc.c
 F:	drivers/bus/stm32_firewall.c
 F:	drivers/bus/stm32_rifsc.c
diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
index 2a1b46f07080..7a1b04007efb 100644
--- a/drivers/bus/Kconfig
+++ b/drivers/bus/Kconfig
@@ -169,6 +169,16 @@ config QCOM_SSC_BLOCK_BUS
 	  i2c/spi/uart controllers, a hexagon core, and a clock controller
 	  which provides clocks for the above.
 
+config STM32_DBG_BUS
+	tristate "OP-TEE based debug access bus"
+	depends on OPTEE && STM32_FIREWALL
+	depends on ARCH_STM32 || COMPILE_TEST
+	help
+	  Select this to get the support for the OP-TEE based STM32 debug bus
+	  driver that is used to handle debug-related peripherals on STM32
+	  platforms when the debug configuration is not accessible by the
+	  normal world.
+
 config STM32_FIREWALL
 	bool "STM32 Firewall framework"
 	depends on (ARCH_STM32 || COMPILE_TEST) && OF
diff --git a/drivers/bus/Makefile b/drivers/bus/Makefile
index 8e693fe8a03a..799724cfc2df 100644
--- a/drivers/bus/Makefile
+++ b/drivers/bus/Makefile
@@ -27,6 +27,7 @@ obj-$(CONFIG_OMAP_INTERCONNECT)	+= omap_l3_smx.o omap_l3_noc.o
 obj-$(CONFIG_OMAP_OCP2SCP)	+= omap-ocp2scp.o
 obj-$(CONFIG_QCOM_EBI2)		+= qcom-ebi2.o
 obj-$(CONFIG_QCOM_SSC_BLOCK_BUS)	+= qcom-ssc-block-bus.o
+obj-$(CONFIG_STM32_DBG_BUS)	+= stm32_dbg_bus.o
 obj-$(CONFIG_STM32_FIREWALL)	+= stm32_firewall.o stm32_rifsc.o stm32_etzpc.o
 obj-$(CONFIG_SUN50I_DE2_BUS)	+= sun50i-de2.o
 obj-$(CONFIG_SUNXI_RSB)		+= sunxi-rsb.o
diff --git a/drivers/bus/stm32_dbg_bus.c b/drivers/bus/stm32_dbg_bus.c
new file mode 100644
index 000000000000..fe4828d2f223
--- /dev/null
+++ b/drivers/bus/stm32_dbg_bus.c
@@ -0,0 +1,251 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026, STMicroelectronics - All Rights Reserved
+ */
+
+#include <linux/bus/stm32_firewall_device.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/tee_drv.h>
+#include <linux/types.h>
+
+#include "stm32_firewall.h"
+
+enum stm32_dbg_profile {
+	PERIPHERAL_DBG_PROFILE	= 0,
+	HDP_DBG_PROFILE		= 1,
+};
+
+enum stm32_dbg_pta_command {
+	/*
+	 * PTA_CMD_GRANT_DBG_ACCESS - Verify the debug configuration against the given debug profile
+	 * and grant access or not
+	 *
+	 * [in]     value[0].a  Debug profile to grant access to.
+	 */
+	PTA_CMD_GRANT_DBG_ACCESS,
+};
+
+/**
+ * struct stm32_dbg_bus - OP-TEE based STM32 debug bus private data
+ * @dev: STM32 debug bus device.
+ * @ctx: OP-TEE context handler.
+ */
+struct stm32_dbg_bus {
+	struct device *dev;
+	struct tee_context *ctx;
+};
+
+/* Expect at most 1 instance of this driver */
+static struct stm32_dbg_bus *stm32_dbg_bus_priv;
+
+static int stm32_dbg_pta_open_session(u32 *id)
+{
+	struct tee_client_device *dbg_bus_dev = to_tee_client_device(stm32_dbg_bus_priv->dev);
+	struct tee_ioctl_open_session_arg sess_arg;
+	int ret;
+
+	memset(&sess_arg, 0, sizeof(sess_arg));
+	export_uuid(sess_arg.uuid, &dbg_bus_dev->id.uuid);
+	sess_arg.clnt_login = TEE_IOCTL_LOGIN_REE_KERNEL;
+
+	ret = tee_client_open_session(stm32_dbg_bus_priv->ctx, &sess_arg, NULL);
+	if (ret < 0 || sess_arg.ret) {
+		dev_err(stm32_dbg_bus_priv->dev, "Failed opening tee session, err: %#x\n",
+			sess_arg.ret);
+		return -EOPNOTSUPP;
+	}
+
+	*id = sess_arg.session;
+
+	return 0;
+}
+
+static void stm32_dbg_pta_close_session(u32 id)
+{
+	tee_client_close_session(stm32_dbg_bus_priv->ctx, id);
+}
+
+static int stm32_dbg_bus_grant_access(struct stm32_firewall_controller *ctrl, u32 dbg_profile)
+{
+	struct tee_ioctl_invoke_arg inv_arg = {0};
+	struct tee_param param[1] = {0};
+	u32 session_id;
+	int ret;
+
+	if (dbg_profile != PERIPHERAL_DBG_PROFILE && dbg_profile != HDP_DBG_PROFILE)
+		return -EOPNOTSUPP;
+
+	ret = stm32_dbg_pta_open_session(&session_id);
+	if (ret)
+		return ret;
+
+	inv_arg.func = PTA_CMD_GRANT_DBG_ACCESS;
+	inv_arg.session = session_id;
+	inv_arg.num_params = 1;
+	param[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT;
+	param[0].u.value.a = dbg_profile;
+
+	ret = tee_client_invoke_func(stm32_dbg_bus_priv->ctx, &inv_arg, param);
+	if (ret < 0 || inv_arg.ret != 0) {
+		dev_dbg(stm32_dbg_bus_priv->dev,
+			"When invoking function, err %x, TEE returns: %x\n", ret, inv_arg.ret);
+		if (!ret)
+			ret = -EACCES;
+	}
+
+	stm32_dbg_pta_close_session(session_id);
+
+	return ret;
+}
+
+/* Implement mandatory release_access ops even if it does nothing*/
+static void stm32_dbg_bus_release_access(struct stm32_firewall_controller *ctrl, u32 dbg_profile)
+{
+}
+
+static int stm32_dbg_bus_plat_probe(struct platform_device *pdev)
+{
+	struct stm32_firewall_controller *dbg_controller;
+	int ret;
+
+	/* Defer if OP-TEE service is not yet available */
+	if (!stm32_dbg_bus_priv)
+		return -EPROBE_DEFER;
+
+	dbg_controller = devm_kzalloc(&pdev->dev, sizeof(*dbg_controller), GFP_KERNEL);
+	if (!dbg_controller)
+		return dev_err_probe(&pdev->dev, -ENOMEM, "Couldn't allocate debug controller\n");
+
+	dbg_controller->dev = &pdev->dev;
+	dbg_controller->mmio = NULL;
+	dbg_controller->name = dev_driver_string(dbg_controller->dev);
+	dbg_controller->type = STM32_PERIPHERAL_FIREWALL;
+	dbg_controller->grant_access = stm32_dbg_bus_grant_access;
+	dbg_controller->release_access = stm32_dbg_bus_release_access;
+
+	ret = stm32_firewall_controller_register(dbg_controller);
+	if (ret) {
+		dev_err(dbg_controller->dev, "Couldn't register as a firewall controller: %d", ret);
+		return ret;
+	}
+
+	ret = stm32_firewall_populate_bus(dbg_controller);
+	if (ret) {
+		dev_err(dbg_controller->dev, "Couldn't populate debug bus: %d", ret);
+		stm32_firewall_controller_unregister(dbg_controller);
+		return ret;
+	}
+
+	pm_runtime_enable(&pdev->dev);
+
+	ret = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
+	if (ret) {
+		dev_err(dbg_controller->dev, "Couldn't populate the node: %d", ret);
+		stm32_firewall_controller_unregister(dbg_controller);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct of_device_id stm32_dbg_bus_of_match[] = {
+	{ .compatible = "st,stm32mp131-dbg-bus", },
+	{ .compatible = "st,stm32mp151-dbg-bus", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, stm32_dbg_bus_of_match);
+
+static struct platform_driver stm32_dbg_bus_driver = {
+	.probe = stm32_dbg_bus_plat_probe,
+	.driver = {
+		.name = "stm32-dbg-bus",
+		.of_match_table = stm32_dbg_bus_of_match,
+	},
+};
+
+static int optee_ctx_match(struct tee_ioctl_version_data *ver, const void *data)
+{
+	return (ver->impl_id == TEE_IMPL_ID_OPTEE);
+}
+
+static void stm32_dbg_bus_remove(struct tee_client_device *tee_dev)
+{
+	tee_client_close_context(stm32_dbg_bus_priv->ctx);
+	stm32_dbg_bus_priv = NULL;
+
+	of_platform_depopulate(&tee_dev->dev);
+}
+
+static int stm32_dbg_bus_probe(struct tee_client_device *tee_dev)
+{
+	struct device *dev = &tee_dev->dev;
+	struct stm32_dbg_bus *priv;
+	int ret = 0;
+
+	if (stm32_dbg_bus_priv)
+		return dev_err_probe(dev, -EBUSY,
+				     "A STM32 debug bus device is already initialized\n");
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	/* Open context with TEE driver */
+	priv->ctx = tee_client_open_context(NULL, optee_ctx_match, NULL, NULL);
+	if (IS_ERR_OR_NULL(priv->ctx))
+		return dev_err_probe(dev, PTR_ERR_OR_ZERO(priv->ctx), "Cannot open TEE context\n");
+
+	stm32_dbg_bus_priv = priv;
+	stm32_dbg_bus_priv->dev = dev;
+
+	return ret;
+}
+
+static const struct tee_client_device_id optee_dbg_bus_id_table[] = {
+	{UUID_INIT(0xdd05bc8b, 0x9f3b, 0x49f0,
+		   0xb6, 0x49, 0x01, 0xaa, 0x10, 0xc1, 0xc2, 0x10)},
+	{}
+};
+
+static struct tee_client_driver stm32_optee_dbg_bus_driver = {
+	.id_table = optee_dbg_bus_id_table,
+	.probe = stm32_dbg_bus_probe,
+	.remove = stm32_dbg_bus_remove,
+	.driver = {
+		.name = "optee_dbg_bus",
+	},
+};
+
+static void __exit stm32_optee_dbg_bus_driver_exit(void)
+{
+	platform_driver_unregister(&stm32_dbg_bus_driver);
+	tee_client_driver_unregister(&stm32_optee_dbg_bus_driver);
+}
+module_exit(stm32_optee_dbg_bus_driver_exit);
+
+static int __init stm32_optee_dbg_bus_driver_init(void)
+{
+	int err;
+
+	err = tee_client_driver_register(&stm32_optee_dbg_bus_driver);
+	if (err)
+		return err;
+
+	err = platform_driver_register(&stm32_dbg_bus_driver);
+	if (err)
+		tee_client_driver_unregister(&stm32_optee_dbg_bus_driver);
+
+	return err;
+}
+module_init(stm32_optee_dbg_bus_driver_init);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Gatien Chevallier <gatien.chevallier@foss.st.com>");
+MODULE_DESCRIPTION("OP-TEE based STM32 debug access bus driver");

-- 
2.43.0


