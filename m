Return-Path: <linux-gpio+bounces-23824-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D684B120DD
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 17:27:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFDC93AF27A
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Jul 2025 15:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BB6E2EF285;
	Fri, 25 Jul 2025 15:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="V35E1STU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4072223ABAB;
	Fri, 25 Jul 2025 15:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753457194; cv=none; b=fBaa84l1JovF/lXUdDAdNqivDNfBoDqNa6lTOOOdYDiOOlRjppFrrrNU+N2U4LOuZSq3ucahYNL6gA6hrI7mM+Lxvj+wa+Yru+WCEVHpIz54zUrLrd5buvCpjCog+Y6TkXnFZhO2I+7UhMeIa7UGORJq/uCAm0BIzsbW3Eer50s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753457194; c=relaxed/simple;
	bh=AnCFM+7dprajka3C9l0RKfVe8qt8NMS8n0W9LawN4Bo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B+I+T9fnWzUq1vGqpkdl3M8lbM7KCYLSw8xEdHKdE/4EKIXDGBH4WN0VgRw9sk/aEn1XBMEBawzzSWhOYilM2lSQ4swl3a++d+k3O6YUcY1G+cxJicNng8h5lfXwcp295pp5ObZ0pz1WvTU2Mc/nNEzFTZ2GcxO7vlFgT8ARlFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=V35E1STU; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id 9F445442B6;
	Fri, 25 Jul 2025 15:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753457189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=32YGeynYn2xNilHcQnK7qlzkEemEAVUdzQTGyDSqIwo=;
	b=V35E1STUzR1e+msXHwHxpzqAtIdbhs1xNGvACk3hQaJZO+Em3DJUaqf989eyk8X4H9QSzI
	8B9JQhDLo3mISBdE2Dr6jsLyaiBgfuQxtPMtbtuaXVNYnMKvHpoir88CYamOJcwtxcyvVO
	70LCi5Pf/rNEYSv0AbDq/+ASEPLVeV0ODsr1Bi8LD0+pfz7ThqXyyWfX7dAhIItmklyTwj
	vHkA0/+/P0vOuOcr7evhltMBsvOCJSN8JUU+JXqNDz8Fms9nScdaNesCWX8DbA3Hpbi+u0
	hdVvDjEllquRYafXRCDkZyp4bnTRo7Tb4rB7625yd39cK6brXnryBEdbolTN+A==
From: Herve Codina <herve.codina@bootlin.com>
To: Hoan Tran <hoan@os.amperecomputing.com>,
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
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH 3/6] dt-bindings: soc: renesas: Add the Renesas RZ/N1 GPIO Interrupt Multiplexer
Date: Fri, 25 Jul 2025 17:26:12 +0200
Message-ID: <20250725152618.32886-4-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250725152618.32886-1-herve.codina@bootlin.com>
References: <20250725152618.32886-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdekfeekkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeefhffhfeevudevuddtteefvdevudefteeiteefjeetgfetieeggfekjefggedtudenucffohhmrghinhepuggvvhhitggvthhrvggvrdhorhhgnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedukedprhgtphhtthhopehhohgrnhesohhsrdgrmhhpvghrvggtohhmphhuthhinhhgrdgtohhmpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepk
 hhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtohepmhgrghhnuhhsrdgurghmmhesghhmrghilhdrtghomh
X-GND-Sasl: herve.codina@bootlin.com

On the Renesas RZ/N1 SoC, GPIOs can generate interruptions. Those
interruption lines are multiplexed by the GPIO Interrupt Multiplexer in
order to map 32 * 3 GPIO interrupt lines to 8 GIC interrupt lines.

The GPIO interrupt multiplexer IP does nothing but select 8 GPIO
IRQ lines out of the 96 available to wire them to the GIC input lines.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 .../soc/renesas/renesas,rzn1-gpioirqmux.yaml  | 99 +++++++++++++++++++
 1 file changed, 99 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/renesas/renesas,rzn1-gpioirqmux.yaml

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas,rzn1-gpioirqmux.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas,rzn1-gpioirqmux.yaml
new file mode 100644
index 000000000000..d2b380f15be7
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas,rzn1-gpioirqmux.yaml
@@ -0,0 +1,99 @@
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
+  interrupts:
+    minItems: 8
+    maxItems: 8
+    description:
+      Output interrupt lines
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
+      interrupts.
+
+required:
+  - compatible
+  - reg
+  - interrupts
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
+        interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
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
2.50.1


