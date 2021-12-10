Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3947470517
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Dec 2021 17:02:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237946AbhLJQFt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Dec 2021 11:05:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237869AbhLJQFt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Dec 2021 11:05:49 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E814C0617A1;
        Fri, 10 Dec 2021 08:02:14 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id i5so15715373wrb.2;
        Fri, 10 Dec 2021 08:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KDKlrGukJH2S1gvUWpBXSmvjwvcwzS5T4IjVBs77AeQ=;
        b=V+L9iOEOifeUb4oaeCp613u5sQpQvTy9qKRNW7WxJUNJAw7DcKAedMqigHjonXMWpK
         EL4rTpdHJQGKgoAnd/DKMyIMIs0UhHkaLfq9taKgxL8mpbWBSG6uznxoQywtNZkeTakA
         RA9To6Ai/D0w/Vxvd2cVG5q5UElctLRr0CQePH28RZb2fFR8RY02pZ87zhTPuXlp/Eop
         lcPgxe2NlA/+EMRocX3Fgd9a40oRqwq8CXgWQiu+wK0uEv7M4MaJH4LlHrrJ0JkQss7C
         ELdga9GRT/UbJm/TrZcFvk3UEZ+/hUj8RcUMTUlYo2A2ROnRIDPylbwETXSzdKo8yB6u
         TMlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KDKlrGukJH2S1gvUWpBXSmvjwvcwzS5T4IjVBs77AeQ=;
        b=kWivUji6oYshnJ33RB4ykGxCK80PdlnRxuXD4fxFZFoU9KLidtohE1nYiSC88vsL1z
         jzWQcV67z/ucsNouGYQ+G28yth9Bq6TaAbczPJKy1dCDzhkfoGU+WgpzSf4LdijDVKhW
         63tzG6IOqbhdJJz7YzXCLkbiGcU92uhTOHmk7Qza43/w7e/aqxFBftgI/RjvbB9L4Yrn
         FXTBM3nRyt8DYsI2e78Hw/3YnwX7Us/R6CuYbiNABkPy7kKPHeMfICFXTa8p4VOfSccT
         SfUrazlr1E7HlATPqA25QxFqFx014Q+0jeaBFcVgpAVG0fl7Zj/RuHxohvfvc9LN03yg
         rqGQ==
X-Gm-Message-State: AOAM530cPMTHznaFJieYGP3UnjJ8f8v1AIJzJK2VRbXPZ1HD6p46tiPh
        /Ttmpt2z+I5qr/+BkHARA3E=
X-Google-Smtp-Source: ABdhPJyV8RAFU2Zc7EHcsmpH+r0N+C2eal/zofLLffhV8Ixy/+/wzENQo/BBsMs4YMs2GkuT843OVg==
X-Received: by 2002:a5d:4448:: with SMTP id x8mr14467637wrr.508.1639152131430;
        Fri, 10 Dec 2021 08:02:11 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id w17sm2932621wrp.79.2021.12.10.08.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 08:02:10 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v4 1/6] dt-bindings: gpio: tegra: Convert to json-schema
Date:   Fri, 10 Dec 2021 17:02:01 +0100
Message-Id: <20211210160206.872998-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Convert the NVIDIA Tegra GPIO controller device tree bindings from
free-form text format to json-schema.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v4:
- remove redundent type reference for "#gpio-cells"

Changes in v3:
- replace unevaluatedProperties with additionalProperties

Changes in v2:
- move GPIO hog definitions into unevaluatedProperties subschema
- remove redundant description of standard properties

 .../bindings/gpio/nvidia,tegra20-gpio.txt     |  40 -------
 .../bindings/gpio/nvidia,tegra20-gpio.yaml    | 110 ++++++++++++++++++
 2 files changed, 110 insertions(+), 40 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.txt b/Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.txt
deleted file mode 100644
index 023c9526e5f8..000000000000
--- a/Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.txt
+++ /dev/null
@@ -1,40 +0,0 @@
-NVIDIA Tegra GPIO controller
-
-Required properties:
-- compatible : "nvidia,tegra<chip>-gpio"
-- reg : Physical base address and length of the controller's registers.
-- interrupts : The interrupt outputs from the controller. For Tegra20,
-  there should be 7 interrupts specified, and for Tegra30, there should
-  be 8 interrupts specified.
-- #gpio-cells : Should be two. The first cell is the pin number and the
-  second cell is used to specify optional parameters:
-  - bit 0 specifies polarity (0 for normal, 1 for inverted)
-- gpio-controller : Marks the device node as a GPIO controller.
-- #interrupt-cells : Should be 2.
-  The first cell is the GPIO number.
-  The second cell is used to specify flags:
-    bits[3:0] trigger type and level flags:
-      1 = low-to-high edge triggered.
-      2 = high-to-low edge triggered.
-      4 = active high level-sensitive.
-      8 = active low level-sensitive.
-      Valid combinations are 1, 2, 3, 4, 8.
-- interrupt-controller : Marks the device node as an interrupt controller.
-
-Example:
-
-gpio: gpio@6000d000 {
-	compatible = "nvidia,tegra20-gpio";
-	reg = < 0x6000d000 0x1000 >;
-	interrupts = < 0 32 0x04
-		       0 33 0x04
-		       0 34 0x04
-		       0 35 0x04
-		       0 55 0x04
-		       0 87 0x04
-		       0 89 0x04 >;
-	#gpio-cells = <2>;
-	gpio-controller;
-	#interrupt-cells = <2>;
-	interrupt-controller;
-};
diff --git a/Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.yaml b/Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.yaml
new file mode 100644
index 000000000000..94b51749ee76
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/nvidia,tegra20-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra GPIO Controller (Tegra20 - Tegra210)
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - nvidia,tegra20-gpio
+          - nvidia,tegra30-gpio
+
+      - items:
+          - enum:
+              - nvidia,tegra114-gpio
+              - nvidia,tegra124-gpio
+              - nvidia,tegra210-gpio
+          - const: nvidia,tegra30-gpio
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description: The interrupt outputs from the controller. For Tegra20,
+      there should be 7 interrupts specified, and for Tegra30, there should
+      be 8 interrupts specified.
+
+  "#gpio-cells":
+    description: The first cell is the pin number and the second cell is used
+      to specify the GPIO polarity (0 = active high, 1 = active low).
+    const: 2
+
+  gpio-controller: true
+
+  gpio-ranges:
+    maxItems: 1
+
+  "#interrupt-cells":
+    description: |
+      Should be 2. The first cell is the GPIO number. The second cell is
+      used to specify flags:
+
+        bits[3:0] trigger type and level flags:
+          1 = low-to-high edge triggered.
+          2 = high-to-low edge triggered.
+          4 = active high level-sensitive.
+          8 = active low level-sensitive.
+
+      Valid combinations are 1, 2, 3, 4, 8.
+    const: 2
+
+  interrupt-controller: true
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nvidia,tegra30-gpio
+    then:
+      properties:
+        interrupts:
+          minItems: 8
+          maxItems: 8
+    else:
+      properties:
+        interrupts:
+          minItems: 7
+          maxItems: 7
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#gpio-cells"
+  - gpio-controller
+  - "#interrupt-cells"
+  - interrupt-controller
+
+additionalProperties:
+  type: object
+  required:
+    - gpio-hog
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    gpio: gpio@6000d000 {
+        compatible = "nvidia,tegra20-gpio";
+        reg = <0x6000d000 0x1000>;
+        interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
+        #gpio-cells = <2>;
+        gpio-controller;
+        #interrupt-cells = <2>;
+        interrupt-controller;
+    };
-- 
2.34.1

