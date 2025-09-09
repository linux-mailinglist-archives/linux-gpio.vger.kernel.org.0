Return-Path: <linux-gpio+bounces-25817-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F53B4AD2A
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 14:02:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 707B4447AD4
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 12:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 970A132CF98;
	Tue,  9 Sep 2025 12:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cB31eYEJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF4332C336;
	Tue,  9 Sep 2025 12:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757419288; cv=none; b=JQgUgCfqetC1dUoYztPlhYvu+/8bTVQeQ3leTGppUwVOH4uRoTdeu/SHAtR9sr7K9Fg8tyze/sl98MxVomMVOGlMz9fXgolyXaPz9zB6kLEoqSue6SfzBOSMDtCR8TDxEtVm4K1wlYLg1nxPlyTCrCTzgRUkz5fjGBs4bUZpG68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757419288; c=relaxed/simple;
	bh=YvfUbxs6b1JbGsqCGcavEKTXNJKfk3IHkVxfwx0HuOg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pYnAXruIlhIwBr5Yo33AxFGvzKPcryVqLzBqGd86/6nZcfSuCuRzPIH8ibDnwC+RiqzhIhbD7pmYLyedX87a2gKNAs+5uzlCcK4ZwSPepwMlC9Ttb5+xdhbGh3uZGeNPhljcoT2ikCREbcwf18t3WDWeDBLGDo3wtnPy4VNdB8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cB31eYEJ; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2BE891A0E11;
	Tue,  9 Sep 2025 12:01:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F35C160630;
	Tue,  9 Sep 2025 12:01:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 06F65102F2948;
	Tue,  9 Sep 2025 14:01:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757419283; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=2slxBNx7/pAHTmwz0kURbwV+wrtZxV+abSkxTsXNeRg=;
	b=cB31eYEJpVg0R2mEsv4E11tUQZ9sfHeZBLkblLOSXeimwJDQteIEuoyHgnYSAx8wk2IenB
	gzODyR9Ee2GFWeUjNiN92VskVgCr2o1CZgd0ywLh/8hwOw2tgFDhTz7sgPAlBVw2j92zw0
	HCDjjoHeSxUrkd9aIKNa2pxOAfZdaOImZaynU6Dmrd7ClWq3mfsnVgJtOaVD0Xxb1tKB5T
	d0q4d8mhut99zop1wESPhli/C5sJlGl1uUn6RIv7YPejBMbrrb7Cs3pWHBWa70f55RkMxX
	q6PuivdHfdejpTIfeWgpgRsJ4DfsEt4Qm6kT/i9rziAJULO3bj8+xG16a3Kh0g==
From: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
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
Subject: [PATCH v2 2/8] dt-bindings: soc: renesas: Add the Renesas RZ/N1 GPIO Interrupt Multiplexer
Date: Tue,  9 Sep 2025 14:00:33 +0200
Message-ID: <20250909120041.154459-3-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250909120041.154459-1-herve.codina@bootlin.com>
References: <20250909120041.154459-1-herve.codina@bootlin.com>
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
 .../soc/renesas/renesas,rzn1-gpioirqmux.yaml  | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/renesas/renesas,rzn1-gpioirqmux.yaml

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas,rzn1-gpioirqmux.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas,rzn1-gpioirqmux.yaml
new file mode 100644
index 000000000000..4a5aad8b2c44
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas,rzn1-gpioirqmux.yaml
@@ -0,0 +1,86 @@
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
+    description:
+      Specifies the mapping from external GPIO interrupt lines to the output
+      interrupts. The array items have to be ordered with the first item
+      related to the output line 0 (IRQ 103), the next one to the output line 1
+      (IRQ 104) and so on up to the output line 8 (IRQ 110).
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
+        #interrupt-cells = <3>;
+    };
+
+    interrupt-controller@51000480 {
+        compatible = "renesas,r9a06g032-gpioirqmux", "renesas,rzn1-gpioirqmux";
+        reg = <0x51000480 0x20>;
+        #address-cells = <0>;
+        #interrupt-cells = <1>;
+        interrupt-map-mask = <0x7f>;
+        /*
+         * The child interrupt number is computed using the following formula:
+         *    gpio_bank * 32 + gpio_number
+         *
+         * with:
+         *    - gpio_bank: The GPIO bank number
+         *          - 0 for GPIO0A,
+         *          - 1 for GPIO1A,
+         *          - 2 for GPIO2A
+         *    - gpio_number: Number of the gpio in the bank (0..31)
+         */
+        interrupt-map =
+            <32 &gic GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>, /* GPIO1A.0 */
+            <89 &gic GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>, /* GPIO2A.25 */
+            <9 &gic GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>; /* GPIO0A.9 */
+    };
-- 
2.51.0


