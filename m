Return-Path: <linux-gpio+bounces-20702-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D58AC7C09
	for <lists+linux-gpio@lfdr.de>; Thu, 29 May 2025 12:48:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 480701C042D5
	for <lists+linux-gpio@lfdr.de>; Thu, 29 May 2025 10:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3102028E606;
	Thu, 29 May 2025 10:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="P2vediOX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5172428DF45
	for <linux-gpio@vger.kernel.org>; Thu, 29 May 2025 10:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748515686; cv=none; b=rbkE3ESdEY/OZL1EpVDkhjnMRZnTAc5dELmnCN3LUuhju1SrlEFkNMF9EREjki/XSm2bPCQtPs4DxEdY7nj6NFMyOnEeLQqG4H6mrt+VwmKA/NR/psg1CY0WCHaYG+u005GiukXPGcAOOmifBpQGr93ACHcT+edtLxQ2lpWJ4Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748515686; c=relaxed/simple;
	bh=1k00ZPSbe+u73O93XUJQSZ9BJLlOaPaki/m1ZdOztYg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y5nb3oOHN6cg6vNCuNqc+qLr9ptoeSd4DYgDYkzT9+ZW9kll9MJO7azEhz9/NtkeqGEAlEI1WJUY5Cgm8Z1+m4RMOxqHQaunA1C6pZjvtoOosNja+WeLcFMZmTXfYOl+kbbZeTvExhgQuUbL7nLx8l9gc56yVLX/U8x/hFiL+Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=P2vediOX; arc=none smtp.client-ip=209.85.218.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-acbb85ce788so137880466b.3
        for <linux-gpio@vger.kernel.org>; Thu, 29 May 2025 03:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748515682; x=1749120482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VGboxmMcozIYFpgNSd3yUXiFLJRnkvYuern9jhJu7Ss=;
        b=P2vediOXNGsQ6mCAXlXow2TKG85KZJdaTstavtGgxK+3gIrECO2hYqSEgBXQFvobxV
         TPKcrJFfiaQ68bs/iLCyLyp6YJ1v7MG0G6Lalm1f+2vxzIkCugmgyX10fLZebA6xnQWm
         DeCAHvs+i8zo1nkOB5Q3eOwewMhPUWrH7pqcQ8PFUI7BadkQm2eTlaxzew3gKP7bfL3R
         sltce2WtEgvVMLNHC08HitMpp0ahUCZTJ6uNz1H6XaTtBi3uUdzz5LVgGv5DL3qRw8iz
         HNORhxGRp4cLG8UQ3cPAYrIf19qomG4+YgvXIC26b+pYi+sElJbGTISX2PFSyc5MmUdz
         ycEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748515682; x=1749120482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VGboxmMcozIYFpgNSd3yUXiFLJRnkvYuern9jhJu7Ss=;
        b=pozt16thGS0wjHO9T2Ti5srB9DoYucHT929gInIaoIGv/xsK/4A4zSSCPjnNx501Sy
         QX2HDTE7tcnaCPz4yOXyZQETOF6QXicn865v7kk4O98SHqSMZgePeK3Kmz5bignC79qX
         bJ0phEqOIOzi+s9UECb+S+YKpHtuLeGMgLoEI8uiwT1YjrXSGGQUxHSq0L3aURIwD04k
         Hlo8GKhalf8XhzYcszJZ8V8sSuWeaqW8JPbXdjszqHQ2LzA0lskUa4xsdWW/1PeL8VnR
         LBkwy+kxJ7407kaCebZEnCnqhZXuttGydqhe7QqNSqkkYTPOc9002S6Z+z4yqJ8KMcX5
         cW+g==
X-Forwarded-Encrypted: i=1; AJvYcCVebNk577axphojDzmxo+WFe1zY47pdogJs2OFoOAvmSNwbmCloopBTYNqP50nBNC4RfEXjyUpLOvg2@vger.kernel.org
X-Gm-Message-State: AOJu0YzeLx78mmpZvmpIUIzj2AJtRZoF+IgFEOHcvGkGyVlsa1zuGFsb
	t7tytNI17awYFK6LZGhJjtfAkJpsYmAVWHfaOvdqMBJ4M1wfrLMYyl3gPW2zl6ppp5avbwN9sT4
	bo2HuevlLKw==
X-Gm-Gg: ASbGncs1/ksxs9puJfXsi9w6rsl45dJ185/WvDqRot8GpXVVTbXn76OB/C94K0Yrtgn
	4ChvFE9HZr7d0xa9A0NwlLom0lpsondamdvpKEqgdyBneolMlAxhQUIctJcK8GOdictmxB3uvy/
	oK6ARVk7VQQNZU5XR5lVARpbQyJQCyiTTYLJpevisd6qX8xM50Fy/Al9xjFkI+In7as+a3uoWc3
	elnR3TO91/3LictbDPZZfKETfKpQD/42fkY2fjjKWnDFzRNQ2PBRDGTpV21MpJFWWJ+aj88MpLz
	ly1SSxfj9ffn01/VM/mWHtO8VWUr4AE1rW9WGXrP4RabD603Zr7Ix1jvXx2kmOWaEzrFmruXTOD
	0l5gAVSTgRJgfOjtQYByWmQ==
