Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2B8647051B
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Dec 2021 17:02:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238024AbhLJQFv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Dec 2021 11:05:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237714AbhLJQFv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Dec 2021 11:05:51 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E295EC061746;
        Fri, 10 Dec 2021 08:02:15 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id t18so15650258wrg.11;
        Fri, 10 Dec 2021 08:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1OyyurAR1F/Gg0phG0i0bfN/SoVK7akOGswu3zUmpDo=;
        b=mDHxgQQkbfjKzUbZCHoBIHqausLVQsptBnErdWdMLdXQtSAwPfZeRFv3nA+fYr3TN1
         bVrlinO0JmE/JlNxhERDfHElXbZEGEYqOnvDVkVGEI6cnRRpYCn4/K4NvG7FLxuk1G3v
         hWYDL59Umxug0WJOKeGxfPCTY53bbmszIjqHGBx9mLLYgQkLEMVk0Dcy/ri2Ufdkz9/0
         JITjjWHCCbh5FaLRL7q01BjAM8SGUrkkw602dGxAUg8A//TxZZE+16kRDyINc8zpzg8I
         3jxW8T0AyYRk/ZStfIZx0o9dP784BRYGvHpnYd4jNqIMBqi0HFNtpn1cVc0jSfjEwfTW
         rrXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1OyyurAR1F/Gg0phG0i0bfN/SoVK7akOGswu3zUmpDo=;
        b=2Nxrh5bzhuC/tKnkniQlWOAnz9d8esrIJxmVmjKMlBQAnU1D8ggfSAUnQbFucGrGLI
         quuEtGdQKuKEHWqsbUCDXic0ya8xVj/VBD7BWMfIL476WTxye8q3uYfQA2HP5v5QtmX0
         8UnOaAes7H96dh5YIhAN7rJ0TAxFXX9ROyi19X2Wgsp3orS9q7c/PaopBaFpUDAMQDDZ
         aNW0/146bjlnAPm1SZ1R93JXtd22E0752iroklEcEjH5uQWcyYjy5b55U1SERGvsDOWq
         w83poD/7tV8o8gM+4Cw5FghEp6BfG4pIfT2iNMaz7ogbsG9D1gloP30Pbm1UauTM6nlO
         2Bcg==
X-Gm-Message-State: AOAM530ggPv3Io8tfSTyTqtFuGwUFdNm4p8Wd0veSh1Syt4Wik+DS47N
        Vhkal1emKger9Cu/0CbWoNI=
X-Google-Smtp-Source: ABdhPJwTxwex8JNOwB7bbhcagGaebNwQyXBVmR7rcIsvavTWp49rJ1xZHFq9oi5o46a6Bmr3ZGyKTw==
X-Received: by 2002:adf:c605:: with SMTP id n5mr15388277wrg.564.1639152134182;
        Fri, 10 Dec 2021 08:02:14 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id m20sm13224454wmq.11.2021.12.10.08.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 08:02:13 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v4 2/6] dt-bindings: gpio: tegra186: Convert to json-schema
Date:   Fri, 10 Dec 2021 17:02:02 +0100
Message-Id: <20211210160206.872998-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211210160206.872998-1-thierry.reding@gmail.com>
References: <20211210160206.872998-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Convert the Tegra186 GPIO controller device tree bindings from free-form
text format to json-schema.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v4:
- make sure #interrupt-cells is always 2

Changes in v2:
- replace unevaluatedProperties with additionalProperties
- drop redundant description of standard properties
- fix order of entries in the reg property
- fix examples

 .../bindings/gpio/nvidia,tegra186-gpio.txt    | 165 --------------
 .../bindings/gpio/nvidia,tegra186-gpio.yaml   | 210 ++++++++++++++++++
 2 files changed, 210 insertions(+), 165 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.txt b/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.txt
