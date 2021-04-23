Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8BF1368A7A
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Apr 2021 03:44:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235569AbhDWBoz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Apr 2021 21:44:55 -0400
Received: from lucky1.263xmail.com ([211.157.147.131]:43930 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235302AbhDWBoy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Apr 2021 21:44:54 -0400
Received: from localhost (unknown [192.168.167.16])
        by lucky1.263xmail.com (Postfix) with ESMTP id DE00DBA143;
        Fri, 23 Apr 2021 09:44:03 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P31919T139684250371840S1619142242534325_;
        Fri, 23 Apr 2021 09:44:03 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <1992614d86c6477ffb7c4ec9c31cbe71>
X-RL-SENDER: jay.xu@rock-chips.com
X-SENDER: xjq@rock-chips.com
X-LOGIN-NAME: jay.xu@rock-chips.com
X-FST-TO: heiko@sntech.de
X-RCPT-COUNT: 8
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From:   Jianqun Xu <jay.xu@rock-chips.com>
To:     heiko@sntech.de, linus.walleij@linaro.org, robh+dt@kernel.org
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH] dt-bindings: pinctrl: rockchip: Convert to json-schema
Date:   Fri, 23 Apr 2021 09:44:00 +0800
Message-Id: <20210423014400.1433347-1-jay.xu@rock-chips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Convert the pinctrl/rockchip,pinctrl.txt binding document to
json-schema.

Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
---
 .../bindings/pinctrl/rockchip,pinctrl.yaml    | 163 ++++++++++++++++++
 1 file changed, 163 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
new file mode 100644
index 000000000000..59cddcd30dbc
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
@@ -0,0 +1,163 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/rockchip,rockchip-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip Pinmux Controller
+
+maintainers:
+  - Heiko Stuebner <heiko@sntech.de>
+
+description: |
+  The Rockchip Pinmux Controller, enables the IC
+  to share one PAD to several functional blocks. The sharing is done by
+  multiplexing the PAD input/output signals. For each PAD there are several
+  muxing options with option 0 being the use as a GPIO.
+
+  Please refer to pinctrl-bindings.txt in this directory for details of the
+  common pinctrl bindings used by client devices, including the meaning of the
+  phrase "pin configuration node".
+
+  The Rockchip pin configuration node is a node of a group of pins which can be
+  used for a specific device or function. This node represents both mux and
+  config of the pins in that group. The 'pins' selects the function mode(also
+  named pin mode) this pin can work on and the 'config' configures various pad
+  settings such as pull-up, etc.
+
+  The pins are grouped into up to 5 individual pin banks which need to be
+  defined as gpio sub-nodes of the pinmux controller.
+
+properties:
+  compatible:
+    enum:
+      - rockchip,px30-pinctrl
+      - rockchip,rv1108-pinctrl
+      - rockchip,rk2928-pinctrl
+      - rockchip,rk3066a-pinctrl
+      - rockchip,rk3066b-pinctrl
+      - rockchip,rk3128-pinctrl
+      - rockchip,rk3188-pinctrl
+      - rockchip,rk3228-pinctrl
+      - rockchip,rk3288-pinctrl
+      - rockchip,rk3308-pinctrl
+      - rockchip,rk3328-pinctrl
+      - rockchip,rk3368-pinctrl
+      - rockchip,rk3399-pinctrl
+      - rockchip,rk3568-pinctrl
+
+  rockchip,grf:
+    description: |
+      phandle referencing a syscon providing the "general register files"
+    maxItems: 1
+
+  rockchip,pmu:
+    description: |
+      Optional. Phandle referencing a syscon providing the pmu registers
+      as some SoCs carry parts of the iomux controller registers there.
+      Required for at least rk3188 and rk3288. On the rk3368 this should
+      point to the PMUGRF syscon.
+    maxItems: 1
+
+  ranges: true
+
+patternProperties:
+  "^gpio[0-9]@[0-9a-f]":
+    type: object
+    description: gpio sub node
+
+    properties:
+      compatible:
+        enum:
+          - rockchip,gpio-bank
+          - rockchip,rk3188-gpio-bank0
+
+      reg:
+        maxItems: 2
+
+      interrupts:
+        description: Specifies the Rockchip summary IRQ
+        maxItems: 1
+
+      interrupt-controller: true
+
+      '#interrupt-cells':
+        description:
+          Specifies the PIN numbers and Flags, as defined in defined in
+          include/dt-bindings/interrupt-controller/irq.h
+        const: 2
+
+      gpio-controller: true
+
+      '#gpio-cells':
+        const: 2
+
+      clocks:
+        description: clock that drives this gpio bank
+        minItems: 1
+        maxItems: 2
+
+      required:
+        - compatible
+        - reg
+        - interrupts
+        - interrupt-controller
+        - '#interrupt-cells'
+        - gpio-controller
+        - '#gpio-cells'
+        - clocks
+
+      additionalProperties: false
+
+required:
+  - compatible
+  - rockchip,grf
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+additionalProperties: true
+
+examples:
+  - |
+        #include <dt-bindings/pinctrl/rockchip.h>
+        pcfg_pull_default: pcfg_pull_default {
+            bias-pull-pin-default
+        };
+
+        pinctrl@20008000 {
+            compatible = "rockchip,rk3066a-pinctrl";
+            rockchip,grf = <&grf>;
+            #address-cells = <1>;
+            #size-cells = <1>;
+            ranges;
+
+            gpio0: gpio0@20034000 {
+                compatible = "rockchip,gpio-bank";
+                reg = <0x20034000 0x100>;
+                interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
+                interrupt-controller;
+                #interrupt-cells = <2>;
+                gpio-controller;
+                #gpio-cells = <2>;
+                clocks = <&clk_gates8 9>;
+            };
+
+            uart2 {
+                uart2_xfer: uart2-xfer {
+                    rockchip,pins = <1 RK_PB0 1 &pcfg_pull_default>,
+                                    <1 RK_PB1 1 &pcfg_pull_default>;
+                };
+            };
+        };
+
+        uart2: serial@20064000 {
+            compatible = "snps,dw-apb-uart";
+                reg = <0x20064000 0x400>;
+                interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+                clocks = <&mux_uart2>;
+                pinctrl-0 = <&uart2_xfer>;
+                pinctrl-names = "default";
+                reg-shift = <2>;
+                reg-io-width = <1>;
+        };
-- 
2.25.1



