Return-Path: <linux-gpio+bounces-29562-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4537BCBEB59
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Dec 2025 16:42:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5DA7B3002A65
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Dec 2025 15:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A960134253F;
	Mon, 15 Dec 2025 14:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="rU90B1nY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7AB34251D;
	Mon, 15 Dec 2025 14:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765808957; cv=none; b=E6I7eUwLDqi+/Q3qQmZdIOOgrINril6rXz1xg/TjxhhPiESin2bA9P/pkF58a4YG7d4j72EEkZmU9aV/tO+CwtkzTKehFJ6jzHmCfrgXpvTXzH3V2/uka5VwsePN33jcczpiSwqD6Atlija2jXnPhLFPESMKMo01wKqg9kgKtDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765808957; c=relaxed/simple;
	bh=cPYz7Rl3IGZjYUip8LQYzhHjmVpG6HFaUtmNGOzanJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VYg0eJBuDwgQGg/SNz0zVUxe7fijhcS1DpTrncp1r5QeRqMUjXIDD/J1uc1Nyk33vmfiaM1ckuU7SO2WVjMQkjP8Fh+uXSwqhzj1pSeRiijMnyrl0IFMccc3AtDwRjrLrs3+uua7B048MZumwtOhS2EbLS5Gwq4OW+p6FmHRDs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=rU90B1nY; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2E3154E41C0C;
	Mon, 15 Dec 2025 14:29:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F1B0D60664;
	Mon, 15 Dec 2025 14:29:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AF70511942426;
	Mon, 15 Dec 2025 15:29:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765808952; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=C57NZV6yvzIJfDxz/lCn6sc57mHd2EX6xsrZ1yoZq3Q=;
	b=rU90B1nYRrdEP+GREE97o2Bw4N0UinNDMXfa+CeI8UK1AN3/+IIvwUETgqrDLCiE5UBRRH
	a6sYv/g9FDj903huAMEQlM8EMyZHtb3djbPV2Z6qfdz1AmymQidLKe2yfNCYp03LEbF/L1
	hbxA6xx/3EAUhGDxrdPAia0kwmV7q3+Xvade1tLf1+09vsZwD5qOVw6RTRq3PAGz/raD6p
	RArNH9ud1heNbGTNH7eiTKI+1K6t9Qxuw/TJ8zNa+3iDNGbIetEZaCIVex3dbksnL3I0Sj
	5op4DZlb1QnboUbeoYf96tZmqIfHF5JzuH4M62ifO+VK0Uy/T6pv5OWIkMo8hw==
From: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Saravana Kannan <saravanak@google.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v7 6/8] dt-bindings: soc: renesas: Add the Renesas RZ/N1 GPIO Interrupt Multiplexer
Date: Mon, 15 Dec 2025 15:28:28 +0100
Message-ID: <20251215142836.167101-7-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215142836.167101-1-herve.codina@bootlin.com>
References: <20251215142836.167101-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On the Renesas RZ/N1 SoC, GPIOs can generate interruptions. Those
interruption lines are multiplexed by the GPIO Interrupt Multiplexer in
order to map 32 * 3 GPIO interrupt lines to 8 GIC interrupt lines.

The GPIO interrupt multiplexer IP does nothing but select 8 GPIO
IRQ lines out of the 96 available to wire them to the GIC input lines.

Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../soc/renesas/renesas,rzn1-gpioirqmux.yaml  | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/renesas/renesas,rzn1-gpioirqmux.yaml

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas,rzn1-gpioirqmux.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas,rzn1-gpioirqmux.yaml
new file mode 100644
index 000000000000..1a31c11bc3b4
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas,rzn1-gpioirqmux.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/renesas/renesas,rzn1-gpioirqmux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/N1 SoCs GPIO Interrupt Multiplexer
+
+description: |
+   The Renesas RZ/N1 GPIO Interrupt Multiplexer multiplexes GPIO interrupt
+   lines to the interrupt controller available in the SoC.
+
+   It selects up to 8 of the 96 GPIO interrupt lines available and connect them
+   to 8 output interrupt lines.
+
+maintainers:
+  - Herve Codina <herve.codina@bootlin.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,r9a06g032-gpioirqmux
+      - const: renesas,rzn1-gpioirqmux
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 0
+
+  "#interrupt-cells":
+    const: 1
+
+  interrupt-map-mask:
+    items:
+      - const: 0x7f
+
+  interrupt-map:
+    description: |
+      Specifies the mapping from external GPIO interrupt lines to the output
+      interrupts. The array has up to 8 items defining the mapping related to
+      the output line 0 (GIC 103) up to the output line 7 (GIC 110).
+
+      The child interrupt number set in arrays items is computed using the
+      following formula:
+          gpio_bank * 32 + gpio_number
+      with:
+        - gpio_bank: The GPIO bank number
+            - 0 for GPIO0A,
+            - 1 for GPIO1A,
+            - 2 for GPIO2A
+        - gpio_number: Number of the gpio in the bank (0..31)
+    minItems: 1
+    maxItems: 8
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#interrupt-cells"
+  - interrupt-map-mask
+  - interrupt-map
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    gic: interrupt-controller {
+        interrupt-controller;
+        #address-cells = <0>;
+        #interrupt-cells = <3>;
+    };
+
+    interrupt-controller@51000480 {
+        compatible = "renesas,r9a06g032-gpioirqmux", "renesas,rzn1-gpioirqmux";
+        reg = <0x51000480 0x20>;
+        #address-cells = <0>;
+        #interrupt-cells = <1>;
+        interrupt-map-mask = <0x7f>;
+        interrupt-map =
+            <32 &gic GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>, /* line 0, GPIO1A.0 */
+            <89 &gic GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>, /* line 1, GPIO2A.25 */
+            <9 &gic GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>; /* line 3, GPIO0A.9 */
+    };
-- 
2.52.0


