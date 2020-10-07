Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB5C2285DE1
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Oct 2020 13:12:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727801AbgJGLMP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Oct 2020 07:12:15 -0400
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:2782 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727140AbgJGLMO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Oct 2020 07:12:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1602069134; x=1633605134;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VdJpqnrCyvW7VQ1RSbiMo6xgusNO3aMhKhOn09ATvjo=;
  b=YajkOpdX+2gdnFnn8IIRUUoiljDB/l68Mvcts4ighic28TVQDGNRN5W6
   X6gaBrWYjo/SY9HEcElfy9P4foXDVRHUvi8ylAlxf4+Ah2gHdsrlBcYTa
   Zc8LOKxayHIfQaBZG/5YrMJR8/oXHO7UfNDaSPEG1U1zrjFlveg2U+8RJ
   33eIGDKc72C+IwpOBunGKeGNdqIAj+7lj3LEcszuekwkRJ1t2CF8oqH37
   RMQuSC2nYeVJdTlUH5nND3mHNYzeqE50yePRo61X4XWcUvO7WwcOSrKEJ
   fVwBtjMtn0IK9/f5qRzhR8ys276l+a8SPmxwl1NgW+tS1622+NIotB7kY
   g==;
IronPort-SDR: T7ZsJ7NjPsECrHZaUHtWMbrCz3BkZnzVf1m5C3ciL05stp7EQsXGEbLfvZKuK0mWdBSZDpSdUe
 fnzSk2iU4CV9AE1glv3jDvqPsOl9ZNbGcN2joTwYnH2nW38ASvgVC+9VO8h/b+REF/KNyYQOha
 sGV+lb+rj1YbHm53H4uAL/54jpdDR4YQfoDTci0Qy7CXfyMnQdlEw/fV4QRNHgP3ksDsS2Q+Ig
 DP5Xy2nC3zNxVjnNfrYB9NRpAqwmdKhvm/vA6x+A4BvyGUEIRcYf/SDrGXE/v1M1NEwcVzct1y
 f0g=
X-IronPort-AV: E=Sophos;i="5.77,346,1596524400"; 
   d="scan'208";a="89405137"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Oct 2020 04:12:13 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 7 Oct 2020 04:11:55 -0700
Received: from soft-dev10.microsemi.net (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Wed, 7 Oct 2020 04:11:53 -0700
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v4 1/3] dt-bindings: pinctrl: Add bindings for pinctrl-mchp-sgpio driver
Date:   Wed, 7 Oct 2020 13:11:43 +0200
Message-ID: <20201007111145.2306213-2-lars.povlsen@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201007111145.2306213-1-lars.povlsen@microchip.com>
References: <20201007111145.2306213-1-lars.povlsen@microchip.com>
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
---
 .../pinctrl/microchip,sparx5-sgpio.yaml       | 140 ++++++++++++++++++
 1 file changed, 140 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
new file mode 100644
index 000000000000..fc41495800ed
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
@@ -0,0 +1,140 @@
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
+  microchip,sgpio-frequency:
+    description: The sgpio controller frequency (Hz). This dictates
+      the serial bitstream speed, which again affects the latency in
+      getting control signals back and forth between external shift
+      registers. The speed must be no larger than half the system
+      clock, and larger than zero.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
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
+        const: 3
+
+      ngpios:
+        minimum: 1
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
+      microchip,sgpio-frequency = <25000000>;
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
