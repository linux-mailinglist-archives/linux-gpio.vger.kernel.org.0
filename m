Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AE6E10FFB8
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Dec 2019 15:13:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726838AbfLCON1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Dec 2019 09:13:27 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:44833 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726492AbfLCONN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Dec 2019 09:13:13 -0500
X-Originating-IP: 90.76.211.102
Received: from localhost.localdomain (lfbn-1-2154-102.w90-76.abo.wanadoo.fr [90.76.211.102])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id AF50E60015;
        Tue,  3 Dec 2019 14:13:11 +0000 (UTC)
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v5 3/4] dt-bindings: gpio: Document the Xylon LogiCVC GPIO controller
Date:   Tue,  3 Dec 2019 15:12:42 +0100
Message-Id: <20191203141243.251058-4-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191203141243.251058-1-paul.kocialkowski@bootlin.com>
References: <20191203141243.251058-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The Xylon LogiCVC display controller exports some GPIOs, which are
exposed as a separate entity.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/gpio/xylon,logicvc-gpio.yaml     | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/xylon,logicvc-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/xylon,logicvc-gpio.yaml b/Documentation/devicetree/bindings/gpio/xylon,logicvc-gpio.yaml
new file mode 100644
index 000000000000..d102888c1be7
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/xylon,logicvc-gpio.yaml
@@ -0,0 +1,69 @@
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
+    logicvc: logicvc@43c00000 {
+      compatible = "xylon,logicvc-3.02.a", "syscon", "simple-mfd";
+      reg = <0x43c00000 0x6000>;
+
+      #address-cells = <1>;
+      #size-cells = <1>;
+
+      logicvc_gpio: gpio@40 {
+        compatible = "xylon,logicvc-3.02.a-gpio";
+        reg = <0x40 0x40>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-line-names = "GPIO0", "GPIO1", "GPIO2", "GPIO3", "GPIO4",
+               "EN_BLIGHT", "EN_VDD", "EN_VEE", "V_EN";
+      };
+    };
-- 
2.24.0

