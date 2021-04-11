Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B54A35B66B
	for <lists+linux-gpio@lfdr.de>; Sun, 11 Apr 2021 19:55:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235420AbhDKRzA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 11 Apr 2021 13:55:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235388AbhDKRzA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 11 Apr 2021 13:55:00 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0092EC061574;
        Sun, 11 Apr 2021 10:54:43 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id r9so16503367ejj.3;
        Sun, 11 Apr 2021 10:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=nI53kziyfbKnEvjuBZ+bfWn5m7mWLDh7ze9LttdxKG8=;
        b=e+k+gtKZE9MsFc07l1+sdWdw/nfatox4OuF07RPrRCnXMpkKd+8wTn62uTEiOcR0SP
         oXbt4DPmBn4rrf019iBr4TZMaSarwevpSrnpf97Yt6xYYzdV6RiIdetdvo0Xn27rtL64
         jwJYL3JXYydEufEuG3V15GZnNhBMlo5hdPXCgE6L8Ja9nodynWKjUULSrL4J5H21J4KI
         QN0urQCcePII0gQw4EhtwQIJFpsMef28dMupU56JF1fTsn7SXXFjkOA6rDc3AKYq4UjZ
         IxJokMUYk7Mnr4/bnSJ8zmGNw+WBGDJuD+mZNoCLi2NM9vZaB9ewElfsHBbm3yD/zANc
         OJeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=nI53kziyfbKnEvjuBZ+bfWn5m7mWLDh7ze9LttdxKG8=;
        b=FOWocAtbpaks/W/1AslREgRZPM/RaPqI8O6HenXug3kVS9G38Lghb80hmlGW+ev0FT
         XEK7+cCwuD6DvqhYu+yhOCtHXuAMP2lv/aGWqIm7HTcY68goPzmXq7RTEtlC2j9o9ipi
         GXq0Jqn8+1HRoKArORw9npEj0pQT5kBL8/YcMngZJSzH8SxdYrOtqLPShOzVBKcMPdce
         loOS3BuxyAfciiRRXjJ8wUaxFYV8JW7BwlIABk66e0U4y1zUkDz6bBNZB4IrI3z1dB75
         44DkFOQUEf0JUI6SCt20eEiXT5EIhAEE6fF6uPGj5/Cl/YkYZNWDVyUo+MV03KlINZwh
         HN4w==
X-Gm-Message-State: AOAM532riFKJAgjuub78UeqAWEwuNROwYdzjdhZOKVLzDyW6R2nRorlX
        BuXcPQTgG4GBgeXDCxroMjaN1jYTwhlwSA==
X-Google-Smtp-Source: ABdhPJx+so6mjMmxaxstEpIv2+fsU54/IXGjC6HocAs37FoIfmVuxcP1+ymTH6ybMtRG+YTcpyxITA==
X-Received: by 2002:a17:906:a1c8:: with SMTP id bx8mr23568241ejb.381.1618163682737;
        Sun, 11 Apr 2021 10:54:42 -0700 (PDT)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id h15sm5021738edb.74.2021.04.11.10.54.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 11 Apr 2021 10:54:42 -0700 (PDT)
From:   Johan Jonker <jbx6244@gmail.com>
To:     heiko@sntech.de
Cc:     robh+dt@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1] dt-bindings: gpio: add YAML description for rockchip,gpio-bank
Date:   Sun, 11 Apr 2021 19:54:35 +0200
Message-Id: <20210411175435.807-1-jbx6244@gmail.com>
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
 .../bindings/gpio/rockchip,gpio-bank.yaml          | 82 ++++++++++++++++++++++
 .../bindings/pinctrl/rockchip,pinctrl.txt          | 58 +--------------
 2 files changed, 83 insertions(+), 57 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml

diff --git a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
new file mode 100644
index 000000000..ac2479732
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
+      gpio0: gpio0@2000a000 {
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
+      gpio1: gpio1@2003c000 {
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

