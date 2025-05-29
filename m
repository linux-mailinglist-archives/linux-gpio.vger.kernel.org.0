Return-Path: <linux-gpio+bounces-20716-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A712AC7CA8
	for <lists+linux-gpio@lfdr.de>; Thu, 29 May 2025 13:22:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09D891BC6882
	for <lists+linux-gpio@lfdr.de>; Thu, 29 May 2025 11:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A90C28EA6D;
	Thu, 29 May 2025 11:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ScddoGoS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A1A28E609
	for <linux-gpio@vger.kernel.org>; Thu, 29 May 2025 11:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748517741; cv=none; b=EzdBiGUts021rjUraRnXUnI4uyjv02j7Vgs7WvXcEdWmcE2o0edmn0MmcLOthM/n0AB5cQgqbOkWYcs8cBawRbzV3/Zbr+4ynvu+HINkK8eb4fLfMlVlfp7aXDlxdKuUJtjdaJXGRy6ioXduyyN50LpTD+e1SzxX0FLIy03KBTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748517741; c=relaxed/simple;
	bh=f6qVhB8aAi3X12mmFwL92k5Ch2dSxKmTZjw4mfsFhCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jhB+BsXrl6ZjNjfmI55MYmI0HyTEOWmMRp1gM8wFiLQ91eNhNCd8GJMYvQRK4zz6JQN+mcb4ovhu5wNhPY2MF2B+KGvba1TA2f7mjARn36S3sExKrfqeqD2N49STGD0VhN6LEoWZ84z/lCjKmqONBjAYB8Ew5+Uf5egZentC7oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ScddoGoS; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-ad8a6c202ffso144583366b.3
        for <linux-gpio@vger.kernel.org>; Thu, 29 May 2025 04:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748517738; x=1749122538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VCnL7F4i57Kf+GfDwe1G9hYOGXQ66tk2hfUTnm8oSwI=;
        b=ScddoGoSTk6DuoHywYhHXWZK20QobVqwwoSdSyODoh59PApJ7W3N4kBa3eQ+ks6hSd
         n3t5xf757thwI7AUZFofVZDJ8RMqud56gZXm4BgFv2G79IT/VAXy2kh7DdzyFlxGGvOJ
         Mm/Q4oMG0nqAFUVNCWPXzu8TLIiK1Z6nvy8SlymGRPNpv70FgojZEoTDfRWYj/CKwgJr
         v+8EfQemXNorTlYZXfHEVQHBEdF3FfFGUnqdV7lRnhbwYgcAi0PljPhNcpXI1FvMMvnM
         fb9QiBS6D+exnuVoNIB4ovKDB9BPdBXCRd95Zzdx6jZ3Xc+qAHVs7h7Cq15thfpJH7Hs
         i/Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748517738; x=1749122538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VCnL7F4i57Kf+GfDwe1G9hYOGXQ66tk2hfUTnm8oSwI=;
        b=levClkB9zF50hFIpuHGaEq45auFRAFc1ofmkkcqnAIXBu9B8ckRUAwWH4myb09AF4A
         yDXupMze/pQproKd3RRbnIn961Y3RenS8GeAkuPDUF1qn4el3REgyi68KcsOUsNEKX2G
         tnRjqLTjRrVcGddYkvrOakZfTjYp+DIwQzVATP4pLRvj2i/VMJuCNzYVjJpC25KB9fHj
         CDKym/QFf/0h2rTceDSNh/VGgH+8SrPkX2XiwNaHe7nU1/o13U78vo6AwJTXE38sjO5T
         Se2VE4ALj5nQIfdwRaiJ8oa9L/DnN5FneL0LCOFVyfLAeCpw+TAOZ3QcWsaGTNTRJ4aq
         m3HA==
X-Forwarded-Encrypted: i=1; AJvYcCV2wtG980bdDqVDQf3Smy9Od/5Df/yoQ5rfOEuvrp0S6rlx9cMqhIdaeUfj2Qi1XzWn2mACjWLJUnj8@vger.kernel.org
X-Gm-Message-State: AOJu0YyURhtydUajkfREeLNxnUsbS3CFzE22BUNulzfqProj94fNwgaU
	hGFI6ox4Y1jdsLWmbtg0we7RDsSwBjNn5HiOCHo9Mj1tDCUgmHSWX3RxoUzvjGarvPg=
X-Gm-Gg: ASbGncuRtJnvVuhEfJgJCGHoBuPYxHEutgvr+/eg/30v8hrD32qyWrTsOA/pfv9wFBZ
	gBqo6sTHcBQ7HzHRuf5V2Z8V8uqsUXgCzE6xzyrjjtwRut5RdSOKIsjRVegYiVXSAvgkck5mOMN
	O7Vb7/Jqfm7gZY2yoGQt7KQV46m0dcRF90C0RDM9/O/pyvnwJkjwndfLu1l4KFkbbyUZb0rzgS9
	3mwShvEhzy9HTyG2piBvA3IBAk/IAgyae2ZI+F8P9qO3qjthCBxRRbZhHDXAc8OCYxBAYPhN/de
	W0FY3R0rUqejeiW2GDrCCfitOFiePKRTXMG/eNJNW3OOlkHOEvv/FDt9cxqXNTrgjh6izCGzzkD
	jZ9gLZ7c5cqm1bwwS/9aP4Q==
X-Google-Smtp-Source: AGHT+IHmoS2kody7mGLjebQZNd/9vGuqJ6QkEA2hUhPHxCsDtNDv8YgqNRd+VGmwse0j0pjW/qNaRQ==
X-Received: by 2002:a17:906:99c2:b0:adb:2e5f:faea with SMTP id a640c23a62f3a-adb2e5ffe3amr2021766b.41.1748517737428;
        Thu, 29 May 2025 04:22:17 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5e2bf011sm124094766b.105.2025.05.29.04.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 04:22:16 -0700 (PDT)
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
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	Matthias Brugger <mbrugger@suse.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v10 02/13] dt-bindings: pinctrl: Add RaspberryPi RP1 gpio/pinctrl/pinmux bindings
Date: Thu, 29 May 2025 13:23:37 +0200
Message-ID: <4fb2c750e97378b2ceb5a90b983943ab5afad48d.1748514765.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748516814.git.andrea.porta@suse.com>
References: <cover.1748516814.git.andrea.porta@suse.com>
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
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 .../pinctrl/raspberrypi,rp1-gpio.yaml         | 198 ++++++++++++++++++
 1 file changed, 198 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
new file mode 100644
index 000000000000..eec9a9b58542
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
+  - A. della Porta <andrea.porta@suse.com>
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
-- 
2.35.3


