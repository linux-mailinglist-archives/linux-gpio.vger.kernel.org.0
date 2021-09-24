Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69922416C9C
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Sep 2021 09:16:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244284AbhIXHRw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Sep 2021 03:17:52 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:55721 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244264AbhIXHRv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 24 Sep 2021 03:17:51 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.nyi.internal (Postfix) with ESMTP id 066A4581053;
        Fri, 24 Sep 2021 03:16:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Fri, 24 Sep 2021 03:16:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm3; bh=zZM521bnoteBXt18EX4cYveNye
        GG0eHjvsT/OD8iDnw=; b=eCmEKBNOFx4p3EZSw1LNbapiiDa8HmiU4bJbkxWvzv
        jnnaT68mC6JowhCKSmnETcQ/MvUngR4bEiqzTx2scw1fbgNOqyDVgHG4VaSDNIDh
        Zw1k2lVY+2O40X+ugUdTruCgtVy4mr1hXPr45ozIV3tD277mSbxA7qlLtHdkGZ0J
        KdwNtpEY3CWiPCuiQrA4bbyX3QW9vOKx7jW35JhxvXw6Da85+Gr3jLLnT18Nf1qX
        p34W8meLPN0/nklmrPDgbJCG052Zlgs4vDoht/0Vul3v4uBVAYAVutTdBtkp2IMM
        AGAVe67LA3Nlm0bGf+AYluXRG9eLSsQrAFUN3LGOf+8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=zZM521bnoteBXt18E
        X4cYveNyeGG0eHjvsT/OD8iDnw=; b=wnkMbVvgc7OHMM0YqySkoIEn4Vmv048gW
        lsy+BY1kpDWg/MhurcKJslPjyZIU4dAMCjNSshuJhG1Ity+CqcbK3TpteHju9AZY
        ekE314ea2lumdTJqG6c8qqdNfIOI0JOekAh+9xxltghehakjueP93u1kVnU+CE6c
        GFgeRaHe+NpmVkRZjkUEeLvwZ4lKcb7ktFVQ31IQbV2RKPs98jXdfyCxdFEMwQJr
        kg5TIahXqGuvNtNMl25+YNSfCMecOIBeySKLqpiBmUKn4AV5XS20CxBtUWvdVeSt
        j1MPEBBsUWJ3gTTXOaGsWkyOWEbtiw6txIapwXofesKVVlyauDssA==
X-ME-Sender: <xms:QXtNYZJF9gGBY3EnSl1cB-7AuT40_C9o9q03Fr1KFEHC7-stzvrNpg>
    <xme:QXtNYVLn6h4mKAY0Ssq_q6KV7Iw_zuEIn4Us_n6ol-MokNHorlnOmoUEBpTr9dBWm
    1mwCC0q9AQ0EfY3nrc>
X-ME-Received: <xmr:QXtNYRuC0IhR5bvlMws5AIdp_kTyU0HE6OTngP5xZIZ_u4a-jbWPh-WcUcpbIZ0Vo6cr1fR9RBhZNDwFCWqpJ3_fiPPQsCguiRF_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejtddguddugecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enogevohgrshhtrghlqdfhgeduvddqtddvucdludehtddmnecujfgurhephffvufffkffo
    ggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhiphgrrhguuceomhgrgi
    himhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvghrnhephffhhfevtddthefg
    ieeigeffudehkefgtdeufedvtdduheduieekvddvfedvkeetnecuffhomhgrihhnpeguvg
    hvihgtvghtrhgvvgdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:QXtNYaYTczXTxr_9gR-eQXmX5TlLCzT1yIWapAKTZ0Cixt2oBQSUTQ>
    <xmx:QXtNYQZG8nLrXCQXaWlOTVt0Oxe-R136pGOVfMIgTPUj101QtIfVsQ>
    <xmx:QXtNYeDQf97ZKxWFafSs1am3h4I8C2zjkvsCO0o1WtTQ6nah6PQz2w>
    <xmx:QntNYaDbK2JoEUlvYkZq9uJH2XzwSTQxtjV3mnrg1_3S06XCnmVeGw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Sep 2021 03:16:17 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
        =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-sunxi@lists.linux.dev,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh@kernel.org>
Subject: [RESEND v2 1/3] dt-bindings: gpio: Convert X-Powers AXP209 GPIO binding to a schema
Date:   Fri, 24 Sep 2021 09:16:12 +0200
Message-Id: <20210924071614.868307-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The X-Powers AXP PMICs feature a GPIO Controller supported by Linux
thanks to its device tree binding.

