Return-Path: <linux-gpio+bounces-14807-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBFAA119DB
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2025 07:42:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08C68167A4C
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2025 06:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C24E22FAD4;
	Wed, 15 Jan 2025 06:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uh2Ur9T4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D436622F395;
	Wed, 15 Jan 2025 06:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736923322; cv=none; b=kVEQRh5KLt5OEvQ80Hld8NH1Zuh5SQlgeeX2/Mrq0qcmXc5VG894H0BS+vt9Sx+id70r5mFK6dCWKilDjAZj8WElZopIMN6jTeqarWyBJSApltNYyXO7BD/QUgMbF+kfGnNJYV9ykuXDlSLu+C96OyUH+S7HNcpISFKOWN8Rmyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736923322; c=relaxed/simple;
	bh=kUfc1krOh8JPSRHIs3171DVKGYtEvs/ci1gfBYmLqSU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ml0BjOdyNamIl2YINZ/EmO193sW5U/7+vR1WipaDncgmjYzTUgB7JLblFfC3/4Pt7HNPqSDxRY+JVTPXjbhGTqN7RVO1IW70GRbto5dxvbZYvIYya1SmLnOLfhPS3p23dU1tvCXFc7+n7HVHJgjWS4zhnPCqavhgbR7crxYlXRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uh2Ur9T4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 57976C4CEE3;
	Wed, 15 Jan 2025 06:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736923322;
	bh=kUfc1krOh8JPSRHIs3171DVKGYtEvs/ci1gfBYmLqSU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Uh2Ur9T45xfoQIXtUsWPsmgkCrA6TwQMay05Xktp0s8KIZmaI3pcV9Eccnty9CgZ/
	 MJlpICOsQamvVFB0Djb8iv9xVIi0xzbB3GKmZ2kvMl9B5vQaEanjwA3hTITRt+VijM
	 bUBLT6u/e/vajjDVlJFDTKhCD5CojeznC7fUF9MEa+9fz8cvVzqTARU9mwxR5fketo
	 60YUk20rQr3Mglrg1NyOs9+qXS6Wch/nSnSVHpEy5gcfzAG1y9l0j4Dc0Nths0zp9L
	 fJYxuAm97l4Fa6KC+La+sRTMepcHyS1hQJCMh5R/kWkuYBqlw5uk6RAV3e33Nea8BK
	 W7WfHVtNednjw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44914C02183;
	Wed, 15 Jan 2025 06:42:02 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 15 Jan 2025 14:41:59 +0800
Subject: [PATCH v3 1/5] dt-bindings: pinctrl: Add support for Amlogic SoCs
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-amlogic-pinctrl-v3-1-2b8536457aba@amlogic.com>
References: <20250115-amlogic-pinctrl-v3-0-2b8536457aba@amlogic.com>
In-Reply-To: <20250115-amlogic-pinctrl-v3-0-2b8536457aba@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736923319; l=5559;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=LleV4eKYRjgHk06xx+Pt9rxMa6atothk5VMgpSkY4LY=;
 b=BvnYQcSfUQ0QaQOABEwwb10q+rATGlqBXDz6q6t/IohvWV+8YhIzDUCGBsemDYAXq8dpf/DfO
 3P+bKaEOiQ1DKfInJoVKulcW+ACixqXjxPweK8N95KkDgmA7dgZGAIt
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add the dt-bindings for Amlogic pin controller, and add a new
dt-binding header file which document the GPIO bank names of
all Amlogic subsequent SoCs.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../bindings/pinctrl/amlogic,pinctrl-a4.yaml       | 132 +++++++++++++++++++++
 include/dt-bindings/pinctrl/amlogic,pinctrl.h      |  46 +++++++
 2 files changed, 178 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
new file mode 100644
index 000000000000..bc2764549471
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
@@ -0,0 +1,132 @@
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
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+
+patternProperties:
+  "^gpio@[0-9a-f]+$":
+    type: object
+
+    properties:
+      reg:
+        minItems: 1
+        items:
+          - description: pin config register
+          - description: pin mux setting register (some special pin fixed function)
+          - description: pin drive strength register (optionanl)
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
+      bank-number:
+        description: |
+          bank-number are provided by the pin controller header file at:
+          <include/dt-bindings/pinctrl/amlogic,pinctrl.h>
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+    required:
+      - reg
+      - reg-names
+      - gpio-controller
+      - "#gpio-cells"
+      - gpio-ranges
+      - bank-number
+
+    additionalProperties: false
+
+  "^func-[0-9a-z-]+$":
+    type: object
+    patternProperties:
+      "^group-[0-9a-z-]+$":
+        type: object
+        allOf:
+          - $ref: /schemas/pinctrl/pincfg-node.yaml
+          - $ref: /schemas/pinctrl/pinmux-node.yaml
+    additionalProperties: false
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
+        gpio@14 {
+          reg = <0 0x14 0 0x10>,
+                <0 0x14 0 0x10>;
+          reg-names = "gpio", "mux";
+          gpio-controller;
+          #gpio-cells = <2>;
+          bank-number = <AMLOGIC_GPIO_B>;
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