X-Google-Smtp-Source: AGHT+IE3SrBjaCCjnxQnBU1Yi6AIusD4ERoFbKQfXPvufzlDmmC5yuaEUmSN0dB9KzizrZ6ZQVyq5Q==
X-Received: by 2002:a17:907:7ea0:b0:ad5:b2aa:847c with SMTP id a640c23a62f3a-adadf2a13e1mr163848466b.54.1748515682461;
        Thu, 29 May 2025 03:48:02 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5dd045e2sm119258566b.90.2025.05.29.03.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 03:48:02 -0700 (PDT)
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
Subject: [PATCH v10 3/5] dt-bindings: misc: Add device specific bindings for RaspberryPi RP1
Date: Thu, 29 May 2025 12:49:20 +0200
Message-ID: <7564a3bb528f3ca965e6e88b435aa8815fe0c2ea.1748514765.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748514765.git.andrea.porta@suse.com>
References: <cover.1748514765.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RP1 is a MFD that exposes its peripherals through PCI BARs. This
schema is intended as minimal support for the clock generator and
gpio controller peripherals which are accessible through BAR1.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 .../devicetree/bindings/misc/pci1de4,1.yaml   | 137 ++++++++++++++++++
 1 file changed, 137 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/pci1de4,1.yaml

diff --git a/Documentation/devicetree/bindings/misc/pci1de4,1.yaml b/Documentation/devicetree/bindings/misc/pci1de4,1.yaml
new file mode 100644
index 000000000000..2f9a7a554ed8
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/pci1de4,1.yaml
@@ -0,0 +1,137 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/misc/pci1de4,1.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RaspberryPi RP1 MFD PCI device
+
+maintainers:
+  - A. della Porta <andrea.porta@suse.com>
+
+description:
+  The RaspberryPi RP1 is a PCI multi function device containing
+  peripherals ranging from Ethernet to USB controller, I2C, SPI
+  and others.
+  The peripherals are accessed by addressing the PCI BAR1 region.
+
+allOf:
+  - $ref: /schemas/pci/pci-ep-bus.yaml
+
+properties:
+  compatible:
+    additionalItems: true
+    maxItems: 3
+    items:
+      - const: pci1de4,1
+
+  '#interrupt-cells':
+    const: 2
+    description: |
+      Specifies respectively the interrupt number and flags as defined
+      in include/dt-bindings/interrupt-controller/irq.h.
+      Since all interrupts are active high, only IRQ_TYPE_LEVEL_HIGH
+      and IRQ_TYPE_EDGE_RISING can be specified as type flags.
+      The supported values for the interrupt number are:
+        - IO BANK0: 0
+        - IO BANK1: 1
+        - IO BANK2: 2
+        - AUDIO IN: 3
+        - AUDIO OUT: 4
+        - PWM0: 5
+        - ETH: 6
+        - I2C0: 7
+        - I2C1: 8
+        - I2C2: 9
+        - I2C3: 10
+        - I2C4: 11
+        - I2C5: 12
+        - I2C6: 13
+        - I2S0: 14
+        - I2S1: 15
+        - I2S2: 16
+        - SDIO0: 17
+        - SDIO1: 18
+        - SPI0: 19
+        - SPI1: 20
+        - SPI2: 21
+        - SPI3: 22
+        - SPI4: 23
+        - SPI5: 24
+        - UART0: 25
+        - TIMER0: 26
+        - TIMER1: 27
+        - TIMER2: 28
+        - TIMER3: 29
+        - USB HOST0: 30
+        - USB HOST0-0: 31
+        - USB HOST0-1: 32
+        - USB HOST0-2: 33
+        - USB HOST0-3: 34
+        - USB HOST1: 35
+        - USB HOST1-0: 36
+        - USB HOST1-1: 37
+        - USB HOST1-2: 38
+        - USB HOST1-3: 39
+        - DMA: 40
+        - PWM1: 41
+        - UART1: 42
+        - UART2: 43
+        - UART3: 44
+        - UART4: 45
+        - UART5: 46
+        - MIPI0: 47
+        - MIPI1: 48
+        - VIDEO OUT: 49
+        - PIO0: 50
+        - PIO1: 51
+        - ADC FIFO: 52
+        - PCIE OUT: 53
+        - SPI6: 54
+        - SPI7: 55
+        - SPI8: 56
+        - PROC MISC: 57
+        - SYSCFG: 58
+        - CLOCKS DEFAULT: 59
+        - VBUSCTRL: 60
+
+  interrupt-controller: true
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - '#interrupt-cells'
+  - interrupt-controller
+  - pci-ep-bus@1
+
+examples:
+  - |
+    pci {
+        #address-cells = <3>;
+        #size-cells = <2>;
+
+        rp1@0,0 {
+            compatible = "pci1de4,1";
+            ranges = <0x01 0x00 0x00000000  0x82010000 0x00 0x00  0x00 0x400000>;
+            #address-cells = <3>;
+            #size-cells = <2>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+
+            pci_ep_bus: pci-ep-bus@1 {
+                compatible = "simple-bus";
+                ranges = <0x00 0x40000000  0x01 0x00 0x00000000  0x00 0x00400000>;
+                dma-ranges = <0x10 0x00000000  0x43000000 0x10 0x00000000  0x10 0x00000000>;
+                #address-cells = <2>;
+                #size-cells = <2>;
+
+                rp1_clocks: clocks@40018000 {
+                    compatible = "raspberrypi,rp1-clocks";
+                    reg = <0x00 0x40018000 0x0 0x10038>;
+                    #clock-cells = <1>;
+                    clocks = <&clk_rp1_xosc>;
+                };
+            };
+        };
+    };
-- 
2.35.3


