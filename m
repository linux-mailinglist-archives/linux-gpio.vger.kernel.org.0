Return-Path: <linux-gpio+bounces-6878-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 683D08D3CC2
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 18:35:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C4601C23F14
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 16:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C36FF1C9ECF;
	Wed, 29 May 2024 16:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GSCdh5/0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7118F194C6D;
	Wed, 29 May 2024 16:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717000236; cv=none; b=ibyM79kkf8+9E2G4TwhoKA/WxGwalmxWlq8yPZhcvD1/eeJCxyj6S6nG3Stiy00Rd4exLiVh0XaKuRsq7Pp+W8kWPjAWXovAYzG88Q3q/PCAC3Rtm2aG1wgPO0fTuQJjoiUoclBDR+M8kD3+pztSPsrZ2WYjTnUWf5PzcXRRNOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717000236; c=relaxed/simple;
	bh=5kY9P5BZ0+lfkMBnpNNuy5VYH98W7LbVhPjCSiEPNiU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pB7nCbcC4sbzleo2fKzrmhlT4Wy1YAGuXTbiTTaT4YcNpE3nvHU3eBNAplw1u1ZQyl+r4YDIv0QgGSNRSHOeLGv3wGYiLrwn5h9rTwvWsR3Ga6IN0Daba23C38BU1k8+KLQgg7LWu+Qs3Ku6AdiYb2vOwZ7/+BVcKvcazciFZE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GSCdh5/0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13794C4DDF9;
	Wed, 29 May 2024 16:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717000236;
	bh=5kY9P5BZ0+lfkMBnpNNuy5VYH98W7LbVhPjCSiEPNiU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GSCdh5/0poDxJmU5vY+SK3qSTgJ8Mi1zYTz9sJq5OXOSERYIzucXFTBz6AOKs0hX3
	 +P9Gpv6P4BGgR8oG8eHG/MOKpeXrm0dxyqHybTjDbIetXtVRcHccHWHHukkk0g7nWH
	 MfrXs0rmF4cRIrNUx9sm3p3OOsA9yx2VM4fC+FSs3QnXM3CaYTebJAo/IpqP6Qo8ag
	 3aq9oOe2BEbFTjQd2YRPOoxrzDomWMKrwtn4P9zNqsxYuYL3H+ZIKCb7aG5izW5ZYy
	 WIy+G3kg1I+cqplzT/eRhhDOWdZ7cM0gROwfD1O+garmJHYnhzh3U+QD/3V88wlKCQ
	 n7o3/GCJsiuuw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sCMCC-000000004j8-0e6j;
	Wed, 29 May 2024 18:30:36 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v2 11/14] dt-bindings: mfd: pm8008: rework binding
Date: Wed, 29 May 2024 18:29:55 +0200
Message-ID: <20240529162958.18081-12-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20240529162958.18081-1-johan+linaro@kernel.org>
References: <20240529162958.18081-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rework the pm8008 binding by dropping internal details like register
offsets and interrupts and by adding the missing regulator and
temperature alarm properties.

Note that child nodes are still used for pinctrl and regulator
configuration.

Also note that the pinctrl state definition will be extended later and
could eventually also be shared with other PMICs (e.g. by breaking out
bits of qcom,pmic-gpio.yaml).

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 .../devicetree/bindings/mfd/qcom,pm8008.yaml  | 149 +++++++++++-------
 1 file changed, 90 insertions(+), 59 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
index d71657f488db..ccf472e7f552 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
@@ -27,103 +27,134 @@ properties:
   reset-gpios:
     maxItems: 1
 
-  "#interrupt-cells":
+  vdd-l1-l2-supply: true
+  vdd-l3-l4-supply: true
+  vdd-l5-supply: true
+  vdd-l6-supply: true
+  vdd-l7-supply: true
+
+  gpio-controller: true
+
+  "#gpio-cells":
     const: 2
 
-    description: |
-      The first cell is the IRQ number, the second cell is the IRQ trigger
-      flag. All interrupts are listed in include/dt-bindings/mfd/qcom-pm8008.h.
+  gpio-ranges:
+    maxItems: 1
 
   interrupt-controller: true
 
-  "#address-cells":
-    const: 1
+  "#interrupt-cells":
+    const: 2
 
-  "#size-cells":
+  "#thermal-sensor-cells":
     const: 0
 
