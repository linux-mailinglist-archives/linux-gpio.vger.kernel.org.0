Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06B8B46D9B9
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Dec 2021 18:30:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237901AbhLHRe3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Dec 2021 12:34:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233218AbhLHRe3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Dec 2021 12:34:29 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC6E1C061746;
        Wed,  8 Dec 2021 09:30:56 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id i5so5374045wrb.2;
        Wed, 08 Dec 2021 09:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q/52o+kc2MtRpGoc1ftGEIAfPJErHeiY54BAoO2W19M=;
        b=XvCDmhfgXKl46EM/TMVCpB2Da5+zxl6FG50TESZ+kTHS/fRnJGtmRSbtXOFDwTL0w6
         xmQC5k2p1qptWlaZ/Qh302jQ6QmXxpCDqTLL/lhMb/MO6F/pO3SizHtRvC6yg8JxHqT5
         2KWjOoTY/8+UPxyEqG3+LEiXXXgyUSXIYClxRmTunDLS8vuarDox0Z1gqcMs4CwB/Wk9
         RngXxgxJ9zFntRpfg58EeqDzeSX84gyltcdElZ/qOJDh9kqWEoDFu2V4O49egUxjLEmC
         UBxrmi+5Sql+vaOUimxYWZQ8/XjF1SJybEAVCebWrifzZcrbN4OY12ggOylYZa76QEeX
         K25A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q/52o+kc2MtRpGoc1ftGEIAfPJErHeiY54BAoO2W19M=;
        b=wew5uvoZQF3VLVbLXrxJUqCRANJh70oTtlRpzFPiQeFX9ymxIdCMO/0Xe12TbgD0Oj
         7Yp/Jm4GQstNig874vdNO/FL5fWAPYpmZs2OCcztuf2LqzlBtOsL79HahkCYvyQ6OAlh
         V2HnWGvqI2KJjnmXFSRbP90AvLuZq9Qjm/7Y5+ywL2+Uar8aT5PMhp7aAfUcVpJgEti5
         gnJIYnyYsD4sY20ejHAvIF+ih9Hov7SmBxlahD+mnAA8nU2UAeHSGNPVC1rezFDw5oMG
         fVnQ6laaoCsOde4TkZpI7ot0IiRbr6sn6gWTOn0bJlfOpG7DypRru1KV2ajg2hPw9usF
         wtdQ==
X-Gm-Message-State: AOAM53310gVWp5WpKbh3WNH2emtFj8GGrnOmjyspro8ZphnInTZIgRr0
        jNpsWXACsp+uaKe3qlJRLiw=
X-Google-Smtp-Source: ABdhPJzv7xyWLFzBvWYa7qYzgoNnc0Wi2a3JnMztiZHuoZLeT/+n0BrfcrhUQV/lrWCN7MgVDKtYng==
X-Received: by 2002:a5d:4f12:: with SMTP id c18mr19712wru.547.1638984655400;
        Wed, 08 Dec 2021 09:30:55 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id r11sm3381983wrw.5.2021.12.08.09.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 09:30:54 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 3/6] dt-bindings: gpio: Add Tegra234 support
Date:   Wed,  8 Dec 2021 18:30:44 +0100
Message-Id: <20211208173047.558108-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211208173047.558108-1-thierry.reding@gmail.com>
References: <20211208173047.558108-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Prathamesh Shete <pshete@nvidia.com>

Extend the existing Tegra186 GPIO controller device tree bindings with
support for the GPIO controller found on Tegra234. The number of pins is
slightly different, but the programming model remains the same.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
[treding@nvidia.com: update device tree bindings]
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../bindings/gpio/nvidia,tegra186-gpio.yaml   |  4 ++
 include/dt-bindings/gpio/tegra234-gpio.h      | 63 +++++++++++++++++++
 2 files changed, 67 insertions(+)
 create mode 100644 include/dt-bindings/gpio/tegra234-gpio.h

diff --git a/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml b/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml
index ad4deb5959fb..be2344344f6b 100644
--- a/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml
@@ -83,6 +83,8 @@ properties:
       - nvidia,tegra186-gpio-aon
       - nvidia,tegra194-gpio
       - nvidia,tegra194-gpio-aon
+      - nvidia,tegra234-gpio
+      - nvidia,tegra234-gpio-aon
 
   reg-names:
     items:
