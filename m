Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED1B047051D
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Dec 2021 17:02:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238056AbhLJQFy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Dec 2021 11:05:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237714AbhLJQFx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Dec 2021 11:05:53 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ADADC061746;
        Fri, 10 Dec 2021 08:02:18 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id p3-20020a05600c1d8300b003334fab53afso9347855wms.3;
        Fri, 10 Dec 2021 08:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8661JBJ+Gygsm+U3ildWFkU5nmBWDYGIw5dzAd4+qEI=;
        b=e6LEM04/GooECZ7KPvuXhG7XkQgb5qNU4ypphF3SD0jSdtkl/f2wPKk/1V/vMT4OEK
         xl+JVHvQDAmZ6yotFeYMUCtIGStgFtYs0J4iNvdEYS35Tvqn71e8E/c791ERlerizM6c
         WEGRb+omWSzfoF4NLiYp65gPABFrgrciPubG+E+m2SjUGhZWIiTBSnr2eLlTXUzsblUb
         MqnmG7JdzrivMTb8Mz0IRRvTRz1xo319ilp/VFQq+NGRMiGeSAwppwXOveIexowBZbFo
         rGizZ98uEpI6T0Kyu46CNofFLzkIOFb7ZyF5VndCROio2BAZbxv4HhWRdXlh0gfzVCMt
         NItQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8661JBJ+Gygsm+U3ildWFkU5nmBWDYGIw5dzAd4+qEI=;
        b=RwTNDpQ8YMOBh+u/kiYEBPJX7uoAeM5HTUnrPyD2Be2jMq5uq2TOE/AeQ56h+dXQLp
         UwEkLfjPDJGs6Z0EOB2YwFcMw3dbf5qVHpUsZU6fCziZjH+WW69wRAYYfqfTcklM30bf
         cZN+wu5yTw+GbliK/zbuiJ2A2m7Rsm5oEsA7GFRZhoDyQBCEYUMoXZ4FzHOFKQG3mQMF
         F4qVYQkmXdakJphkxdcfL/C70aT3yVLjjMT1DTZfCnbA2PqI0VTZotRp+35QaFWb+j5Q
         Bx5IytrshlQUw9k7lPX2oRrWp//vTKXddw0haiqboohcbz15W2v7tEZiOSSKMR1wKQRp
         bGwQ==
X-Gm-Message-State: AOAM531Jx0cpjgG7b4e/qr7150bd6J66ILwLeVEV/uu800nxe3EqZy1s
        k00llcyxDLz9zZrdGfJwWKc=
X-Google-Smtp-Source: ABdhPJwTQO3iIuVqJYCgyFxAVVyDM5zK+1GDo5CYDu4G3j5zJA1Z3ZzCRLS2PsOyErgNHIZXS4DpHg==
X-Received: by 2002:a1c:6a0e:: with SMTP id f14mr17557918wmc.58.1639152136697;
        Fri, 10 Dec 2021 08:02:16 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id p13sm12153027wmi.0.2021.12.10.08.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 08:02:15 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v4 3/6] dt-bindings: gpio: Add Tegra234 support
Date:   Fri, 10 Dec 2021 17:02:03 +0100
Message-Id: <20211210160206.872998-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211210160206.872998-1-thierry.reding@gmail.com>
References: <20211210160206.872998-1-thierry.reding@gmail.com>
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
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
[treding@nvidia.com: update device tree bindings]
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../bindings/gpio/nvidia,tegra186-gpio.yaml   |  4 ++
 include/dt-bindings/gpio/tegra234-gpio.h      | 63 +++++++++++++++++++
 2 files changed, 67 insertions(+)
 create mode 100644 include/dt-bindings/gpio/tegra234-gpio.h

diff --git a/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml b/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml
index cad05ec682d4..4ef06b2ff1ff 100644
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
@@ -149,6 +151,7 @@ allOf:
             enum:
               - nvidia,tegra186-gpio
               - nvidia,tegra194-gpio
+              - nvidia,tegra234-gpio
     then:
       properties:
         interrupts:
@@ -162,6 +165,7 @@ allOf:
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

