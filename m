Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95FE72D843F
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Dec 2020 05:10:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438086AbgLLEIp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Dec 2020 23:08:45 -0500
Received: from relay-us1.mymailcheap.com ([51.81.35.219]:42054 "EHLO
        relay-us1.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438088AbgLLEIZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Dec 2020 23:08:25 -0500
Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.248.207])
        by relay-us1.mymailcheap.com (Postfix) with ESMTPS id 2C09C20CCE
        for <linux-gpio@vger.kernel.org>; Sat, 12 Dec 2020 04:07:43 +0000 (UTC)
Received: from relay3.mymailcheap.com (relay3.mymailcheap.com [217.182.66.161])
        by relay5.mymailcheap.com (Postfix) with ESMTPS id 195F4260EB;
        Sat, 12 Dec 2020 04:06:24 +0000 (UTC)
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
        by relay3.mymailcheap.com (Postfix) with ESMTPS id 424FF3F1CC;
        Sat, 12 Dec 2020 05:04:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by filter1.mymailcheap.com (Postfix) with ESMTP id 6D7402A36D;
        Fri, 11 Dec 2020 23:04:51 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1607745891;
        bh=WmDb+uM4073hllkNp+eTnA6s8fc0doHBTnhAEU5xHgw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=yGLo7nsODoiSUB8fPlH2PmdInMHDjfmYvoon+O7Ssn46Zz/opQRVfLb16ASu5a0U7
         sFEh6IwlWlTsN5TpnJpzaTnN99PjYoBgOy2FTKCJobJLxAuvUYA8MOBp8KlCnTGMYR
         nAHiU1o9uGCbPndKLjlBttgVljHVkLORb6JLtdy0=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
        by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id koYpZiTmXclG; Fri, 11 Dec 2020 23:04:49 -0500 (EST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter1.mymailcheap.com (Postfix) with ESMTPS;
        Fri, 11 Dec 2020 23:04:49 -0500 (EST)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
        by mail20.mymailcheap.com (Postfix) with ESMTP id 97A0742F58;
        Sat, 12 Dec 2020 04:04:48 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=aosc.io header.i=@aosc.io header.b="cLV6NLnu";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from ice-e5v2.lan (unknown [59.41.161.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id A6EF042F46;
        Sat, 12 Dec 2020 04:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
        t=1607745885; bh=WmDb+uM4073hllkNp+eTnA6s8fc0doHBTnhAEU5xHgw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cLV6NLnuGnPrjV4ivASJdYofOF/1zAFLej73QA8NTC6En9a9owe6XCoIWJ7rVn8xQ
         s7SujygB6jdLRtiZumYwJdnG4/1TJZWRaZAn8sYvPDgLdziGuqi/ygMFfAE7RRcQ3m
         B4y72zJaOwQY9M8PLLin+FVwjPG2vMMrJ7xi5OHI=
From:   Icenowy Zheng <icenowy@aosc.io>
To:     Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Icenowy Zheng <icenowy@aosc.io>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: [RFC PATCH 05/12] pinctrl: sunxi: add pinctrl driver for V831/V833
Date:   Sat, 12 Dec 2020 12:04:23 +0800
Message-Id: <20201212040430.3640418-2-icenowy@aosc.io>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201212040157.3639864-1-icenowy@aosc.io>
References: <20201212040157.3639864-1-icenowy@aosc.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: mail20.mymailcheap.com
X-Spamd-Result: default: False [6.40 / 20.00];
         ARC_NA(0.00)[];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         R_DKIM_ALLOW(0.00)[aosc.io:s=default];
         RECEIVED_SPAMHAUS_PBL(0.00)[59.41.161.2:received];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         R_MISSING_CHARSET(2.50)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         TAGGED_RCPT(0.00)[dt];
         MIME_GOOD(-0.10)[text/plain];
         BROKEN_CONTENT_TYPE(1.50)[];
         R_SPF_SOFTFAIL(0.00)[~all:c];
         DMARC_NA(0.00)[aosc.io];
         ML_SERVERS(-3.10)[213.133.102.83];
         DKIM_TRACE(0.00)[aosc.io:+];
         RCPT_COUNT_SEVEN(0.00)[10];
         MID_CONTAINS_FROM(1.00)[];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:213.133.96.0/19, country:DE];
         RCVD_COUNT_TWO(0.00)[2];
         SUSPICIOUS_RECIPS(1.50)[];
         HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1]
X-Rspamd-Queue-Id: 97A0742F58
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

V831/V833 are new chips from Allwinner. They're the same die with
different package.

Add a pinctrl driver for them.

The difference between V831/V833 pinctrl is implemented based on the
user manual.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 drivers/pinctrl/sunxi/Kconfig              |   5 +
 drivers/pinctrl/sunxi/Makefile             |   1 +
 drivers/pinctrl/sunxi/pinctrl-sun8i-v83x.c | 743 +++++++++++++++++++++
 drivers/pinctrl/sunxi/pinctrl-sunxi.h      |   2 +
 4 files changed, 751 insertions(+)
 create mode 100644 drivers/pinctrl/sunxi/pinctrl-sun8i-v83x.c

diff --git a/drivers/pinctrl/sunxi/Kconfig b/drivers/pinctrl/sunxi/Kconfig
index 593293584ecc..fc13335a3eda 100644
--- a/drivers/pinctrl/sunxi/Kconfig
+++ b/drivers/pinctrl/sunxi/Kconfig
@@ -73,6 +73,11 @@ config PINCTRL_SUN8I_V3S
 	default MACH_SUN8I
 	select PINCTRL_SUNXI
 
+config PINCTRL_SUN8I_V83X
+	bool "Support for the Allwinner V831/V833 PIO"
+	default MACH_SUN8I
+	select PINCTRL_SUNXI
+
 config PINCTRL_SUN9I_A80
 	bool "Support for the Allwinner A80 PIO"
 	default MACH_SUN9I
diff --git a/drivers/pinctrl/sunxi/Makefile b/drivers/pinctrl/sunxi/Makefile
index 8b7ff0dc3bdf..8bcca109e942 100644
--- a/drivers/pinctrl/sunxi/Makefile
+++ b/drivers/pinctrl/sunxi/Makefile
@@ -20,6 +20,7 @@ obj-$(CONFIG_PINCTRL_SUN8I_A83T_R)	+= pinctrl-sun8i-a83t-r.o
 obj-$(CONFIG_PINCTRL_SUN8I_H3)		+= pinctrl-sun8i-h3.o
 obj-$(CONFIG_PINCTRL_SUN8I_H3_R)	+= pinctrl-sun8i-h3-r.o
 obj-$(CONFIG_PINCTRL_SUN8I_V3S)		+= pinctrl-sun8i-v3s.o
+obj-$(CONFIG_PINCTRL_SUN8I_V83X)	+= pinctrl-sun8i-v83x.o
 obj-$(CONFIG_PINCTRL_SUN50I_H5)		+= pinctrl-sun50i-h5.o
 obj-$(CONFIG_PINCTRL_SUN50I_H6)		+= pinctrl-sun50i-h6.o
 obj-$(CONFIG_PINCTRL_SUN50I_H6_R)	+= pinctrl-sun50i-h6-r.o
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun8i-v83x.c b/drivers/pinctrl/sunxi/pinctrl-sun8i-v83x.c
new file mode 100644
index 000000000000..19d035dcebbf
--- /dev/null
+++ b/drivers/pinctrl/sunxi/pinctrl-sun8i-v83x.c
@@ -0,0 +1,743 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020 Icenowy Zheng <icenowy@aosc.io>
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/pinctrl/pinctrl.h>
+
+#include "pinctrl-sunxi.h"
+
+static const struct sunxi_desc_pin sun8i_v83x_pins[] = {
+	/* Hole */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 0),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION_VARIANT(0x3,
+					 "mmc2",	/* DS */
+					 PINCTRL_SUN8I_V833),
+		  SUNXI_FUNCTION(0x4, "spi0"),		/* CLK */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 0)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 1),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION_VARIANT(0x3,
+					 "mmc2",	/* RST */
+					 PINCTRL_SUN8I_V833),
+		  SUNXI_FUNCTION(0x4, "spi0"),		/* CS0 */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 1)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 2),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION_VARIANT(0x3,
+					 "mmc2",	/* CLK */
+					 PINCTRL_SUN8I_V833),
+		  SUNXI_FUNCTION(0x4, "spi0"),		/* MOSI */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 2)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 3),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION_VARIANT(0x3,
+					 "mmc2",	/* CMD */
+					 PINCTRL_SUN8I_V833),
+		  SUNXI_FUNCTION(0x4, "spi0"),		/* MISO */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 3)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 4),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION_VARIANT(0x3,
+					 "mmc2",	/* WP */
+					 PINCTRL_SUN8I_V833),
+		  SUNXI_FUNCTION(0x4, "spi0"),		/* D3 */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 4)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 5),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION_VARIANT(0x3,
+					 "mmc2",	/* HOLD */
+					 PINCTRL_SUN8I_V833),
+		  SUNXI_FUNCTION(0x4, "spi0"),		/* D4 */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 5)),
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(C, 6),
+			  PINCTRL_SUN8I_V833,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x3, "mmc2"),		/* D0 */
+			  SUNXI_FUNCTION(0x4, "spi0"),		/* CS1 */
+			  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 6)),
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(C, 7),
+			  PINCTRL_SUN8I_V833,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x3, "mmc2"),		/* D5 */
+			  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 7)),
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(C, 8),
+			  PINCTRL_SUN8I_V833,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x3, "mmc2"),		/* D1 */
+			  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 8)),
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(C, 9),
+			  PINCTRL_SUN8I_V833,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x3, "mmc2"),		/* D6 */
+			  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 9)),
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(C, 10),
+			  PINCTRL_SUN8I_V833,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x3, "mmc2"),		/* D2 */
+			  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 10)),
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(C, 11),
+			  PINCTRL_SUN8I_V833,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x3, "mmc2"),		/* D7 */
+			  SUNXI_FUNCTION_IRQ_BANK(0x6, 0, 11)),
+	/* Hole */
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 0),
+			  PINCTRL_SUN8I_V833,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "lcd"),		/* D2 */
+			  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 0)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 1),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "lcd"),		/* D3 */
+		  SUNXI_FUNCTION(0x3, "pwm"),		/* 0 */
+		  SUNXI_FUNCTION(0x4, "vo"),		/* D0 */
+		  SUNXI_FUNCTION(0x5, "emac"),		/* RXD1 */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 1)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 2),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "lcd"),		/* D4 */
+		  SUNXI_FUNCTION(0x3, "pwm"),		/* 1 */
+		  SUNXI_FUNCTION(0x4, "vo"),		/* D1 */
+		  SUNXI_FUNCTION(0x5, "emac"),		/* RXD0 */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 2)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 3),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "lcd"),		/* D5 */
+		  SUNXI_FUNCTION(0x3, "pwm"),		/* 2 */
+		  SUNXI_FUNCTION(0x4, "vo"),		/* D2 */
+		  SUNXI_FUNCTION(0x5, "emac"),		/* CRS_DV */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 3)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 4),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "lcd"),		/* D6 */
+		  SUNXI_FUNCTION(0x3, "pwm"),		/* 3 */
+		  SUNXI_FUNCTION(0x4, "vo"),		/* D3 */
+		  SUNXI_FUNCTION(0x5, "emac"),		/* RXER */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 4)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 5),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "lcd"),		/* D7 */
+		  SUNXI_FUNCTION(0x3, "pwm"),		/* 4 */
+		  SUNXI_FUNCTION(0x4, "vo"),		/* D4 */
+		  SUNXI_FUNCTION(0x5, "emac"),		/* TXD1 */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 5)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 6),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "lcd"),		/* D10 */
+		  SUNXI_FUNCTION(0x3, "pwm"),		/* 5 */
+		  SUNXI_FUNCTION(0x4, "vo"),		/* D5 */
+		  SUNXI_FUNCTION(0x5, "emac"),		/* TXD0 */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 6)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 7),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "lcd"),		/* D11 */
+		  SUNXI_FUNCTION(0x3, "pwm"),		/* 6 */
+		  SUNXI_FUNCTION(0x4, "vo"),		/* D6 */
+		  SUNXI_FUNCTION(0x5, "emac"),		/* TXCK */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 7)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 8),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "lcd"),		/* D12 */
+		  SUNXI_FUNCTION(0x3, "pwm"),		/* 7 */
+		  SUNXI_FUNCTION(0x4, "vo"),		/* D7 */
+		  SUNXI_FUNCTION(0x5, "emac"),		/* TXEN */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 8)),
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 9),
+			  PINCTRL_SUN8I_V833,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "lcd"),		/* D13 */
+			  SUNXI_FUNCTION(0x3, "pwm"),		/* 8 */
+			  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 9)),
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 10),
+			  PINCTRL_SUN8I_V833,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "lcd"),		/* D14 */
+			  SUNXI_FUNCTION(0x3, "i2s1"),		/* MCLK */
+			  SUNXI_FUNCTION(0x4, "vo"),		/* D8 */
+			  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 10)),
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 11),
+			  PINCTRL_SUN8I_V833,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "lcd"),		/* D15 */
+			  SUNXI_FUNCTION(0x3, "i2s1"),		/* BCLK */
+			  SUNXI_FUNCTION(0x4, "vo"),		/* D9 */
+			  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 11)),
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 12),
+			  PINCTRL_SUN8I_V833,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "lcd"),		/* D18 */
+			  SUNXI_FUNCTION(0x3, "i2s1"),		/* LRCK */
+			  SUNXI_FUNCTION(0x4, "vo"),		/* D10 */
+			  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 12)),
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 13),
+			  PINCTRL_SUN8I_V833,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "lcd"),		/* D19 */
+			  SUNXI_FUNCTION(0x3, "i2s1"),		/* DOUT0 */
+			  SUNXI_FUNCTION(0x4, "vo"),		/* D11 */
+			  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 13)),
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 14),
+			  PINCTRL_SUN8I_V833,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "lcd"),		/* D20 */
+			  SUNXI_FUNCTION(0x3, "i2s1_out"),	/* DOUT1 */
+			  SUNXI_FUNCTION(0x4, "vo"),		/* D11 */
+			  SUNXI_FUNCTION(0x5, "i2s1_in"),	/* DIN1 */
+			  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 14)),
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 15),
+			  PINCTRL_SUN8I_V833,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "lcd"),		/* D21 */
+			  SUNXI_FUNCTION(0x3, "i2s1_out"),	/* DOUT2 */
+			  SUNXI_FUNCTION(0x4, "vo"),		/* D13 */
+			  SUNXI_FUNCTION(0x5, "i2s1_in"),	/* DIN2 */
+			  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 15)),
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 16),
+			  PINCTRL_SUN8I_V833,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "lcd"),		/* D22 */
+			  SUNXI_FUNCTION(0x3, "i2s1_out"),	/* DOUT3 */
+			  SUNXI_FUNCTION(0x4, "vo"),		/* D14 */
+			  SUNXI_FUNCTION(0x5, "i2s1_in"),	/* DIN3 */
+			  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 16)),
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 17),
+			  PINCTRL_SUN8I_V833,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "lcd"),		/* D23 */
+			  SUNXI_FUNCTION(0x3, "i2s1"),		/* DIN0 */
+			  SUNXI_FUNCTION(0x4, "vo"),		/* D15 */
+			  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 17)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 18),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "lcd"),		/* CLK */
+		  SUNXI_FUNCTION(0x4, "vo"),		/* CLK */
+		  SUNXI_FUNCTION(0x5, "emac"),		/* EPHY_25M */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 18)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 19),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "lcd"),		/* DE */
+		  SUNXI_FUNCTION(0x4, "vo"),		/* FIELD */
+		  SUNXI_FUNCTION(0x5, "tcon_trig"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 19)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 20),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "lcd"),		/* HSYNC */
+		  SUNXI_FUNCTION(0x4, "vo"),		/* HSYNC */
+		  SUNXI_FUNCTION(0x5, "emac"),		/* MDC */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 20)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 21),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "lcd"),		/* VSYNC */
+		  SUNXI_FUNCTION(0x4, "vo"),		/* VSYNC */
+		  SUNXI_FUNCTION(0x5, "emac"),		/* MDIO */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 21)),
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(D, 22),
+			  PINCTRL_SUN8I_V833,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "pwm"),		/* 9 */
+			  SUNXI_FUNCTION_IRQ_BANK(0x6, 1, 22)),
+	/* Hole */
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(E, 0),
+			  PINCTRL_SUN8I_V833,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "csi1"),		/* PCLK */
+			  SUNXI_FUNCTION(0x3, "emac"),		/* RXD3 */
+			  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 0)),
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(E, 1),
+			  PINCTRL_SUN8I_V833,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "csi1"),		/* MCLK */
+			  SUNXI_FUNCTION(0x3, "emac"),		/* RXD2 */
+			  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 1)),
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(E, 2),
+			  PINCTRL_SUN8I_V833,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "csi1"),		/* HSYNC */
+			  SUNXI_FUNCTION(0x3, "emac"),		/* RXD1 */
+			  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 2)),
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(E, 3),
+			  PINCTRL_SUN8I_V833,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "csi1"),		/* VSYNC */
+			  SUNXI_FUNCTION(0x3, "emac"),		/* RXD0 */
+			  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 3)),
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(E, 4),
+			  PINCTRL_SUN8I_V833,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "csi1"),		/* D0 */
+			  SUNXI_FUNCTION(0x3, "emac"),		/* RXCK */
+			  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 4)),
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(E, 5),
+			  PINCTRL_SUN8I_V833,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "csi1"),		/* D1 */
+			  SUNXI_FUNCTION(0x3, "emac"),		/* RXCTL */
+			  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 5)),
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(E, 6),
+			  PINCTRL_SUN8I_V833,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "csi1"),		/* D2 */
+			  SUNXI_FUNCTION(0x3, "emac"),		/* CLKIN */
+			  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 6)),
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(E, 7),
+			  PINCTRL_SUN8I_V833,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "csi1"),		/* D3 */
+			  SUNXI_FUNCTION(0x3, "emac"),		/* TXD3 */
+			  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 7)),
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(E, 8),
+			  PINCTRL_SUN8I_V833,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "csi1"),		/* D4 */
+			  SUNXI_FUNCTION(0x3, "emac"),		/* TXD2 */
+			  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 8)),
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(E, 9),
+			  PINCTRL_SUN8I_V833,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "csi1"),		/* D5 */
+			  SUNXI_FUNCTION(0x3, "emac"),		/* TXD1 */
+			  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 9)),
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(E, 10),
+			  PINCTRL_SUN8I_V833,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "csi1"),		/* D6 */
+			  SUNXI_FUNCTION(0x3, "emac"),		/* TXD0 */
+			  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 10)),
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(E, 11),
+			  PINCTRL_SUN8I_V833,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "csi1"),		/* D7 */
+			  SUNXI_FUNCTION(0x3, "emac"),		/* TXCK */
+			  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 11)),
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(E, 12),
+			  PINCTRL_SUN8I_V833,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "csi1"),		/* D8 */
+			  SUNXI_FUNCTION(0x3, "emac"),		/* TXCTL */
+			  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 12)),
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(E, 13),
+			  PINCTRL_SUN8I_V833,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "csi1"),		/* D9 */
+			  SUNXI_FUNCTION(0x3, "emac"),		/* MDC */
+			  SUNXI_FUNCTION(0x5, "i2c1"),		/* SCK */
+			  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 13)),
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(E, 14),
+			  PINCTRL_SUN8I_V833,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "csi1"),		/* D10 */
+			  SUNXI_FUNCTION(0x3, "emac"),		/* MDIO */
+			  SUNXI_FUNCTION(0x5, "i2c1"),		/* SDA */
+			  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 14)),
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(E, 15),
+			  PINCTRL_SUN8I_V833,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "csi1_data"),	/* D11 */
+			  SUNXI_FUNCTION(0x3, "emac"),		/* EPHY_25M */
+			  SUNXI_FUNCTION(0x3, "csi1_field"),
+			  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 15)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 16),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION_VARIANT(0x3,
+					 "lcd",		/* D0 */
+					 PINCTRL_SUN8I_V833),
+		  SUNXI_FUNCTION(0x5, "i2c0"),		/* SCK */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 16)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 17),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION_VARIANT(0x3,
+					 "lcd",		/* D1 */
+					 PINCTRL_SUN8I_V833),
+		  SUNXI_FUNCTION(0x5, "i2c0"),		/* SDA */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 17)),
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(E, 18),
+			  PINCTRL_SUN8I_V833,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "csi1"),		/* D12 */
+			  SUNXI_FUNCTION(0x3, "lcd"),		/* D8 */
+			  SUNXI_FUNCTION(0x4, "spi2"),		/* CLK */
+			  SUNXI_FUNCTION(0x5, "uart2"),		/* TX */
+			  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 18)),
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(E, 19),
+			  PINCTRL_SUN8I_V833,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "csi1"),		/* D13 */
+			  SUNXI_FUNCTION(0x3, "lcd"),		/* D9 */
+			  SUNXI_FUNCTION(0x4, "spi2"),		/* MOSI */
+			  SUNXI_FUNCTION(0x5, "uart2"),		/* RX */
+			  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 19)),
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(E, 20),
+			  PINCTRL_SUN8I_V833,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "csi1"),		/* D14 */
+			  SUNXI_FUNCTION(0x3, "lcd"),		/* D16 */
+			  SUNXI_FUNCTION(0x4, "spi2"),		/* MISO */
+			  SUNXI_FUNCTION(0x5, "uart2"),		/* RTS */
+			  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 20)),
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(E, 21),
+			  PINCTRL_SUN8I_V833,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x2, "csi1"),		/* D15 */
+			  SUNXI_FUNCTION(0x3, "lcd"),		/* D17 */
+			  SUNXI_FUNCTION(0x4, "spi2"),		/* CS0 */
+			  SUNXI_FUNCTION(0x5, "uart2"),		/* CTS */
+			  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 21)),
+	/* Hole */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 0),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "mmc0"),		/* D1 */
+		  SUNXI_FUNCTION(0x3, "jtag"),		/* MS */
+		  SUNXI_FUNCTION(0x5, "cpu_bist0"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 0)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 1),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "mmc0"),		/* D0 */
+		  SUNXI_FUNCTION(0x3, "jtag"),		/* DI */
+		  SUNXI_FUNCTION(0x5, "cpu_bist1"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 1)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 2),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "mmc0"),		/* CLK */
+		  SUNXI_FUNCTION(0x3, "uart0"),		/* TX */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 2)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 3),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "mmc0"),		/* CMD */
+		  SUNXI_FUNCTION(0x3, "jtag"),		/* DO */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 3)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 4),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "mmc0"),		/* D3 */
+		  SUNXI_FUNCTION(0x3, "uart0"),		/* RX */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 4)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 5),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "mmc0"),		/* D2 */
+		  SUNXI_FUNCTION(0x3, "jtag"),		/* CK */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 5)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 6),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 3, 6)),
+	/* Hole */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 0),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "mmc1"),		/* CLK */
+		  SUNXI_FUNCTION(0x5, "uart3"),		/* TX */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 0)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 1),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "mmc1"),		/* CMD */
+		  SUNXI_FUNCTION(0x5, "uart3"),		/* RX */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 1)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 2),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "mmc1"),		/* D0 */
+		  SUNXI_FUNCTION(0x5, "uart3"),		/* CTS */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 2)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 3),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "mmc1"),		/* D1 */
+		  SUNXI_FUNCTION(0x5, "uart3"),		/* RTS */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 3)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 4),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "mmc1"),		/* D2 */
+		  SUNXI_FUNCTION(0x5, "uart1"),		/* RTS */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 4)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 5),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "mmc1"),		/* D3 */
+		  SUNXI_FUNCTION(0x5, "uart1"),		/* CTS */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 5)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 6),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x5, "uart1"),		/* TX */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 6)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 7),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x5, "uart1"),		/* RX */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 4, 7)),
+	/* Hole */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 0),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "pwm"),		/* 0 */
+		  SUNXI_FUNCTION(0x3, "i2s0"),		/* MCLK */
+		  SUNXI_FUNCTION(0x4, "spi1"),		/* CLK */
+		  SUNXI_FUNCTION(0x5, "uart3"),		/* TX */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 5, 0)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 1),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "pwm"),		/* 1 */
+		  SUNXI_FUNCTION(0x3, "i2s0"),		/* BCLK */
+		  SUNXI_FUNCTION(0x4, "spi1"),		/* MOSI */
+		  SUNXI_FUNCTION(0x5, "uart3"),		/* RX */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 5, 1)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 2),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "pwm"),		/* 2 */
+		  SUNXI_FUNCTION(0x3, "i2s0"),		/* LRCK */
+		  SUNXI_FUNCTION(0x4, "spi1"),		/* MISO */
+		  SUNXI_FUNCTION(0x5, "uart3"),		/* CTS */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 5, 2)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 3),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "pwm"),		/* 3 */
+		  SUNXI_FUNCTION(0x3, "i2s0"),		/* DOUT */
+		  SUNXI_FUNCTION(0x4, "spi1"),		/* CS0 */
+		  SUNXI_FUNCTION(0x5, "uart3"),		/* RTS */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 5, 3)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 4),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "pwm"),		/* 4 */
+		  SUNXI_FUNCTION(0x3, "i2s0"),		/* DIN */
+		  SUNXI_FUNCTION(0x4, "spi1"),		/* CS1 */
+		  SUNXI_FUNCTION(0x5, "w1"),
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 5, 4)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 5),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "pwm"),		/* 5 */
+		  SUNXI_FUNCTION(0x3, "emac"),		/* RXD1 */
+		  SUNXI_FUNCTION(0x4, "i2c2"),		/* SCK */
+		  SUNXI_FUNCTION(0x5, "uart2"),		/* TX */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 5, 5)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 6),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "pwm"),		/* 6 */
+		  SUNXI_FUNCTION(0x3, "emac"),		/* RXD0 */
+		  SUNXI_FUNCTION(0x4, "i2c2"),		/* SDA */
+		  SUNXI_FUNCTION(0x5, "uart2"),		/* RX */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 5, 6)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 7),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "pwm"),		/* 7 */
+		  SUNXI_FUNCTION(0x3, "emac"),		/* CRS_DV */
+		  SUNXI_FUNCTION(0x4, "uart0"),		/* TX */
+		  SUNXI_FUNCTION(0x5, "uart2"),		/* RTS */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 5, 7)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 8),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "pwm"),		/* 8 */
+		  SUNXI_FUNCTION(0x3, "emac"),		/* RXER */
+		  SUNXI_FUNCTION(0x4, "uart0"),		/* RX */
+		  SUNXI_FUNCTION(0x5, "uart2"),		/* CTS */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 5, 8)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 9),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "pwm"),		/* 9 */
+		  SUNXI_FUNCTION(0x3, "emac"),		/* TXD1 */
+		  SUNXI_FUNCTION(0x4, "i2c3"),		/* SCK */
+		  SUNXI_FUNCTION(0x5, "uart0"),		/* TX */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 5, 9)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 10),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x3, "emac"),		/* TXD0 */
+		  SUNXI_FUNCTION(0x4, "i2c3"),		/* SDA */
+		  SUNXI_FUNCTION(0x5, "uart0"),		/* RX */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 5, 10)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 11),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "jtag"),		/* MS */
+		  SUNXI_FUNCTION(0x3, "emac"),		/* TXCK */
+		  SUNXI_FUNCTION(0x4, "spi1"),		/* CLK */
+		  SUNXI_FUNCTION(0x5, "i2c2"),		/* SCK */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 5, 11)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 12),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "jtag"),		/* CK */
+		  SUNXI_FUNCTION(0x3, "emac"),		/* TXEN */
+		  SUNXI_FUNCTION(0x4, "spi1"),		/* MOSI */
+		  SUNXI_FUNCTION(0x5, "i2c2"),		/* SDA */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 5, 12)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 13),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "jtag"),		/* DO */
+		  SUNXI_FUNCTION(0x3, "emac"),		/* MDC */
+		  SUNXI_FUNCTION(0x4, "spi1"),		/* MISO */
+		  SUNXI_FUNCTION(0x5, "i2c3"),		/* SCK */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 5, 13)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 14),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "jtag"),		/* DI */
+		  SUNXI_FUNCTION(0x3, "emac"),		/* MDIO */
+		  SUNXI_FUNCTION(0x4, "spi1"),		/* CS0 */
+		  SUNXI_FUNCTION(0x5, "i2c3"),		/* SDA */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 5, 14)),
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(H, 15),
+			  PINCTRL_SUN8I_V833,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x3, "emac"),		/* EPHY_25M */
+			  SUNXI_FUNCTION(0x4, "spi1"),		/* CS1 */
+			  SUNXI_FUNCTION_IRQ_BANK(0x6, 5, 15)),
+	/* Hole */
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 0),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "csi0"),		/* MCLK */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 0)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 1),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "csi0"),		/* SM_HS */
+		  SUNXI_FUNCTION_VARIANT(0x4,
+					 "spi2",	/* CLK */
+					 PINCTRL_SUN8I_V833),
+		  SUNXI_FUNCTION(0x5, "i2c1"),		/* SCK */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 1)),
+	SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 2),
+		  SUNXI_FUNCTION(0x0, "gpio_in"),
+		  SUNXI_FUNCTION(0x1, "gpio_out"),
+		  SUNXI_FUNCTION(0x2, "csi0"),		/* SM_VS */
+		  SUNXI_FUNCTION(0x3, "tcon_trig"),
+		  SUNXI_FUNCTION_VARIANT(0x4,
+					 "spi2",	/* MOSI */
+					 PINCTRL_SUN8I_V833),
+		  SUNXI_FUNCTION(0x5, "i2c1"),		/* SDA */
+		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 2)),
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(I, 3),
+			  PINCTRL_SUN8I_V833,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x4, "spi3"),		/* MISO */
+			  SUNXI_FUNCTION(0x5, "i2c0"),		/* SCK */
+			  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 3)),
+	SUNXI_PIN_VARIANT(SUNXI_PINCTRL_PIN(I, 4),
+			  PINCTRL_SUN8I_V833,
+			  SUNXI_FUNCTION(0x0, "gpio_in"),
+			  SUNXI_FUNCTION(0x1, "gpio_out"),
+			  SUNXI_FUNCTION(0x4, "spi3"),		/* CS0 */
+			  SUNXI_FUNCTION(0x5, "i2c0"),		/* SDA */
+			  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 4)),
+};
+
+static const unsigned int sun8i_v83x_pinctrl_irq_bank_map[] = { 2, 3, 4, 5, 6, 7, 8 };
+
+static const struct sunxi_pinctrl_desc sun8i_v83x_pinctrl_data = {
+	.pins = sun8i_v83x_pins,
+	.npins = ARRAY_SIZE(sun8i_v83x_pins),
+	.irq_banks = 7,
+	.irq_bank_map = sun8i_v83x_pinctrl_irq_bank_map,
+	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
+};
+
+static int sun8i_v83x_pinctrl_probe(struct platform_device *pdev)
+{
+	unsigned long variant = (unsigned long)of_device_get_match_data(&pdev->dev);
+
+	return sunxi_pinctrl_init_with_variant(pdev, &sun8i_v83x_pinctrl_data,
+					       variant);
+}
+
+static const struct of_device_id sun8i_v83x_pinctrl_match[] = {
+	{
+		.compatible = "allwinner,sun8i-v831-pinctrl",
+		.data = (void *)PINCTRL_SUN8I_V831
+	},
+	{
+		.compatible = "allwinner,sun8i-v833-pinctrl",
+		.data = (void *)PINCTRL_SUN8I_V833
+	},
+	{ },
+};
+
+static struct platform_driver sun8i_v83x_pinctrl_driver = {
+	.probe	= sun8i_v83x_pinctrl_probe,
+	.driver	= {
+		.name		= "sun8i-v83x-pinctrl",
+		.of_match_table	= sun8i_v83x_pinctrl_match,
+	},
+};
+builtin_platform_driver(sun8i_v83x_pinctrl_driver);
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index a32bb5bcb754..b3b157dfc510 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -96,6 +96,8 @@
 #define PINCTRL_SUN8I_R40	BIT(8)
 #define PINCTRL_SUN8I_V3	BIT(9)
 #define PINCTRL_SUN8I_V3S	BIT(10)
+#define PINCTRL_SUN8I_V831	BIT(11)
+#define PINCTRL_SUN8I_V833	BIT(12)
 
 #define PIO_POW_MOD_SEL_REG	0x340
 
-- 
2.28.0
