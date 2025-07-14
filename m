Return-Path: <linux-gpio+bounces-23239-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7AFB0487E
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 22:30:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69F5F1884AD7
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 20:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61CBD27934E;
	Mon, 14 Jul 2025 20:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vEbO/orw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116CA23AB87;
	Mon, 14 Jul 2025 20:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752524913; cv=none; b=gpo1Nob0hTCiZ6tAYZtFmAvFwREKX3tL77SPne8FC3Hq4bSbh4HwmAO69KA6/gZJrQpPSGrQ2arB9hINFTW3WgKeQjnJIVCeCj8k8N8mHzuYfFXi2w/vqF/Yf+E6ZAEbNJt8sLvgVizpY5eDA7Spi0kdfhbHrurTRfscsTJYN4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752524913; c=relaxed/simple;
	bh=YxRxeTzWx10IBG0EGK5dxyNUyoD35jE25xIiYjHSp9w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g7jPTrq5iTwkCc0qSeDibrwrTzV7d0e/s1X9OnptR1I4ywaor2R+W/sxD4C6fCKP+XWAfnVAJGA0FQuGrb5GbkF+cKELsnEssXl3plgg5ToaSSoDim3mqBH3aAKHEiOowRQunoewaaPP6vD1JgQ6FbT4Ddx/PJL7XAIuu2VPGTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vEbO/orw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85F6BC4CEED;
	Mon, 14 Jul 2025 20:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752524912;
	bh=YxRxeTzWx10IBG0EGK5dxyNUyoD35jE25xIiYjHSp9w=;
	h=From:To:Cc:Subject:Date:From;
	b=vEbO/orwaB/WQb5IqG2U/ld/Mw1vNnK969hKl2Q/0k0rld0Tvy+Vwt9f/GjfzjI+s
	 5GqjJhGXGMHZZ5fZqBiSVRlrxkBrNJks7LY18/YPuVUF3MuSP/4kR6lyNrpZUyj1mF
	 1KkhcoDio8utKQiUZiTYz+/4VIWovx+d8tZCLYQ6fOxkLxnK6eCPfki5wQ09cHIl5P
	 MwPKucVMJWjI/lL6aOINxtKcegolpkgyNGC/GaVFv1r441x7YxUVinALgSg8daqb93
	 V1vBeb8cchgVkyJ8Abc8Aytlh6Zmag0+Q/p7pLUp2dTK3WSpRuPpdd2sTbEEMghw6M
	 44if5QBs+sfUg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: gpio: Convert ti,twl4030-gpio to DT schema
Date: Mon, 14 Jul 2025 15:28:28 -0500
Message-ID: <20250714202829.3011298-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the TI TWL4030 PMIC GPIO binding to DT schema format. The number
of #interrupt-cells was wrong compared to what is in use. Correct it to
be 1.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/gpio/gpio-twl4030.txt | 29 ---------
 .../bindings/gpio/ti,twl4030-gpio.yaml        | 61 +++++++++++++++++++
 2 files changed, 61 insertions(+), 29 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-twl4030.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/ti,twl4030-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-twl4030.txt b/Documentation/devicetree/bindings/gpio/gpio-twl4030.txt
deleted file mode 100644
index 66788fda1db3..000000000000
--- a/Documentation/devicetree/bindings/gpio/gpio-twl4030.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-twl4030 GPIO controller bindings
-
-Required properties:
-- compatible:
-  - "ti,twl4030-gpio" for twl4030 GPIO controller
-- #gpio-cells : Should be two.
-  - first cell is the pin number
-  - second cell is used to specify optional parameters (unused)
-- gpio-controller : Marks the device node as a GPIO controller.
-- #interrupt-cells : Should be 2.
-- interrupt-controller: Mark the device node as an interrupt controller
-  The first cell is the GPIO number.
-  The second cell is not used.
-- ti,use-leds : Enables LEDA and LEDB outputs if set
-- ti,debounce : if n-th bit is set, debounces GPIO-n
-- ti,mmc-cd : if n-th bit is set, GPIO-n controls VMMC(n+1)
-- ti,pullups : if n-th bit is set, set a pullup on GPIO-n
-- ti,pulldowns : if n-th bit is set, set a pulldown on GPIO-n
-
-Example:
-
-twl_gpio: gpio {
-    compatible = "ti,twl4030-gpio";
-    #gpio-cells = <2>;
-    gpio-controller;
-    #interrupt-cells = <2>;
-    interrupt-controller;
-    ti,use-leds;
-};
diff --git a/Documentation/devicetree/bindings/gpio/ti,twl4030-gpio.yaml b/Documentation/devicetree/bindings/gpio/ti,twl4030-gpio.yaml
new file mode 100644
index 000000000000..5e3e199fd9a4
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/ti,twl4030-gpio.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/ti,twl4030-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI TWL4030 GPIO controller
+
+maintainers:
+  - Aaro Koskinen <aaro.koskinen@iki.fi>
+  - Andreas Kemnade <andreas@kemnade.info>
+  - Kevin Hilman <khilman@baylibre.com>
+  - Roger Quadros <rogerq@kernel.org>
+  - Tony Lindgren <tony@atomide.com>
+
+properties:
+  compatible:
+    const: ti,twl4030-gpio
+
+  '#gpio-cells':
+    const: 2
+
+  gpio-controller: true
+
+  '#interrupt-cells':
+    const: 1
+
+  interrupt-controller: true
+
+  ti,debounce:
+    description: Debounce control bits. Each bit corresponds to a GPIO pin.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  ti,mmc-cd:
+    description: MMC card detect control bits. Each bit corresponds to a GPIO pin for VMMC(n+1).
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  ti,pullups:
+    description: Pull-up control bits. Each bit corresponds to a GPIO pin.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  ti,pulldowns:
+    description: Pull-down control bits. Each bit corresponds to a GPIO pin.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  ti,use-leds:
+    type: boolean
+    description: Enables LEDA and LEDB outputs if set
+
+additionalProperties: false
+
+examples:
+  - |
+    gpio {
+        compatible = "ti,twl4030-gpio";
+        #gpio-cells = <2>;
+        gpio-controller;
+        #interrupt-cells = <1>;
+        interrupt-controller;
+        ti,use-leds;
+    };
-- 
2.47.2


