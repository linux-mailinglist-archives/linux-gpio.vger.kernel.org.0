Return-Path: <linux-gpio+bounces-35150-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uE73EOhF3mnlpwkAu9opvQ
	(envelope-from <linux-gpio+bounces-35150-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2026 15:49:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0743FAB5D
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2026 15:49:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EC0AE3038D0F
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Apr 2026 13:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 317493E63BF;
	Tue, 14 Apr 2026 13:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="QuiPLdj2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11023112.outbound.protection.outlook.com [40.107.201.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C813B22D4E9;
	Tue, 14 Apr 2026 13:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776174538; cv=fail; b=hUGODAlPAKJF6czR+3hcUYxI/2YAx9Wb2ivRYrcfXBrLbfweHUJU+v48mwLELj1mZfTFVqNYgLRAdNAwWkmgiCL8eBEl58Tvjn2denTrKPOlJNBaf5euS/D1mXPNNcuIO54SrwcLFT4jyZBZm/IFmcGec5uu26q84qXwTUlq8fw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776174538; c=relaxed/simple;
	bh=UctPww/5ghi9OTkK+5V0Zebvu20m6X4LR+bptf3MKpc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PQkKbKF9g4MVTDSzd5Cr6osCifUnwd8N9FEipvlXTwGjuNypGpLggpW56voQbyAA6/PptuGbEXSLt4IWkpD5kEgV4jn1tNdBWSlvvF7mZLAf/wot4NOs1DQcldG3TbqSIPcFi4cvQO1M6+TkERPczZcnh4xCq3VvXwHFolK0//U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=QuiPLdj2; arc=fail smtp.client-ip=40.107.201.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k5+pp8jdyChKI+MkGc3kbNZZw7BDewo4RkzmHstwG7l2WtMy1LKQn42bRZFKB8K8xj7DPnddTJEb5caggjUWy9Y/SyDBixdQlFVzKA00jJBcVLSPiO/Uxe1DJZBzk1TjSy9cm4i+E+iCJkoiViS7tumXO5hXVbCJRvn/jOUotFMk6IMU7H3yD/1DdVgDfUFRUqrqqi5uZ4EDxELzRdyEwKsJgLRqsGLhjZjuGzw78gQohXSz4a8V4nEakXiPdNNFMfdN7+xQOQmT9kkRF6OOuvzlrubqP0Seerfx2gbM3cW+wyCuop9/3ps6BadcI7/2G+Uo6Tx1KHjbZ8mNPfvoCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uc0Cc5EnREDYCPbblIwAoMTbAbdhsP2yAQGul9ifjbw=;
 b=QcCBrSKcjhDaF2yQdPQdRgKvVY+qT0/BSHE0LmMQscqmZc89QxvU3xmiH5GtNOUnjyZLlYdgrTZj+B1HV/Pxy/et433iVWj3IRbclQPBvI/okYFjljlcLROw43l4/FrEBTS+uRRqX2sBSlq5/pCl1Fd+En6bHViIaGzyd7IZ1FU6Nlp91P3p8Y6LV4Mylqd4/9G5Bz+kMibhT6/5HYw1S+KsL25be6w+tn2AHnd2424qp8rZ47YNJLdovl5xoERn3u9XQS1NBjHxuQNBMHSSbRYAfzWagJtyec+Ga5NJSTnwZfz4skAvGmN42j6s7FMBUENPgGAXHWfeOEjmhgEnUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uc0Cc5EnREDYCPbblIwAoMTbAbdhsP2yAQGul9ifjbw=;
 b=QuiPLdj2CgHVsub3AUkRVUFQOL2LLsSIC174wuNdXScTMnJGz0u3rxajVJMDXmOT0zfVyO5R+byxvd0Uu+o1HJUL5xUUpP4dhB/9MYKPFF8IEkF1N6SSXyzPU0OzPN7TGEXfUda0DzK8x5gwprb1khxcP62mfrqFx5p5N8qLL7OPpJRwgxp1lBCVbWzqaLF9jxZ6k18C4hAxGYXiXI35tsgaa9s5Z5j7Zb0JnPre6QWTojoMSyYotML04CKpVFB7ULXegh2AtJEgcf/h6vdyjiN2zYIxGpxLUdd/KDjeJIuK2bPeDdRMpiL6JUI9mIqxc+JnFCWt0uwY2crXm9FmYg==
Received: from SJ0PR13CA0136.namprd13.prod.outlook.com (2603:10b6:a03:2c6::21)
 by SA0PR18MB3662.namprd18.prod.outlook.com (2603:10b6:806:9e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 13:48:53 +0000
Received: from SJ5PEPF000001D2.namprd05.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::98) by SJ0PR13CA0136.outlook.office365.com
 (2603:10b6:a03:2c6::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Tue,
 14 Apr 2026 13:48:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194;
 helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (50.233.182.194) by
 SJ5PEPF000001D2.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Tue, 14 Apr 2026 13:48:52 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTP id 77A354186B5A;
	Tue, 14 Apr 2026 06:48:51 -0700 (PDT)
From: Petar Stepanovic <pstepanovic@axiado.com>
Date: Tue, 14 Apr 2026 06:48:33 -0700
Subject: [PATCH 2/3] gpio: axiado: add SGPIO controller support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-axiado-ax3000-sgpio-controller-v1-2-b5c7e4c2e69b@axiado.com>
References: <20260414-axiado-ax3000-sgpio-controller-v1-0-b5c7e4c2e69b@axiado.com>
In-Reply-To: <20260414-axiado-ax3000-sgpio-controller-v1-0-b5c7e4c2e69b@axiado.com>
To: Petar Stepanovic <pstepanovic@axiado.com>, 
 Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>, 
 SriNavmani A <srinavmani@axiado.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776174532; l=21770;
 i=pstepanovic@axiado.com; s=20250916; h=from:subject:message-id;
 bh=UctPww/5ghi9OTkK+5V0Zebvu20m6X4LR+bptf3MKpc=;
 b=GjvMHTV63fcT2rH2/EsmLkSGlEyt/ODexKYpu7hRXLrW50tpgoeQYEchPAHDq5isHu+Qj34Kd
 fHQGES1/oVzDhX1WTUD00Xi6dLFgHpCN0ZuI0vIIcIIvrSfWZRtipiG
X-Developer-Key: i=pstepanovic@axiado.com; a=ed25519;
 pk=70f1UJOGT9U11ZK6o+ENXtv0I5wBE3e+Y9YWODzRsdI=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D2:EE_|SA0PR18MB3662:EE_
X-MS-Office365-Filtering-Correlation-Id: a1e8612c-4e18-47a5-82a4-08de9a2c90ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	mohtETSJD3bExUr0oVWWQkJ0gTgtgdd8+/RiiTKhBLvRQVg9XzK0oTalzai7/o+SAujnj2/QmmEP/U9Spd94QpVvVjuGx2c54WZSVM/SjTY4KiAmYrmCHUvSUm/vRZ0BSLoQbniUBtGzwR7gDuAW8jrVeC5KbmRJ1AVM1SPfAkTfx+p8FM5b+/BFajqbtdTkwkAzizNYdW31JdgxOb/eVPPEYVAW5FPWYV07hrNnp3baTUTXM5riUi/EuHh39U2OGlz3ULGNM3p+HE3OtmkgO193nGH/zykUYcXa7q1BIIKLGROFo1KZIkP3yWRh4W+YZIIhEEUZX1Nfgw/Jo/JGPX3ZdDseKowxE3f3Bf7tlasEjXcINHFB+NEtv6IKDgfVhl1ToTuy3OdwSr1OUabAEv48M+jzLhqxUNqdCA8ze7BZr+ozGjdi/Ajy5FamUI0UTeLlppz0Oqwe61nceb96tUbIqobiR0AyUpb74Dd/qxv+sLzjFhJTcZgQSU7jsTaSn3J+3GODiI7T1VS5yjnlp5lJrGTvb80NQHZ/CFUrqFBOCY3IcxJgQ6EWoIzviLiJmtRE7BGfPxt/angdCEerFZ65vI6D7I4xI8Th/ES/if9CmxNvWLAk2aEHoKbeAOOPuXfahcLx6+s3m8JTXC1XqQIDMIX5+ByKhhFOZ6zfzpq74eGoQP7JOM8ERuDHVekbglpAaEZae+gsmLv37tj5gJzOd0p3tSFT0maIJk4lZg+IPiEKL79llvuGYIU3VrMevQF/DA3Rkw80ysuXkTB2nRTN0RY/p3QWEpUe/YnIfeoHkUidKFhKemNmbUn+0815
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fn8lvT9wBxwH3Filw1jh1vPasAfDmpNoPYXKFkKZPqhaj9FvScHZHUw0rjtMcqx3eR+ioFH2vuQELNakzFuHPhMgaybs61W0ypQL2fj1CgPMbfIwKDM8HUcUIcsvpbqYuRh48vnHdw9MTM2K/J6mqv6R+afFMBx/km6vC0TtHedd7cwqm5H/jiv0BC460EoPYf1z0nApUbVn3zV/6Swkj7m8DcO5bAAW+6OdfR4T18HjC2QcUQ1tXXG7avmFR644kbJLus+jYGr6dRQRlQ7rHotMC8vhuXOgXWfnXMxOdy7ASpSUZbV4nwrsH8nu8I28QqpvAuisvzKwUZ87OSVEh5Ar9/JH4/K5MXsORv/yV2LESf8nrZC41ukrD3drJeodm+shgs9/xuNiyM359D8cGNMxAhr9C3BF4kZmxi8dmr47xVQIB1M3IFTqyBb+jksn
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 13:48:52.9104
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1e8612c-4e18-47a5-82a4-08de9a2c90ab
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR18MB3662
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[axiado.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35150-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[axiado.com:dkim,axiado.com:email,axiado.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[axiado.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[axiado.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pstepanovic@axiado.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EB0743FAB5D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the Axiado SGPIO controller.

The controller provides a serialized interface for GPIOs with
configurable direction and interrupt support.

The driver registers the controller as a gpio_chip and uses
regmap for register access.

Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
---
 drivers/gpio/Kconfig             |  18 +
 drivers/gpio/Makefile            |   1 +
 drivers/gpio/gpio-axiado-sgpio.c | 780 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 799 insertions(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index bd185482a7fd..42c56d157092 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -198,6 +198,24 @@ config GPIO_ATH79
 	  Select this option to enable GPIO driver for
 	  Atheros AR71XX/AR724X/AR913X SoC devices.
 
+config GPIO_AXIADO_SGPIO
+	bool "Axiado SGPIO support"
+	depends on OF_GPIO
+	depends on ARCH_AXIADO || COMPILE_TEST
+	select GPIO_GENERIC
+	select GPIOLIB_IRQCHIP
+	select REGMAP
+	help
+	  Enable support for the Axiado Serial GPIO (SGPIO) controller.
+
+	  The SGPIO controller provides a serialized interface for
+	  controlling multiple GPIO signals over a limited number of
+	  physical lines. It supports configurable data direction and
+	  interrupt handling.
+
+	  This driver integrates with the Linux GPIO subsystem and
+	  exposes the controller as a standard GPIO provider.
+
 config GPIO_RASPBERRYPI_EXP
 	tristate "Raspberry Pi 3 GPIO Expander"
 	default RASPBERRYPI_FIRMWARE
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 2421a8fd3733..909a97551807 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -42,6 +42,7 @@ obj-$(CONFIG_GPIO_ARIZONA)		+= gpio-arizona.o
 obj-$(CONFIG_GPIO_ASPEED)		+= gpio-aspeed.o
 obj-$(CONFIG_GPIO_ASPEED_SGPIO)		+= gpio-aspeed-sgpio.o
 obj-$(CONFIG_GPIO_ATH79)		+= gpio-ath79.o
+obj-$(CONFIG_GPIO_AXIADO_SGPIO)		+= gpio-axiado-sgpio.o
 obj-$(CONFIG_GPIO_BCM_KONA)		+= gpio-bcm-kona.o
 obj-$(CONFIG_GPIO_BCM_XGS_IPROC)	+= gpio-xgs-iproc.o
 obj-$(CONFIG_GPIO_BD71815)		+= gpio-bd71815.o
diff --git a/drivers/gpio/gpio-axiado-sgpio.c b/drivers/gpio/gpio-axiado-sgpio.c
new file mode 100644
index 000000000000..8cd349ec6f53
--- /dev/null
+++ b/drivers/gpio/gpio-axiado-sgpio.c
@@ -0,0 +1,780 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2022-2026 Axiado Corporation
+ */
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/module.h>
+
+#include <linux/platform_device.h>
+#include <linux/io.h>
+#include <linux/spinlock.h>
+
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
+
+#include <linux/gpio/driver.h>
+
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_irq.h>
+
+#include <linux/regmap.h>
+
+struct sgpio_reg_offsets {
+	u32 mux_0;
+	u32 preset_0;
+	u32 count_0;
+	u32 pos_0;
+
+	u32 mux_1;
+	u32 ld;
+	u32 ld_ss;
+
+	u32 preset_1;
+	u32 count_1;
+	u32 pos_1;
+
+	u32 mux_2;
+	u32 dout;
+	u32 dout_ss;
+
+	u32 preset_2;
+	u32 count_2;
+	u32 pos_2;
+
+	u32 mux_3;
+	u32 preset_3;
+	u32 count_3;
+	u32 pos_3;
+
+	u32 mux_4;
+	u32 oe;
+	u32 oe_ss;
+
+	u32 preset_4;
+	u32 count_4;
+	u32 pos_4;
+
+	u32 mask;
+	u32 ctrl_en;
+	u32 ctrl_en_pos;
+
+	u32 din_ss;
+	u32 status;
+};
+
+static const struct sgpio_reg_offsets sgpio_offsets_512 = {
+	.mux_0 = 0x000,
+	.preset_0 = 0x1dc,
+	.count_0 = 0x1f0,
+	.pos_0 = 0x204,
+
+	.mux_1 = 0x004,
+	.ld = 0x014,
+	.ld_ss = 0x0d8,
+
+	.preset_1 = 0x1e0,
+	.count_1 = 0x1f4,
+	.pos_1 = 0x208,
+
+	.mux_2 = 0x008,
+	.dout = 0x054,
+	.dout_ss = 0x158,
+
+	.preset_2 = 0x1e4,
+	.count_2 = 0x1f8,
+	.pos_2 = 0x20c,
+
+	.mux_3 = 0x00c,
+	.preset_3 = 0x1e8,
+	.count_3 = 0x1fc,
+	.pos_3 = 0x210,
+
+	.mux_4 = 0x010,
+	.oe = 0x0d4,
+	.oe_ss = 0x1d8,
+
+	.preset_4 = 0x1ec,
+	.count_4 = 0x200,
+	.pos_4 = 0x214,
+
+	.mask = 0x224,
+	.ctrl_en = 0x218,
+	.ctrl_en_pos = 0x21c,
+
+	.din_ss = 0x198,
+	.status = 0x228,
+};
+
+static const struct sgpio_reg_offsets sgpio_offsets_128 = {
+	.mux_0 = 0x000,
+	.preset_0 = 0x08c,
+	.count_0 = 0x0a0,
+	.pos_0 = 0x0b4,
+
+	.mux_1 = 0x004,
+	.ld = 0x014,
+	.ld_ss = 0x048,
+
+	.preset_1 = 0x090,
+	.count_1 = 0x0a4,
+	.pos_1 = 0x0b8,
+
+	.mux_2 = 0x008,
+	.dout = 0x024,
+	.dout_ss = 0x068,
+
+	.preset_2 = 0x094,
+	.count_2 = 0x0a8,
+	.pos_2 = 0x0bc,
+
+	.mux_3 = 0x00c,
+	.preset_3 = 0x098,
+	.count_3 = 0x0ac,
+	.pos_3 = 0x0c0,
+
+	.mux_4 = 0x010,
+	.oe = 0x044,
+	.oe_ss = 0x088,
+
+	.preset_4 = 0x09c,
+	.count_4 = 0x0b0,
+	.pos_4 = 0x0c4,
+
+	.mask = 0x0d4,
+	.ctrl_en = 0x0c8,
+	.ctrl_en_pos = 0x0cc,
+
+	.din_ss = 0x078,
+	.status = 0x0d8,
+};
+
+#define MAX_SGPIO_PINS 512
+#define MAX_OFFSET_REG 16
+#define MAX_SLICE_COUNT 5
+
+struct ax3000_slice_info {
+	u32 out_mux;
+	u32 sgpio_mux;
+	u32 slice_mux;
+	u32 reg[MAX_OFFSET_REG];
+	u32 reg_ss[MAX_OFFSET_REG];
+	u32 preset;
+	u32 count;
+	u32 pos;
+};
+
+struct ax3000_sgpio {
+	u32 preset_value;
+	u32 count_value;
+	u32 pos_reg;
+	struct ax3000_slice_info
+		slices[MAX_SLICE_COUNT]; /* 0=clk,1=load,2=out,3=in,4=oe */
+	spinlock_t lock;
+	int ngpios;
+	int max_sgpio_pins;
+	int max_offset_regs;
+	struct gpio_chip chip;
+	u32 irq_unmasked[MAX_SGPIO_PINS];
+	int parent_irq;
+	struct regmap *regmap;
+	u32 regmap_base_offset;
+	struct sgpio_reg_offsets *regs;
+};
+
+static int sgpio_set_irq_type(struct irq_data *d, unsigned int type);
+static void sgpio_mask_irq(struct irq_data *d);
+static void sgpio_unmask_irq(struct irq_data *d);
+static void sgpio_irq_shutdown(struct irq_data *d);
+
+static const struct irq_chip axiado_sgpio_irqchip = {
+	.name = "axiado-sgpio",
+	.irq_mask = sgpio_mask_irq,
+	.irq_unmask = sgpio_unmask_irq,
+	.irq_set_type = sgpio_set_irq_type,
+	.irq_shutdown = sgpio_irq_shutdown,
+	.flags = IRQCHIP_IMMUTABLE | IRQCHIP_MASK_ON_SUSPEND,
+};
+
+static void ax3000_sgpio_set(struct gpio_chip *chip, unsigned int offset,
+			     int value)
+{
+	struct ax3000_sgpio *sgpio = gpiochip_get_data(chip);
+	unsigned long flags;
+	u32 bank = (offset / 2) / 32;
+	u32 position = (offset / 2) % 32;
+
+	spin_lock_irqsave(&sgpio->lock, flags);
+	if (value)
+		sgpio->slices[2].reg_ss[bank] |= BIT(position);
+	else
+		sgpio->slices[2].reg_ss[bank] &= ~BIT(position);
+
+	spin_unlock_irqrestore(&sgpio->lock, flags);
+	regmap_write(sgpio->regmap,
+		     sgpio->regmap_base_offset + sgpio->regs->dout_ss +
+			     (bank * 4),
+		     sgpio->slices[2].reg_ss[bank]);
+}
+
+static int ax3000_sgpio_get(struct gpio_chip *chip, unsigned int offset)
+{
+	struct ax3000_sgpio *sgpio = gpiochip_get_data(chip);
+	u32 bank = (offset / 2) / 32;
+	u32 position = (offset / 2) % 32;
+
+	if (offset % 2 == 0)
+		return !!(sgpio->slices[3].reg_ss[bank] & BIT(position));
+	else
+		return !!(sgpio->slices[2].reg_ss[bank] & BIT(position));
+}
+
+static int ax3000_sgpio_dir_in(struct gpio_chip *chip, unsigned int offset)
+{
+	if (!(offset % 2))
+		return 0;
+	else
+		return -EINVAL;
+}
+
+static int ax3000_sgpio_dir_out(struct gpio_chip *chip, unsigned int offset,
+				int value)
+{
+	if (offset % 2) {
+		if (chip->set)
+			chip->set(chip, offset, value);
+		return 0;
+	} else {
+		return -EINVAL;
+	}
+}
+
+static irqreturn_t sgpio_irq_handler(int irq, void *arg)
+{
+	struct ax3000_sgpio *sgpio = (struct ax3000_sgpio *)arg;
+	unsigned long flags;
+	u32 status, new_value;
+	u32 changed_value;
+	int i, bit, reg_ptr;
+
+	/* Read-on-clear (ACK) parent cause */
+	regmap_read(sgpio->regmap,
+		    sgpio->regmap_base_offset + sgpio->regs->status, &status);
+	status >>= 16;
+
+	bool has_shifted_layout = (sgpio->max_offset_regs == MAX_OFFSET_REG);
+
+	reg_ptr = has_shifted_layout ? 16 - DIV_ROUND_UP(sgpio->ngpios, 32) : 0;
+
+	for (i = 0; i < DIV_ROUND_UP(sgpio->ngpios, 32); i++, reg_ptr++) {
+		if (status & BIT(reg_ptr)) {
+			regmap_read(sgpio->regmap,
+				    sgpio->regmap_base_offset +
+					    sgpio->regs->din_ss + (reg_ptr * 4),
+				    &new_value);
+			spin_lock_irqsave(&sgpio->lock, flags);
+			changed_value = sgpio->slices[3].reg_ss[i] ^ new_value;
+			sgpio->slices[3].reg_ss[i] = new_value;
+			spin_unlock_irqrestore(&sgpio->lock, flags);
+
+			while (changed_value) {
+				bit = __ffs(changed_value);
+				changed_value &= ~BIT(bit);
+
+				irq_hw_number_t hwirq = i * 32 + bit;
+
+				if (sgpio->irq_unmasked[hwirq]) {
+					unsigned int child_irq;
+
+					child_irq = irq_find_mapping(sgpio->chip.irq.domain,
+								     hwirq);
+
+					if (child_irq)
+						handle_nested_irq(child_irq);
+				}
+			}
+		}
+	}
+
+	return IRQ_HANDLED;
+}
+
+static void sgpio_hw_init(struct ax3000_sgpio *sgpio)
+{
+	u32 bank;
+	u32 position;
+	int i = 0;
+	bool has_shifted_layout = (sgpio->max_offset_regs == MAX_OFFSET_REG);
+
+	/* slice A0, Clock Pin - 0 */
+	regmap_write(sgpio->regmap,
+		     sgpio->regmap_base_offset + sgpio->regs->mux_0, 0x306);
+	regmap_write(sgpio->regmap,
+		     sgpio->regmap_base_offset + sgpio->regs->preset_0,
+		     sgpio->preset_value);
+	regmap_write(sgpio->regmap,
+		     sgpio->regmap_base_offset + sgpio->regs->count_0,
+		     sgpio->count_value);
+	regmap_write(sgpio->regmap,
+		     sgpio->regmap_base_offset + sgpio->regs->pos_0, 0x1f001f);
+
+	/* Slice B1, Data Load Pin - 1 */
+	bank = (sgpio->ngpios - 1) / 32;
+	position = (sgpio->ngpios - 1) % 32;
+
+	regmap_write(sgpio->regmap,
+		     sgpio->regmap_base_offset + sgpio->regs->mux_1,
+		     has_shifted_layout ? 0x30c : 0x304);
+
+	for (i = 0; i < bank; i++) {
+		regmap_write(sgpio->regmap,
+			     sgpio->regmap_base_offset + sgpio->regs->ld +
+				     (i * 4),
+			     0xffffffff);
+		regmap_write(sgpio->regmap,
+			     sgpio->regmap_base_offset + sgpio->regs->ld_ss +
+				     (i * 4),
+			     0xffffffff);
+	}
+
+	if (position) {
+		u32 val;
+
+		val = sgpio->slices[1].reg_ss[i];
+		val |= GENMASK(position - 1, 0);
+
+		regmap_write(sgpio->regmap,
+			     sgpio->regmap_base_offset + sgpio->regs->ld +
+				     (i * 4),
+			     val);
+		regmap_write(sgpio->regmap,
+			     sgpio->regmap_base_offset + sgpio->regs->ld_ss +
+				     (i * 4),
+			     val);
+	}
+
+	regmap_write(sgpio->regmap,
+		     sgpio->regmap_base_offset + sgpio->regs->preset_1,
+		     sgpio->preset_value);
+	regmap_write(sgpio->regmap,
+		     sgpio->regmap_base_offset + sgpio->regs->count_1,
+		     sgpio->count_value);
+	regmap_write(sgpio->regmap,
+		     sgpio->regmap_base_offset + sgpio->regs->pos_1,
+		     sgpio->pos_reg);
+
+	/* Slice C2, Data Out Pin - 2 */
+	bank = sgpio->ngpios / 32;
+	position = sgpio->ngpios % 32;
+
+	regmap_write(sgpio->regmap,
+		     sgpio->regmap_base_offset + sgpio->regs->mux_2,
+		     has_shifted_layout ? 0x30c : 0x304);
+
+	for (i = 0; i < bank; i++) {
+		regmap_write(sgpio->regmap,
+			     sgpio->regmap_base_offset + sgpio->regs->dout +
+				     (i * 4),
+			     sgpio->slices[2].reg_ss[i]);
+		regmap_write(sgpio->regmap,
+			     sgpio->regmap_base_offset + sgpio->regs->dout_ss +
+				     (i * 4),
+			     sgpio->slices[2].reg_ss[i]);
+	}
+
+	if (position) {
+		regmap_write(sgpio->regmap,
+			     sgpio->regmap_base_offset + sgpio->regs->dout +
+				     (i * 4),
+			     sgpio->slices[2].reg_ss[i]);
+		regmap_write(sgpio->regmap,
+			     sgpio->regmap_base_offset + sgpio->regs->dout_ss +
+				     (i * 4),
+			     sgpio->slices[2].reg_ss[i]);
+	}
+
+	regmap_write(sgpio->regmap,
+		     sgpio->regmap_base_offset + sgpio->regs->preset_2,
+		     sgpio->preset_value);
+	regmap_write(sgpio->regmap,
+		     sgpio->regmap_base_offset + sgpio->regs->count_2,
+		     sgpio->count_value);
+	regmap_write(sgpio->regmap,
+		     sgpio->regmap_base_offset + sgpio->regs->pos_2,
+		     sgpio->pos_reg);
+
+	/* Slice D3, Data In Pin - 3 */
+	regmap_write(sgpio->regmap,
+		     sgpio->regmap_base_offset + sgpio->regs->mux_3, 0x14C);
+	regmap_write(sgpio->regmap,
+		     sgpio->regmap_base_offset + sgpio->regs->preset_3,
+		     sgpio->preset_value);
+	regmap_write(sgpio->regmap,
+		     sgpio->regmap_base_offset + sgpio->regs->count_3,
+		     sgpio->count_value);
+	regmap_write(sgpio->regmap,
+		     sgpio->regmap_base_offset + sgpio->regs->pos_3,
+		     sgpio->pos_reg);
+
+	/* Slice E4, Output Enable for respective pins */
+	regmap_write(sgpio->regmap,
+		     sgpio->regmap_base_offset + sgpio->regs->mux_4,
+		     has_shifted_layout ? 0x10c : 0x104);
+	regmap_write(sgpio->regmap, sgpio->regmap_base_offset + sgpio->regs->oe,
+		     0xffffffff);
+	regmap_write(sgpio->regmap,
+		     sgpio->regmap_base_offset + sgpio->regs->oe_ss,
+		     0xffffffff);
+	regmap_write(sgpio->regmap,
+		     sgpio->regmap_base_offset + sgpio->regs->preset_4,
+		     sgpio->preset_value);
+	regmap_write(sgpio->regmap,
+		     sgpio->regmap_base_offset + sgpio->regs->count_4,
+		     sgpio->count_value);
+	regmap_write(sgpio->regmap,
+		     sgpio->regmap_base_offset + sgpio->regs->pos_4, 0x1f001f);
+
+	regmap_write(sgpio->regmap,
+		     sgpio->regmap_base_offset + sgpio->regs->mask, 0xdfff);
+
+	regmap_write(sgpio->regmap,
+		     sgpio->regmap_base_offset + sgpio->regs->ctrl_en, 0xffff);
+	regmap_write(sgpio->regmap,
+		     sgpio->regmap_base_offset + sgpio->regs->ctrl_en_pos,
+		     0xffff);
+}
+
+static int sgpio_set_irq_type(struct irq_data *d, unsigned int type)
+{
+	switch (type) {
+	case IRQ_TYPE_EDGE_BOTH:
+	case IRQ_TYPE_EDGE_RISING:
+	case IRQ_TYPE_EDGE_FALLING:
+		irq_set_handler_locked(d, handle_edge_irq);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void sgpio_mask_irq(struct irq_data *d)
+{
+	struct gpio_chip *chip;
+	struct ax3000_sgpio *sgpio;
+	u32 irq_num;
+
+	chip = irq_data_get_irq_chip_data(d);
+	if (!chip) {
+		pr_err("Unable to get gpio_chip for IRQ\n");
+		return;
+	}
+
+	sgpio = gpiochip_get_data(chip);
+	if (!sgpio) {
+		pr_err("Unable to get chip data\n");
+		return;
+	}
+
+	irq_num = irqd_to_hwirq(d);
+	sgpio->irq_unmasked[irq_num / 2] = 0;
+}
+
+static void sgpio_unmask_irq(struct irq_data *d)
+{
+	struct gpio_chip *chip;
+	struct ax3000_sgpio *sgpio;
+	u32 irq_num;
+
+	chip = irq_data_get_irq_chip_data(d);
+	if (!chip) {
+		pr_err("Unable to get gpio_chip for IRQ\n");
+		return;
+	}
+
+	sgpio = gpiochip_get_data(chip);
+	if (!sgpio) {
+		pr_err("Unable to get chip data\n");
+		return;
+	}
+
+	irq_num = irqd_to_hwirq(d);
+	sgpio->irq_unmasked[irq_num / 2] = 1;
+}
+
+static void sgpio_irq_shutdown(struct irq_data *d)
+{
+	sgpio_mask_irq(d);
+}
+
+static int sgpio_probe(struct platform_device *pdev)
+{
+	int rc;
+	int irq;
+	int i;
+	const __be32 *prop;
+	struct gpio_irq_chip *girq;
+	struct ax3000_sgpio *sgpio;
+	u32 variant;
+	u32 dout_value;
+	u32 bus_frequency;
+	u32 apb_frequency;
+	int dout_reverse;
+
+	void __iomem *base;
+
+	const struct regmap_config regmap_config = {
+		.reg_bits = 32,
+		.val_bits = 32,
+		.reg_stride = 4,
+	};
+
+	sgpio = devm_kzalloc(&pdev->dev, sizeof(*sgpio), GFP_KERNEL);
+	if (!sgpio)
+		return -ENOMEM;
+
+	spin_lock_init(&sgpio->lock);
+
+	sgpio->regmap = dev_get_regmap(pdev->dev.parent, NULL);
+
+	if (sgpio->regmap) {
+		rc = of_property_read_u32(pdev->dev.of_node, "reg",
+					  &sgpio->regmap_base_offset);
+		if (rc) {
+			dev_err(&pdev->dev, "Failed to read reg property: %d\n",
+				rc);
+			return rc;
+		}
+		dev_info(&pdev->dev, "Using regmap with base offset: 0x%x\n",
+			 sgpio->regmap_base_offset);
+	} else {
+		base = devm_platform_ioremap_resource(pdev, 0);
+		if (IS_ERR(base))
+			return PTR_ERR(base);
+
+		sgpio->regmap =
+			devm_regmap_init_mmio(&pdev->dev, base, &regmap_config);
+
+		if (IS_ERR(sgpio->regmap))
+			return PTR_ERR(sgpio->regmap);
+
+		sgpio->regmap_base_offset = 0;
+
+		dev_info(&pdev->dev, "Using MMIO regmap\n");
+	}
+
+	rc = device_property_read_u32(&pdev->dev, "ngpios", &sgpio->ngpios);
+	if (rc < 0) {
+		dev_err(&pdev->dev, "Could not read ngpios property\n");
+		return -EINVAL;
+	}
+
+	if (device_property_read_u32(&pdev->dev, "design-variant", &variant)) {
+		dev_err(&pdev->dev, "design-variant not specified in DT\n");
+		return -EINVAL;
+	}
+
+	if (variant == 128) {
+		sgpio->regs = &sgpio_offsets_128;
+		sgpio->max_sgpio_pins = 128;
+		sgpio->max_offset_regs = 4;
+	} else if (variant == 512) {
+		sgpio->regs = &sgpio_offsets_512;
+		sgpio->max_sgpio_pins = 512;
+		sgpio->max_offset_regs = 16;
+	} else {
+		return -EINVAL;
+	}
+
+	if (sgpio->ngpios > sgpio->max_sgpio_pins) {
+		dev_err(&pdev->dev, "ngpio is greater than 512 pins\n");
+		return -EINVAL;
+	}
+
+	rc = device_property_read_u32(&pdev->dev, "bus-frequency",
+				      &bus_frequency);
+	if (rc < 0) {
+		dev_err(&pdev->dev, "Could not read bus-frequency property\n");
+		return -EINVAL;
+	}
+
+	rc = device_property_read_u32(&pdev->dev, "apb-frequency",
+				      &apb_frequency);
+	if (rc < 0) {
+		dev_err(&pdev->dev, "Could not read apb-frequency property\n");
+		return -EINVAL;
+	}
+
+	sgpio->preset_value = (apb_frequency / bus_frequency) - 1;
+	sgpio->count_value = sgpio->preset_value;
+
+	u32 pos;
+
+	pos = sgpio->ngpios - 1;
+	sgpio->pos_reg = (pos << 16) | pos;
+
+	prop = of_get_property(pdev->dev.of_node, "dout-init", NULL);
+	if (!prop) {
+		dev_err(&pdev->dev, "Failed to get dout-init\n");
+		return -EINVAL;
+	}
+
+	for (i = 0; i < sgpio->max_offset_regs; i++) {
+		sgpio->slices[2].reg_ss[i] = 0;
+		dout_value = be32_to_cpu(prop[i]);
+
+		for (dout_reverse = 0; dout_reverse < 32; ++dout_reverse) {
+			sgpio->slices[2].reg_ss[i] <<= 1;
+			sgpio->slices[2].reg_ss[i] |= (dout_value & 1);
+			dout_value >>= 1;
+		}
+	}
+
+	sgpio_hw_init(sgpio);
+
+	irq = platform_get_irq(pdev, 0);
+
+	if (irq < 0) {
+		dev_err(&pdev->dev, "Failed to get parent IRQ: %d\n", irq);
+		return irq;
+	}
+	/* Store parent IRQ for cleanup */
+	sgpio->parent_irq = irq;
+
+	rc = devm_request_threaded_irq(&pdev->dev, irq, NULL, sgpio_irq_handler,
+				       IRQF_ONESHOT, "axiado-sgpio", sgpio);
+
+	if (rc < 0) {
+		dev_err(&pdev->dev, "Failed to request threaded IRQ %d: %d\n",
+			irq, rc);
+		return rc;
+	}
+
+	sgpio->chip.parent = &pdev->dev;
+	sgpio->chip.ngpio = sgpio->ngpios * 2;
+	sgpio->chip.owner = THIS_MODULE;
+	sgpio->chip.direction_input = ax3000_sgpio_dir_in;
+	sgpio->chip.direction_output = ax3000_sgpio_dir_out;
+	sgpio->chip.get = ax3000_sgpio_get;
+	sgpio->chip.set = ax3000_sgpio_set;
+	sgpio->chip.label = dev_name(&pdev->dev);
+	sgpio->chip.base = -1;
+
+	girq = &sgpio->chip.irq;
+
+	girq->chip = &axiado_sgpio_irqchip;
+	girq->handler = handle_edge_irq;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->num_parents = 1;
+	girq->parents =
+		devm_kcalloc(&pdev->dev, 1, sizeof(*girq->parents), GFP_KERNEL);
+	if (!girq->parents) {
+		dev_err(&pdev->dev, "Failed to allocate parents array\n");
+		return -ENOMEM;
+	}
+	girq->parents[0] = irq;
+
+	rc = devm_gpiochip_add_data(&pdev->dev, &sgpio->chip, sgpio);
+	if (rc < 0) {
+		dev_err(&pdev->dev, "Could not register gpiochip, %d\n", rc);
+		return rc;
+	}
+
+	/* Store driver data for remove() */
+	platform_set_drvdata(pdev, sgpio);
+	dev_info(&pdev->dev, "SGPIO registered with %d GPIOs\n",
+		 sgpio->chip.ngpio);
+
+	return 0;
+}
+
+static int sgpio_remove(struct platform_device *pdev)
+{
+	struct ax3000_sgpio *sgpio = platform_get_drvdata(pdev);
+	int i;
+
+	if (!sgpio)
+		return 0;
+
+	/* Disable interrupts in hardware */
+	if (sgpio->regs) {
+		regmap_write(sgpio->regmap,
+			     sgpio->regmap_base_offset + sgpio->regs->mask,
+			     0x0);
+		regmap_write(sgpio->regmap,
+			     sgpio->regmap_base_offset + sgpio->regs->ctrl_en,
+			     0x0);
+	}
+
+	/* Disable and synchronize parent IRQ to avoid races with handlers */
+	if (sgpio->parent_irq >= 0) {
+		disable_irq(sgpio->parent_irq);
+		synchronize_irq(sgpio->parent_irq);
+	}
+
+	/* Ensure all GPIO IRQ handlers complete before removal */
+	if (sgpio->chip.irq.domain) {
+		struct irq_domain *domain = sgpio->chip.irq.domain;
+		unsigned int irq;
+		int hwirq;
+
+		for (hwirq = 0; hwirq < sgpio->chip.ngpio; hwirq++) {
+			irq = irq_find_mapping(domain, hwirq);
+			if (irq) {
+				disable_irq(irq);
+				synchronize_irq(irq);
+			}
+		}
+	}
+
+	/* Clear internal IRQ state */
+	for (i = 0; i < sgpio->max_sgpio_pins; i++)
+		sgpio->irq_unmasked[i] = 0;
+
+	return 0;
+}
+
+static const struct of_device_id ax_sgpio_match[] = {
+	{ .compatible = "axiado,sgpio" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, ax_sgpio_match);
+
+static struct platform_driver sgpio_driver = {
+	.driver = {
+		.name = "sgpio",
+		.owner = THIS_MODULE,
+		.of_match_table = ax_sgpio_match,
+	},
+	.probe = sgpio_probe,
+	.remove = sgpio_remove,
+};
+
+static int __init ax_sgpio_init(void)
+{
+	int ret;
+
+	ret = platform_driver_register(&sgpio_driver);
+	if (ret < 0) {
+		pr_err("Failed to register SGPIO driver\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static void __exit ax_sgpio_exit(void)
+{
+	platform_driver_unregister(&sgpio_driver);
+}
+
+module_init(ax_sgpio_init);
+module_exit(ax_sgpio_exit);
+
+MODULE_DESCRIPTION("Axiado Serial GPIO Driver");
+MODULE_AUTHOR("Axiado Corporation");
+MODULE_LICENSE("GPL");

-- 
2.34.1


