Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01AC626C709
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Sep 2020 20:16:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727854AbgIPSQA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Sep 2020 14:16:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:53834 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727832AbgIPSPa (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 16 Sep 2020 14:15:30 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BD231229CA;
        Wed, 16 Sep 2020 16:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600273396;
        bh=qIjIq4ccrlQzXJFJ28ymdkmjtOcIfObeEiV2Tpqqy+0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pHVjvQd7Z6Y8N84FNLBmbrNlr2FYmeSVkffjhxnexZrdHFTD6LzFHeQYcUtMK3elZ
         aUKIS5f0xGhm7d4RgcK52TtQcF2VPXY1Yl966l1EyotC5oNKRbi4/yJDglf/JXnFDw
         zr4/0LOUbtXdlcliYkTpssqcAFIuE2FYlWxEA/GY=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Anson Huang <Anson.Huang@nxp.com>,
        Sungbo Eo <mans0n@gorani.run>, Stefan Agner <stefan@agner.ch>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yash Shah <yash.shah@sifive.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-unisoc@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-riscv@lists.infradead.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 1/8] dt-bindings: gpio: add common schema for GPIO controllers
Date:   Wed, 16 Sep 2020 18:22:43 +0200
Message-Id: <20200916162250.16098-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200916162250.16098-1-krzk@kernel.org>
References: <20200916162250.16098-1-krzk@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Convert parts of gpio.txt bindings into common dtschema file for GPIO
controllers.  The schema enforces proper naming of GPIO controller nodes
and GPIO hogs.

The schema should be included by specific GPIO controllers bindings.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../devicetree/bindings/gpio/gpio-common.yaml | 126 ++++++++++++++++++
 1 file changed, 126 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-common.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-common.yaml b/Documentation/devicetree/bindings/gpio/gpio-common.yaml
new file mode 100644
index 000000000000..d0974fcac659
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-common.yaml
@@ -0,0 +1,126 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/gpio-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common GPIO controller properties
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+  - Linus Walleij <linus.walleij@linaro.org>
+
+properties:
+  nodename:
+    pattern: "^(gpio-controller|gpio)(@[0-9a-f]+|-[0-9a-f]+)?$"
+
+  '#gpio-cells': true
+  gpio-controller: true
+  gpio-ranges: true
+
+  gpio-line-names:
+    description: |
+      Optionally, a GPIO controller may have a "gpio-line-names" property. This
+      is an array of strings defining the names of the GPIO lines going out of
+      the GPIO controller. This name should be the most meaningful producer
+      name for the system, such as a rail name indicating the usage. Package
+      names such as pin name are discouraged: such lines have opaque names
+      (since they are by definition generic purpose) and such names are usually
+      not very helpful.
+
+      For example "MMC-CD", "Red LED Vdd" and "ethernet reset" are reasonable
+      line names as they describe what the line is used for. "GPIO0" is not a
+      good name to give to a GPIO line.
+
+      Placeholders are discouraged: rather use the "" (blank string) if the use
+      of the GPIO line is undefined in your design. The names are assigned
+      starting from line offset 0 from left to right from the passed array. An
+      incomplete array (where the number of passed named are less than ngpios)
+      will still be used up until the last provided valid line index.
+
+  gpio-reserved-ranges:
+    description:
+      Indicates the start and size of the GPIOs that can't be used.
+
+  ngpios:
+    description: |
+      Optionally, a GPIO controller may have a "ngpios" property. This property
+      indicates the number of in-use slots of available slots for GPIOs. The
+      typical example is something like this: the hardware register is 32 bits
+      wide, but only 18 of the bits have a physical counterpart. The driver is
+      generally written so that all 32 bits can be used, but the IP block is
+      reused in a lot of designs, some using all 32 bits, some using 18 and
+      some using 12. In this case, setting "ngpios = <18>;" informs the driver
+      that only the first 18 GPIOs, at local offset 0 .. 17, are in use.
+
+      If these GPIOs do not happen to be the first N GPIOs at offset 0...N-1,
+      an additional set of tuples is needed to specify which GPIOs are
+      unusable, with the gpio-reserved-ranges binding.
+
+patternProperties:
+  "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
+    type: object
+    description:
+      The GPIO chip may contain GPIO hog definitions. GPIO hogging is a mechanism
+      providing automatic GPIO request and configuration as part of the
+      gpio-controller's driver probe function.
+      Each GPIO hog definition is represented as a child node of the GPIO controller.
+
+    properties:
+      gpio-hog: true
+      gpios: true
+      input: true
+      output-high: true
+      output-low: true
+      line-name:
+        description:
+          The GPIO label name. If not present the node name is used.
+
+    required:
+      - gpio-hog
+      - gpios
+
+    oneOf:
+      - required:
+          - input
+      - required:
+          - output-high
+      - required:
+          - output-low
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - "#gpio-cells"
+  - gpio-controller
+
+examples:
+  - |
+    gpio-controller@15000000 {
+        compatible = "foo";
+        reg = <0x15000000 0x1000>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        ngpios = <18>;
+        gpio-reserved-ranges = <0 4>, <12 2>;
+        gpio-line-names = "MMC-CD", "MMC-WP", "VDD eth", "RST eth", "LED R",
+                          "LED G", "LED B", "Col A", "Col B", "Col C", "Col D",
+                          "Row A", "Row B", "Row C", "Row D", "NMI button",
+                          "poweroff", "reset";
+    };
+
+  - |
+    gpio-controller@1400 {
+        compatible = "fsl,qe-pario-bank-a", "fsl,qe-pario-bank";
+        reg = <0x1400 0x18>;
+        gpio-controller;
+        #gpio-cells = <2>;
+
+        line-b-hog {
+            gpio-hog;
+            gpios = <6 0>;
+            input;
+            line-name = "foo-bar-gpio";
+        };
+    };
-- 
2.17.1

