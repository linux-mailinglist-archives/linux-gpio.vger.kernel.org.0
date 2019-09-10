Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66893AEE83
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Sep 2019 17:30:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393941AbfIJP3z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Sep 2019 11:29:55 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:41649 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727457AbfIJP3y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Sep 2019 11:29:54 -0400
X-Originating-IP: 86.250.200.211
Received: from localhost.localdomain (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 6BAFD60015;
        Tue, 10 Sep 2019 15:29:51 +0000 (UTC)
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH 2/3] dt-bindings: gpio: Add binding document for xylon logicvc-gpio
Date:   Tue, 10 Sep 2019 17:28:54 +0200
Message-Id: <20190910152855.111588-2-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190910152855.111588-1-paul.kocialkowski@bootlin.com>
References: <20190910152855.111588-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The Xylon LogiCVC display controller exports some GPIOs, which are
exposed as a dedicated driver.

This introduces the associated device-tree bindings documentation.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 .../bindings/gpio/xylon,logicvc-gpio.txt      | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/xylon,logicvc-gpio.txt

diff --git a/Documentation/devicetree/bindings/gpio/xylon,logicvc-gpio.txt b/Documentation/devicetree/bindings/gpio/xylon,logicvc-gpio.txt
new file mode 100644
index 000000000000..4835659cb90b
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/xylon,logicvc-gpio.txt
@@ -0,0 +1,48 @@
+Xylon LogiCVC GPIO controller
+
+The Xylon LogiCVC is a display controller that contains a number of GPIO pins,
+meant to be used for controlling display-related signals.
+
+In practice, the GPIOs can be used for any purpose they might be needed for.
+
+The controller exposes GPIOs from the display and power control registers,
+which are mapped by the driver as follows:
+- GPIO[4:0] (display control) mapped to index 0-4
+- EN_BLIGHT (power control) mapped to index 5
+- EN_VDD (power control) mapped to index 6
+- EN_VEE (power control) mapped to index 7
+- V_EN (power control) mapped to index 8
+
+The driver was implemented and tested for version 3.02.a of the controller,
+but should be compatible with version 4 as well.
+
+Required properties:
+- compatible: Should contain "xylon,logicvc-3.02.a-gpio".
+- gpio-controller: Marks the device node as a gpio controller.
+- #gpio-cells: Should be 2. The first cell is the pin number and
+  the second cell is used to specify the gpio polarity:
+    0 = Active high,
+    1 = Active low.
+- gpio,syscon-dev: Syscon phandle representing the logicvc instance.
+
+Example:
+
+	logicvc: logicvc@43c00000 {
+		compatible = "syscon", "simple-mfd";
+		reg = <0x43c00000 0x6000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		logicvc_gpio: display-gpio@40 {
+			compatible = "xylon,logicvc-3.02.a-gpio";
+			reg = <0x40 0x40>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio,syscon-dev = <&logicvc>;
+		};
+	};
+
+Note: the device-tree node should either be declared as a child of the logicvc
+syscon node or the syscon node should be precised with the gpio,syscon-dev
+property. Both are shown in the example above.
-- 
2.23.0

