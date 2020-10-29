Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D17229ED25
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Oct 2020 14:40:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727304AbgJ2Nkp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Oct 2020 09:40:45 -0400
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:33536 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726923AbgJ2Nkp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Oct 2020 09:40:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1603978844; x=1635514844;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fa6KWX2B4zVTjwSqmWXYRE0FGe8eLF9ePLavcrFXjlI=;
  b=HhZevP/SsKPzgsZ/vCxzVtejG87wVLfeU1okyPgNm/wK1DPmRfbFkKSr
   uktf6/83nutT5be3HU3WFqvciHNhjQBh1mzw2G5qrgNMmR+sNuvZMzkwQ
   0jzaObj9pPfLkl28p3eQNbpmz/KXFv3DOGjO88ssSI2d4wWwnUGzBTa8g
   RpkfddRZvvw18epEO/2q7DzxdZsm7pMefJZ+a4kivoYoceb4fVnQqLsdA
   gcbTSg3kdX2inkg3+F/3bOo9L+ktl8nUGIcDhkr64jE6h6Jlg72y835UR
   xf5cuK2gNG+Fg0G0tWULH5bcuVWmaG5lOW5j0CdqS6twe9GnSxJD6r1Cd
   g==;
IronPort-SDR: ObT8nPTqsZRvPc9QWhpE0Q1cLOKCFJYGZvPRpsKIHtXZi5jNlgC4KS9riHg9w8NN0o2EhfqzYm
 uzC5HX+6myyuX1Zqf1a+egfUmUJ/dOmTHV9OyCNpj3JkBPjyud0nlXNFB50ImwdiWvJuHe9cZP
 sIV51V1slWC84L7HqH8skc7qaYKecskRrUg7RZBP9/b2GsQFMXXWSjLSSpyOCr1gvIG6FJDJxD
 bNjtLHvwNgnNkqG/mMOFLYhqvbd3VPQCPrk7wDgE+j0/OWaXwUCohyxDtznIuEKmp71gQ4yOPH
 d8Y=
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; 
   d="scan'208";a="91815723"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Oct 2020 06:40:43 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 29 Oct 2020 06:40:43 -0700
Received: from soft-dev10.microsemi.net (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Thu, 29 Oct 2020 06:40:41 -0700
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v7 1/3] dt-bindings: pinctrl: Add bindings for pinctrl-microchip-sgpio driver
Date:   Thu, 29 Oct 2020 14:40:25 +0100
Message-ID: <20201029134027.232951-2-lars.povlsen@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201029134027.232951-1-lars.povlsen@microchip.com>
References: <20201029134027.232951-1-lars.povlsen@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This adds DT bindings for the Microsemi/Microchip SGPIO controller,
bindings microchip,sparx5-sgpio, mscc,ocelot-sgpio and
mscc,luton-sgpio.

Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../pinctrl/microchip,sparx5-sgpio.yaml       | 145 ++++++++++++++++++
 1 file changed, 145 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
new file mode 100644
index 000000000000..08325bf77a81
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
@@ -0,0 +1,145 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/microchip,sparx5-sgpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microsemi/Microchip Serial GPIO controller
+
+maintainers:
+  - Lars Povlsen <lars.povlsen@microchip.com>
+
+description: |
+  By using a serial interface, the SIO controller significantly extend
+  the number of available GPIOs with a minimum number of additional
+  pins on the device. The primary purpose of the SIO controllers is to
+  connect control signals from SFP modules and to act as an LED
+  controller.
+
+properties:
+  $nodename:
+    pattern: "^gpio@[0-9a-f]+$"
+
+  compatible:
+    enum:
+      - microchip,sparx5-sgpio
+      - mscc,ocelot-sgpio
+      - mscc,luton-sgpio
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  microchip,sgpio-port-ranges:
+    description: This is a sequence of tuples, defining intervals of
+      enabled ports in the serial input stream. The enabled ports must
+      match the hardware configuration in order for signals to be
+      properly written/read to/from the controller holding
+      registers. Being tuples, then number of arguments must be
+      even. The tuples mast be ordered (low, high) and are
+      inclusive.
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    items:
+      items:
+        - description: |
+            "low" indicates start bit number of range
+          minimum: 0
+          maximum: 31
+        - description: |
+            "high" indicates end bit number of range
+          minimum: 0
+          maximum: 31
+    minItems: 1
+    maxItems: 32
+
+  bus-frequency:
+    description: The sgpio controller frequency (Hz). This dictates
+      the serial bitstream speed, which again affects the latency in
+      getting control signals back and forth between external shift
+      registers. The speed must be no larger than half the system
+      clock, and larger than zero.
+    default: 12500000
+
+patternProperties:
+  "^gpio@[0-1]$":
+    type: object
+    properties:
+      compatible:
+        const: microchip,sparx5-sgpio-bank
+
+      reg:
+        description: |
+          The GPIO bank number. "0" is designates the input pin bank,
+          "1" the output bank.
+        maxItems: 1
+
+      gpio-controller: true
+
+      '#gpio-cells':
+        description: |
+         Specifies the pin (port and bit) and flags. Note that the
+         SGIO pin is defined by *2* numbers, a port number between 0
+         and 31, and a bit index, 0 to 3. The maximum bit number is
+         controlled indirectly by the "ngpios" property: (ngpios/32).
+        const: 3
+
+      ngpios:
+        description: The numbers of GPIO's exposed. This must be a
+          multiple of 32.
+        minimum: 32
+        maximum: 128
+
+    required:
+      - compatible
+      - reg
+      - gpio-controller
+      - '#gpio-cells'
+      - ngpios
+
+    additionalProperties: false
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - microchip,sgpio-port-ranges
+  - "#address-cells"
+  - "#size-cells"
+
+examples:
+  - |
+    sgpio2: gpio@1101059c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      compatible = "microchip,sparx5-sgpio";
+      clocks = <&sys_clk>;
+      pinctrl-0 = <&sgpio2_pins>;
+      pinctrl-names = "default";
+      reg = <0x1101059c 0x100>;
+      microchip,sgpio-port-ranges = <0 0>, <16 18>, <28 31>;
+      bus-frequency = <25000000>;
+      sgpio_in2: gpio@0 {
+        reg = <0>;
+        compatible = "microchip,sparx5-sgpio-bank";
+        gpio-controller;
+        #gpio-cells = <3>;
+        ngpios = <96>;
+      };
+      sgpio_out2: gpio@1 {
+        compatible = "microchip,sparx5-sgpio-bank";
+        reg = <1>;
+        gpio-controller;
+        #gpio-cells = <3>;
+        ngpios = <96>;
+      };
+    };
-- 
2.25.1

