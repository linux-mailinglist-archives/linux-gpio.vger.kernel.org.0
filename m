Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6439746D9B2
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Dec 2021 18:30:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235008AbhLHReY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Dec 2021 12:34:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233218AbhLHReX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Dec 2021 12:34:23 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 747B2C061746;
        Wed,  8 Dec 2021 09:30:51 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id c4so5315237wrd.9;
        Wed, 08 Dec 2021 09:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SVZdOGZOAPlD+6YyqWVGxIn4/ByLbFt+t1EfFkZKM9w=;
        b=CoDuh5Z9TQ9FrcU9OoIXJNShdxo7TYw6oxjWQt/+NkRMnkXPBIpz5P7rpWaYg+gSuo
         pbw4/csPNTffApdD23Uo3txmMVK3uq+EchflpH6iv+9UZ4q9TuCdN7B816F8jLHptvVI
         aOd6B7K4mSWqZK69LE8sJydgTXMf8H+pql3FJSRRvdf+9Ue/sGPNT3qyytAC+wWlAZ9M
         8Ep0T3UciiurFmIfPmu/G6uG3DhkWTRGizfSlqxh7oztMeVwAp0vvJXZj9R72wptIpgg
         xlDys61A/BmM79+xOZ1KFdjmundnHhc+zJ51LuTXVNwPBFh5NLLelBSwh/dq1pANEeAx
         AleA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SVZdOGZOAPlD+6YyqWVGxIn4/ByLbFt+t1EfFkZKM9w=;
        b=vQOeO5IWWgRk8L1lSo+McWhqU+Fhto2L8Bdqu+nWLG2tZF+57sYXkDJvKVzxsHw+dx
         KTzlxevs+sO5zT5zJx+dNTRDY/JXKJ/7eOEbppHl2LlqUrqTKX7IZPtEn3p9B2MBP7WT
         fS/hWoQRvHWqgNX9ZshUIOVuP/hGm6BOgq7dC+GG8sv/S4Qgs9IPKwCXHqRUwV4a3bf1
         guvykjq4efpgc24CcCnK77koKmI0tQNTLnnP5Ok/FyBocnoLMZXjYGUknfRPF3O7sTg9
         EJetThVW+OHbO5t6kvQQZtP2JzSnInwfEPSMfagPBtxXGl9Aco/ONDbla/E2TMLF6QIK
         EA5A==
X-Gm-Message-State: AOAM533hAi1KdbBzx49uBCbETpUKGyAXLIpCoH0d+vFl4YZqGPwcPh1W
        5O1MtCfkrTCtFfpXimhUCHM=
X-Google-Smtp-Source: ABdhPJyyQg5ajTFdc3VNHlPmyaP8rpVVl6AOR2vs0473Pwh0oeo3Gz4UWCJvou4WpKqpJ8ey2b8DAw==
X-Received: by 2002:a5d:6ac2:: with SMTP id u2mr75494wrw.486.1638984649737;
        Wed, 08 Dec 2021 09:30:49 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id b197sm3259444wmb.24.2021.12.08.09.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 09:30:48 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 1/6] dt-bindings: gpio: tegra: Convert to json-schema
Date:   Wed,  8 Dec 2021 18:30:42 +0100
Message-Id: <20211208173047.558108-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Convert the NVIDIA Tegra GPIO controller device tree bindings from
free-form text format to json-schema.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v3:
- replace unevaluatedProperties with additionalProperties

Changes in v2:
- move GPIO hog definitions into unevaluatedProperties subschema
- remove redundant description of standard properties

 .../bindings/gpio/nvidia,tegra20-gpio.txt     |  40 -------
 .../bindings/gpio/nvidia,tegra20-gpio.yaml    | 111 ++++++++++++++++++
 2 files changed, 111 insertions(+), 40 deletions(-)
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
index 000000000000..dd5d29add699
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/nvidia,tegra20-gpio.yaml
@@ -0,0 +1,111 @@
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
+    $ref: "/schemas/types.yaml#/definitions/uint32"
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

