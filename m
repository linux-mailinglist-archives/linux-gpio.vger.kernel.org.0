Return-Path: <linux-gpio+bounces-15794-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9A3A31DDB
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 06:24:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 562FC3A6C08
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2025 05:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCBE21F5428;
	Wed, 12 Feb 2025 05:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IwuvHHA9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA791E7C0B;
	Wed, 12 Feb 2025 05:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739337846; cv=none; b=TpoduAe/B/KA1ys6vfqcCzdDgQxI5yUvkk3bejsNZsR3sKTc8PVVYeQgcK4/7NJcqOgvd2O9rEHUBmF2bb+V5nBdoEQ7F5bODdk+HgePCejd1Gq3RVvyamk9JMbSY2M0VBFhWfN+LOwi+qyOlAdVH7vlUffOtuSXML4cpvptG0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739337846; c=relaxed/simple;
	bh=Iw/B7TolfH6YdNfBJP1h8y4hfF5RXrNxzv9e7oH9K2U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VuEKpkyf7/U5S6d4ducuHghRf0a97Hdi716EO+FHK/Y5rCbOMKEoj4dZGyGrijiIpZcQbmIgRESDpp+5NCthYcy8VV5x9FNx/hOryUh/pyeT0j4jwbe6RnsdsF2BHXPzGDHB19d7NZ93glzhcnHRBqkL0Jk3c3ZRRVFK1AHiib8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IwuvHHA9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 850E4C4CEE4;
	Wed, 12 Feb 2025 05:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739337845;
	bh=Iw/B7TolfH6YdNfBJP1h8y4hfF5RXrNxzv9e7oH9K2U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IwuvHHA9kkSzFoKujLRRTsLf62AGhbom9sxDmWrtVc3aSGQTkG/1LCLKIG0pSZLL+
	 F/Hv7CBRtST9xRwwyonqF8uVTjYkLTQaBLBHSj0P32aAygL9+TM3KYyseKaSVc9q/+
	 T4zAbp85dXA0EXARN1Es70rjGEUodocSk+XSnANEUC30R8bfEfqCxWXhIIhmnzwA/6
	 c0D16augKoPsPW9efahm1owtclC7Vxm4r71OREOJDMFmV872Z691bshsYY4Jq8RULr
	 03kLyvjEYVYjksS9tr8OYkI3vwcesk7BLtFkENJzIJJRgvwD20+U7UjiK1U6VFBwI5
	 FQjBTMjocxFiA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E0F2C02198;
	Wed, 12 Feb 2025 05:24:05 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 12 Feb 2025 13:20:50 +0800
Subject: [PATCH v5 1/5] dt-bindings: pinctrl: Add support for Amlogic A4
 SoC
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-amlogic-pinctrl-v5-1-282bc2516804@amlogic.com>
References: <20250212-amlogic-pinctrl-v5-0-282bc2516804@amlogic.com>
In-Reply-To: <20250212-amlogic-pinctrl-v5-0-282bc2516804@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739337841; l=5281;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=wHafSOFRU9VhDp0j+tA5aiggZ0msRQSb1T36INbtrZY=;
 b=EKi6Nj2Mg8NOBV3iMAj2Xba3ebHz48e3P24ycICx71uhdwQSvLhZp7a1BH6KAdsv7fG6JurN1
 F9eMYG1AoMzAB3k4caPvFqIuW8oJnbU5GqlyoO1qLPROBE7U0OZkyEw
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add the dt-bindings for Amlogic pin controller, and add a new
dt-binding header file which document the GPIO bank names of
Amlogic A4 SoC.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../bindings/pinctrl/amlogic,pinctrl-a4.yaml       | 126 +++++++++++++++++++++
 include/dt-bindings/pinctrl/amlogic,pinctrl.h      |  46 ++++++++
 2 files changed, 172 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
