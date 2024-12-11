Return-Path: <linux-gpio+bounces-13740-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E999EC502
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 07:48:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB2C4284667
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 06:48:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD8991C5CA1;
	Wed, 11 Dec 2024 06:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y/kxde8G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1391C07EA;
	Wed, 11 Dec 2024 06:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733899689; cv=none; b=tyPWrEbthALCuR0PBLL782PR/y1Ak0qyyo1jOY7Bg/sNSYLf85YVbewkPAuakwzav3+1IazZ9LhSv0MD1R3niaop4OzzkpN5rOugt6KxFsW4HVq97dH0676ofK8jZudLHBtreyLYZDdQKbcm0XhgS/n+SSqtcNqx4HzojrVwPTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733899689; c=relaxed/simple;
	bh=r2eeKH7TLgxvTvb9gVR4IZYvFOKaGGlhAHkcdxIXTKQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cq85vmxCGokIy+LLAUT3Vrh76yIn4LmzM0nbjqtd2UGsV/+1lZxEKLOofrdCsju2kvvMR3OlJw1V0uFFVHdCGGqEwWwFFIygStu+j6vKodEjaJjHPF1G2KDFtbv/LD2mb+0TUp3FMuWS2b47biFzifpRPEpZQdT6aq3TZ2ZEi+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y/kxde8G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB31FC4AF0B;
	Wed, 11 Dec 2024 06:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733899689;
	bh=r2eeKH7TLgxvTvb9gVR4IZYvFOKaGGlhAHkcdxIXTKQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Y/kxde8GyXMG9YTry1zgTpQ6N26TEIzEdtUGpqLqX+yLv/r6hCU/JkjzfClQxpPvv
	 /ujVIKE7UBO43J0OOxlZtdeWY8veShL3Hk/CUz5nKaEEW2GDrjAt3nlpd1YTLzDRFH
	 BR71h8sHpVS/dAd/A/jkIxkvqWVOlW9qI/iZspWcuep8BzoXYNx7TotkxIOCR8bCo7
	 Fi1nBeMsZzEpl7+JMrOrGwMfrJUAmSAC5QeOLA94pyrg5coGpVigbiWzIYp1QGcTZz
	 7x4QKbdTOxdu4wY47DQARwUP6Fv9dVEMIDZA8AVfRYGSz+uxpC/sxHc4znDXQgQTsP
	 X16+bajqkNOAg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1D5DE7717D;
	Wed, 11 Dec 2024 06:48:08 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 11 Dec 2024 14:47:49 +0800
Subject: [PATCH RFC 1/3] dt-bindings: pinctrl: Add support for Amlogic SoCs
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241211-amlogic-pinctrl-v1-1-410727335119@amlogic.com>
References: <20241211-amlogic-pinctrl-v1-0-410727335119@amlogic.com>
In-Reply-To: <20241211-amlogic-pinctrl-v1-0-410727335119@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733899686; l=6135;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=1xxGNtsdXsiZXZjmB+MPMut36Qg0ZC563IbXVw2acMI=;
 b=PKEYhS2WHVog3Lwog0d7EwsQit7I9Yte40i35UyYc6fWye7YPqKCxV2CltPggIDHfLwxs9idX
 IJ67TtZ1mb5APrPA8EFx0AfJ7MRmgTQUYsPJNsMvjg4sKkdXXr3fQd8
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add the dt-bindings for Amlogic pin controller, and add a new
dt-binding header file which document the GPIO bank names and
alternative func value of all Amlogic subsequent SoCs.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../bindings/pinctrl/amlogic,pinctrl.yaml          | 150 +++++++++++++++++++++
 include/dt-bindings/pinctrl/amlogic,pinctrl.h      |  68 ++++++++++
 2 files changed, 218 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl.yaml