@@ -148,6 +150,7 @@ allOf:
             enum:
               - nvidia,tegra186-gpio
               - nvidia,tegra194-gpio
+              - nvidia,tegra234-gpio
     then:
       properties:
         interrupts:
@@ -161,6 +164,7 @@ allOf:
             enum:
               - nvidia,tegra186-gpio-aon
               - nvidia,tegra194-gpio-aon
+              - nvidia,tegra234-gpio-aon
     then:
       properties:
         interrupts:
diff --git a/include/dt-bindings/gpio/tegra234-gpio.h b/include/dt-bindings/gpio/tegra234-gpio.h
new file mode 100644
index 000000000000..d7a1f2e298e8
--- /dev/null
+++ b/include/dt-bindings/gpio/tegra234-gpio.h
@@ -0,0 +1,63 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2020, NVIDIA CORPORATION. All rights reserved. */
+
+/*
+ * This header provides constants for binding nvidia,tegra234-gpio*.
+ *
+ * The first cell in Tegra's GPIO specifier is the GPIO ID. The macros below
+ * provide names for this.
+ *
+ * The second cell contains standard flag values specified in gpio.h.
+ */
+
+#ifndef _DT_BINDINGS_GPIO_TEGRA234_GPIO_H
+#define _DT_BINDINGS_GPIO_TEGRA234_GPIO_H
+
+#include <dt-bindings/gpio/gpio.h>
+
+/* GPIOs implemented by main GPIO controller */
+#define TEGRA234_MAIN_GPIO_PORT_A   0
+#define TEGRA234_MAIN_GPIO_PORT_B   1
+#define TEGRA234_MAIN_GPIO_PORT_C   2
+#define TEGRA234_MAIN_GPIO_PORT_D   3
+#define TEGRA234_MAIN_GPIO_PORT_E   4
+#define TEGRA234_MAIN_GPIO_PORT_F   5
+#define TEGRA234_MAIN_GPIO_PORT_G   6
+#define TEGRA234_MAIN_GPIO_PORT_H   7
+#define TEGRA234_MAIN_GPIO_PORT_I   8
+#define TEGRA234_MAIN_GPIO_PORT_J   9
+#define TEGRA234_MAIN_GPIO_PORT_K  10
+#define TEGRA234_MAIN_GPIO_PORT_L  11
+#define TEGRA234_MAIN_GPIO_PORT_M  12
+#define TEGRA234_MAIN_GPIO_PORT_N  13
+#define TEGRA234_MAIN_GPIO_PORT_P  14
+#define TEGRA234_MAIN_GPIO_PORT_Q  15
+#define TEGRA234_MAIN_GPIO_PORT_R  16
+#define TEGRA234_MAIN_GPIO_PORT_S  17
+#define TEGRA234_MAIN_GPIO_PORT_T  18
+#define TEGRA234_MAIN_GPIO_PORT_U  19
+#define TEGRA234_MAIN_GPIO_PORT_V  20
+#define TEGRA234_MAIN_GPIO_PORT_X  21
+#define TEGRA234_MAIN_GPIO_PORT_Y  22
+#define TEGRA234_MAIN_GPIO_PORT_Z  23
+#define TEGRA234_MAIN_GPIO_PORT_AC 24
+#define TEGRA234_MAIN_GPIO_PORT_AD 25
+#define TEGRA234_MAIN_GPIO_PORT_AE 26
+#define TEGRA234_MAIN_GPIO_PORT_AF 27
+#define TEGRA234_MAIN_GPIO_PORT_AG 28
+
+#define TEGRA234_MAIN_GPIO(port, offset) \
+	((TEGRA234_MAIN_GPIO_PORT_##port * 8) + offset)
+
+/* GPIOs implemented by AON GPIO controller */
+#define TEGRA234_AON_GPIO_PORT_AA 0
+#define TEGRA234_AON_GPIO_PORT_BB 1
+#define TEGRA234_AON_GPIO_PORT_CC 2
+#define TEGRA234_AON_GPIO_PORT_DD 3
+#define TEGRA234_AON_GPIO_PORT_EE 4
+#define TEGRA234_AON_GPIO_PORT_GG 5
+
+#define TEGRA234_AON_GPIO(port, offset) \
+	((TEGRA234_AON_GPIO_PORT_##port * 8) + offset)
+
+#endif
-- 
2.34.1

