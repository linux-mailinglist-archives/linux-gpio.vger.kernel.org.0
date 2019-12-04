Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EE1E1128FF
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2019 11:11:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727621AbfLDKLG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Dec 2019 05:11:06 -0500
Received: from zimbra2.kalray.eu ([92.103.151.219]:56818 "EHLO
        zimbra2.kalray.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727606AbfLDKLF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Dec 2019 05:11:05 -0500
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 43E8B27E1514;
        Wed,  4 Dec 2019 11:11:04 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id 91PZJiDiSQRY; Wed,  4 Dec 2019 11:11:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 9FBF327E0E3A;
        Wed,  4 Dec 2019 11:11:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 9FBF327E0E3A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1575454263;
        bh=49GmeuQtl5iQNzkiGn2NTlC0kJCfQvjsNi37acIHiZU=;
        h=From:To:Date:Message-Id;
        b=MIsRZrhbuhD4YYRWSmWNJQ9Z/+VlYRcCOHZMAQlWqr6F89Xjmc4Dq3ogSHvH7iEJB
         zyzQzUKNkX5kijbEZ3togmASSYAvIU8ETTegK+Jur8AVWL+4HE4e7beW9LV2B9S5aL
         iD6vNxCEKxOg0bOHSbQg2bBxAnu8lKkzyGXjyj5w=
X-Virus-Scanned: amavisd-new at zimbra2.kalray.eu
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id x_Wo29Vgnq5b; Wed,  4 Dec 2019 11:11:03 +0100 (CET)
Received: from triton.lin.mbt.kalray.eu (unknown [192.168.37.25])
        by zimbra2.kalray.eu (Postfix) with ESMTPSA id 7DB6C27E0A05;
        Wed,  4 Dec 2019 11:11:03 +0100 (CET)
From:   Clement Leger <cleger@kalray.eu>
To:     linux-kernel@vger.kernel.org
Cc:     Clement Leger <cleger@kalray.eu>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 5/5] dt-bindings: pinctrl: dw: move sps,dwapb-gpio.txt to pinctrl
Date:   Wed,  4 Dec 2019 11:10:39 +0100
Message-Id: <20191204101042.4275-6-cleger@kalray.eu>
X-Mailer: git-send-email 2.15.0.276.g89ea799
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Since the driver has been moved to pinctrl and now supports it, move the
documentation into pinctrl folder. In the same time, add documentation
for pinctrl properties such has snps,has-pinctrl and description of pin
alternate functions.

Signed-off-by: Clement Leger <cleger@kalray.eu>
---
 .../bindings/{gpio => pinctrl}/snps-dwapb-gpio.txt  | 21 ++++++++++++++++++++-
 MAINTAINERS                                         |  2 +-
 2 files changed, 21 insertions(+), 2 deletions(-)
 rename Documentation/devicetree/bindings/{gpio => pinctrl}/snps-dwapb-gpio.txt (76%)

diff --git a/Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt b/Documentation/devicetree/bindings/pinctrl/snps-dwapb-gpio.txt
similarity index 76%
rename from Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
rename to Documentation/devicetree/bindings/pinctrl/snps-dwapb-gpio.txt
index 839dd32ffe11..4fb1b754a2bd 100644
--- a/Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
+++ b/Documentation/devicetree/bindings/pinctrl/snps-dwapb-gpio.txt
@@ -1,4 +1,4 @@
-* Synopsys DesignWare APB GPIO controller
+* Synopsys DesignWare APB GPIO & pinmux controller
 
 Required properties:
 - compatible : Should contain "snps,dw-apb-gpio"
@@ -33,8 +33,16 @@ controller.
   use the interrupts-extended property to specify the interrupts and set the
   interrupt controller handle for unused interrupts to 0.
 - snps,nr-gpios : The number of pins in the port, a single cell.
+- snps,has-pinctrl : If present, register the pinctrl controller.
 - resets : Reset line for the controller.
 
+Required properties for pin configuration node:
+- function: string representing a function to mux for pins
+    dw apb controller only has two functions for each pins (sw and hw). When set
+    in software mode, the gpio controller controls the pin output. When
+    configured in hardware mode, an external peripheral controls the pin signal.
+- pins: string array of pins to be muxed.
+
 Example:
 
 gpio: gpio@20000 {
@@ -60,6 +68,17 @@ gpio: gpio@20000 {
 		gpio-controller;
 		#gpio-cells = <2>;
 		snps,nr-gpios = <8>;
+		snps,has-pinctrl;
 		reg = <1>;
+
+		uart0_pins: pinmux_uart0_pins {
+			function = "hw";
+			pins = "pin0", "pin1";
+		};
+
+		uart1_pins: pinmux_uart1_pins {
+			function = "hw";
+			pins = "pin2", "pin3";
+		};
 	};
 };
diff --git a/MAINTAINERS b/MAINTAINERS
index 35b90ad9f594..e8f9e827d687 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15873,7 +15873,7 @@ M:	Hoan Tran <hoan@os.amperecomputing.com>
 L:	linux-gpio@vger.kernel.org
 S:	Maintained
 F:	drivers/pinctrl/dw/pinctrl-dwapb.c
-F:	Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
+F:	Documentation/devicetree/bindings/pinctrl/snps-dwapb-gpio.txt
 
 SYNOPSYS DESIGNWARE AXI DMAC DRIVER
 M:	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
-- 
2.15.0.276.g89ea799

