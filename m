Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 598D73FD67A
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Sep 2021 11:20:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243419AbhIAJUd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Sep 2021 05:20:33 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:41651 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243528AbhIAJUc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Sep 2021 05:20:32 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id E521B580B26;
        Wed,  1 Sep 2021 05:19:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 01 Sep 2021 05:19:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=3qrnArky4cbLJ
        wXpsp16UfGsjyWCwx/Rms7egRuHx2g=; b=j0Q+PPt/YC1fPVAVshV0N5eU01XNZ
        4DsExDJJJTjTiZe7QTMSJ0TTdBHMc6bW0MQ8eDbJdM+DAAIie7eVQk5ydSjbp7HZ
        wyTUmslxRv8WtN8l6Om2uHVsxdrGCp01Mkcor3/U7RI4fMc+zVwMM0ya6x1d7gt0
        C21qIsRij/J8vHnrDo6HYh9dOVS+rddC1hEe204TBkmhcMzDti0sg544Qy0cnnFZ
        lNdcWnD1XyVWWSLFNax20MvLbhPZkeTmwr5Ho9a0Z3UoaMpcygoGMcSx0OHKEAAe
        er8EnVGAtU+/SmloahHEmUsJuwjxngMBTtscOBX3iN6ZsFpogpL3g7q9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=3qrnArky4cbLJwXpsp16UfGsjyWCwx/Rms7egRuHx2g=; b=Dc7RLiQ2
        /Ov6Ay+8ErxbFGexY0GGs7/Kl6B7gbJL2RO7lON0ErrNGpxKO1HjyknM5v9OuPfX
        0m81WCs76S5NDc9adAUGFDluTh1yEGOVqWroplLIyZ9f4KLXbCAxsd/egq3a6SwX
        oUxW/f/muqEiRqe84283YKvZSMUm9sAibGDsmDNVxnvo7QdZKEA2uyU8dGXKCJgT
        /MOajBq6Km+hW5IkOgs2O/93JqQnRVwCl3C4EjT2nep0w3fXYky8XjIQq6L4fp9I
        uyX/NgvsN0FOLbQxAhC77Ibc5JavJmelgDghGTAba5Z2l/UO9ZH0FLuZlLKHlL4u
        g9A9oETpZcyarA==
X-ME-Sender: <xms:p0UvYYygLAhhKJZq2vwPdCk0dVyKQ2jmMn9A4FtFN1IIn__w2WSmUw>
    <xme:p0UvYcQ_RETGCeE52tnbYia4MYjHpfsauDqMymyyIjx3QoZ80JPqrVtIlwZipUGTQ
    qbJUgvP_SCjB5UsPlA>
X-ME-Received: <xmr:p0UvYaWWaRookycfRQxXs9Ut4AGQ-T28wNewdsxq6JFwOK8V0c5QW8UfOG6hwfaAnbcVjPIqnT0O8GkE32HGlA7Fwqw5xCxTuByb>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvfedgudehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    govehorghsthgrlhdqhfeguddvqddtvdculdduhedtmdenucfjughrpefhvffufffkofgj
    fhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucftihhprghrugcuoehmrg
    igihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrhhnpeevjeeijedtvefg
    fffgjeeugffguedtleetkeegteeufedtuddttdfgfffhgfeuffenucffohhmrghinhepug
    gvvhhitggvthhrvggvrdhorhhgnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghm
    pehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:p0UvYWjOTFfcOsdn6apDMnzVjSpnyAIc9GvZQyK_2X1H3LDDwbpfpw>
    <xmx:p0UvYaAWSeGMUhalEMKKi-_23yAvGlVPniY_czSKu5naxX8vfldH-Q>
    <xmx:p0UvYXL-2LJmGCSYc1Fqg2YRIwqwsA6KCwwVL17Nr2xyNJKjK-O6VA>
    <xmx:p0UvYStZUmj8GPhKMoA0Gsvh-7YOwT-PQN8Aj65PMZE0a0dncqPJmA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Sep 2021 05:19:35 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime@cerno.tech>,
        =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: [PATCH v2 22/52] dt-bindings: gpio: Convert X-Powers AXP209 GPIO binding to a schema
Date:   Wed,  1 Sep 2021 11:18:22 +0200
Message-Id: <20210901091852.479202-23-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901091852.479202-1-maxime@cerno.tech>
References: <20210901091852.479202-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The X-Powers AXP PMICs feature a GPIO Controller supported by Linux
thanks to its device tree binding.

Now that we have the DT validation in place, let's convert the device
tree bindings for that driver over to a YAML schema.

Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
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

