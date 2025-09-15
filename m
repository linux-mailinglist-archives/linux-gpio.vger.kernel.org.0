Return-Path: <linux-gpio+bounces-26170-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 979BDB57BC2
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 14:48:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9EC718954BA
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Sep 2025 12:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82A0830BF78;
	Mon, 15 Sep 2025 12:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="w508YE6u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4C630EF92
	for <linux-gpio@vger.kernel.org>; Mon, 15 Sep 2025 12:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757940446; cv=none; b=XISihdoHIW7bxlDAI4NXdRYcDxWr3PLNjCcS6zKo6MQoXUpgN0qhNjZIwcdTKIlI2dhqIitEYXjVOFRASF3HbJgHaeMdDgl51uumOpVvkpTzq/KYJCkmTq2mW8c+CjOJ9ChhkNSa+WL70JAMvQuPBqYD/7KKgFuaJndEm3Zc4hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757940446; c=relaxed/simple;
	bh=irm5rOzkMCBKy8afw3JexKMiBbgIOkVmWCMIQ2l0hUY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CdAPNPr/OQdLrUbuk/xZSIt7d7v6JRljbTm/Nlv3DJ+oCZ6fsUlOEZ+tnnXMVedRrgdqjxqP/GARBWNQUo1ACmzKAlXv57uRoAG0m689AWJs3Ua48eJGzb1Y6mEQXKiWBJ2eiYYpUEXvrDsZun6+R/ydQgIpzfO0STn5pE1flws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=w508YE6u; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=w508YE6uho32x7yE7/EJBlz8koT3SVa2CC+66Zgn5IwpQmySNfUD2ZfJwbFBkxQM8/C6rdlzbZwO4os4rYCikmo9NK5VnEg7aTqIToCZavahpCkVbfsEgomtNbKeeyX49mKmj1V5lfd8C2XHtAk4olDP3/zkM+iBBBk/CieHxETjcRZgjP0ojIBpT9CTfa8Fl0LYABIqmHmBnVdRQZ9c5WU7Amvn5725/7hAbIYe75uiIMSJ2k7zeXMMqNW+T/dGXb9vYjG3abowl/xUmY9S7Bg4ycXL3KEB2pymwAr5xKvrN11a2Rm2V3WMViQaFWwk1Iu1FuRo/5N23ppWHlAV/Q==; s=purelymail3; d=purelymail.com; v=1; bh=irm5rOzkMCBKy8afw3JexKMiBbgIOkVmWCMIQ2l0hUY=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-gpio@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1506483826;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 15 Sep 2025 12:46:29 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Mon, 15 Sep 2025 14:46:23 +0200
Subject: [PATCH v3 1/4] dt-bindings: pinctrl: mediatek: Document MT6878 pin
 controller bindings
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-mt6878-pinctrl-support-v3-1-593cc007d4cf@mentallysanemainliners.org>
References: <20250915-mt6878-pinctrl-support-v3-0-593cc007d4cf@mentallysanemainliners.org>
In-Reply-To: <20250915-mt6878-pinctrl-support-v3-0-593cc007d4cf@mentallysanemainliners.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757940385; l=7159;
 i=igor.belwon@mentallysanemainliners.org; s=20250908;
 h=from:subject:message-id; bh=irm5rOzkMCBKy8afw3JexKMiBbgIOkVmWCMIQ2l0hUY=;
 b=kY5stO3TWCNOuMxLH3HOmWHosNYVTrd6ojPgwbhL4T3EnOKSMWAi11YFYNfSdBNc4j6tnRBwR
 saLN2TsUfLAC6fOtbKa39jJjOjYmxXQ4zXkQPqg/yU5KLOo9ckiVQIU
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=t9Kz6B3jEwJD7YAKcp8XftfEz7SUSlGbrsfFlbrrFwA=

