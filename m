Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94B0DBDA20
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2019 10:46:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2442881AbfIYIqM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Sep 2019 04:46:12 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:58189 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2442828AbfIYIqL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Sep 2019 04:46:11 -0400
X-Originating-IP: 86.250.200.211
Received: from localhost.localdomain (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 94F681C001F;
        Wed, 25 Sep 2019 08:46:08 +0000 (UTC)
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH v2 4/5] dt-bindings: gpio: Document the Xylon LogiCVC GPIO controller
Date:   Wed, 25 Sep 2019 10:45:54 +0200
Message-Id: <20190925084555.147771-5-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190925084555.147771-1-paul.kocialkowski@bootlin.com>
References: <20190925084555.147771-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The Xylon LogiCVC display controller exports some GPIOs, which are
exposed as a separate entity.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 .../bindings/gpio/xylon,logicvc-gpio.yaml     | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/xylon,logicvc-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/xylon,logicvc-gpio.yaml b/Documentation/devicetree/bindings/gpio/xylon,logicvc-gpio.yaml
new file mode 100644
index 000000000000..1503c922f845
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/xylon,logicvc-gpio.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2019 Bootlin
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/gpio/xylon,logicvc-gpio.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Xylon LogiCVC GPIO controller
+
+maintainers:
+  - Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+
+description: |
+  The LogiCVC GPIO describes the GPIO block included in the LogiCVC display
+  controller. These are meant to be used for controlling display-related
+  signals.
+
+  The controller exposes GPIOs from the display and power control registers,
+  which are mapped by the driver as follows:
+  - GPIO[4:0] (display control) mapped to index 0-4
+  - EN_BLIGHT (power control) mapped to index 5
+  - EN_VDD (power control) mapped to index 6
+  - EN_VEE (power control) mapped to index 7
+  - V_EN (power control) mapped to index 8
+
+properties:
+  $nodename:
+    pattern: "^gpio@[0-9a-f]+$"
+
+  compatible:
+    enum:
+      - xylon,logicvc-3.02.a-gpio
+
+  reg:
+    maxItems: 1
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-controller: true
+
+  gpio-line-names:
+    minItems: 1
+    maxItems: 9
+
+required:
+  - compatible
+  - reg
+  - "#gpio-cells"
+  - gpio-controller
+
+examples:
+  - |
+    &amba {
+      logicvc: logicvc@43c00000 {
+        compatible = "xylon,logicvc-3.02.a", "syscon", "simple-mfd";
+        reg = <0x43c00000 0x6000>;
+        ...
+
+        logicvc_gpio: gpio@40 {
+          compatible = "xylon,logicvc-3.02.a-gpio";
+          reg = <0x40 0x40>;
+          gpio-controller;
+          #gpio-cells = <2>;
+          gpio-lines-names = "GPIO0", "GPIO1", "GPIO2", "GPIO3", "GPIO4",
+                             "EN_BLIGHT", "EN_VDD", "EN_VEE", "V_EN";
+        };
+      };
+      ...
+    };
-- 
2.23.0

