Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E4D92B1DBD
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Nov 2020 15:52:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726734AbgKMOwY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Nov 2020 09:52:24 -0500
Received: from esa6.microchip.iphmx.com ([216.71.154.253]:44219 "EHLO
        esa6.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726503AbgKMOwY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Nov 2020 09:52:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1605279143; x=1636815143;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fa6KWX2B4zVTjwSqmWXYRE0FGe8eLF9ePLavcrFXjlI=;
  b=PdxAR4RkPBPBacxNnAzd3pEgcGpWRRt1RtAvbmrD5ZEqlnKozA6PHooB
   iqiVcPJ2DmKcD/OswyUOyeL+yPQOhMHTgPDEcu8ZGKtKcMjMT/pxCpTre
   QX0owXTxwYB7Zbtg/lrCQdu/EHQ5exlPK2vmms+Le9CtvbKweVwbp7hkV
   vM5e9/KMS8J1wzGSgEclisnMEftJ9rRve3w8VOs9shk3pJVj06kGyKPC2
   Upy6sEenrkATwWB/6sAK0OIsDoNV8vFWftPb0RpsGf3tjaUubFBQWVfY8
   Eot6UyzM4EiuwxVxjqDsNU0DMpajgSiACAmudCHViqOb79bjmbnSEHweX
   Q==;
IronPort-SDR: OCwudK5203UVl8Z4bhv/dtpWosauQ8fcDMb78EbMwnTkUCSM5Wg7afddTevrCcKRPxSDFv6CVF
 9s7dXL3Wlcz3DKzftWFXJ/pR7qjt1yaV3qw+H9tM0UM6l7R4yv22o8vp4sr1eo9rQqTsaGqNRu
 ZmXWSsHLs6DXC18ojd4XagADfASb7Ste1/m64XC0s/FA8SR1eIgjKdKMBc1Fy2a/5aoU49ukpe
 6kOJBV9a40E/DspxioJQmKB6nzRXBVGs9PY3o0T7IGYIjs8QT2QPqYTp0Fay1c/jtqMvWdVFYv
 yWU=
X-IronPort-AV: E=Sophos;i="5.77,475,1596524400"; 
   d="scan'208";a="33541702"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Nov 2020 07:52:23 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 13 Nov 2020 07:52:22 -0700
Received: from soft-dev10.microsemi.net (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Fri, 13 Nov 2020 07:52:20 -0700
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
Subject: [PATCH v10 1/3] dt-bindings: pinctrl: Add bindings for pinctrl-microchip-sgpio driver
Date:   Fri, 13 Nov 2020 15:51:49 +0100
Message-ID: <20201113145151.68900-2-lars.povlsen@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113145151.68900-1-lars.povlsen@microchip.com>
References: <20201113145151.68900-1-lars.povlsen@microchip.com>
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

