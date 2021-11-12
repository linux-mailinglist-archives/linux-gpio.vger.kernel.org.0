Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99D8144E6EF
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Nov 2021 14:02:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234988AbhKLNE6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Nov 2021 08:04:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234881AbhKLNE6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Nov 2021 08:04:58 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ED8BC061766;
        Fri, 12 Nov 2021 05:02:07 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id g191-20020a1c9dc8000000b0032fbf912885so6708168wme.4;
        Fri, 12 Nov 2021 05:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hF+umXotXFTa5Bv/iOmAtQEBR2OcP3HD51gGQe8v93A=;
        b=W+P7nfZgQD/jNQxOOWS6o3PSwya7PZUG1WH4Vwj3x/3c3SkBK0hA1qSQcHm2YXWY6x
         9cVXCrnRaxaaplu/WREedW7KtKJqf08/uWLhds+JUApRTWNHbX+nrBzE0rl4udV3910j
         cWa3OzzHoxHRrpBNqwN70UtrPcrqXpmDr/oo2TB1fJGeLQCzo4Y9QJgBwI1y9K/pVJ3Q
         5492wWvss/wM+7sctiYWSSRjdtce7LXYQXx1F9JaLl/+2vISivC6hMHhEYtuBGNCK81X
         IosIlApydOkLI3fOfRzrzvjSLBDNYIuh8kDWv6I5BbJOX1ZptV2fgs7Fs08wlEAt7K/+
         ResQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hF+umXotXFTa5Bv/iOmAtQEBR2OcP3HD51gGQe8v93A=;
        b=UhXiBPVwpQFt23ifIgDgXLrw4qNWedinKxXDxvKLf4SVWfFlNJFvOel1/2nxF4Catl
         fAhleMZblzAYfreQE3Y79phrkREgYipEiUTheFClYg9oayFvV2I46QuuKwEym7ftgbJn
         6M01bFfjtUqXNzskW9lXW8HVnv/Fx+rXVqHx7N7ycpc1SH145eOguY6PQa87vxNNIBoa
         aP1EH8+G0grZL2TzHGpXF+hHlTVTIuvQcz5QjR7gBQ+YOyYIrcFAf7CiXjs/RH6gGshw
         tlIDect3GgBeR/eVG9WXIIpesOlQVJSx0f/ePWRbLpkKIMxpGZoxF4L0E2Oujn7uXGk9
         5vyA==
X-Gm-Message-State: AOAM531THC2gbNOA0Er3o3OoPFIY3k5MHBbHeYMnKSKvlEnoLLozr/Nu
        ZBmm/BTEfuds1uf8gm9Avi4=
X-Google-Smtp-Source: ABdhPJwTQl8x+lRxwEjUlC2GeK1l9wdo5bcar8GwYB6BJuNTmEc0npznvhkOfI6UtwyI8NWAgq/Hqg==
X-Received: by 2002:a1c:ed03:: with SMTP id l3mr17348979wmh.86.1636722125961;
        Fri, 12 Nov 2021 05:02:05 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id g5sm8941359wri.45.2021.11.12.05.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 05:02:04 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH v2 2/5] dt-bindings: gpio: Add Tegra234 support
Date:   Fri, 12 Nov 2021 14:01:49 +0100
Message-Id: <20211112130152.3682556-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112130152.3682556-1-thierry.reding@gmail.com>
References: <20211112130152.3682556-1-thierry.reding@gmail.com>
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
index fc201df57851..02dfaae0ba1d 100644
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
@@ -150,6 +152,7 @@ allOf:
             enum:
               - nvidia,tegra186-gpio
               - nvidia,tegra194-gpio
+              - nvidia,tegra234-gpio
     then:
       properties:
         interrupts:
@@ -163,6 +166,7 @@ allOf:
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
2.33.1