Now that we have the DT validation in place, let's convert the device
tree bindings for that driver over to a YAML schema.

Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---

Changes from v1:
  - Removed the example and moved it in the mfd schema
---
 .../devicetree/bindings/gpio/gpio-axp209.txt  | 75 -------------------
 .../bindings/gpio/x-powers,axp209-gpio.yaml   | 55 ++++++++++++++
 2 files changed, 55 insertions(+), 75 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-axp209.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/x-powers,axp209-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-axp209.txt b/Documentation/devicetree/bindings/gpio/gpio-axp209.txt
deleted file mode 100644
index fc42b2caa06d..000000000000
--- a/Documentation/devicetree/bindings/gpio/gpio-axp209.txt
+++ /dev/null
@@ -1,75 +0,0 @@
-AXP209 GPIO & pinctrl controller
-
-This driver follows the usual GPIO bindings found in
-Documentation/devicetree/bindings/gpio/gpio.txt
-
-This driver follows the usual pinctrl bindings found in
-Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
-
-This driver employs the per-pin muxing pattern.
-
-Required properties:
-- compatible: Should be one of:
-	- "x-powers,axp209-gpio"
-	- "x-powers,axp813-gpio"
-- #gpio-cells: Should be two. The first cell is the pin number and the
-  second is the GPIO flags.
-- gpio-controller: Marks the device node as a GPIO controller.
-
-This node must be a subnode of the axp20x PMIC, documented in
-Documentation/devicetree/bindings/mfd/axp20x.txt
-
-Example:
-
-axp209: pmic@34 {
-	compatible = "x-powers,axp209";
-	reg = <0x34>;
-	interrupt-parent = <&nmi_intc>;
-	interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
-	interrupt-controller;
-	#interrupt-cells = <1>;
-
-	axp_gpio: gpio {
-		compatible = "x-powers,axp209-gpio";
-		gpio-controller;
-		#gpio-cells = <2>;
-	};
-};
-
-The GPIOs can be muxed to other functions and therefore, must be a subnode of
-axp_gpio.
-
-Example:
-
-&axp_gpio {
-	gpio0_adc: gpio0-adc {
-		pins = "GPIO0";
-		function = "adc";
-	};
-};
-
-&example_node {
-	pinctrl-names = "default";
-	pinctrl-0 = <&gpio0_adc>;
-};
-
-GPIOs and their functions
--------------------------
-
-Each GPIO is independent from the other (i.e. GPIO0 in gpio_in function does
-not force GPIO1 and GPIO2 to be in gpio_in function as well).
-
-axp209
-------
-GPIO	|	Functions
-------------------------
-GPIO0	|	gpio_in, gpio_out, ldo, adc
-GPIO1	|	gpio_in, gpio_out, ldo, adc
-GPIO2	|	gpio_in, gpio_out
-
-axp813
-------
-GPIO	|	Functions
-------------------------
-GPIO0	|	gpio_in, gpio_out, ldo, adc
-GPIO1	|	gpio_in, gpio_out, ldo
diff --git a/Documentation/devicetree/bindings/gpio/x-powers,axp209-gpio.yaml b/Documentation/devicetree/bindings/gpio/x-powers,axp209-gpio.yaml
new file mode 100644
index 000000000000..0f628b088cec
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/x-powers,axp209-gpio.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/gpio/x-powers,axp209-gpio.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: X-Powers AXP209 GPIO Device Tree Bindings
+
+maintainers:
+  - Chen-Yu Tsai <wens@csie.org>
+
+properties:
+  "#gpio-cells":
+    const: 2
+    description: >
+      The first cell is the pin number and the second is the GPIO flags.
+
+  compatible:
+    oneOf:
+      - enum:
+          - x-powers,axp209-gpio
+          - x-powers,axp813-gpio
+      - items:
+          - const: x-powers,axp803-gpio
+          - const: x-powers,axp813-gpio
+
+  gpio-controller: true
+
+patternProperties:
+  "^.*-pins?$":
+    $ref: /schemas/pinctrl/pinmux-node.yaml#
+
+    properties:
+      pins:
+        items:
+          enum:
+            - GPIO0
+            - GPIO1
+            - GPIO2
+
+      function:
+        enum:
+          - adc
+          - ldo
+          - gpio_in
+          - gpio_out
+
+required:
+  - compatible
+  - "#gpio-cells"
+  - gpio-controller
+
+additionalProperties: false
+
+...
-- 
2.31.1

