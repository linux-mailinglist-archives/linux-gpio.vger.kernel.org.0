Return-Path: <linux-gpio+bounces-13389-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 026B59E0052
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 12:27:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2D1D282037
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Dec 2024 11:27:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 173161FDE34;
	Mon,  2 Dec 2024 11:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NAvhYxek"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC89200119
	for <linux-gpio@vger.kernel.org>; Mon,  2 Dec 2024 11:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733138350; cv=none; b=ATcVF+Vs8SGfiSoRDkci1stAKfpBMBv/E43Xs8h5o1nFO2YS/dUnEsYsQO/2dU7Y4I8eihIe9RexJ1DmYxBvu+UdEggUROlOCrWng62c7VxWj8rGZ+wUFNV5i+oZ2FYqcIVsq8RqdioR7IocHIQBQpSYU6vQb4G/x5wvfyPNUuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733138350; c=relaxed/simple;
	bh=NrMSbJ2XGVtFgEyUrzA0pJr6RVYO20LGsbTNZsJdJxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pwaM2dvbMAKBhxq5q9ts+IhLBkunO5xSCpmD4W2/dNpn41KpDtOp6Srd15C9MDwwa9+ZP31Ia0uSDzlnQHa6DKzJ2/FtUkdmLWGoCPtyunYoFdq/PQGNvwvi0PByue5JszdJjOyTK/yL+EYC0WbNxXkRMyTNiwPWfrK1qrcXE+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NAvhYxek; arc=none smtp.client-ip=209.85.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-5d0bfa52bd9so3100064a12.2
        for <linux-gpio@vger.kernel.org>; Mon, 02 Dec 2024 03:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733138345; x=1733743145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7xgMRFiDopNsdcYTrP+3jxqEP/4Bdvjg/hgzdLhOu28=;
        b=NAvhYxekm+Cvvxu9TvmE/kUpgPP67phanNAUitzam8YfbbiZi74xWCLI6qSGtbGxJY
         19K3SOAXiTOwsZpYh3WmM9y/9U9RMHuyDgx+CG9xc5b1Fo3XY3x9uxjtoGJ6uUdI9SUT
         7F1Gw4mX+B/DUhkaurJpR5K2u34zBsPIRKyb3XYWRZfWsDfC7+fhg2rxPKSyR7zbg19X
         Hk1wQ+pdq9tadokA1sMJ5Z+fJlHsiDHFnf/wHX/PH6zdf/9QSdg7NfMGa1xduMNndxtH
         CTXUQoAEu0YrxCuZ7OyN6yzIkYP3UkZWk4fygRPWDPy4VPfr00jFlYET7wQOJJd1sgFR
         K/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733138345; x=1733743145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7xgMRFiDopNsdcYTrP+3jxqEP/4Bdvjg/hgzdLhOu28=;
        b=HpxkmOqpS8xNWZ4s/mMCs6DiPtjwlx4k+ZdY4sdWJNvkuYyyyBEaJ5iRyknH1wBCPm
         gHrLCCxfQa/E/A30vg+WXN9k3ab2xz1Sg6hq46kdy6yCwmtxwzAmgeH7UMQibRjaUslN
         qUpr+kQKJVeQLDU4xYvZzZBVvWJ+8CR2ZGwd+NSjN44jUwC+fN2zJVb/Y42VDTjSK+26
         mA8iwqKmP168pqPUCiXTmaT2twMbGqnUZMI+uRibCvyoLRzrCz41XBGlBOjH5lfrcxjM
         Ztrr/Zl/FwudU9BVkHjE77a4Vb36QAX+AnToDDSVCXY4w9qDOI1cXTNPnuXf0zVDdi12
         ILyw==
X-Forwarded-Encrypted: i=1; AJvYcCVY3oESPB7UWjlHfuwvs/mAfsepR8GfnT8CFSR4Wp5JvHmHna1oZBWUcpwvABbdpJUKcPQM4zge4U28@vger.kernel.org
X-Gm-Message-State: AOJu0YyRggmPWBiTI8y9WRcrAHH5KSQBHHpaXhCftK2KeQUtZ+BsRLd9
	fa1+okRBbGhK3dJGXfKi3CROcJw5T9OPbtD2giBl/oDmdyL1T+VtYcffmQ3lni4=