Add device-tree bindings for the pin controller and the EINT controller
found in the MediaTek MT6878 SoC.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 .../bindings/pinctrl/mediatek,mt6878-pinctrl.yaml  | 211 +++++++++++++++++++++
 1 file changed, 211 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6878-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6878-pinctrl.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..8d44194a79389663de339a422dea7b68d8a060e2
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6878-pinctrl.yaml
@@ -0,0 +1,211 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/mediatek,mt6878-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6878 Pin Controller
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+  - Igor Belwon <igor.belwon@mentallysanemainliners.org>
+
+description:
+  The MediaTek MT6878 Pin controller is used to control SoC pins.
+
+properties:
+  compatible:
+    const: mediatek,mt6878-pinctrl
+
+  reg:
+    items:
+      - description: pin controller base
+      - description: bl group IO
+      - description: bm group IO
+      - description: br group IO
+      - description: bl1 group IO
+      - description: br1 group IO
+      - description: lm group IO
+      - description: lt group IO
+      - description: rm group IO
+      - description: rt group IO
+      - description: EINT controller E block
+      - description: EINT controller S block
+      - description: EINT controller W block
+      - description: EINT controller C block
+
+  reg-names:
+    items:
+      - const: base
+      - const: bl
+      - const: bm
+      - const: br
+      - const: bl1
+      - const: br1
+      - const: lm
+      - const: lt
+      - const: rm
+      - const: rt
+      - const: eint-e
+      - const: eint-s
+      - const: eint-w
+      - const: eint-c
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    description:
+      Number of cells in GPIO specifier. Since the generic GPIO binding is used,
+      the amount of cells must be specified as 2. See the below mentioned gpio
+      binding representation for description of particular cells.
+    const: 2
+
+  gpio-ranges:
+    maxItems: 1
+
+  gpio-line-names:
+    maxItems: 216
+
+  interrupts:
+    description: The interrupt outputs to sysirq
+    maxItems: 1
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+# PIN CONFIGURATION NODES
+patternProperties:
+  '-pins$':
+    type: object
+    additionalProperties: false
+
+    patternProperties:
+      '^pins':
+        type: object
+        allOf:
+          - $ref: /schemas/pinctrl/pincfg-node.yaml
+          - $ref: /schemas/pinctrl/pinmux-node.yaml
+        description:
+          A pinctrl node should contain at least one subnodes representing the
+          pinctrl groups available on the machine. Each subnode will list the
+          pins it needs, and how they should be configured, with regard to muxer
+          configuration, pullups, drive strength, input enable/disable and input
+          schmitt.
+
+        properties:
+          pinmux:
+            description:
+              Integer array, represents gpio pin number and mux setting.
+              Supported pin number and mux are defined as macros in
+              arch/arm64/boot/dts/mediatek/mt8196-pinfunc.h for this SoC.
+
+          drive-strength:
+            enum: [2, 4, 6, 8, 10, 12, 14, 16]
+
+          drive-strength-microamp:
+            enum: [125, 250, 500, 1000]
+
+          bias-pull-down:
+            oneOf:
+              - type: boolean
+              - enum: [75000, 5000]
+                description: Pull down RSEL type resistance values (in ohms)
+            description:
+              For normal pull down type there is no need to specify a resistance
+              value, hence this can be specified as a boolean property.
+              For RSEL pull down type a resistance value (in ohms) can be added.
+
+          bias-pull-up:
+            oneOf:
+              - type: boolean
+              - enum: [10000, 5000, 4000, 3000]
+                description: Pull up RSEL type resistance values (in ohms)
+            description:
+              For normal pull up type there is no need to specify a resistance
+              value, hence this can be specified as a boolean property.
+              For RSEL pull up type a resistance value (in ohms) can be added.
+
+          bias-disable: true
+
+          output-high: true
+
+          output-low: true
+
+          input-enable: true
+
+          input-disable: true
+
+          input-schmitt-enable: true
+
+          input-schmitt-disable: true
+
+        required:
+          - pinmux
+
+        additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - '#interrupt-cells'
+  - gpio-controller
+  - '#gpio-cells'
+  - gpio-ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/pinctrl/mt65xx.h>
+    #define PINMUX_GPIO0__FUNC_GPIO0 (MTK_PIN_NO(0) | 0)
+    #define PINMUX_GPIO99__FUNC_SCL0 (MTK_PIN_NO(99) | 1)
+    #define PINMUX_GPIO100__FUNC_SDA0 (MTK_PIN_NO(100) | 1)
+
+    pio: pinctrl@10005000 {
+        compatible = "mediatek,mt6878-pinctrl";
+        reg = <0x10005000 0x1000>,
+              <0x11d10000 0x1000>,
+              <0x11d30000 0x1000>,
+              <0x11d40000 0x1000>,
+              <0x11d50000 0x1000>,
+              <0x11d60000 0x1000>,
+              <0x11e20000 0x1000>,
+              <0x11e30000 0x1000>,
+              <0x11eb0000 0x1000>,
+              <0x11ec0000 0x1000>,
+              <0x11ce0000 0x1000>,
+              <0x11de0000 0x1000>,
+              <0x11e60000 0x1000>,
+              <0x1c01e000 0x1000>;
+        reg-names = "base", "bl", "bm", "br", "bl1", "br1",
+                    "lm", "lt", "rm", "rt", "eint-e", "eint-s",
+                    "eint-w", "eint-c";
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&pio 0 0 220>;
+        interrupt-controller;
+        interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH 0>;
+        #interrupt-cells = <2>;
+
+        gpio-pins {
+            pins {
+                pinmux = <PINMUX_GPIO0__FUNC_GPIO0>;
+                bias-pull-up = <4000>;
+                drive-strength = <6>;
+            };
+        };
+
+        i2c0-pins {
+            pins-bus {
+                pinmux = <PINMUX_GPIO99__FUNC_SCL0>,
+                         <PINMUX_GPIO100__FUNC_SDA0>;
+                bias-pull-down = <75000>;
+                drive-strength-microamp = <1000>;
+            };
+        };
+    };

-- 
2.51.0


