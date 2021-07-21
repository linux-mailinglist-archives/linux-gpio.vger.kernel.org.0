Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80EC03D108C
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jul 2021 16:04:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239082AbhGUNYU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Jul 2021 09:24:20 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:34107 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239047AbhGUNYU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 21 Jul 2021 09:24:20 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id B2A1B580482;
        Wed, 21 Jul 2021 10:04:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 21 Jul 2021 10:04:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=wpczZwFr2oV/h
        pVBUw2hzMPAB0ad3TvRVbaqRU+T1Tg=; b=qJZBv0xVqf5ccsLlQnyhK9lpmXa14
        rWexNwmQfLwPKLyDkPzAARmzATwCc/YZDT0tJYj1efbFpyitPCDggzO7jrjSggOF
        Fk8rFn/a5WtAnxJr/NJRTdCi90VUJzD9MfhQtbsQBeiNMm5zvH8LBW2H945Ftkv+
        qEg0GQ3QTY7hPT97esz2f1ITvAVsbvw39frLGTz+IUcQM1ZHIM+lX/TW1EgSud1M
        y5xcWLK/E+1vzrgd9ABYxxXkfkxb0eYih06NDa6Hf/zb6OIVIibcmTcM+149VTAg
        JzNNXr2QAtnTiHZrJYc3c3hNo4dsYA16AGSbbxqOhsurp6ZPBNCreGYKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=wpczZwFr2oV/hpVBUw2hzMPAB0ad3TvRVbaqRU+T1Tg=; b=tCYQTa6v
        Pz2YdcmdRA7wzGfHiW4xGdAL2gP+Cact1HOt8IuW8U9GM2X/t6dVIBGVp67iEG5k
        XLbiSpGQHfOqeqnVi1u4I+JiBzukpJJ3to5hl9PN79HGbOtHT08HAaWNUummx8/F
        O7Y2fjRsvpvXPFez9lauAwykVzszKLiepLPrEI1m6li2KQ+YJOL8glkux+ZusRtl
        gFT+N61xskpWf41l3ZBRVyIlZuaEbKuPbJNPDw851oumRsrmcb+zjTwK1iQLXR70
        h7xLjZ6wBEgvH83fMeOkIOEWdCAChSCMooOT6xEo4ZCmQd7o0oWzBUA0fBaHR7+r
        vqC2tnEb86oACg==
X-ME-Sender: <xms:iCn4YEiidTMnzMuLf5VHQKlbzeATebhIjdnXQiwG1Xv32RGFG_BKOQ>
    <xme:iCn4YNDkOOud7SosrW97OfC09h8cm9mWQfPgXydV69oQCZj3GxpPiqqZUGzuGtSJz
    40y3HyLfTikWL6ILk8>
X-ME-Received: <xmr:iCn4YMGk7Is3ZmLeYdme91jumgwxMtQ4kxc5E6bM7t7Mm6XPahigJnMEbBTDLoZHdNiIG9pTdkwCdYhl8bgReGLnM0P7WdUpq5Cc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeeggdeijecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenog
    evohgrshhtrghlqdfhgeduvddqtddvucdludehtddmnecujfgurhephffvufffkffojghf
    ggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhiphgrrhguuceomhgrgi
    himhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvghrnhepveejieejtdevgfff
    gfejuefggfeutdelteekgeetueeftddutddtgfffhffgueffnecuffhomhgrihhnpeguvg
    hvihgtvghtrhgvvgdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:iCn4YFT4lrQbwkkxl4oGpD7lXb1hVhzdIcMNfLzE5ioziph-lM4DWQ>
    <xmx:iCn4YBz4FonNSdl9s3dCqPe9NP6oT9INTa0mnIjCPh5RS7vrPDfK8Q>
    <xmx:iCn4YD5oZ4TnZ2bywbwaCyV0uCxz9BD8MXrT17i_ICfkhlD6iBp9ig>
    <xmx:iCn4YBfWaiui1s93X5VAbAybdZm9E42ni5OhDG4EG2pKUJ2Npnk4JA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Jul 2021 10:04:55 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: [PATCH 13/54] dt-bindings: gpio: Convert X-Powers AXP209 GPIO binding to a schema
Date:   Wed, 21 Jul 2021 16:03:43 +0200
Message-Id: <20210721140424.725744-14-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210721140424.725744-1-maxime@cerno.tech>
References: <20210721140424.725744-1-maxime@cerno.tech>
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
 .../devicetree/bindings/gpio/gpio-axp209.txt  | 75 -----------------
 .../bindings/gpio/x-powers,axp209-gpio.yaml   | 84 +++++++++++++++++++
 2 files changed, 84 insertions(+), 75 deletions(-)
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
index 000000000000..28337f939d4e
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/x-powers,axp209-gpio.yaml
@@ -0,0 +1,84 @@
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
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic@34 {
+            #interrupt-cells = <1>;
+            compatible = "x-powers,axp209";
+            reg = <0x34>;
+            interrupt-parent = <&nmi_intc>;
+            interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+            interrupt-controller;
+
+            gpio {
+                #gpio-cells = <2>;
+                compatible = "x-powers,axp209-gpio";
+                gpio-controller;
+
+                gpio0-adc-pin {
+                    pins = "GPIO0";
+                    function = "adc";
+                };
+            };
+        };
+    };
+
+...
-- 
2.31.1

