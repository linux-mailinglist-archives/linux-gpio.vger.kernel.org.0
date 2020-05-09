Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8582B1CC06C
	for <lists+linux-gpio@lfdr.de>; Sat,  9 May 2020 12:40:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728190AbgEIKk0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 9 May 2020 06:40:26 -0400
Received: from inva021.nxp.com ([92.121.34.21]:44410 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726877AbgEIKkZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 9 May 2020 06:40:25 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 9201B200102;
        Sat,  9 May 2020 12:40:24 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 2638120032A;
        Sat,  9 May 2020 12:40:21 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 7DB0A40297;
        Sat,  9 May 2020 18:40:16 +0800 (SGT)
From:   Hui Song <hui.song_1@nxp.com>
To:     jagdish.gediya@nxp.com, priyanka.jain@nxp.com,
        pramod.kumar_1@nxp.com
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        "hui.song" <hui.song_1@nxp.com>
Subject: [PATCH v1 2/3] armv8: gpio: add gpio feature
Date:   Sat,  9 May 2020 18:35:36 +0800
Message-Id: <20200509103537.22865-2-hui.song_1@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200509103537.22865-1-hui.song_1@nxp.com>
References: <20200509103537.22865-1-hui.song_1@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: "hui.song" <hui.song_1@nxp.com>

add one struct mpc8xxx_gpio_plat to enable gpio feature.

Signed-off-by: hui.song <hui.song_1@nxp.com>
---
 .../include/asm/arch-fsl-layerscape/gpio.h    | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 arch/arm/include/asm/arch-fsl-layerscape/gpio.h

diff --git a/arch/arm/include/asm/arch-fsl-layerscape/gpio.h b/arch/arm/include/asm/arch-fsl-layerscape/gpio.h
new file mode 100644
index 0000000000..d8dd750a72
--- /dev/null
+++ b/arch/arm/include/asm/arch-fsl-layerscape/gpio.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2014 Freescale Semiconductor, Inc.
+ */
+
+/*
+ * Dummy header file to enable CONFIG_OF_CONTROL.
+ * If CONFIG_OF_CONTROL is enabled, lib/fdtdec.c is compiled.
+ * It includes <asm/arch/gpio.h> via <asm/gpio.h>, so those SoCs that enable
+ * OF_CONTROL must have arch/gpio.h.
+ */
+
+#ifndef __ASM_ARCH_MX85XX_GPIO_H
+#define __ASM_ARCH_MX85XX_GPIO_H
+
+struct mpc8xxx_gpio_plat {
+	ulong addr;
+	unsigned long size;
+	uint ngpios;
+};
+
+#endif
-- 
2.17.1

