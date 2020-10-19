Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04BB6292909
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Oct 2020 16:10:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729178AbgJSOKV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Oct 2020 10:10:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729155AbgJSOKU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Oct 2020 10:10:20 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D9C1C0613D1
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2020 07:10:19 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id l18so44676pgg.0
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2020 07:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sDf2wpUuzblvqUz0TuYPHYF7CNvy5nJj5wlwfBiA9Cc=;
        b=HpOqAHzYkbFF5EvXP78Au0CjG9EmpOZbfd4X/1c/HTraPCSeMIHRSQcWo05jZ9CqqS
         j8JLSTcuYn9AetcrcKp7ZEHx/FKxpSdNCTR+1Ac0JHwdLTl0RkGInpzLXbHuqmZThNel
         EpONuf9v61dahukEdqkmWKeUsKqQcnUQH4M0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sDf2wpUuzblvqUz0TuYPHYF7CNvy5nJj5wlwfBiA9Cc=;
        b=jBsQgcRxmoF4GLOtPVztGOWm3jOIrvasyxogBrciJNpg+UTkbbgYwsPDnhJMIsJftA
         +SnMJ7kyAJI0/0iFKbO78vX7IjQKAohhpda+14M9FJaYOfWxQtZAA52iG1mZRac5ke4P
         2/ZNTKYpjUfoGyZ9gCoEv6u0vw1YLdbRadB0Ndp8+jkQyElGb5xq9MXpcbmrbAsvci4E
         valL19xzuiBoHi+MDsl6kjmB6BoX+QZGtK1yGrEorHWNcxZYVbKQA5HOba/8RuHdZTHA
         wHp//YRJXNZyTr20GhtncD/rrbHqFw4UXZzG5+xpqmKJ5Ew7FfdOAfoRYezobVFRX8ET
         IUCw==
X-Gm-Message-State: AOAM532itCNDj2CG8a4J8p+ksFVKFH09qa8S9Y4gN3xo7PnEKYvJeVXO
        +esmfgNeHJtRfNh5b2WMj4XCB040A0C7cg==
X-Google-Smtp-Source: ABdhPJzEdWMHwmzuKcel1JcctN9VzFL0wzme9sHn8luNQVG+SQYgKgKwtwMkcc+NBv2dyYE336znmg==
X-Received: by 2002:a63:1e65:: with SMTP id p37mr14684476pgm.131.1603116618537;
        Mon, 19 Oct 2020 07:10:18 -0700 (PDT)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp. [118.13.124.123])
        by smtp.googlemail.com with ESMTPSA id 131sm78999pfy.5.2020.10.19.07.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 07:10:17 -0700 (PDT)
From:   Daniel Palmer <daniel@0x0f.com>
To:     linux-gpio@vger.kernel.org
Cc:     devicetree@vger.kernel.org, arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
        Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH v2 1/5] dt-bindings: gpio: Add a binding header for the MSC313 GPIO driver
Date:   Mon, 19 Oct 2020 23:10:04 +0900
Message-Id: <20201019141008.871177-2-daniel@0x0f.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201019141008.871177-1-daniel@0x0f.com>
References: <20201019141008.871177-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Header adds defines for the gpio number of each pin
from the driver view. The gpio block seems to support 128 lines
but what line is mapped to a physical pin depends on the chip.
The driver itself uses the index of a pin's offset in an array
of the possible offsets for a chip as the gpio number.

