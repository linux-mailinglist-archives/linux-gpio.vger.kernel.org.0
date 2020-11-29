Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C70E2C78B4
	for <lists+linux-gpio@lfdr.de>; Sun, 29 Nov 2020 12:09:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727240AbgK2LJD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 29 Nov 2020 06:09:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727181AbgK2LJC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 29 Nov 2020 06:09:02 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B780FC0617A7
        for <linux-gpio@vger.kernel.org>; Sun, 29 Nov 2020 03:08:16 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id y7so8368048pfq.11
        for <linux-gpio@vger.kernel.org>; Sun, 29 Nov 2020 03:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=16VMX6uM7lI5S9V41IUHUt9op6rpkiAjlSaJJsAQ7s8=;
        b=DL4wQJzuGSyc/hlkegBa0pq5K3TU3n2zBMmkXqZ4wM2M99zRp6wSLEP0Poj+cYTgot
         VyPe49qecPtFyiHYDktXNKKkR7I42NfSz276Ns2XVBVZLdaUT+08FpqeX8IXfvNhswNk
         feV5UVSTXChJvtPACKOseztZ8P6hOWLwkHkFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=16VMX6uM7lI5S9V41IUHUt9op6rpkiAjlSaJJsAQ7s8=;
        b=LsTEfjQY0n0Cn68oW6faAcsFpdNmMg6Dc4DgKt637c6dwpKczAxPX1z4phjFjPJCoY
         xr3GRu74QntXDH/sRPYgyN4pnZkNniRS4vvdl2ghdxFabAxYSXi2VKp4G6VepMmRrqwL
         G524D46VwHjMtR1oQaKNQ/mjzSM2Cpma+uPGtQkXVjpKfBl9NJ7MoFFMl2aGuPjQ0Lsg
         gnesy8cVm5fStgbZmR0A+vAktJhpc8maAHwbeHBQvZR5GdaDNssRxX9/281tOHjFB4KA
         dV+sAH4IC5Aaktu1U3dSQM3WmRwdfzfpfkreydOkJiLg5Efu9o+b84Asllz0uCjFKv7X
         Dyrw==
X-Gm-Message-State: AOAM531WWtK+VTNpWUTGjfS1bk6+Ot6fPzRQ9CkIf3E80Km2BYVKLwdl
        XDsxkCAVUUNAQ5TR8qNWULLqMQ==
X-Google-Smtp-Source: ABdhPJyfynF8n9FCKgQOL73Kj9LIi27mnjeS+Z6lGrlpwqVSgrOxcVS6Gp1+3xzUFXP83s4amDBZJA==
X-Received: by 2002:a62:7e4f:0:b029:18c:9322:739b with SMTP id z76-20020a627e4f0000b029018c9322739bmr14216395pfc.7.1606648096288;
        Sun, 29 Nov 2020 03:08:16 -0800 (PST)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp. [118.13.124.123])
        by smtp.googlemail.com with ESMTPSA id 21sm13095653pfw.105.2020.11.29.03.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Nov 2020 03:08:15 -0800 (PST)
From:   Daniel Palmer <daniel@0x0f.com>
To:     soc@kernel.org, linux-gpio@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
        robh@kernel.org, w@1wt.eu, daniel@0x0f.com
Subject: [PATCH v4 1/5] dt-bindings: gpio: Add a binding header for the MSC313 GPIO driver
Date:   Sun, 29 Nov 2020 20:07:58 +0900
Message-Id: <20201129110803.2461700-2-daniel@0x0f.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201129110803.2461700-1-daniel@0x0f.com>
References: <20201129110803.2461700-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Header adds defines for the gpio number of each pad from the driver view.

The gpio block seems to have enough registers for 128 lines but what line
is mapped to a physical pin depends on the chip. The gpio block also seems
to contain some registers that are not related to gpio but needed somewhere
to go.

Because of the above the driver itself uses the index of a pin's offset in
an array of the possible offsets for a chip as the gpio number.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 MAINTAINERS                            |  1 +
 include/dt-bindings/gpio/msc313-gpio.h | 53 ++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 include/dt-bindings/gpio/msc313-gpio.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 2daa6ee673f7..9e7d12b2d403 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2135,6 +2135,7 @@ W:	http://linux-chenxing.org/
 F:	Documentation/devicetree/bindings/arm/mstar/*
 F:	arch/arm/boot/dts/mstar-*
 F:	arch/arm/mach-mstar/
+F:	include/dt-bindings/gpio/msc313-gpio.h
 
 ARM/NEC MOBILEPRO 900/c MACHINE SUPPORT
 M:	Michael Petchkovsky <mkpetch@internode.on.net>
diff --git a/include/dt-bindings/gpio/msc313-gpio.h b/include/dt-bindings/gpio/msc313-gpio.h
new file mode 100644
index 000000000000..2dd56683d3c1
--- /dev/null
+++ b/include/dt-bindings/gpio/msc313-gpio.h
@@ -0,0 +1,53 @@
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
2.29.2