X-Gm-Gg: ASbGnctzYHZm9wjJM0KsOeaqxdXnb5T9g8Gx8F8p7uDAMWZiY8wkZ1icNL7TpEhiA36
	zIj+k/r1Y/Iucg2Q4WBUMzT96swynJ8cBTfyoXdjemjnxoO+jotgUcU3TJ3+yBoJmldh2NbaQna
	VHZ9Nj1qfuircn2/PfHipEQFcKGWabLTb74d5eD32cqOCZgGXn+Sfcia9iM9rfbA0qc9BVYYA+n
	OEqnf+SxzuKL4gpyONfh8/4mwmgJft3VdSLBtc12Owbi+sroQsuf8CGQnGCvZE/V3dStCQD/mFa
	Ly/fYX+UfoAFItMD0jxY
X-Google-Smtp-Source: AGHT+IF3shr2CV1+a7JjoR5W1W1EQNTv7IO8D5Vs33upiNnpNgUlouH5yyAJ4MeJYHTtkSfk/FPJ2w==
X-Received: by 2002:a17:906:5a5f:b0:a9e:b471:8008 with SMTP id a640c23a62f3a-aa580f6add9mr1651838766b.34.1733138345380;
        Mon, 02 Dec 2024 03:19:05 -0800 (PST)
Received: from localhost (host-87-20-211-251.retail.telecomitalia.it. [87.20.211.251])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa59990a7b2sm494941466b.169.2024.12.02.03.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 03:19:05 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 02/10] dt-bindings: pinctrl: Add RaspberryPi RP1 gpio/pinctrl/pinmux bindings
Date: Mon,  2 Dec 2024 12:19:26 +0100
Message-ID: <42e09506979d878547d1140d7f6bf68ace76549b.1733136811.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1733136811.git.andrea.porta@suse.com>
References: <cover.1733136811.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree bindings for the gpio/pin/mux controller that is part of
the RP1 multi function device, and relative entries in MAINTAINERS file.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../pinctrl/raspberrypi,rp1-gpio.yaml         | 198 ++++++++++++++++++
 MAINTAINERS                                   |   2 +
 2 files changed, 200 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
