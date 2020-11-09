Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F4002AB801
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 13:18:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729651AbgKIMS3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 07:18:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729656AbgKIMS2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Nov 2020 07:18:28 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5F12C0613D3
        for <linux-gpio@vger.kernel.org>; Mon,  9 Nov 2020 04:18:26 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id x13so7004358pgp.7
        for <linux-gpio@vger.kernel.org>; Mon, 09 Nov 2020 04:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BJndKSj8My/lD4O/+Sp04VAWacA8AAsvTE/T22US8mE=;
        b=es61WEQDXvBAwbtrTXGrIPFFVg54mRQzr2/r4Y5K8y0O9QFX5jXWR0bem2fJai8Ft8
         /HCPTo2YOBTI88TE46yfE0q/TSyMVJ5jEaOVEZGp18KzB1OTQipEYDUXpVd07BT3d0Me
         8AEZsxS4huYBf3SzoXERwWRo3rLLHiswNu7j4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BJndKSj8My/lD4O/+Sp04VAWacA8AAsvTE/T22US8mE=;
        b=c2dJoRAXWNyA8wq0c1VLrYRLxWZioZMnS9EV+nZpquwe2C48sORNxidf4I10qBs9kr
         RJl88hOh/4Z7z8Hl2wXHPbNYp4SMKzNUt7tmgaPTjtgpbaxqPItGZVb7gHqXbPdehbLo
         kG1pErLLvo8HnT5IrGQMkgoaUhC9AU6KuRQblh8EuYah+QSCVa6JQacFCpFXrZ88mqbR
         1Ibq/W9qAKCwNldLoBhckUITd+SnQJ9zC25vnDYupdJSdPIzx2PwCL2Fq4SPPsfKBLYu
         vyh9kbRmD/lHv2qTn5CsylvRkO5sPO+dvcqgLqCcPXaXs85pEpiRlb0TWS43njBhE6DY
         n0Pw==
X-Gm-Message-State: AOAM532lqR6aBNusAAqoE6AyOkFsWTFKCrqLiZ+QbEHuc0iMt7OcaLzS
        EMPZqyL+cIhubKJiMlFB0+DzoQ==
X-Google-Smtp-Source: ABdhPJwhFxAidMBTYaFliqwEcl6vTF7HtAm7p5OhDrlTlcJQD3uuKmEIo19PThFVwl2x53CA/x72YA==
X-Received: by 2002:aa7:91cf:0:b029:18a:9972:1aa9 with SMTP id z15-20020aa791cf0000b029018a99721aa9mr13540279pfa.46.1604924306431;
        Mon, 09 Nov 2020 04:18:26 -0800 (PST)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp. [118.13.124.123])
        by smtp.googlemail.com with ESMTPSA id i123sm11425204pfc.13.2020.11.09.04.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 04:18:26 -0800 (PST)
From:   Daniel Palmer <daniel@0x0f.com>
To:     soc@kernel.org, linux-gpio@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
        maz@kernel.org, w@1wt.eu, Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH v3 1/5] dt-bindings: gpio: Add a binding header for the MSC313 GPIO driver
Date:   Mon,  9 Nov 2020 21:17:27 +0900
Message-Id: <20201109121731.1537580-2-daniel@0x0f.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201109121731.1537580-1-daniel@0x0f.com>
References: <20201109121731.1537580-1-daniel@0x0f.com>
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
---
 MAINTAINERS                            |  1 +
 include/dt-bindings/gpio/msc313-gpio.h | 53 ++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 include/dt-bindings/gpio/msc313-gpio.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 3da6d8c154e4..db9c008a0395 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2133,6 +2133,7 @@ W:	http://linux-chenxing.org/
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

