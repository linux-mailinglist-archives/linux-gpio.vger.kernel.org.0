Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D32A1D1729
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2020 16:11:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731192AbgEMOLp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 May 2020 10:11:45 -0400
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:49833 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388793AbgEMOLp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 May 2020 10:11:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1589379105; x=1620915105;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=34twIogV2VXK/5cBS72qnRikOQ0cr6shYcbN5Zkqzio=;
  b=JAcD5w+Ygp5/z9diRzluAXs9/8TtJirEwKht0TUDg2wkvPzyBgeEx6s2
   fn+OujZMEyOLjN4CsD8z72joJL36lBPYoY+hjsE9rXinjD8FHokUam2oe
   t8RjXG6kRsRcittEbFECfJHGeSXtKOgN4FOdFikuHmYS12Ql6xhhvpiXj
   aoR6wm98Tl2lsRixql4PtIeAX6OvdOB/BjFj+PIPyYblHMNnB2HzMZlPS
   SxmI7NTNnflK3fJQtG704C9o8z2y6txHue65S8rMthJwVjMyXeXHKOYWV
   gUgyAu4O/aMujL9chp5X+H7VWHl8RKqy064nQAiyTZp+RJ+ime6RM6QCS
   w==;
IronPort-SDR: 1Od7ZgHDf3L4nkg5mwvATSydVTQ86uLwEiNi85EJaP111dxqzLBA+OxfAvvy9dWvLYoCKZdqvB
 ovc2q9wkw/Yo4/jGc+VJOnD2+CTYBxKtnHPED5U8Cwk9DRwf6uR8girTu+/q2BEFw5eibcRpJY
 FXL+yds+jxjKZGYEv/AvG/PCNhX4CeS775uEInmoQ8gpHaO+pMAvUZvAgkX11IZVeLLAWurqiV
 kGEv5oFfQePXM65mjiPGt+jr8t5W9huziq/Es9bu/Db5vDcx6+/vZ3CivTNnr4Ep0yiLyr6Ki7
 J40=
X-IronPort-AV: E=Sophos;i="5.73,388,1583218800"; 
   d="scan'208";a="79449768"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 May 2020 07:11:44 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 13 May 2020 07:11:47 -0700
Received: from soft-dev15.microsemi.net (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Wed, 13 May 2020 07:11:42 -0700
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     SoC Team <soc@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Rob Herring" <robh+dt@kernel.org>
CC:     Lars Povlsen <lars.povlsen@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 1/3] dt-bindings: pinctrl: Add bindings for mscc,ocelot-sgpio
Date:   Wed, 13 May 2020 16:11:32 +0200
Message-ID: <20200513141134.25819-2-lars.povlsen@microchip.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200513141134.25819-1-lars.povlsen@microchip.com>
References: <20200513141134.25819-1-lars.povlsen@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This adds DT bindings for the Microsemi SGPIO controller, bindings
mscc,ocelot-sgpio and mscc,luton-sgpio.

Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Lars Povlsen <lars.povlsen@microchip.com>
---
 .../bindings/pinctrl/mscc,ocelot-sgpio.yaml   | 66 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 include/dt-bindings/gpio/mchp-sgpio.h         | 21 ++++++
 3 files changed, 88 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mscc,ocelot-sgpio.yaml
 create mode 100644 include/dt-bindings/gpio/mchp-sgpio.h

diff --git a/Documentation/devicetree/bindings/pinctrl/mscc,ocelot-sgpio.yaml b/Documentation/devicetree/bindings/pinctrl/mscc,ocelot-sgpio.yaml
new file mode 100644
index 0000000000000..a332a0f4582fa
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/mscc,ocelot-sgpio.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/mscc,ocelot-sgpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microsemi Serial GPIO controller
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
+      - mscc,ocelot-sgpio
+      - mscc,luton-sgpio
+
+  clocks:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    description: Specifying the pin number and flags, as defined in
+      include/dt-bindings/gpio/gpio.h
+    const: 2
+
+  gpio-ranges:
+    maxItems: 1
+
+  microchip,sgpio-ports:
+    description: This is a 32-bit bitmask, configuring whether a
+      particular port in the controller is enabled or not. This allows
+      unused ports to be removed from the bitstream and reduce latency.
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+
+required:
+  - compatible
+  - clocks
+  - gpio-controller
+  - '#gpio-cells'
+  - gpio-ranges
+
+examples:
+  - |
+    sgpio0: gpio@61101036c {
+        compatible = "mscc,ocelot-sgpio";
+        clocks = <&sys_clk>;
+        pinctrl-0 = <&sgpio0_pins>;
+        pinctrl-names = "default";
+        reg = <0x1101036c 0x100>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&gpio 0 64 64>;
+        microchip,sgpio-ports = <0x00ffffff>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index de64fd4548697..cdb63ca04670d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11233,6 +11233,7 @@ S:	Supported
 F:	Documentation/devicetree/bindings/mips/mscc.txt
 F:	Documentation/devicetree/bindings/power/reset/ocelot-reset.txt
 F:	Documentation/devicetree/bindings/spi/mscc,ocelot-spi.yaml
+F:	Documentation/devicetree/bindings/pinctrl/mscc,ocelot-sgpio.yaml
 F:	arch/mips/boot/dts/mscc/
 F:	arch/mips/configs/generic/board-ocelot.config
 F:	arch/mips/generic/board-ocelot.c
diff --git a/include/dt-bindings/gpio/mchp-sgpio.h b/include/dt-bindings/gpio/mchp-sgpio.h
new file mode 100644
index 0000000000000..0736158563f0a
--- /dev/null
+++ b/include/dt-bindings/gpio/mchp-sgpio.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * This header provides constants for binding mscc,*-sgpio
+ *
+ * The first cell in the SGPIO specifier is the GPIO ID. The macros below
+ * provide machros for this.
+ *
+ * The second cell contains standard flag values specified in gpio.h.
+ */
+
+#ifndef _DT_BINDINGS_GPIO_MSCC_SGPIO_H
+#define _DT_BINDINGS_GPIO_MSCC_SGPIO_H
+
+#include <dt-bindings/gpio/gpio.h>
+
+#define MSCC_SGPIOS_PER_BANK	32
+#define MSCC_SGPIO_BANK_DEPTH	4
+
+#define MSCC_SGPIO(port, bit) ((bit * MSCC_SGPIOS_PER_BANK) + port)
+
+#endif
--
2.26.2
