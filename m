Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30FDD2874D3
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Oct 2020 15:05:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730274AbgJHNFa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Oct 2020 09:05:30 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:42834 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730146AbgJHNF3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Oct 2020 09:05:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1602162329; x=1633698329;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VdJpqnrCyvW7VQ1RSbiMo6xgusNO3aMhKhOn09ATvjo=;
  b=tYydNxOpRI+U0oWmWmhZ51oDfhA2QexDKtXBYznvHijlZbgtqWQXdxDI
   wNl/jwPRbUq6CGkc1qjdiuUFGM9it2Lg7gned4rrQeozA1J7O4bV7f73U
   cpM5y/xPppiP/27Eqp3jCHBjUgPP5mU4eU3wX7ZggjIUQB3Bce04p+blk
   ppiilF9TtWxA+r2gdLC8zXDNpznvBY7xTTJDDV0RSmUjzksVO07DU8ZY4
   IHPbVXxfrtkB1O52iiZiyYJhUa+KDwHCEx06VisVnNT+xPSsy/4IACZSz
   eyxWsgbSDti4pLpLL4f8Rr02dtWrsNXd6LObx2v25WaUjOnyU9XCdZEqt
   Q==;
IronPort-SDR: 7sNj4/jUXKcKei9HTdhRWvuFtg7Rjc4rh8ZszfIlhjgnvqnOIGISIKvIkstWBhCKRUgna4QM50
 H9m/VvyCGL0+Nm83zAed/gqRjmT2hTeMSBTsHjw7Y98Fj5okwg0mr4Fw53Zsx2Dyk+z2Hn+GRa
 D9FaolcXxukMPSaPcWhaMljqh9hljvw/538V7MX29UUsTnmRtO8u8GOn8VxkmTVUMtktSsUvcZ
 wE7I+/iUz4sDALwULhWyyw488mSkTzk8Y7iBgcnbO3ivpYaMPx5MF6b+RULU4IhPSL6IhWORDV
 QgM=
X-IronPort-AV: E=Sophos;i="5.77,350,1596524400"; 
   d="scan'208";a="94643176"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Oct 2020 06:05:28 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 8 Oct 2020 06:05:27 -0700
Received: from soft-dev10.microsemi.net (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Thu, 8 Oct 2020 06:05:25 -0700
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v5 1/3] dt-bindings: pinctrl: Add bindings for pinctrl-microchip-sgpio driver
Date:   Thu, 8 Oct 2020 15:05:13 +0200
Message-ID: <20201008130515.2385825-2-lars.povlsen@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201008130515.2385825-1-lars.povlsen@microchip.com>
References: <20201008130515.2385825-1-lars.povlsen@microchip.com>
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
