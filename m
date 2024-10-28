Return-Path: <linux-gpio+bounces-12245-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 900269B32AA
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 15:08:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 136001F21E33
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 14:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 428401DDC14;
	Mon, 28 Oct 2024 14:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="csPIyBmi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAF41DD877
	for <linux-gpio@vger.kernel.org>; Mon, 28 Oct 2024 14:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730124444; cv=none; b=JiT91NWD4jtux+3YcNhKmRRsuj0wxsSvnkf+hzMhwR/w2t48QwMoG8jOWV/1FPWV9Cltvts/IYjSfiqtkxhXjZVE0CEFjs/8gPo3GHO4E7EheEeRVzep/ovjx1BRnO/mTthXKnHiuTjIQQpe1Fj1CEhaKi65QDiJG21/xtaIAf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730124444; c=relaxed/simple;
	bh=KWzJH01MBbP+2MBa2bGY8qrZZJMVX7VaS+5unE5ZJRA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LKR/U7hlPp9Cth+WjU65MqThGdJnkFHV1OUUHzwehhc8FLBkPe3qizy/PrBSUOPROCEuCrv1tTDaPi/KNirCkHM4ZSIT0kitPRXaRUL3s3l19X4+HIAx0XNUQL8mQl8K8FaFJdSQeRLJy8yqTGqXatIbZH5QTmpqC3x7Z5q9mrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=csPIyBmi; arc=none smtp.client-ip=209.85.218.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-a9a0f198d38so631331766b.1
        for <linux-gpio@vger.kernel.org>; Mon, 28 Oct 2024 07:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730124439; x=1730729239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iNEc7Ab11J7D2bwXEyWPM+PpwLENCKqu46gw0+Cu+lU=;
        b=csPIyBmimIuaIUUUOWaOirSwgf/xHd6HWzZ5vJ/Vbw0CEU9WnCRBp3n/9C+pcZAY/O
         eqfIA8IDBN8hUDq8xzLasWypEAfnDOIVo3KRGTj1+FiBQx1KD9QtIfE+Jr5uYeMtMlC0
         iiU+xf0P9pEx5w3c0ELsG6d5IpyctBAidQ/i1jPRHOyYT7x9/s2QRCPjsHckiqAHFTik
         Ht17jfu1PzhHRah1/hXunwWXu7rmbdGWTqY2F7FPDf5L5K2EAqjLAJapKtL0XzEuJkc6
         k17xGrQk0plppaMhEtQuBhpVNCG6pfuU5XxKygDwVDa+de0i5tSrKrERFEFc2QfbNeeW
         B4zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730124439; x=1730729239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iNEc7Ab11J7D2bwXEyWPM+PpwLENCKqu46gw0+Cu+lU=;
        b=cO4XwYc5JE6t6sH1f40+mDD9gOHUxjtXd/0G99MuGWcMjwv3nnUe4hp08BqiXseMgY
         b4wJOv4ioCHj4rp7PoO6P8xHbChIqBLt8A6eDkH/m6u5vjAgQT3EcaG7rerDAULJS2F4
         ZJglhGcsXXtmGkgD4FXppZCwiT4UV3Hu6rJIrnD7jjMva5Wx1KsMA5Ru9fKDYyAuvk58
         nh7RhhueAgdVhMtMNmqwLBpp55SGQtYEZyyqIxEJlMmYVjpAOmGqkCHi2j/ENB1x2EWI
         0j8KulzSlczDb/8T1YzlU39CAdkH92dMCnlDgJeXrkPXqo/tNGpH9MOWtdH1Xs9p4qG1
         Gxzw==
X-Forwarded-Encrypted: i=1; AJvYcCUE23hgis3QnTn+6Bdj5bhUp+0aydNl8dX7oO4TO0KI8jhYsnjmPvuDtTV7qcCfRI0xCEvXt7/xGOae@vger.kernel.org
X-Gm-Message-State: AOJu0Yz90hjXYBphh0bVoBViHx5FLxE4MWAgoPn8X5xbNXctV0vRIj6u
	BH5JcL/+uuQfi6hTbfjPWQXj2eS0oZSygqddHWldEHdoSDe6BYgwSfmrW5vLZaM=
X-Google-Smtp-Source: AGHT+IGLRlQTVhRPQemiDdTWqan8eXJlYIgmzJ3VjDMdLX43CD2E2sNJ5FgkqwMaVS/d3Bu6+8CK3Q==
X-Received: by 2002:a17:907:3da1:b0:a99:4e35:9a25 with SMTP id a640c23a62f3a-a9de61a17a1mr698709666b.44.1730124439054;
        Mon, 28 Oct 2024 07:07:19 -0700 (PDT)
Received: from localhost (host-79-35-211-193.retail.telecomitalia.it. [79.35.211.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b3a08b29asm383846066b.225.2024.10.28.07.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 07:07:18 -0700 (PDT)
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
Subject: [PATCH v3 04/12] dt-bindings: misc: Add device specific bindings for RaspberryPi RP1
Date: Mon, 28 Oct 2024 15:07:21 +0100
Message-ID: <768d2307342e1054c58324a9d51957456dc82cbf.1730123575.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1730123575.git.andrea.porta@suse.com>
References: <cover.1730123575.git.andrea.porta@suse.com>
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
---
 .../devicetree/bindings/misc/pci1de4,1.yaml   | 80 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/pci1de4,1.yaml

diff --git a/Documentation/devicetree/bindings/misc/pci1de4,1.yaml b/Documentation/devicetree/bindings/misc/pci1de4,1.yaml
new file mode 100644
index 000000000000..d66b2fc130d1
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/pci1de4,1.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/misc/pci1de4,1.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RaspberryPi RP1 MFD PCI device
+
+maintainers:
+  - Andrea della Porta <andrea.porta@suse.com>
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
+    description:
+      Specifies respectively the interrupt number and flags as defined
+      in include/dt-bindings/interrupt-controller/irq.h.
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
+            ranges = <0x01 0x00 0x00000000
+                      0x82010000 0x00 0x00
+                      0x00 0x400000>;
+            #address-cells = <3>;
+            #size-cells = <2>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+
+            pci_ep_bus: pci-ep-bus@1 {
+                compatible = "simple-bus";
+                ranges = <0xc0 0x40000000
+                          0x01 0x00 0x00000000
+                          0x00 0x00400000>;
+                dma-ranges = <0x10 0x00000000
+                              0x43000000 0x10 0x00000000
+                              0x10 0x00000000>;
+                #address-cells = <2>;
+                #size-cells = <2>;
+
+                rp1_clocks: clocks@c040018000 {
+                    compatible = "raspberrypi,rp1-clocks";
+                    reg = <0xc0 0x40018000 0x0 0x10038>;
+                    #clock-cells = <1>;
+                    clocks = <&clk_rp1_xosc>;
+                    clock-names =  "xosc";
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index ccf123b805c8..2aea5a6166bd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19384,6 +19384,7 @@ RASPBERRY PI RP1 PCI DRIVER
 M:	Andrea della Porta <andrea.porta@suse.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
+F:	Documentation/devicetree/bindings/misc/pci1de4,1.yaml
 F:	Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
 F:	Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
 F:	include/dt-bindings/clock/rp1.h
-- 
2.35.3


