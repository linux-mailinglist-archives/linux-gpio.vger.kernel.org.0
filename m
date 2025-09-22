Return-Path: <linux-gpio+bounces-26491-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F19B91EA8
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 17:28:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F22BC19047E0
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 15:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E24B2DD61E;
	Mon, 22 Sep 2025 15:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VFDOVQZ+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4442E2F04;
	Mon, 22 Sep 2025 15:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758554833; cv=none; b=lp8/OEHch76rcemIyydwZZDYjLwWNDTJ//yWFytRKWI1saAu/gJXiAc55qYVAX/+6UllgXmy2R4cib7WO08ULt6zVOzRwr6htm3h7iOgVQ455ebq6KeXGYwrmePvXnAulvKgFfTfV/EgS7UVEKYj1kC/7Kop9CE7U4DWVnKAnYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758554833; c=relaxed/simple;
	bh=WJZH7OZOUw3HFgBO3E5TaMQnRe9z3Bt+bOLGWl2djWs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bhv/J4f2fWvEma5czsOvN9WSwwZLtt/J13VBHtvRSPkHBruELJsUZXfm0gwvAfgmtSuZwkGvNAYXtQfssY/mn8gYMoHis3aTxI2LG9g+4UqcWfdB7DPiAelu9gTxqxLAoBmSV2gWX+m+MkZFf74K69S/dwdsULKywwKedkyoKz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VFDOVQZ+; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D108AC8EC77;
	Mon, 22 Sep 2025 15:26:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D19A760635;
	Mon, 22 Sep 2025 15:27:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E6896102F195F;
	Mon, 22 Sep 2025 17:27:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758554828; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=pPN2NG26JNqVNK3neT+Fe8Rs9WuevIOs8rbutpUQv4g=;
	b=VFDOVQZ+VTJj/tdSff7M49oqKsMoTKBl/tsHydZPe8To8k9pjqezT1Mlvgjix4N8p5zFPZ
	EzEttxjnskL13+8AsZTWNJQaMHlv9wrUVIDm5ZIJXKihCTYAeUkTJKgI0OUg5bGu5zu8MB
	2l+h+U+ZfUZhjCkkqBtNxRolw5UiabMQ0D0h9rfXj80036URC+w6l5TPHRl3KgFrfUUfWK
	d2jj+PYmXKwuV+Oye1CYxVyAYjwhjwEYZMtVFtj9t8Q1k1JxS/j/Hcx/N3fYqEKDJ8Nbc9
	Yu6h0RwOpqfXmUehZBMAwm0geb2Ph+Cp7T53s0yme/YLW1lmU4Oycs5QIZNkCQ==
From: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Saravana Kannan <saravanak@google.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Phil Edworthy <phil.edworthy@renesas.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v4 6/8] dt-bindings: soc: renesas: Add the Renesas RZ/N1 GPIO Interrupt Multiplexer
Date: Mon, 22 Sep 2025 17:26:37 +0200
Message-ID: <20250922152640.154092-7-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250922152640.154092-1-herve.codina@bootlin.com>
References: <20250922152640.154092-1-herve.codina@bootlin.com>
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
2.51.0