deleted file mode 100644
index adff16c71d21..000000000000
--- a/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.txt
+++ /dev/null
@@ -1,165 +0,0 @@
-NVIDIA Tegra186 GPIO controllers
-
-Tegra186 contains two GPIO controllers; a main controller and an "AON"
-controller. This binding document applies to both controllers. The register
-layouts for the controllers share many similarities, but also some significant
-differences. Hence, this document describes closely related but different
-bindings and compatible values.
-
-The Tegra186 GPIO controller allows software to set the IO direction of, and
-read/write the value of, numerous GPIO signals. Routing of GPIO signals to
-package balls is under the control of a separate pin controller HW block. Two
-major sets of registers exist:
-
-a) Security registers, which allow configuration of allowed access to the GPIO
-register set. These registers exist in a single contiguous block of physical
-address space. The size of this block, and the security features available,
-varies between the different GPIO controllers.
-
-Access to this set of registers is not necessary in all circumstances. Code
-that wishes to configure access to the GPIO registers needs access to these
-registers to do so. Code which simply wishes to read or write GPIO data does not
-need access to these registers.
-
-b) GPIO registers, which allow manipulation of the GPIO signals. In some GPIO
-controllers, these registers are exposed via multiple "physical aliases" in
-address space, each of which access the same underlying state. See the hardware
-documentation for rationale. Any particular GPIO client is expected to access
-just one of these physical aliases.
-
-Tegra HW documentation describes a unified naming convention for all GPIOs
-implemented by the SoC. Each GPIO is assigned to a port, and a port may control
-a number of GPIOs. Thus, each GPIO is named according to an alphabetical port
-name and an integer GPIO name within the port. For example, GPIO_PA0, GPIO_PN6,
-or GPIO_PCC3.
-
-The number of ports implemented by each GPIO controller varies. The number of
-implemented GPIOs within each port varies. GPIO registers within a controller
-are grouped and laid out according to the port they affect.
-
-The mapping from port name to the GPIO controller that implements that port, and
-the mapping from port name to register offset within a controller, are both
-extremely non-linear. The header file <dt-bindings/gpio/tegra186-gpio.h>
-describes the port-level mapping. In that file, the naming convention for ports
-matches the HW documentation. The values chosen for the names are alphabetically
-sorted within a particular controller. Drivers need to map between the DT GPIO
-IDs and HW register offsets using a lookup table.
-
-Each GPIO controller can generate a number of interrupt signals. Each signal
-represents the aggregate status for all GPIOs within a set of ports. Thus, the
-number of interrupt signals generated by a controller varies as a rough function
-of the number of ports it implements. Note that the HW documentation refers to
-both the overall controller HW module and the sets-of-ports as "controllers".
-
-Each GPIO controller in fact generates multiple interrupts signals for each set
-of ports. Each GPIO may be configured to feed into a specific one of the
-interrupt signals generated by a set-of-ports. The intent is for each generated
-signal to be routed to a different CPU, thus allowing different CPUs to each
-handle subsets of the interrupts within a port. The status of each of these
-per-port-set signals is reported via a separate register. Thus, a driver needs
-to know which status register to observe. This binding currently defines no
-configuration mechanism for this. By default, drivers should use register
-GPIO_${port}_INTERRUPT_STATUS_G1_0. Future revisions to the binding could
-define a property to configure this.
-
-Required properties:
-- compatible
-    Array of strings.
-    One of:
-    - "nvidia,tegra186-gpio".
-    - "nvidia,tegra186-gpio-aon".
-    - "nvidia,tegra194-gpio".
-    - "nvidia,tegra194-gpio-aon".
-- reg-names
-    Array of strings.
-    Contains a list of names for the register spaces described by the reg
-    property. May contain the following entries, in any order:
-    - "gpio": Mandatory. GPIO control registers. This may cover either:
-        a) The single physical alias that this OS should use.
-        b) All physical aliases that exist in the controller. This is
-           appropriate when the OS is responsible for managing assignment of
-           the physical aliases.
-    - "security": Optional. Security configuration registers.
-    Users of this binding MUST look up entries in the reg property by name,
-    using this reg-names property to do so.
-- reg
-    Array of (physical base address, length) tuples.
-    Must contain one entry per entry in the reg-names property, in a matching
-    order.
-- interrupts
-    Array of interrupt specifiers.
-    The interrupt outputs from the HW block, one per set of ports, in the
-    order the HW manual describes them. The number of entries required varies
-    depending on compatible value:
-    - "nvidia,tegra186-gpio": 6 entries.
-    - "nvidia,tegra186-gpio-aon": 1 entry.
-    - "nvidia,tegra194-gpio": 6 entries.
-    - "nvidia,tegra194-gpio-aon": 1 entry.
-- gpio-controller
-    Boolean.
-    Marks the device node as a GPIO controller/provider.
-- #gpio-cells
-    Single-cell integer.
-    Must be <2>.
-    Indicates how many cells are used in a consumer's GPIO specifier.
-    In the specifier:
-    - The first cell is the pin number.
-        See <dt-bindings/gpio/tegra186-gpio.h>.
-    - The second cell contains flags:
-        - Bit 0 specifies polarity
-            - 0: Active-high (normal).
-            - 1: Active-low (inverted).
-- interrupt-controller
-    Boolean.
-    Marks the device node as an interrupt controller/provider.
-- #interrupt-cells
-    Single-cell integer.
-    Must be <2>.
-    Indicates how many cells are used in a consumer's interrupt specifier.
-    In the specifier:
-    - The first cell is the GPIO number.
-        See <dt-bindings/gpio/tegra186-gpio.h>.
-    - The second cell is contains flags:
-        - Bits [3:0] indicate trigger type and level:
-            - 1: Low-to-high edge triggered.
-            - 2: High-to-low edge triggered.
-            - 4: Active high level-sensitive.
-            - 8: Active low level-sensitive.
-            Valid combinations are 1, 2, 3, 4, 8.
-
-Example:
-
-#include <dt-bindings/interrupt-controller/irq.h>
-
-gpio@2200000 {
-	compatible = "nvidia,tegra186-gpio";
-	reg-names = "security", "gpio";
-	reg =
-		<0x0 0x2200000 0x0 0x10000>,
-		<0x0 0x2210000 0x0 0x10000>;
-	interrupts =
-		<0 47 IRQ_TYPE_LEVEL_HIGH>,
-		<0 50 IRQ_TYPE_LEVEL_HIGH>,
-		<0 53 IRQ_TYPE_LEVEL_HIGH>,
-		<0 56 IRQ_TYPE_LEVEL_HIGH>,
-		<0 59 IRQ_TYPE_LEVEL_HIGH>,
-		<0 180 IRQ_TYPE_LEVEL_HIGH>;
-	gpio-controller;
-	#gpio-cells = <2>;
-	interrupt-controller;
-	#interrupt-cells = <2>;
-};
-
-gpio@c2f0000 {
-	compatible = "nvidia,tegra186-gpio-aon";
-	reg-names = "security", "gpio";
-	reg =
-		<0x0 0xc2f0000 0x0 0x1000>,
-		<0x0 0xc2f1000 0x0 0x1000>;
-	interrupts =
-		<0 60 IRQ_TYPE_LEVEL_HIGH>;
-	gpio-controller;
-	#gpio-cells = <2>;
-	interrupt-controller;
-	#interrupt-cells = <2>;
-};
diff --git a/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml b/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml
new file mode 100644
index 000000000000..cad05ec682d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/nvidia,tegra186-gpio.yaml
@@ -0,0 +1,210 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/nvidia,tegra186-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra GPIO Controller (Tegra186 and later)
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+description: |
+  Tegra186 contains two GPIO controllers; a main controller and an "AON"
+  controller. This binding document applies to both controllers. The register
+  layouts for the controllers share many similarities, but also some
+  significant differences. Hence, this document describes closely related but
+  different bindings and compatible values.
+
+  The Tegra186 GPIO controller allows software to set the IO direction of,
+  and read/write the value of, numerous GPIO signals. Routing of GPIO signals
+  to package balls is under the control of a separate pin controller hardware
+  block. Two major sets of registers exist:
+
+    a) Security registers, which allow configuration of allowed access to the
+       GPIO register set. These registers exist in a single contiguous block
+       of physical address space. The size of this block, and the security
+       features available, varies between the different GPIO controllers.
+
+       Access to this set of registers is not necessary in all circumstances.
+       Code that wishes to configure access to the GPIO registers needs access
+       to these registers to do so. Code which simply wishes to read or write
+       GPIO data does not need access to these registers.
+
+    b) GPIO registers, which allow manipulation of the GPIO signals. In some
+       GPIO controllers, these registers are exposed via multiple "physical
+       aliases" in address space, each of which access the same underlying
+       state. See the hardware documentation for rationale. Any particular
+       GPIO client is expected to access just one of these physical aliases.
+
+    Tegra HW documentation describes a unified naming convention for all GPIOs
+    implemented by the SoC. Each GPIO is assigned to a port, and a port may
+    control a number of GPIOs. Thus, each GPIO is named according to an
+    alphabetical port name and an integer GPIO name within the port. For
+    example, GPIO_PA0, GPIO_PN6, or GPIO_PCC3.
+
+    The number of ports implemented by each GPIO controller varies. The number
+    of implemented GPIOs within each port varies. GPIO registers within a
+    controller are grouped and laid out according to the port they affect.
+
+    The mapping from port name to the GPIO controller that implements that
+    port, and the mapping from port name to register offset within a
+    controller, are both extremely non-linear. The header file
+    <dt-bindings/gpio/tegra186-gpio.h> describes the port-level mapping. In
+    that file, the naming convention for ports matches the HW documentation.
+    The values chosen for the names are alphabetically sorted within a
+    particular controller. Drivers need to map between the DT GPIO IDs and HW
+    register offsets using a lookup table.
+
+    Each GPIO controller can generate a number of interrupt signals. Each
+    signal represents the aggregate status for all GPIOs within a set of
+    ports. Thus, the number of interrupt signals generated by a controller
+    varies as a rough function of the number of ports it implements. Note
+    that the HW documentation refers to both the overall controller HW
+    module and the sets-of-ports as "controllers".
+
+    Each GPIO controller in fact generates multiple interrupts signals for
+    each set of ports. Each GPIO may be configured to feed into a specific
+    one of the interrupt signals generated by a set-of-ports. The intent is
+    for each generated signal to be routed to a different CPU, thus allowing
+    different CPUs to each handle subsets of the interrupts within a port.
+    The status of each of these per-port-set signals is reported via a
+    separate register. Thus, a driver needs to know which status register to
+    observe. This binding currently defines no configuration mechanism for
+    this. By default, drivers should use register
+    GPIO_${port}_INTERRUPT_STATUS_G1_0. Future revisions to the binding could
+    define a property to configure this.
+
+properties:
+  compatible:
+    enum:
+      - nvidia,tegra186-gpio
+      - nvidia,tegra186-gpio-aon
+      - nvidia,tegra194-gpio
+      - nvidia,tegra194-gpio-aon
+
+  reg-names:
+    items:
+      - const: security
+      - const: gpio
+    minItems: 1
+
+  reg:
+    items:
+      - description: Security configuration registers.
+      - description: |
+          GPIO control registers. This may cover either:
+
+            a) The single physical alias that this OS should use.
+            b) All physical aliases that exist in the controller. This is
+               appropriate when the OS is responsible for managing assignment
+               of the physical aliases.
+    minItems: 1
+
+  interrupts:
+    description: The interrupt outputs from the HW block, one per set of
+      ports, in the order the HW manual describes them. The number of entries
+      required varies depending on compatible value.
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    description: |
+      Indicates how many cells are used in a consumer's GPIO specifier. In the
+      specifier:
+
+        - The first cell is the pin number.
+          See <dt-bindings/gpio/tegra186-gpio.h>.
+        - The second cell contains flags:
+          - Bit 0 specifies polarity
+            - 0: Active-high (normal).
+            - 1: Active-low (inverted).
+    const: 2
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    description: |
+      Indicates how many cells are used in a consumer's interrupt specifier.
+      In the specifier:
+
+        - The first cell is the GPIO number.
+          See <dt-bindings/gpio/tegra186-gpio.h>.
+        - The second cell is contains flags:
+          - Bits [3:0] indicate trigger type and level:
+            - 1: Low-to-high edge triggered.
+            - 2: High-to-low edge triggered.
+            - 4: Active high level-sensitive.
+            - 8: Active low level-sensitive.
+
+            Valid combinations are 1, 2, 3, 4, 8.
+    const: 2
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra186-gpio
+              - nvidia,tegra194-gpio
+    then:
+      properties:
+        interrupts:
+          minItems: 6
+          maxItems: 48
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra186-gpio-aon
+              - nvidia,tegra194-gpio-aon
+    then:
+      properties:
+        interrupts:
+          minItems: 1
+          maxItems: 4
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    gpio@2200000 {
+        compatible = "nvidia,tegra186-gpio";
+        reg-names = "security", "gpio";
+        reg = <0x2200000 0x10000>,
+              <0x2210000 0x10000>;
+        interrupts = <0  47 IRQ_TYPE_LEVEL_HIGH>,
+                     <0  50 IRQ_TYPE_LEVEL_HIGH>,
+                     <0  53 IRQ_TYPE_LEVEL_HIGH>,
+                     <0  56 IRQ_TYPE_LEVEL_HIGH>,
+                     <0  59 IRQ_TYPE_LEVEL_HIGH>,
+                     <0 180 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+    };
+
+    gpio@c2f0000 {
+        compatible = "nvidia,tegra186-gpio-aon";
+        reg-names = "security", "gpio";
+        reg = <0xc2f0000 0x1000>,
+              <0xc2f1000 0x1000>;
+        interrupts = <0 60 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+    };
-- 
2.34.1

