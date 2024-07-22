Return-Path: <linux-gpio+bounces-8345-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E36938EE6
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2024 14:11:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67AB21C2124E
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2024 12:11:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7B9C16D4E5;
	Mon, 22 Jul 2024 12:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mo7aMFNe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE84F16CD32;
	Mon, 22 Jul 2024 12:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721650282; cv=none; b=gEsHqt9W7wceUpOIBlfUGQiRMq+yiXDh3BG+EQli3zFEbvmElBSt1/P4Qr6utsZbXTyX/Yo7PHVF6Hd/TGIC7rGD1oC1vhNNpTCA1wH/3NAyuyotvUPpNzeb0TI3KJvKFjSyotFYF9S+W3zlCn3yu50g5QYGMpnsgi5up9jaRl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721650282; c=relaxed/simple;
	bh=AjGOHNrcbUkES1BHSLfifOFPW26U1lQsP9UPuHrjplo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tbRIWRFgt7cVja4NOLjvltJ0z0b74E3L2CWBws8237pcGZdSPffrdk3fk8ZOwe4j/QLDoC+WVnVDTLMEcX3BjY4XbNbzqdmG6kgvbT7HfCPij0EHd9nHjyQ9trBNPn9Z35ZTnO4A1wj33RNaDAwrWevTaI1slHOORM4Nbjxp5n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mo7aMFNe; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 007D94CF;
	Mon, 22 Jul 2024 14:10:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1721650238;
	bh=AjGOHNrcbUkES1BHSLfifOFPW26U1lQsP9UPuHrjplo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mo7aMFNeO4QbWaon2NcIVZrW41oxyTNTUqUwD1jHVmSOBwovjqRpCOoK51cCFcty0
	 Je2dO5UyqjAmUg1vY2+f7rchBRl3z4Tr2KOh3YKpNx67wdKpMZ2z+cjKleR7lQNS1J
	 PP/eHdoC8Nz/Ef9IDRHqXlH1dM1tGYvfSRR3GXF0=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-pwm@vger.kernel.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Haibo Chen <haibo.chen@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>
Subject: [PATCH v7 1/4] dt-bindings: mfd: Add Analog Devices ADP5585
Date: Mon, 22 Jul 2024 15:10:57 +0300
Message-ID: <20240722121100.2855-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240722121100.2855-1-laurent.pinchart@ideasonboard.com>
References: <20240722121100.2855-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ADP5585 is a 10/11 input/output port expander with a built in keypad
matrix decoder, programmable logic, reset generator, and PWM generator.
These bindings model the device as an MFD, and support the GPIO expander
and PWM functions.

These bindings support the GPIO and PWM functions.

Drop the existing adi,adp5585 and adi,adp5585-02 compatible strings from
trivial-devices.yaml. They have been added there by mistake as the
driver that was submitted at the same time used different compatible
strings. We can take them over safely.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
I've limited the bindings to GPIO and PWM as I lack hardware to design,
implement and test the rest of the features the chip supports.

Changes since v5:

- Fix gpio-reserved-ranges definition

Changes since v4:

- Drop the right comment in trivial-devices.yaml

Changes since v3:

- Fix prefix and drop redundant text in subject line
- Rename node in example from mfd@ to io-expander@

Changes since v2:

- Drop gpio property from required
- Drop second example

Changes since v1:

- Squash "dt-bindings: trivial-devices: Drop adi,adp5585 and
  adi,adp5585-02" into this patch
- Merge child nodes into parent node
---
 .../devicetree/bindings/mfd/adi,adp5585.yaml  | 92 +++++++++++++++++++
 .../devicetree/bindings/trivial-devices.yaml  |  4 -
 MAINTAINERS                                   |  7 ++
 3 files changed, 99 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/adi,adp5585.yaml

diff --git a/Documentation/devicetree/bindings/mfd/adi,adp5585.yaml b/Documentation/devicetree/bindings/mfd/adi,adp5585.yaml
new file mode 100644
index 000000000000..f9c069f8534b
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/adi,adp5585.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/adi,adp5585.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices ADP5585 Keypad Decoder and I/O Expansion
+
+maintainers:
+  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+
+description:
+  The ADP5585 is a 10/11 input/output port expander with a built in keypad
+  matrix decoder, programmable logic, reset generator, and PWM generator.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - adi,adp5585-00  # Default
+          - adi,adp5585-01  # 11 GPIOs
+          - adi,adp5585-02  # No pull-up resistors by default on special pins
+          - adi,adp5585-03  # Alternate I2C address
+          - adi,adp5585-04  # Pull-down resistors on all pins by default
+      - const: adi,adp5585
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  vdd-supply: true
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  gpio-reserved-ranges: true
+
+  "#pwm-cells":
+    const: 3
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - "#gpio-cells"
+  - "#pwm-cells"
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: adi,adp5585-01
+    then:
+      properties:
+        gpio-reserved-ranges: false
+    else:
+      properties:
+        gpio-reserved-ranges:
+          maxItems: 1
+          items:
+            items:
+              - const: 5
+              - const: 1
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        io-expander@34 {
+            compatible = "adi,adp5585-00", "adi,adp5585";
+            reg = <0x34>;
+
+            vdd-supply = <&reg_3v3>;
+
+            gpio-controller;
+            #gpio-cells = <2>;
+            gpio-reserved-ranges = <5 1>;
+
+            #pwm-cells = <3>;
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 0a419453d183..8a6056323545 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -38,10 +38,6 @@ properties:
           - ad,adm9240
             # AD5110 - Nonvolatile Digital Potentiometer
           - adi,ad5110
-            # Analog Devices ADP5585 Keypad Decoder and I/O Expansion
-          - adi,adp5585
-            # Analog Devices ADP5585 Keypad Decoder and I/O Expansion with support for Row5
-          - adi,adp5585-02
             # Analog Devices ADP5589 Keypad Decoder and I/O Expansion
           - adi,adp5589
             # Analog Devices LT7182S Dual Channel 6A, 20V PolyPhase Step-Down Silent Switcher
diff --git a/MAINTAINERS b/MAINTAINERS
index 958e935449e5..4fe8bd8752a5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -526,6 +526,13 @@ F:	drivers/leds/leds-adp5520.c
 F:	drivers/mfd/adp5520.c
 F:	drivers/video/backlight/adp5520_bl.c
 
+ADP5585 GPIO EXPANDER, PWM AND KEYPAD CONTROLLER DRIVER
+M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+L:	linux-gpio@vger.kernel.org
+L:	linux-pwm@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/*/adi,adp5585*.yaml
+
 ADP5588 QWERTY KEYPAD AND IO EXPANDER DRIVER (ADP5588/ADP5587)
 M:	Michael Hennerich <michael.hennerich@analog.com>
 S:	Supported
-- 
Regards,

Laurent Pinchart


