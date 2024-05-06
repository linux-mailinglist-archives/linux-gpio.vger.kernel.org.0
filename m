Return-Path: <linux-gpio+bounces-6147-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F668BD123
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 17:10:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70FB61F2208D
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 15:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC849155A25;
	Mon,  6 May 2024 15:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MIWaKCl7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725C615531D;
	Mon,  6 May 2024 15:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715008215; cv=none; b=fv+/pE57d+EnnJJ3zwJ6Nn2JBn0mJjtOjNhCfvPJBzsZlQw2b3sTYrlXW4S3LDiPNxH2lRo0xkK56/UG6Nny17u2C17YCXjrHAupqvVLKmbTjL1iu3uSrqZJ0JHMRduFLXGmujkzaFkms/hwYhrtNADaFr4VyhTF4jXwnW+iM/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715008215; c=relaxed/simple;
	bh=AkdkaR54sACrEoSvNXOHYSL1x8xDnc3d3gyuETl7sUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VxAbrCLH2LHxcZRclCdILQTpD8nQVp8tqTg1Qh+h428lDiBnMmP/1NjGmCGjnBROVYCwZv1ePuTR3Ll1L2Eq7o1F7r88LLPZPrSIZcoWkoEspZr1r8v0l9r1NAkcB6NSY5abCCZAE6g/uvBKFxfhOiwPRmGcAB7mkiYNewmufbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MIWaKCl7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4B5CC4DDF1;
	Mon,  6 May 2024 15:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715008215;
	bh=AkdkaR54sACrEoSvNXOHYSL1x8xDnc3d3gyuETl7sUU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MIWaKCl70QAmGJwYnzJ4aB9Bm4VHKlrVwiBBJVJ4Ag08l46Qn0GcZsIH1d2kUfxv7
	 GEJ0zt8mw9Y0ShewmqWl++sLpvQx4/rE4Sj+ms4nqOZdC0DMyGqYIJL3dTH7M+1Ojv
	 ywHOlHJNM3YaSYZ7ozZz/jT/PgY3SnMYFxkvxIWDUYbG+xdf+mvwBLjISjqJBc8WSH
	 CBzNNtX0qEwrkyfMrGOJt1mPZyn7sgYT2vGBgaAkQNnSWRyTjxj+vEfwHjFrLxNS3J
	 H2an/u2fkk2SvNMXON25Dbdg0KYkuHM5gX7aVropoZteDfD3GYolBipKIRWiEg66m3
	 TYyvEtgaaWAgA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1s3zyq-000000006CU-2jIX;
	Mon, 06 May 2024 17:10:16 +0200
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
	Satya Priya <quic_c_skakit@quicinc.com>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 10/13] dt-bindings: mfd: pm8008: rework binding
Date: Mon,  6 May 2024 17:08:27 +0200
Message-ID: <20240506150830.23709-11-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240506150830.23709-1-johan+linaro@kernel.org>
References: <20240506150830.23709-1-johan+linaro@kernel.org>
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
 .../devicetree/bindings/mfd/qcom,pm8008.yaml  | 154 ++++++++++--------
 1 file changed, 90 insertions(+), 64 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
index e1e05921afb4..ac1bab0261b6 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
@@ -19,116 +19,142 @@ properties:
     const: qcom,pm8008
 
   reg:
-    description:
-      I2C slave address.
-
     maxItems: 1
 
   interrupts:
     maxItems: 1
 
-    description: Parent interrupt.
-
   reset-gpios:
     maxItems: 1
 
-  "#interrupt-cells":
+  vdd_l1_l2-supply: true
+  vdd_l3_l4-supply: true
+  vdd_l5-supply: true
+  vdd_l6-supply: true
+  vdd_l7-supply: true
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
+  - vdd_l1_l2-supply
+  - vdd_l3_l4-supply
+  - vdd_l5-supply
+  - vdd_l6-supply
+  - vdd_l7-supply
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
+        vdd_l1_l2-supply = <&vreg_s8b_1p2>;
+        vdd_l3_l4-supply = <&vreg_s1b_1p8>;
+        vdd_l5-supply = <&vreg_bob>;
+        vdd_l6-supply = <&vreg_bob>;
+        vdd_l7-supply = <&vreg_bob>;
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
2.43.2


