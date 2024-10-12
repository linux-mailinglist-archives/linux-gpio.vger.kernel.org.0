Return-Path: <linux-gpio+bounces-11244-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3F199B770
	for <lists+linux-gpio@lfdr.de>; Sun, 13 Oct 2024 00:08:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F0701C20DEB
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Oct 2024 22:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D519519C546;
	Sat, 12 Oct 2024 22:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gpj5/8xp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBD716C6A7;
	Sat, 12 Oct 2024 22:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728770902; cv=none; b=WLRjue04aLsKpLJtRaqrbIkscbwPR5tdEoQzed5+uEfmQ3x05nZ8ku3sycdikM6zI+369zyOtMP7PKV+VSxnH2bFQ1hSNG/FuydqDyFdvn3vXjE2rcpmiplGZ9qZ+ri8/VpbZ8/uVdGZw8nOvgpDrAKOqy3MCp/4LjcYV8dt2xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728770902; c=relaxed/simple;
	bh=hPDzU0MU42w4NN9HxoGD4ZxcUZc8Ag1v1MGVFJad9j8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cDocvvCg9kyulQjPDfIqzQm0hUsqFXgEpJ9d0FUv4sjUfR6JS1M6H39m563FhaPZi/Z8Z3BXpAP0ufR5LYoj2avVOXVD4BiuJV0dhb3UgDIJuMcIMojzH9DJ0dSww6T/Z0jm/h1PqfdWEM40uDJ5Qj3ZWKeBVJqkEgpOrJCc8lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gpj5/8xp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17301C4CEC6;
	Sat, 12 Oct 2024 22:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728770902;
	bh=hPDzU0MU42w4NN9HxoGD4ZxcUZc8Ag1v1MGVFJad9j8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gpj5/8xpSql6ZOpMqaERf2ogQnT/f75lM6FDgblM1x1J6x5Brn7XjgnWcKycPwGTs
	 mrsPjzSpx9SPlWxqpXUZRAsFW5Jv4GIec0iltQKbOOCu9FxaCFsWV04WdNJKSxKFMo
	 UGarYfigaTSA4EiaDHQN4MFdcav9Zjm1APpN+kHCJJ1LpcsCZq47L32m1yo1Sn/m1w
	 vUVmviLh2kr61kxBLuXVdZJmR58nzxyXj9CdHIpRdsENvvJFjBTIqI0iUJy3C2qPRw
	 YpyxvWkWZEYzbNMKUhLkhfxZdlV8RV0jrku1xDt/buC2QOw1tjYY0vmTtDxzZcqWrO
	 k2CdrcXHdxlSQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sun, 13 Oct 2024 00:07:10 +0200
Subject: [PATCH v6 4/6] dt-bindings: mfd: Add support for Airoha EN7581
 GPIO System Controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241013-en7581-pinctrl-v6-4-2048e2d099c2@kernel.org>
References: <20241013-en7581-pinctrl-v6-0-2048e2d099c2@kernel.org>
In-Reply-To: <20241013-en7581-pinctrl-v6-0-2048e2d099c2@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 upstream@airoha.com, benjamin.larsson@genexis.eu, ansuelsmth@gmail.com, 
 linux-pwm@vger.kernel.org
X-Mailer: b4 0.14.2

From: Christian Marangi <ansuelsmth@gmail.com>

Add support for Airoha EN7581 GPIO System Controller which provide a
register map for controlling the GPIO, pinctrl and PWM of the SoC via
dedicated pinctrl and pwm child nodes.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../bindings/mfd/airoha,en7581-gpio-sysctl.yaml    | 90 ++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/airoha,en7581-gpio-sysctl.yaml b/Documentation/devicetree/bindings/mfd/airoha,en7581-gpio-sysctl.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..4a81ed82ef34dc2b99594098584cc77f67f276c8
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/airoha,en7581-gpio-sysctl.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/airoha,en7581-gpio-sysctl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha EN7581 GPIO System Controller
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+  - Lorenzo Bianconi <lorenzo@kernel.org>
+
+description:
+  Airoha EN7581 SoC GPIO system controller which provided a register map
+  for controlling the GPIO, pins and PWM of the SoC.
+
+properties:
+  compatible:
+    items:
+      - const: airoha,en7581-gpio-sysctl
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  pinctrl:
+    type: object
+    $ref: /schemas/pinctrl/airoha,en7581-pinctrl.yaml
+    description:
+      Child node definition for EN7581 Pin controller
+
+  pwm:
+    type: object
+    $ref: /schemas/pwm/airoha,en7581-pwm.yaml
+    description:
+      Child node definition for EN7581 PWM controller
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    system-controller@1fbf0200 {
+      compatible = "airoha,en7581-gpio-sysctl", "syscon", "simple-mfd";
+      reg = <0x1fbf0200 0xc0>;
+
+      pinctrl {
+        compatible = "airoha,en7581-pinctrl";
+
+        interrupt-parent = <&gic>;
+        interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+
+        gpio-controller;
+        #gpio-cells = <2>;
+
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        mmc-pins {
+          mux {
+            function = "emmc";
+            groups = "emmc";
+          };
+        };
+
+        mdio-pins {
+          mux {
+            function = "mdio";
+            groups = "mdio";
+          };
+
+          conf {
+            pins = "gpio2";
+            output-enable;
+          };
+        };
+      };
+
+      pwm {
+        compatible = "airoha,en7581-pwm";
+
+        #pwm-cells = <3>;
+      };
+    };

-- 
2.47.0


