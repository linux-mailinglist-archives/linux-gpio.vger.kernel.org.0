Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 482E6284D97
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Oct 2020 16:25:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726128AbgJFOZu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Oct 2020 10:25:50 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:52073 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725902AbgJFOZu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Oct 2020 10:25:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1601994349; x=1633530349;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=37P99FRWrTMea0KX2EyNsdkN2HT1aIXVZC/6d50PNvI=;
  b=SlIg7A360Sz2zu++eHJLp38O7uYEbwFmVL0jmJXHfkvO7IjlbGKisexG
   ybbfi5C2Wc2TXK4tB4mTgOFehNlKlZU+lYK3DzRI1GgtPeqP+84RAjJBt
   8NqLRd3aSXxW/ufptRXw+3xfftx5LDn+dp5ETykdaXxRGNfxmFCBFUjH9
   +ppEXHyWXeJWRoyr2dxCkXcxywp5Rb4Bk+HlNT2HrqhUFxCZDSm3s768/
   b4HwYxiRs1+m7ZJrKMUc7r89hp9R8DH6kyAQ+ahl0/ZRC/jL9s5IRa6LZ
   81R1AGjZX6KkyExrET7SSBvTQUoYxJ3VGIbsu81SSF9hQ5RpJo1ak4TW7
   Q==;
IronPort-SDR: YJuGaFUd0eQZOSzlVK+qKNTD/fwzBuBzoVOniv3LCkJ39DPD5ilW+I/yYsSUXACpWxBaNLxPes
 w08Ku3RCBbrU4mxko7OwKdw774DF8E+kN8CWL/4Y4ZNOBuM2LK1yPZ3hIBiw9cNdPwBFUEeeA0
 X/F6m5tpyvTdTjjEklryB9PXhVupd3IW7WizTSZufatvBm4NwjKQ1eMBMIsVNtBAaPjF74bl0f
 4owP7SftBz3dHn4hdXRVz+iIMxtop1LVqjLzC8FTNQNmCntDDafeR2LN2isVTXPj3r38fiarLZ
 hn4=
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; 
   d="scan'208";a="94382233"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Oct 2020 07:25:48 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 6 Oct 2020 07:25:37 -0700
Received: from soft-dev10.microsemi.net (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Tue, 6 Oct 2020 07:25:36 -0700
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [RESEND PATCH v3 1/3] dt-bindings: pinctrl: Add bindings for pinctrl-mchp-sgpio driver
Date:   Tue, 6 Oct 2020 16:25:30 +0200
Message-ID: <20201006142532.2247515-2-lars.povlsen@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201006142532.2247515-1-lars.povlsen@microchip.com>
References: <20201006142532.2247515-1-lars.povlsen@microchip.com>
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
 .../pinctrl/microchip,sparx5-sgpio.yaml       | 127 ++++++++++++++++++
 1 file changed, 127 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
new file mode 100644
index 000000000000..e3618ed28165
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
@@ -0,0 +1,127 @@
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
+      inclusive. Arguments must be between 0 and 31.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 2
+    maxItems: 64
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
+  "^gpio-(port|controller)@[01]$":
+    type: object
+    properties:
+      compatible:
+        const: microchip,sparx5-sgpio-bank
+
+      reg:
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
+    	#address-cells = <1>;
+    	#size-cells = <0>;
+    	compatible = "microchip,sparx5-sgpio";
+    	clocks = <&sys_clk>;
+    	pinctrl-0 = <&sgpio2_pins>;
+    	pinctrl-names = "default";
+    	reg = <0x1101059c 0x100>;
+        microchip,sgpio-port-ranges = <0 0 16 18 28 31>;
+        microchip,sgpio-frequency = <25000000>;
+    	sgpio_in2: gpio-controller@0 {
+            reg = <0>;
+            compatible = "microchip,sparx5-sgpio-bank";
+            gpio-controller;
+            #gpio-cells = <3>;
+            ngpios = <96>;
+    	};
+    	sgpio_out2: gpio-controller@1 {
+            compatible = "microchip,sparx5-sgpio-bank";
+            reg = <1>;
+            gpio-controller;
+            #gpio-cells = <3>;
+            ngpios = <96>;
+    	};
+    };
--
2.25.1
