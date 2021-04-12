Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D038A35D336
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Apr 2021 00:36:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240663AbhDLWgp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Apr 2021 18:36:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240461AbhDLWgp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Apr 2021 18:36:45 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F5F9C061574;
        Mon, 12 Apr 2021 15:36:26 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id z1so16993321edb.8;
        Mon, 12 Apr 2021 15:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=PCOQOWXTwfhkR+0L4ZauafZ+IJNAVs6L3CJ2sNHUQY8=;
        b=jZxqWTmRDZRSaxNzAEYEgxfkixY7xakoWasaoKXnE32gQoAjkLQdYEB2QR/AA39KuS
         vAM2y54IF33qMJh0ItuwD5JdoSMD6DeWNlf8WNdmcGYI9GdUTw1iG4YSW3veZZXbHg9p
         ecfv6ZrnJofFEdOg6MDZVnBIDuUUXRQEuaOyJkX8zLBsyCLHdmJ5P+sy2xFW1KXwDaul
         lu4z1zXZVApYc/vqzyfewYZqSZjCSJIJKb3hsKmuQ/WBO3V0jiUPUYZZrxCidvLhCULZ
         6YSZxrxGwiSamlYH3dSQn9E+MRM/964QttOhQSPJntY3613LUiV1+Sio+hJDG3NyDsz0
         bRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=PCOQOWXTwfhkR+0L4ZauafZ+IJNAVs6L3CJ2sNHUQY8=;
        b=Su6B1O4vqFzlvGoOe4g4Dpd/XcUnO2Z81K6en5rNQJfcmqInyJgRwQeQpNqvhw/JXz
         YUtqZe58U0+LGnVyhyb/JH0+i4FOGbxoCtHh8uJ8oqovkkV88aHQ3X//sehvn5tdxq3C
         rKYaz44hOGa8Rh8sUsnumnPeqjTHnPC3oGsNwwTDRTQCzxJoJMCQZhktyE98K86yTezQ
         qd8vQ1s1k4ADO58ogPYwc0PlVzoQMbQW+PhN/PjrsqJTwxUNEYMkBZefUX4VNPb/Pa95
         em5FgKFammtVmhOjJXJpEyR2sBEMCglK29GZ3x2RUaTzp2+5lk1BPISUk9yG9wPjJHAo
         TzxQ==
X-Gm-Message-State: AOAM530AJ9FVjRp6Xed/UmNPb9pMB/e0iSZMYtX2lxAF8xPHxtEtu8ms
        m/znzaCi4SuzNTuTL/0jNdM=
X-Google-Smtp-Source: ABdhPJw+YvEYtJMzuEKk1ETc2B4l3L35SVDmbqMmrZESh4suaxrIyFV4hUg+5YEtDYRWlhnLfzV60w==
X-Received: by 2002:a50:fd16:: with SMTP id i22mr31119515eds.239.1618266984692;
        Mon, 12 Apr 2021 15:36:24 -0700 (PDT)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id d10sm7817209edp.77.2021.04.12.15.36.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Apr 2021 15:36:24 -0700 (PDT)
From:   Johan Jonker <jbx6244@gmail.com>
To:     heiko@sntech.de
Cc:     robh+dt@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: gpio: add YAML description for rockchip,gpio-bank
Date:   Tue, 13 Apr 2021 00:36:15 +0200
Message-Id: <20210412223617.8634-1-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Current dts files with "rockchip,gpio-bank" subnodes
are manually verified. In order to automate this process
the text that describes the compatible in rockchip,pinctrl.txt
is removed and converted to YAML in rockchip,gpio-bank.yaml.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
Changed V2:
  changed example gpio nodename
---
 .../bindings/gpio/rockchip,gpio-bank.yaml          | 82 ++++++++++++++++++++++
 .../bindings/pinctrl/rockchip,pinctrl.txt          | 58 +--------------
 2 files changed, 83 insertions(+), 57 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml

diff --git a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
new file mode 100644
index 000000000..d993e002c
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/rockchip,gpio-bank.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip GPIO bank
+
+maintainers:
+  - Heiko Stuebner <heiko@sntech.de>
+
+properties:
+  compatible:
+    enum:
+      - rockchip,gpio-bank
+      - rockchip,rk3188-gpio-bank0
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - gpio-controller
+  - "#gpio-cells"
+  - interrupt-controller
+  - "#interrupt-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    pinctrl: pinctrl {
+      #address-cells = <1>;
+      #size-cells = <1>;
+      ranges;
+
+      gpio0: gpio@2000a000 {
+        compatible = "rockchip,rk3188-gpio-bank0";
+        reg = <0x2000a000 0x100>;
+        interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clk_gates8 9>;
+
+        gpio-controller;
+        #gpio-cells = <2>;
+
+        interrupt-controller;
+        #interrupt-cells = <2>;
+      };
+
+      gpio1: gpio@2003c000 {
+        compatible = "rockchip,gpio-bank";
+        reg = <0x2003c000 0x100>;
+        interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clk_gates8 10>;
+
+        gpio-controller;
+        #gpio-cells = <2>;
+
+        interrupt-controller;
+        #interrupt-cells = <2>;
+      };
+    };
diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
index d3eae61a3..4719a6a07 100644
--- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.txt
@@ -50,23 +50,7 @@ Deprecated properties for iomux controller:
 	 Use rockchip,grf and rockchip,pmu described above instead.
 
 Required properties for gpio sub nodes:
-  - compatible: "rockchip,gpio-bank"
-  - reg: register of the gpio bank (different than the iomux registerset)
-  - interrupts: base interrupt of the gpio bank in the interrupt controller
-  - clocks: clock that drives this bank
-  - gpio-controller: identifies the node as a gpio controller and pin bank.
-  - #gpio-cells: number of cells in GPIO specifier. Since the generic GPIO
-    binding is used, the amount of cells must be specified as 2. See generic
-    GPIO binding documentation for description of particular cells.
-  - interrupt-controller: identifies the controller node as interrupt-parent.
-  - #interrupt-cells: the value of this property should be 2 and the interrupt
-    cells should use the standard two-cell scheme described in
-    bindings/interrupt-controller/interrupts.txt
-
-Deprecated properties for gpio sub nodes:
-  - compatible: "rockchip,rk3188-gpio-bank0"
-  - reg: second element: separate pull register for rk3188 bank0, use
-	 rockchip,pmu described above instead
+See rockchip,gpio-bank.yaml
 
 Required properties for pin configuration node:
   - rockchip,pins: 3 integers array, represents a group of pins mux and config
@@ -127,43 +111,3 @@ uart2: serial@20064000 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart2_xfer>;
 };
-
-Example for rk3188:
-
-	pinctrl@20008000 {
-		compatible = "rockchip,rk3188-pinctrl";
-		rockchip,grf = <&grf>;
-		rockchip,pmu = <&pmu>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges;
-
-		gpio0: gpio0@2000a000 {
-			compatible = "rockchip,rk3188-gpio-bank0";
-			reg = <0x2000a000 0x100>;
-			interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk_gates8 9>;
-
-			gpio-controller;
-			#gpio-cells = <2>;
-
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-
-		gpio1: gpio1@2003c000 {
-			compatible = "rockchip,gpio-bank";
-			reg = <0x2003c000 0x100>;
-			interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&clk_gates8 10>;
-
-			gpio-controller;
-			#gpio-cells = <2>;
-
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-
-		...
-
-	};
-- 
2.11.0