new file mode 100644
index 000000000000..8eb50cad61d5
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
@@ -0,0 +1,126 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/amlogic,pinctrl-a4.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic pinmux controller
+
+maintainers:
+  - Xianwei Zhao <xianwei.zhao@amlogic.com>
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+properties:
+  compatible:
+    const: amlogic,pinctrl-a4
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 2
+
+  ranges: true
+
+patternProperties:
+  "^gpio@[0-9a-f]+$":
+    type: object
+
+    additionalProperties: false
+    properties:
+      reg:
+        minItems: 1
+        items:
+          - description: pin config register
+          - description: pin mux setting register (some special pin fixed function)
+          - description: pin drive strength register (optional)
+
+      reg-names:
+        minItems: 1
+        items:
+          - const: gpio
+          - const: mux
+          - const: ds
+
+      gpio-controller: true
+
+      "#gpio-cells":
+        const: 2
+
+      gpio-ranges:
+        maxItems: 1
+
+    required:
+      - reg
+      - reg-names
+      - gpio-controller
+      - "#gpio-cells"
+      - gpio-ranges
+
+  "^func-[0-9a-z-]+$":
+    type: object
+    additionalProperties: false
+    patternProperties:
+      "^group-[0-9a-z-]+$":
+        type: object
+        allOf:
+          - $ref: /schemas/pinctrl/pincfg-node.yaml
+          - $ref: /schemas/pinctrl/pinmux-node.yaml
+
+        required:
+          - pinmux
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/pinctrl/amlogic,pinctrl.h>
+    apb {
+      #address-cells = <2>;
+      #size-cells = <2>;
+      periphs_pinctrl: pinctrl {
+        compatible = "amlogic,pinctrl-a4";
+        #address-cells = <2>;
+        #size-cells = <2>;
+        ranges;
+
+        gpio@4240 {
+          reg = <0 0x4240 0 0x40>, <0 0x4000 0 0x8>;
+          reg-names = "gpio", "mux";
+          gpio-controller;
+          #gpio-cells = <2>;
+          gpio-ranges = <&periphs_pinctrl 0 8 10>;
+        };
+
+        func-uart-b {
+          group-default {
+            pinmux = <AML_PINMUX(AMLOGIC_GPIO_B, 1, 4)>;
+            bias-pull-up;
+            drive-strength-microamp = <4000>;
+          };
+
+          group-pins1 {
+            pinmux = <AML_PINMUX(AMLOGIC_GPIO_B, 5, 2)>;
+            bias-pull-up;
+            drive-strength-microamp = <4000>;
+          };
+        };
+
+        func-uart-c {
+          group-default {
+            pinmux = <AML_PINMUX(AMLOGIC_GPIO_B, 3, 1)>,
+                     <AML_PINMUX(AMLOGIC_GPIO_B, 2, 1)>;
+            bias-pull-up;
+            drive-strength-microamp = <4000>;
+          };
+        };
+      };
+    };
diff --git a/include/dt-bindings/pinctrl/amlogic,pinctrl.h b/include/dt-bindings/pinctrl/amlogic,pinctrl.h
new file mode 100644
index 000000000000..7d40aecc7147
--- /dev/null
+++ b/include/dt-bindings/pinctrl/amlogic,pinctrl.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
+ * Author: Xianwei Zhao <xianwei.zhao@amlogic.com>
+ */
+
+#ifndef _DT_BINDINGS_AMLOGIC_PINCTRL_H
+#define _DT_BINDINGS_AMLOGIC_PINCTRL_H
+/* Normal PIN bank */
+#define AMLOGIC_GPIO_A		0
+#define AMLOGIC_GPIO_B		1
+#define AMLOGIC_GPIO_C		2
+#define AMLOGIC_GPIO_D		3
+#define AMLOGIC_GPIO_E		4
+#define AMLOGIC_GPIO_F		5
+#define AMLOGIC_GPIO_G		6
+#define AMLOGIC_GPIO_H		7
+#define AMLOGIC_GPIO_I		8
+#define AMLOGIC_GPIO_J		9
+#define AMLOGIC_GPIO_K		10
+#define AMLOGIC_GPIO_L		11
+#define AMLOGIC_GPIO_M		12
+#define AMLOGIC_GPIO_N		13
+#define AMLOGIC_GPIO_O		14
+#define AMLOGIC_GPIO_P		15
+#define AMLOGIC_GPIO_Q		16
+#define AMLOGIC_GPIO_R		17
+#define AMLOGIC_GPIO_S		18
+#define AMLOGIC_GPIO_T		19
+#define AMLOGIC_GPIO_U		20
+#define AMLOGIC_GPIO_V		21
+#define AMLOGIC_GPIO_W		22
+#define AMLOGIC_GPIO_X		23
+#define AMLOGIC_GPIO_Y		24
+#define AMLOGIC_GPIO_Z		25
+
+/* Special PIN bank */
+#define AMLOGIC_GPIO_DV		26
+#define AMLOGIC_GPIO_AO		27
+#define AMLOGIC_GPIO_CC		28
+#define AMLOGIC_GPIO_TEST_N	29
+#define AMLOGIC_GPIO_ANALOG	30
+
+#define AML_PINMUX(bank, offset, mode)	(((((bank) << 8) + (offset)) << 8) | (mode))
+
+#endif /* _DT_BINDINGS_AMLOGIC_PINCTRL_H */

-- 
2.37.1