The defines remove the need to work out that index to consume
a pin in the device tree.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 MAINTAINERS                            |  1 +
 include/dt-bindings/gpio/msc313-gpio.h | 95 ++++++++++++++++++++++++++
 2 files changed, 96 insertions(+)
 create mode 100644 include/dt-bindings/gpio/msc313-gpio.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 3f345f36c22c..a188fae8c04e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2132,6 +2132,7 @@ W:	http://linux-chenxing.org/
 F:	Documentation/devicetree/bindings/arm/mstar/*
 F:	arch/arm/boot/dts/mstar-*
 F:	arch/arm/mach-mstar/
+F:	include/dt-bindings/gpio/msc313-gpio.h
 
 ARM/NEC MOBILEPRO 900/c MACHINE SUPPORT
 M:	Michael Petchkovsky <mkpetch@internode.on.net>
diff --git a/include/dt-bindings/gpio/msc313-gpio.h b/include/dt-bindings/gpio/msc313-gpio.h
new file mode 100644
index 000000000000..9b8cd6ffb7c4
--- /dev/null
+++ b/include/dt-bindings/gpio/msc313-gpio.h
@@ -0,0 +1,95 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * GPIO definitions for MStar/SigmaStar MSC313 and later SoCs
+ *
+ * Copyright (C) 2020 Daniel Palmer <daniel@thingy.jp>
+ */
+
+#ifndef _DT_BINDINGS_MSC313_GPIO_H
+#define _DT_BINDINGS_MSC313_GPIO_H
+
+/* pin names for fuart, same for all SoCs so far */
+#define MSC313_PINNAME_FUART_RX		"fuart_rx"
+#define MSC313_PINNAME_FUART_TX		"fuart_tx"
+#define MSC313_PINNAME_FUART_CTS	"fuart_cts"
+#define MSC313_PINNAME_FUART_RTS	"fuart_rts"
+
+/* pin names for sr, mercury5 is different */
+#define MSC313_PINNAME_SR_IO2		"sr_io2"
+#define MSC313_PINNAME_SR_IO3		"sr_io3"
+#define MSC313_PINNAME_SR_IO4		"sr_io4"
+#define MSC313_PINNAME_SR_IO5		"sr_io5"
+#define MSC313_PINNAME_SR_IO6		"sr_io6"
+#define MSC313_PINNAME_SR_IO7		"sr_io7"
+#define MSC313_PINNAME_SR_IO8		"sr_io8"
+#define MSC313_PINNAME_SR_IO9		"sr_io9"
+#define MSC313_PINNAME_SR_IO10		"sr_io10"
+#define MSC313_PINNAME_SR_IO11		"sr_io11"
+#define MSC313_PINNAME_SR_IO12		"sr_io12"
+#define MSC313_PINNAME_SR_IO13		"sr_io13"
+#define MSC313_PINNAME_SR_IO14		"sr_io14"
+#define MSC313_PINNAME_SR_IO15		"sr_io15"
+#define MSC313_PINNAME_SR_IO16		"sr_io16"
+#define MSC313_PINNAME_SR_IO17		"sr_io17"
+
+/* pin names for sd, same for all SoCs so far */
+#define MSC313_PINNAME_SD_CLK		"sd_clk"
+#define MSC313_PINNAME_SD_CMD		"sd_cmd"
+#define MSC313_PINNAME_SD_D0		"sd_d0"
+#define MSC313_PINNAME_SD_D1		"sd_d1"
+#define MSC313_PINNAME_SD_D2		"sd_d2"
+#define MSC313_PINNAME_SD_D3		"sd_d3"
+
+/* pin names for i2c1, same for all SoCs so for */
+#define MSC313_PINNAME_I2C1_SCL		"i2c1_scl"
+#define MSC313_PINNAME_I2C1_SCA		"i2c1_sda"
+
+/* pin names for spi0, same for all SoCs so far */
+#define MSC313_PINNAME_SPI0_CZ		"spi0_cz"
+#define MSC313_PINNAME_SPI0_CK		"spi0_ck"
+#define MSC313_PINNAME_SPI0_DI		"spi0_di"
+#define MSC313_PINNAME_SPI0_DO		"spi0_do"
+
+#define MSC313_GPIO_FUART	0
+#define MSC313_GPIO_FUART_RX	(MSC313_GPIO_FUART + 0)
+#define MSC313_GPIO_FUART_TX	(MSC313_GPIO_FUART + 1)
+#define MSC313_GPIO_FUART_CTS	(MSC313_GPIO_FUART + 2)
+#define MSC313_GPIO_FUART_RTS	(MSC313_GPIO_FUART + 3)
+
+#define MSC313_GPIO_SR		(MSC313_GPIO_FUART_RTS + 1)
+#define MSC313_GPIO_SR_IO2	(MSC313_GPIO_SR + 0)
+#define MSC313_GPIO_SR_IO3	(MSC313_GPIO_SR + 1)
+#define MSC313_GPIO_SR_IO4	(MSC313_GPIO_SR + 2)
+#define MSC313_GPIO_SR_IO5	(MSC313_GPIO_SR + 3)
+#define MSC313_GPIO_SR_IO6	(MSC313_GPIO_SR + 4)
+#define MSC313_GPIO_SR_IO7	(MSC313_GPIO_SR + 5)
+#define MSC313_GPIO_SR_IO8	(MSC313_GPIO_SR + 6)
+#define MSC313_GPIO_SR_IO9	(MSC313_GPIO_SR + 7)
+#define MSC313_GPIO_SR_IO10	(MSC313_GPIO_SR + 8)
+#define MSC313_GPIO_SR_IO11	(MSC313_GPIO_SR + 9)
+#define MSC313_GPIO_SR_IO12	(MSC313_GPIO_SR + 10)
+#define MSC313_GPIO_SR_IO13	(MSC313_GPIO_SR + 11)
+#define MSC313_GPIO_SR_IO14	(MSC313_GPIO_SR + 12)
+#define MSC313_GPIO_SR_IO15	(MSC313_GPIO_SR + 13)
+#define MSC313_GPIO_SR_IO16	(MSC313_GPIO_SR + 14)
+#define MSC313_GPIO_SR_IO17	(MSC313_GPIO_SR + 15)
+
+#define MSC313_GPIO_SD		(MSC313_GPIO_SR_IO17 + 1)
+#define MSC313_GPIO_SD_CLK	(MSC313_GPIO_SD + 0)
+#define MSC313_GPIO_SD_CMD	(MSC313_GPIO_SD + 1)
+#define MSC313_GPIO_SD_D0	(MSC313_GPIO_SD + 2)
+#define MSC313_GPIO_SD_D1	(MSC313_GPIO_SD + 3)
+#define MSC313_GPIO_SD_D2	(MSC313_GPIO_SD + 4)
+#define MSC313_GPIO_SD_D3	(MSC313_GPIO_SD + 5)
+
+#define MSC313_GPIO_I2C1	(MSC313_GPIO_SD_D3 + 1)
+#define MSC313_GPIO_I2C1_SCL	(MSC313_GPIO_I2C1 + 0)
+#define MSC313_GPIO_I2C1_SDA	(MSC313_GPIO_I2C1 + 1)
+
+#define MSC313_GPIO_SPI0	(MSC313_GPIO_I2C1_SDA + 1)
+#define MSC313_GPIO_SPI0_CZ	(MSC313_GPIO_SPI0 + 0)
+#define MSC313_GPIO_SPI0_CK	(MSC313_GPIO_SPI0 + 1)
+#define MSC313_GPIO_SPI0_DI	(MSC313_GPIO_SPI0 + 2)
+#define MSC313_GPIO_SPI0_DO	(MSC313_GPIO_SPI0 + 3)
+
+#endif /* _DT_BINDINGS_MSC313_GPIO_H */
-- 
2.28.0

