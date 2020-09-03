Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C83925C3F7
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Sep 2020 17:01:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729457AbgICPBp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Sep 2020 11:01:45 -0400
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:45501 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728901AbgICOFq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Sep 2020 10:05:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1599141945; x=1630677945;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XhjSQzdLpx3cLG7IPjN6/FZ2dqHvFMkU3/3chby5SGU=;
  b=hPSkQS96oD9b5J8c9XhV9Ac/ZAagmwYLE9Q4Ay1pzs6VwyDUzpB0slfA
   IxbshV9GQmfw88cWB4NfXo3GYP9AevCpCsDwQilHaKbmiKyfdMtxgt/Vf
   //1hGIaIb0aaUa7iPPvy/OUaETxKPE+syJw7GoR7A8/dY420n9xNPMxf6
   1mwyU14ImZaxfsn/QJTkCHq/C6ioqKfUVG1FuQvOaezqU9VGW1PT8YC6C
   BWLBQ2oCNKgJcjb+sZOtbQSIdoh/saFXKAFu9KVBNLnqSVpai+YH2oouv
   A/x0HQBCqM1UMK2ygggLK0n0PBu+FZU2I9/BwfNe0AnvCFrHLtTUweGMP
   g==;
IronPort-SDR: 1LS7gf6+EWFKbSgkGJcUzpuGon1lIscUl2tjUQA6Gr3Ey7Nu8yzzIkWd3wrWgWyxEC3TRVm37M
 rsKkup5TqL+eMZCWRAREsMhCNbSs4UygDVJkLO8N/FSNxvt5gHRgSmz+c8r42B/+cN6dg3RuL5
 ZySl0IsbArTgC6FUcGdE01T0Kj9gCijbQQ254WUbQC/5dHdw5RmKskmnA5bqvT1aLKtz1uYQ9b
 YKIuU+PXHJHLpW2djNUziGk4OI8w3MWFndkr8BO4VbPW/7Lv/T2On5AyW7dHGp2DMByQn1yltm
 Q2U=
X-IronPort-AV: E=Sophos;i="5.76,386,1592895600"; 
   d="scan'208";a="87815717"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Sep 2020 06:35:44 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 3 Sep 2020 06:35:03 -0700
Received: from soft-dev15.microsemi.net (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.1979.3 via Frontend Transport; Thu, 3 Sep 2020 06:35:00 -0700
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v2 1/3] dt-bindings: pinctrl: Add bindings for pinctrl-mchp-sgpio driver
Date:   Thu, 3 Sep 2020 15:35:26 +0200
Message-ID: <20200903133528.8595-2-lars.povlsen@microchip.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200903133528.8595-1-lars.povlsen@microchip.com>
References: <20200903133528.8595-1-lars.povlsen@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This adds DT bindings for the Microsemi/Microchip SGPIO controller,
bindings microchip,sparx5-sgpio, mscc,ocelot-sgpio and
mscc,luton-sgpio.

Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
---
 .../pinctrl/microchip,sparx5-sgpio.yaml       | 88 +++++++++++++++++++
 include/dt-bindings/gpio/mchp-sgpio.h         | 19 ++++
 2 files changed, 107 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
 create mode 100644 include/dt-bindings/gpio/mchp-sgpio.h

diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
new file mode 100644
index 000000000000..25a50ba9e893
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
@@ -0,0 +1,88 @@
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
+    pattern: "gpio"
+
+  compatible:
+    enum:
+      - microchip,sparx5-sgpio
+      - mscc,ocelot-sgpio
+      - mscc,luton-sgpio
+
+  clocks:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    description: GPIO consumers must specify four arguments, first the
+      port number, then the bit number, then a input/output flag and
+      finally the GPIO flags (from include/dt-bindings/gpio/gpio.h).
+      The dt-bindings/gpio/mchp-sgpio.h file define manifest constants
+      PIN_INPUT and PIN_OUTPUT.
+    const: 4
+
+  gpio-ranges:
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
+required:
+  - compatible
+  - clocks
+  - gpio-controller
+  - '#gpio-cells'
+  - gpio-ranges
+  - microchip,sgpio-port-ranges
+
+examples:
+  - |
+    sgpio2: gpio@1101036c {
+        compatible = "microchip,sparx5-sgpio";
+        pinctrl-0 = <&sgpio0_pins>;
+        pinctrl-names = "default";
+        reg = <0x1101036c 0x100>;
+        clocks = <&sys_clk>;
+        gpio-controller;
+        gpio-ranges = <&sgpio0 0 0 192>;
+        #gpio-cells = <4>;
+        microchip,sgpio-port-ranges = <0 0 16 18 28 31>;
+        microchip,sgpio-frequency = <25000000>;
+    };
diff --git a/include/dt-bindings/gpio/mchp-sgpio.h b/include/dt-bindings/gpio/mchp-sgpio.h
new file mode 100644
index 000000000000..61b8aa75d870
--- /dev/null
+++ b/include/dt-bindings/gpio/mchp-sgpio.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * This header provides constants for binding the Microchip SGPIO
+ * driver.
+ *
+ */
+
+#ifndef _DT_BINDINGS_GPIO_MCHP_SGPIO_H
+#define _DT_BINDINGS_GPIO_MCHP_SGPIO_H
+
+#include <dt-bindings/gpio/gpio.h>
+
+/* mchp-sgpio specific pin type defines */
+#undef PIN_OUTPUT
+#undef PIN_INPUT
+#define PIN_OUTPUT	0
+#define PIN_INPUT	1
+
+#endif
--
2.27.0
