Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E32AA2DCC2D
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Dec 2020 06:52:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727146AbgLQFsG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Dec 2020 00:48:06 -0500
Received: from mo-csw1516.securemx.jp ([210.130.202.155]:47042 "EHLO
        mo-csw.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726999AbgLQFsF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Dec 2020 00:48:05 -0500
Received: by mo-csw.securemx.jp (mx-mo-csw1516) id 0BH5jg6q001870; Thu, 17 Dec 2020 14:45:42 +0900
X-Iguazu-Qid: 34tKHiA2wuBf3MeCUL
X-Iguazu-QSIG: v=2; s=0; t=1608183941; q=34tKHiA2wuBf3MeCUL; m=L4eiyHo1Sa7b18spQ74GmWZ36FJ9ezljVNeOiwZEdlE=
Received: from imx2.toshiba.co.jp (imx2.toshiba.co.jp [106.186.93.51])
        by relay.securemx.jp (mx-mr1513) id 0BH5jfaf017874;
        Thu, 17 Dec 2020 14:45:41 +0900
Received: from enc01.toshiba.co.jp ([106.186.93.100])
        by imx2.toshiba.co.jp  with ESMTP id 0BH5jftu021826;
        Thu, 17 Dec 2020 14:45:41 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
        by enc01.toshiba.co.jp  with ESMTP id 0BH5jen9023978;
        Thu, 17 Dec 2020 14:45:40 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     punit1.agrawal@toshiba.co.jp, yuji2.ishikawa@toshiba.co.jp,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v5 1/4] dt-bindings: gpio: Add bindings for Toshiba Visconti GPIO Controller
Date:   Thu, 17 Dec 2020 23:43:35 +0900
X-TSB-HOP: ON
Message-Id: <20201217144338.3129140-2-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217144338.3129140-1-nobuhiro1.iwamatsu@toshiba.co.jp>
References: <20201217144338.3129140-1-nobuhiro1.iwamatsu@toshiba.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add bindings for the Toshiba Visconti GPIO Controller.

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Punit Agrawal <punit1.agrawal@toshiba.co.jp>
---
 .../bindings/gpio/toshiba,gpio-visconti.yaml  | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml

diff --git a/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml b/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
new file mode 100644
index 000000000000..9ad470e01953
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/toshiba,gpio-visconti.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/toshiba,gpio-visconti.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toshiba Visconti ARM SoCs GPIO controller
+
+maintainers:
+  - Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
+
+properties:
+  compatible:
+    items:
+      - const: toshiba,gpio-tmpv7708
+
+  reg:
+    maxItems: 1
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-ranges: true
+
+  gpio-controller: true
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  interrupts:
+    description:
+      interrupt mapping one per GPIO.
+    minItems: 16
+    maxItems: 16
+
+required:
+  - compatible
+  - reg
+  - "#gpio-cells"
+  - gpio-ranges
+  - gpio-controller
+  - interrupt-controller
+  - "#interrupt-cells"
+  - interrupt-parent
+
+additionalProperties: false
+
+examples:
+  - |
+      #include <dt-bindings/interrupt-controller/irq.h>
+      #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+      soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        gpio: gpio@28020000 {
+          compatible = "toshiba,gpio-tmpv7708";
+          reg = <0 0x28020000 0 0x1000>;
+          #gpio-cells = <0x2>;
+          gpio-ranges = <&pmux 0 0 32>;
+          gpio-controller;
+          interrupt-controller;
+          #interrupt-cells = <2>;
+          interrupt-parent = <&gic>;
+        };
+      };
+...
-- 
2.29.2