new file mode 100644
index 000000000000..b0c2ae585d7d
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl.yaml
@@ -0,0 +1,150 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/amlogic,pinctrl.yaml#
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
+    const: amlogic,pinctrl
+
+  reg:
+    minItems: 2
+
+  reg-names:
+    items:
+      - const: mux
+      - const: gpio
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - "#address-cells"
+  - "#size-cells"
+
+patternProperties:
+  "^gpio[a-z]":
+    type: object
+
+    properties:
+      gpio-controller: true
+
+      "#gpio-cells":
+        const: 2
+
+      bank-name:
+        $ref: /schemas/types.yaml#/definitions/string
+
+      npins:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 1
+        maximum: 32
+
+      bank-index:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 29
+
+      reg-mux-offset:
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+      bit-mux-offset:
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+      reg-gpio-offset:
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+    required:
+      - gpio-controller
+      - "#gpio-cells"
+      - npins
+      - bank-index
+      - reg-mux-offset
+      - reg-gpio-offset
+      - bank-name
+
+    additionalProperties: false
+    unevaluatedProperties: false
+
+  "^func-[0-9a-z]":
+    type: object
+    additionalProperties:
+      type: object
+      allOf:
+        - $ref: pincfg-node.yaml#
+        - $ref: pinmux-node.yaml#
+
+additionalProperties: false
+
+examples:
+  - |
+    apb {
+      #address-cells = <2>;
+      #size-cells = <2>;
+      periphs_pinctrl: pinctrl@8e700 {
+        compatible = "amlogic,pinctrl";
+        #address-cells = <2>;
+        #size-cells = <2>;
+        reg = <0x0 0x8e700 0x0 0x04>,
+              <0x0 0x8e704 0x0 0x60>;
+        reg-names = "mux", "gpio";
+
+        gpiob {
+          gpio-controller;
+          #gpio-cells = <2>;
+          npins = <10>;
+          bank-index = <1>;
+          reg-mux-offset = <0x14>;
+          bit-mux-offset = <0x14>;
+          reg-gpio-offset = <0x30>;
+          bank-name = "GPIOB";
+        };
+
+        gpioe {
+          gpio-controller;
+          #gpio-cells = <2>;
+          npins = <10>;
+          bank-index = <5>;
+          reg-mux-offset = <0x14>;
+          reg-gpio-offset = <0x30>;
+          bank-name = "GPIOE";
+        };
+
+        func-uart-b {
+          uart-b-default{
+            pinmux = <3>;
+            bias-pull-up;
+            drive-strength-microamp = <4000>;
+          };
+
+          uart-c-default{
+            pinmux = <4>;
+            bias-pull-up;
+            drive-strength-microamp = <4000>;
+          };
+        };
+
+        func-uart-c {
+          uart-c-default{
+            pinmux = <3>;
+            bias-pull-up;
+            drive-strength-microamp = <4000>;
+          };
+        };
+      };
+    };
diff --git a/include/dt-bindings/pinctrl/amlogic,pinctrl.h b/include/dt-bindings/pinctrl/amlogic,pinctrl.h
new file mode 100644
index 000000000000..03db0a730e8b
--- /dev/null
+++ b/include/dt-bindings/pinctrl/amlogic,pinctrl.h
@@ -0,0 +1,68 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
+ * Author: Xianwei Zhao <xianwei.zhao@amlogic.com>
+ */
+
+#ifndef _DT_BINDINGS_AMLOGIC_PINCTRL_H
+#define _DT_BINDINGS_AMLOGIC_PINCTRL_H
+
+/* define PIN modes */
+#define AF0	0x0
+#define AF1	0x1
+#define AF2	0x2
+#define AF3	0x3
+#define AF4	0x4
+#define AF5	0x5
+#define AF6	0x6
+#define AF7	0x7
+#define AF8	0x8
+#define AF9	0x9
+#define AF10	0xa
+#define AF11	0xb
+#define AF12	0xc
+#define AF13	0xd
+#define AF14	0xe
+#define AF15	0xf
+
+#define AML_PIN_ALT_FUNC_MASK	0xf
+
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
+
+#define AML_PINMUX(bank, offset, mode)	(((((bank) << 8) + (offset)) << 8) | (mode))
+#define AML_PINMUX_TO_BANK(pinmux)	(((pinmux) >> 16) & 0xff)
+#define AML_PINMUX_TO_OFFSET(pinmux)	(((pinmux) >> 8) & 0xff)
+
+#endif /* _DT_BINDINGS_AMLOGIC_PINCTRL_H */

-- 
2.37.1