new file mode 100644
index 000000000000..9528f8675b3b
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
@@ -0,0 +1,198 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/raspberrypi,rp1-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RaspberryPi RP1 GPIO/Pinconf/Pinmux Controller submodule
+
+maintainers:
+  - Andrea della Porta <andrea.porta@suse.com>
+
+description:
+  The RP1 chipset is a Multi Function Device containing, among other
+  sub-peripherals, a gpio/pinconf/mux controller whose 54 pins are grouped
+  into 3 banks.
+  It works also as an interrupt controller for those gpios.
+
+properties:
+  compatible:
+    const: raspberrypi,rp1-gpio
+
+  reg:
+    maxItems: 3
+    description: One reg specifier for each one of the 3 pin banks.
+
+  '#gpio-cells':
+    description: The first cell is the pin number and the second cell is used
+      to specify the flags (see include/dt-bindings/gpio/gpio.h).
+    const: 2
+
+  gpio-controller: true
+
+  gpio-ranges:
+    maxItems: 1
+
+  gpio-line-names:
+    maxItems: 54
+
+  interrupts:
+    maxItems: 3
+    description: One interrupt specifier for each one of the 3 pin banks.
+
+  '#interrupt-cells':
+    description:
+      Specifies the Bank number [0, 1, 2] and Flags as defined in
+      include/dt-bindings/interrupt-controller/irq.h.
+    const: 2
+
+  interrupt-controller: true
+
+patternProperties:
+  '-state$':
+    oneOf:
+      - $ref: '#/$defs/raspberrypi-rp1-state'
+      - patternProperties:
+          '-pins$':
+            $ref: '#/$defs/raspberrypi-rp1-state'
+        additionalProperties: false
+
+$defs:
+  raspberrypi-rp1-state:
+    allOf:
+      - $ref: pincfg-node.yaml#
+      - $ref: pinmux-node.yaml#
+
+    description:
+      Pin controller client devices use pin configuration subnodes (children
+      and grandchildren) for desired pin configuration.
+      Client device subnodes use below standard properties.
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this
+          subnode.
+        items:
+          pattern: '^gpio([0-9]|[1-4][0-9]|5[0-3])$'
+
+      function:
+        enum: [ alt0, alt1, alt2, alt3, alt4, gpio, alt6, alt7, alt8, none,
+                aaud, dcd0, dpi, dsi0_te_ext, dsi1_te_ext, dsr0, dtr0, gpclk0,
+                gpclk1, gpclk2, gpclk3, gpclk4, gpclk5, i2c0, i2c1, i2c2, i2c3,
+                i2c4, i2c5, i2c6, i2s0, i2s1, i2s2, ir, mic, pcie_clkreq_n,
+                pio, proc_rio, pwm0, pwm1, ri0, sd0, sd1, spi0, spi1, spi2,
+                spi3, spi4, spi5, spi6, spi7, spi8, uart0, uart1, uart2, uart3,
+                uart4, uart5, vbus0, vbus1, vbus2, vbus3 ]
+
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+
+      bias-disable: true
+      bias-pull-down: true
+      bias-pull-up: true
+      input-enable: true
+      input-schmitt-enable: true
+      output-enable: true
+      output-high: true
+      output-low: true
+      slew-rate:
+        description: 0 is slow slew rate, 1 is fast slew rate
+        enum: [ 0, 1 ]
+      drive-strength:
+        enum: [ 2, 4, 8, 12 ]
+
+    additionalProperties: false
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+required:
+  - reg
+  - compatible
+  - '#gpio-cells'
+  - gpio-controller
+  - interrupts
+  - '#interrupt-cells'
+  - interrupt-controller
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    rp1 {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        rp1_gpio: pinctrl@c0400d0000 {
+            reg = <0xc0 0x400d0000  0x0 0xc000>,
+                  <0xc0 0x400e0000  0x0 0xc000>,
+                  <0xc0 0x400f0000  0x0 0xc000>;
+            compatible = "raspberrypi,rp1-gpio";
+            gpio-controller;
+            #gpio-cells = <2>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+            interrupts = <0 IRQ_TYPE_LEVEL_HIGH>,
+                         <1 IRQ_TYPE_LEVEL_HIGH>,
+                         <2 IRQ_TYPE_LEVEL_HIGH>;
+            gpio-line-names =
+                   "ID_SDA", // GPIO0
+                   "ID_SCL", // GPIO1
+                   "GPIO2", "GPIO3", "GPIO4", "GPIO5", "GPIO6",
+                   "GPIO7", "GPIO8", "GPIO9", "GPIO10", "GPIO11",
+                   "GPIO12", "GPIO13", "GPIO14", "GPIO15", "GPIO16",
+                   "GPIO17", "GPIO18", "GPIO19", "GPIO20", "GPIO21",
+                   "GPIO22", "GPIO23", "GPIO24", "GPIO25", "GPIO26",
+                   "GPIO27",
+                   "PCIE_RP1_WAKE", // GPIO28
+                   "FAN_TACH", // GPIO29
+                   "HOST_SDA", // GPIO30
+                   "HOST_SCL", // GPIO31
+                   "ETH_RST_N", // GPIO32
+                   "", // GPIO33
+                   "CD0_IO0_MICCLK", // GPIO34
+                   "CD0_IO0_MICDAT0", // GPIO35
+                   "RP1_PCIE_CLKREQ_N", // GPIO36
+                   "", // GPIO37
+                   "CD0_SDA", // GPIO38
+                   "CD0_SCL", // GPIO39
+                   "CD1_SDA", // GPIO40
+                   "CD1_SCL", // GPIO41
+                   "USB_VBUS_EN", // GPIO42
+                   "USB_OC_N", // GPIO43
+                   "RP1_STAT_LED", // GPIO44
+                   "FAN_PWM", // GPIO45
+                   "CD1_IO0_MICCLK", // GPIO46
+                   "2712_WAKE", // GPIO47
+                   "CD1_IO1_MICDAT1", // GPIO48
+                   "EN_MAX_USB_CUR", // GPIO49
+                   "", // GPIO50
+                   "", // GPIO51
+                   "", // GPIO52
+                   ""; // GPIO53
+
+            rp1-i2s0-default-state {
+                function = "i2s0";
+                pins = "gpio18", "gpio19", "gpio20", "gpio21";
+                bias-disable;
+            };
+
+            rp1-uart0-default-state {
+                txd-pins {
+                    function = "uart0";
+                    pins = "gpio14";
+                    bias-disable;
+                };
+
+                rxd-pins {
+                    function = "uart0";
+                    pins = "gpio15";
+                    bias-pull-up;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 8ced4ed32c00..a547e863807c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19578,7 +19578,9 @@ RASPBERRY PI RP1 PCI DRIVER
 M:	Andrea della Porta <andrea.porta@suse.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
+F:	Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
 F:	include/dt-bindings/clock/rp1.h
+F:	include/dt-bindings/misc/rp1.h
 
 RC-CORE / LIRC FRAMEWORK
 M:	Sean Young <sean@mess.org>
-- 
2.35.3


