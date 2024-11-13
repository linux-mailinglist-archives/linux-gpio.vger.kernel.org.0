Return-Path: <linux-gpio+bounces-12917-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDC09C6B90
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 10:37:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 45994B2201B
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2024 09:37:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79EF31F80CC;
	Wed, 13 Nov 2024 09:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TypZg6pL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308F81C8FCE;
	Wed, 13 Nov 2024 09:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731490656; cv=none; b=dYtKXaosirm8uOoyaZJSHPoMyvo4EGROOeDNv0f/W++G7w6zLEQduCz90KREeaYSKSyIBQx8HmiS9gtnMCeQYCaLBSVPA1nClwSFwnTCOAxp+/lDEAwx3qeWz6Z0JI0/BFRGM9wi/ZYEVk7yXRyBX5r7T6IjBUC1f95w+4X2Jnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731490656; c=relaxed/simple;
	bh=jF8bZTWN3AB9XKsseQGVgxQ6RryMR2osjnjfCUqnOnU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CKFwUWEVQSXsMTxiZq0PZaFKHXko8oFk4MZDtGe5JL8uwLknImPyucwgPXDJmDqV8boLVbzlUrg2Pfa1oYNnvTrcTKyRxYlDg6vwUotwyjvSjGR2Z6ELDpNVLoZQeD3BQvmahceOYTY6DTEmn4mD0xbr26A8hqcaeCjyTxipiF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TypZg6pL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C89E8C4CED7;
	Wed, 13 Nov 2024 09:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731490655;
	bh=jF8bZTWN3AB9XKsseQGVgxQ6RryMR2osjnjfCUqnOnU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TypZg6pLeCaSBoINbmBXk6UDfJHSDQ1MZdeHPE6ZxZYBdmGzk8phSSCuS817Zi3iv
	 yme7W9KturW9EgdfJdbd+hwqI3Lq+3GcHyp/9Ns6XwhBBVlVSs1iCsI2X5Ou3ArTQs
	 RM5JXDXIM7ecSswuxkdf7Tr/exVtrQoRQeBY2OVIjbVXmSOXWGBBZKziQMthmja6y4
	 8UQY0Rqn/Pi4eWnyPc9T/qzIA3eZoWtJiNwNe8gaetfgneqeLdYj2xEOCHFwntKV7+
	 JJOBptxJksr9ZhF4zLWuvCZVHiitsfFbEJ67yC4X2zA6IZT7Y4JoMqX9ZualujhNvc
	 0quTWQFWNp/8g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAC03D41C00;
	Wed, 13 Nov 2024 09:37:35 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 13 Nov 2024 17:37:29 +0800
Subject: [PATCH v7 2/5] dt-bindings: pinctrl: Add support for Amlogic A4
 SoCs
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241113-a4_pinctrl-v7-2-0546a20c1c22@amlogic.com>
References: <20241113-a4_pinctrl-v7-0-0546a20c1c22@amlogic.com>
In-Reply-To: <20241113-a4_pinctrl-v7-0-0546a20c1c22@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731490653; l=4207;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=E8gcBsM6qojqj57hTy/vqLumXN1IUp3FUay7hZlvU14=;
 b=6g8W/fNaZ8PbmBSC3DbFf1TECvck9xVkg2eXOLWcM81cH+8yNpEH4njg3QQWAv+2GitlgLlVu
 tkOjeb49ionCc/xBLYfShpBF6tq1Q+0z0MEIEsVm54NUiSIYQmz5w5o
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add the dt-bindings for Amlogic A4 pin controller, and add a new
dt-binding header file which document the GPIO bank names of all
Amlogic subsequent SoCs.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../bindings/pinctrl/amlogic,meson-pinctrl-a4.yaml | 82 ++++++++++++++++++++++
 include/dt-bindings/gpio/amlogic-gpio.h            | 45 ++++++++++++
 2 files changed, 127 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a4.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a4.yaml
new file mode 100644
index 000000000000..357e9bb079eb
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a4.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/amlogic,meson-pinctrl-a4.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic A4 pinmux controller
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+  - Xianwei Zhao <xianwei.zhao@amlogic.com>
+
+allOf:
+  - $ref: amlogic,meson-pinctrl-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - amlogic,a4-aobus-pinctrl
+      - amlogic,a4-periphs-pinctrl
+
+required:
+  - compatible
+
+patternProperties:
+  "^bank@[0-9a-f]+$":
+    $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-gpio
+
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        maxItems: 2
+
+      reg-names:
+        items:
+          - const: mux
+          - const: gpio
+
+      gpio-controller: true
+
+      "#gpio-cells":
+        const: 3
+
+      gpio-line-names:
+        minItems: 8
+        maxItems: 73
+
+unevaluatedProperties:
+  type: object
+  $ref: amlogic,meson-pinctrl-common.yaml#/$defs/meson-pins
+
+examples:
+  - |
+    bus {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      periphs_pinctrl: pinctrl@4000 {
+        compatible = "amlogic,a4-periphs-pinctrl";
+        #address-cells = <2>;
+        #size-cells = <2>;
+        ranges = <0x0 0x0 0x0 0x4000 0x0 0x02e0>;
+
+        bank@0 {
+          reg = <0x0 0x0 0x0 0x0050>,
+                <0x0 0xc0 0x0 0x0220>;
+          reg-names = "mux", "gpio";
+          gpio-controller;
+          #gpio-cells = <3>;
+          gpio-ranges = <&periphs_pinctrl 0 0 73>;
+        };
+
+        cec_ao_a_h_pins: cec_ao_a_h {
+          mux {
+            groups = "cec_ao_a_h";
+            function = "cec_ao_a_h";
+            bias-disable;
+          };
+        };
+      };
+    };
diff --git a/include/dt-bindings/gpio/amlogic-gpio.h b/include/dt-bindings/gpio/amlogic-gpio.h
new file mode 100644
index 000000000000..5bfdb39eeda8
--- /dev/null
+++ b/include/dt-bindings/gpio/amlogic-gpio.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
+ * Author: Xianwei Zhao <xianwei.zhao@amlogic.com>
+ */
+
+#ifndef _DT_BINDINGS_AMLOGIC_GPIO_H
+#define _DT_BINDINGS_AMLOGIC_GPIO_H
+
+#include <dt-bindings/gpio/gpio.h>
+
+/* Normal GPIO bank */
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
+/* Special GPIO bank */
+#define AMLOGIC_GPIO_DV		26
+#define AMLOGIC_GPIO_AO		27
+#define AMLOGIC_GPIO_CC		28
+#define AMLOGIC_GPIO_TEST_N	29
+
+#endif /* _DT_BINDINGS_AMLOGIC_GPIO_H */

-- 
2.37.1