-patternProperties:
-  "^gpio@[0-9a-f]+$":
+  pinctrl:
     type: object
+    additionalProperties: false
+    patternProperties:
+      "-state$":
+        type: object
+        $ref: "#/$defs/qcom-pm8008-pinctrl-state"
+        unevaluatedProperties: false
 
-    description: |
-      The GPIO peripheral. This node may be specified twice, one for each GPIO.
-
-    properties:
-      compatible:
-        items:
-          - const: qcom,pm8008-gpio
-          - const: qcom,spmi-gpio
+  regulators:
+    type: object
+    additionalProperties: false
+    patternProperties:
+      "^ldo[1-7]$":
+        type: object
+        $ref: /schemas/regulator/regulator.yaml#
+        unevaluatedProperties: false
 
-      reg:
-        description: Peripheral address of one of the two GPIO peripherals.
-        maxItems: 1
+required:
+  - compatible
+  - reg
+  - interrupts
+  - vdd-l1-l2-supply
+  - vdd-l3-l4-supply
+  - vdd-l5-supply
+  - vdd-l6-supply
+  - vdd-l7-supply
+  - gpio-controller
+  - "#gpio-cells"
+  - gpio-ranges
+  - interrupt-controller
+  - "#interrupt-cells"
+  - "#thermal-sensor-cells"
 
-      gpio-controller: true
+additionalProperties: false
 
-      gpio-ranges:
-        maxItems: 1
+$defs:
+  qcom-pm8008-pinctrl-state:
+    type: object
 
-      interrupt-controller: true
+    allOf:
+      - $ref: /schemas/pinctrl/pinmux-node.yaml
+      - $ref: /schemas/pinctrl/pincfg-node.yaml
 
-      "#interrupt-cells":
-        const: 2
+    properties:
+      pins:
+        items:
+          pattern: "^gpio[12]$"
 
-      "#gpio-cells":
-        const: 2
+      function:
+        items:
+          - enum:
+              - normal
 
     required:
-      - compatible
-      - reg
-      - gpio-controller
-      - interrupt-controller
-      - "#gpio-cells"
-      - gpio-ranges
-      - "#interrupt-cells"
+      - pins
+      - function
 
     additionalProperties: false
 
-required:
-  - compatible
-  - reg
-  - interrupts
-  - "#address-cells"
-  - "#size-cells"
-  - "#interrupt-cells"
-
-additionalProperties: false
-
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
-    #include <dt-bindings/mfd/qcom-pm8008.h>
     #include <dt-bindings/interrupt-controller/irq.h>
 
     i2c {
       #address-cells = <1>;
       #size-cells = <0>;
 
-      pmic@8 {
+      pm8008: pmic@8 {
         compatible = "qcom,pm8008";
         reg = <0x8>;
-        #address-cells = <1>;
-        #size-cells = <0>;
-        interrupt-controller;
-        #interrupt-cells = <2>;
 
         interrupt-parent = <&tlmm>;
         interrupts = <32 IRQ_TYPE_EDGE_RISING>;
 
         reset-gpios = <&tlmm 42 GPIO_ACTIVE_LOW>;
 
-        pm8008_gpios: gpio@c000 {
-          compatible = "qcom,pm8008-gpio", "qcom,spmi-gpio";
-          reg = <0xc000>;
-          gpio-controller;
-          gpio-ranges = <&pm8008_gpios 0 0 2>;
-          #gpio-cells = <2>;
-          interrupt-controller;
-          #interrupt-cells = <2>;
+        vdd-l1-l2-supply = <&vreg_s8b_1p2>;
+        vdd-l3-l4-supply = <&vreg_s1b_1p8>;
+        vdd-l5-supply = <&vreg_bob>;
+        vdd-l6-supply = <&vreg_bob>;
+        vdd-l7-supply = <&vreg_bob>;
+
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&pm8008 0 0 2>;
+
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        #thermal-sensor-cells = <0>;
+
+        pinctrl {
+          gpio-keys-state {
+            pins = "gpio1";
+            function = "normal";
+          };
+        };
+
+        regulators {
+          ldo1 {
+            regulator-name = "vreg_l1";
+            regulator-min-microvolt = <950000>;
+            regulator-max-microvolt = <1300000>;
+          };
         };
       };
     };
-- 
2.44.1


