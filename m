Return-Path: <linux-gpio+bounces-1134-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5938D80AF07
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Dec 2023 22:55:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E6E32813B2
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Dec 2023 21:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7337E58AB9;
	Fri,  8 Dec 2023 21:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ID3x8OxZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 201F9171D
	for <linux-gpio@vger.kernel.org>; Fri,  8 Dec 2023 13:55:41 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40c339d2b88so10740665e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 08 Dec 2023 13:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702072539; x=1702677339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FjvclqOZQPdp/ySHfQ62/WK4T76lvl+K0DABvIIpwvo=;
        b=ID3x8OxZu23v1b/XsPieOYJtzIj11gpTNJ/QsaLM1dhPFpMVuu6+FC8fBlgBRHMPwe
         XHqZ5dDOuyBBNd0AVp8iRZFlMK81VZGP4f082Xy3PG1YSk0csKZ/5YTVO3kqtOls13Wb
         fdYniWjhs52ggwcKO32LsXjnqO8sdu/I5t/4ITqLkRkZoJYelG+0dKgnHXPN//mkQfsX
         oex1Ai9RbZyYry7WzB+8pRMH3qyeKqP5cz5J/bsFZf86e1sNpJ8PoTpYLL+iFELCcBBB
         /nBtn91+SZPwYHcVWWhKhSB10RMYG3oRPfBlErP4fpDf9pRH1FfdnZFHrn+oBtyhKoyR
         bXUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702072539; x=1702677339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FjvclqOZQPdp/ySHfQ62/WK4T76lvl+K0DABvIIpwvo=;
        b=X82jHSCA6Gayoe+c7lkUhjMD06njVG2AapM/ydqLs6xZW680kowKPiTmQypUTzFpNy
         1aNktgccvw/TtTm3O9LznF+kjU66ASK33ob2jvg2ergROHKg1kGUc01FuisbXhxkggNm
         Mge6pAFMijvi6GzEkZjkU7wOH2VHiApdqJ4E9pWm6Jx6SkK5GPCefX+0UqSgKNGTU9h4
         vcuOtm4gycI3kDl5JQRp4sR2Y+HYlaAdaqTLLYJEl2NkiecoHzZulKDPD09LWO4xvTMW
         QHVeXQOk9rQpR5038RNVC7cBgLuOyTwF9Erv3CHQNTyehqoV/79yZTaunT7HCIiTQb0/
         L1BQ==
X-Gm-Message-State: AOJu0YwJe8+6fbQu8qETRaQQymiiaJXKmG3AHt/l1QPq+IBEbvuexOFv
	yYH1unYa4sA8SzzvbkqMLB/gZQ==
X-Google-Smtp-Source: AGHT+IFes8ntwMuaHaAbleFhA6O4kz2plWbx/N3J8ah3XVD6nOLd43XlUH10ZQB9yrHrmf7i0TLudA==
X-Received: by 2002:a05:600c:3ba6:b0:40b:5e21:e27a with SMTP id n38-20020a05600c3ba600b0040b5e21e27amr321653wms.103.1702072539267;
        Fri, 08 Dec 2023 13:55:39 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id r20-20020a05600c459400b0040b349c91acsm6321789wmo.16.2023.12.08.13.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 13:55:38 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Shawn Guo <shawn.guo@linaro.org>,
	Melody Olvera <quic_molvera@quicinc.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Richard Acayan <mailingradian@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	krishna Lanka <quic_vamslank@quicinc.com>,
	Rohit Agarwal <quic_rohiagar@quicinc.com>,
	Iskren Chernev <me@iskren.info>,
	Martin Botka <martin.botka@somainline.org>,
	Danila Tikhonov <danila@jiaxyga.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 01/10] dt-bindings: pinctrl: qcom: create common LPASS LPI schema
Date: Fri,  8 Dec 2023 22:55:25 +0100
Message-Id: <20231208215534.195854-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Just like regular TLMM pin controllers in Qualcomm SoCs, the Low Power
Audio SubSystem (LPASS) Low Power Island (LPI) TLMM blocks share a lot
of properties, so common part can be moved to separate schema to reduce
code duplication and make reviewing easier.

Except the move of common part, this introduces effective changes:
1. To all LPASS LPI bindings: Reference pinmux-node.yaml in each pin
   muxing and configuration node, to bring definition of "function" and
   "pins" properties.

2. qcom,sc7280-lpass-lpi-pinctrl: Reference pinctrl.yaml in top leve.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../pinctrl/qcom,lpass-lpi-common.yaml        | 75 +++++++++++++++++++
 .../qcom,sc7280-lpass-lpi-pinctrl.yaml        | 49 ++----------
 .../qcom,sc8280xp-lpass-lpi-pinctrl.yaml      | 49 +-----------
 .../qcom,sm6115-lpass-lpi-pinctrl.yaml        | 48 +-----------
 .../qcom,sm8250-lpass-lpi-pinctrl.yaml        | 49 +-----------
 .../qcom,sm8350-lpass-lpi-pinctrl.yaml        | 49 +-----------
 .../qcom,sm8450-lpass-lpi-pinctrl.yaml        | 49 +-----------
 .../qcom,sm8550-lpass-lpi-pinctrl.yaml        | 49 +-----------
 .../qcom,sm8650-lpass-lpi-pinctrl.yaml        | 49 +-----------
 9 files changed, 109 insertions(+), 357 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-common.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-common.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-common.yaml
new file mode 100644
index 000000000000..3b5045730471
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-common.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,lpass-lpi-common.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SoC LPASS LPI TLMM Common Properties
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+
+description:
+  Common properties for the Top Level Mode Multiplexer pin controllers in the
+  Low Power Audio SubSystem (LPASS) Low Power Island (LPI) of Qualcomm SoCs.
+
+properties:
+  gpio-controller: true
+
+  "#gpio-cells":
+    description:
+      Specifying the pin number and flags, as defined in
+      include/dt-bindings/gpio/gpio.h
+    const: 2
+
+  gpio-ranges:
+    maxItems: 1
+
+required:
+  - gpio-controller
+  - "#gpio-cells"
+  - gpio-ranges
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+additionalProperties: true
+
+$defs:
+  qcom-tlmm-state:
+    properties:
+      drive-strength:
+        enum: [2, 4, 6, 8, 10, 12, 14, 16]
+        default: 2
+        description:
+          Selects the drive strength for the specified pins, in mA.
+
+      slew-rate:
+        enum: [0, 1, 2, 3]
+        default: 0
+        description: |
+          0: No adjustments
+          1: Higher Slew rate (faster edges)
+          2: Lower Slew rate (slower edges)
+          3: Reserved (No adjustments)
+
+      bias-bus-hold: true
+      bias-pull-down: true
+      bias-pull-up: true
+      bias-disable: true
+      input-enable: true
+      output-high: true
+      output-low: true
+
+    required:
+      - pins
+      - function
+
+    allOf:
+      - $ref: pincfg-node.yaml#
+      - $ref: pinmux-node.yaml#
+
+    additionalProperties: true
+
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
index 00c5a00e35fc..08801cc4e476 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
@@ -20,16 +20,6 @@ properties:
   reg:
     maxItems: 2
 
-  gpio-controller: true
-
-  "#gpio-cells":
-    description: Specifying the pin number and flags, as defined in
-      include/dt-bindings/gpio/gpio.h
-    const: 2
-
-  gpio-ranges:
-    maxItems: 1
-
 patternProperties:
   "-state$":
     oneOf:
@@ -45,7 +35,8 @@ $defs:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
-    $ref: /schemas/pinctrl/pincfg-node.yaml
+    $ref: qcom,lpass-lpi-common.yaml#/$defs/qcom-tlmm-state
+    unevaluatedProperties: false
 
     properties:
       pins:
@@ -68,42 +59,14 @@ $defs:
           Specify the alternative function to be configured for the specified
           pins.
 
-      drive-strength:
-        enum: [2, 4, 6, 8, 10, 12, 14, 16]
-        default: 2
-        description:
-          Selects the drive strength for the specified pins, in mA.
-
-      slew-rate:
-        enum: [0, 1, 2, 3]
-        default: 0
-        description: |
-            0: No adjustments
-            1: Higher Slew rate (faster edges)
-            2: Lower Slew rate (slower edges)
-            3: Reserved (No adjustments)
-
-      bias-pull-down: true
-      bias-pull-up: true
-      bias-bus-hold: true
-      bias-disable: true
-      output-high: true
-      output-low: true
-
-    required:
-      - pins
-      - function
-
-    additionalProperties: false
-
 required:
   - compatible
   - reg
-  - gpio-controller
-  - "#gpio-cells"
-  - gpio-ranges
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,lpass-lpi-common.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-lpass-lpi-pinctrl.yaml
index a9167dac9ab5..240e6d45cc95 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-lpass-lpi-pinctrl.yaml
@@ -32,16 +32,6 @@ properties:
       - const: core
       - const: audio
 
-  gpio-controller: true
-
-  "#gpio-cells":
-    description: Specifying the pin number and flags, as defined in
-      include/dt-bindings/gpio/gpio.h
-    const: 2
-
-  gpio-ranges:
-    maxItems: 1
-
 patternProperties:
   "-state$":
     oneOf:
@@ -57,7 +47,8 @@ $defs:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
-    $ref: /schemas/pinctrl/pincfg-node.yaml
+    $ref: qcom,lpass-lpi-common.yaml#/$defs/qcom-tlmm-state
+    unevaluatedProperties: false
 
     properties:
       pins:
@@ -79,48 +70,16 @@ $defs:
           Specify the alternative function to be configured for the specified
           pins.
 
-      drive-strength:
-        enum: [2, 4, 6, 8, 10, 12, 14, 16]
-        default: 2
-        description:
-          Selects the drive strength for the specified pins, in mA.
-
-      slew-rate:
-        enum: [0, 1, 2, 3]
-        default: 0
-        description: |
-          0: No adjustments
-          1: Higher Slew rate (faster edges)
-          2: Lower Slew rate (slower edges)
-          3: Reserved (No adjustments)
-
-      bias-bus-hold: true
-      bias-pull-down: true
-      bias-pull-up: true
-      bias-disable: true
-      input-enable: true
-      output-high: true
-      output-low: true
-
-    required:
-      - pins
-      - function
-
-    additionalProperties: false
-
 allOf:
-  - $ref: pinctrl.yaml#
+  - $ref: qcom,lpass-lpi-common.yaml#
 
 required:
   - compatible
   - reg
   - clocks
   - clock-names
-  - gpio-controller
-  - "#gpio-cells"
-  - gpio-ranges
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-lpass-lpi-pinctrl.yaml
index abac3311fc55..f4cf2ce86fcd 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-lpass-lpi-pinctrl.yaml
@@ -31,16 +31,6 @@ properties:
     items:
       - const: audio
 
-  gpio-controller: true
-
-  "#gpio-cells":
-    description: Specifying the pin number and flags, as defined in
-      include/dt-bindings/gpio/gpio.h
-    const: 2
-
-  gpio-ranges:
-    maxItems: 1
-
 patternProperties:
   "-state$":
     oneOf:
@@ -56,7 +46,8 @@ $defs:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
-    $ref: /schemas/pinctrl/pincfg-node.yaml
+    $ref: qcom,lpass-lpi-common.yaml#/$defs/qcom-tlmm-state
+    unevaluatedProperties: false
 
     properties:
       pins:
@@ -75,48 +66,17 @@ $defs:
           Specify the alternative function to be configured for the specified
           pins.
 
-      drive-strength:
-        enum: [2, 4, 6, 8, 10, 12, 14, 16]
-        default: 2
-        description:
-          Selects the drive strength for the specified pins, in mA.
-
-      slew-rate:
-        enum: [0, 1, 2, 3]
-        default: 0
-        description: |
-          0: No adjustments
-          1: Higher Slew rate (faster edges)
-          2: Lower Slew rate (slower edges)
-          3: Reserved (No adjustments)
-
-      bias-bus-hold: true
-      bias-pull-down: true
-      bias-pull-up: true
-      bias-disable: true
-      input-enable: true
-      output-high: true
-      output-low: true
-
-    required:
-      - pins
-      - function
-
-    additionalProperties: false
 
 allOf:
-  - $ref: pinctrl.yaml#
+  - $ref: qcom,lpass-lpi-common.yaml#
 
 required:
   - compatible
   - reg
   - clocks
   - clock-names
-  - gpio-controller
-  - "#gpio-cells"
-  - gpio-ranges
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml
index 4b4be7efc150..750c996c10a7 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml
@@ -30,16 +30,6 @@ properties:
       - const: core
       - const: audio
 
-  gpio-controller: true
-
-  "#gpio-cells":
-    description: Specifying the pin number and flags, as defined in
-      include/dt-bindings/gpio/gpio.h
-    const: 2
-
-  gpio-ranges:
-    maxItems: 1
-
 patternProperties:
   "-state$":
     oneOf:
@@ -55,7 +45,8 @@ $defs:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
-    $ref: /schemas/pinctrl/pincfg-node.yaml
+    $ref: qcom,lpass-lpi-common.yaml#/$defs/qcom-tlmm-state
+    unevaluatedProperties: false
 
     properties:
       pins:
@@ -78,48 +69,16 @@ $defs:
           Specify the alternative function to be configured for the specified
           pins.
 
-      drive-strength:
-        enum: [2, 4, 6, 8, 10, 12, 14, 16]
-        default: 2
-        description:
-          Selects the drive strength for the specified pins, in mA.
-
-      slew-rate:
-        enum: [0, 1, 2, 3]
-        default: 0
-        description: |
-            0: No adjustments
-            1: Higher Slew rate (faster edges)
-            2: Lower Slew rate (slower edges)
-            3: Reserved (No adjustments)
-
-      bias-pull-down: true
-      bias-pull-up: true
-      bias-bus-hold: true
-      bias-disable: true
-      input-enable: true
-      output-high: true
-      output-low: true
-
-    required:
-      - pins
-      - function
-
-    additionalProperties: false
-
 allOf:
-  - $ref: pinctrl.yaml#
+  - $ref: qcom,lpass-lpi-common.yaml#
 
 required:
   - compatible
   - reg
   - clocks
   - clock-names
-  - gpio-controller
-  - "#gpio-cells"
-  - gpio-ranges
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-lpass-lpi-pinctrl.yaml
index 2e65ae08dd21..9d782f910b31 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-lpass-lpi-pinctrl.yaml
@@ -33,16 +33,6 @@ properties:
       - const: core
       - const: audio
 
-  gpio-controller: true
-
-  "#gpio-cells":
-    description: Specifying the pin number and flags, as defined in
-      include/dt-bindings/gpio/gpio.h
-    const: 2
-
-  gpio-ranges:
-    maxItems: 1
-
 patternProperties:
   "-state$":
     oneOf:
@@ -58,7 +48,8 @@ $defs:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
-    $ref: /schemas/pinctrl/pincfg-node.yaml
+    $ref: qcom,lpass-lpi-common.yaml#/$defs/qcom-tlmm-state
+    unevaluatedProperties: false
 
     properties:
       pins:
@@ -81,48 +72,16 @@ $defs:
           Specify the alternative function to be configured for the specified
           pins.
 
-      drive-strength:
-        enum: [2, 4, 6, 8, 10, 12, 14, 16]
-        default: 2
-        description:
-          Selects the drive strength for the specified pins, in mA.
-
-      slew-rate:
-        enum: [0, 1, 2, 3]
-        default: 0
-        description: |
-          0: No adjustments
-          1: Higher Slew rate (faster edges)
-          2: Lower Slew rate (slower edges)
-          3: Reserved (No adjustments)
-
-      bias-bus-hold: true
-      bias-pull-down: true
-      bias-pull-up: true
-      bias-disable: true
-      input-enable: true
-      output-high: true
-      output-low: true
-
-    required:
-      - pins
-      - function
-
-    additionalProperties: false
-
 allOf:
-  - $ref: pinctrl.yaml#
+  - $ref: qcom,lpass-lpi-common.yaml#
 
 required:
   - compatible
   - reg
   - clocks
   - clock-names
-  - gpio-controller
-  - "#gpio-cells"
-  - gpio-ranges
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
index 1eefa9aa6a86..e7565592da86 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
@@ -32,16 +32,6 @@ properties:
       - const: core
       - const: audio
 
-  gpio-controller: true
-
-  "#gpio-cells":
-    description: Specifying the pin number and flags, as defined in
-      include/dt-bindings/gpio/gpio.h
-    const: 2
-
-  gpio-ranges:
-    maxItems: 1
-
 patternProperties:
   "-state$":
     oneOf:
@@ -57,7 +47,8 @@ $defs:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
-    $ref: /schemas/pinctrl/pincfg-node.yaml
+    $ref: qcom,lpass-lpi-common.yaml#/$defs/qcom-tlmm-state
+    unevaluatedProperties: false
 
     properties:
       pins:
@@ -81,48 +72,16 @@ $defs:
           Specify the alternative function to be configured for the specified
           pins.
 
-      drive-strength:
-        enum: [2, 4, 6, 8, 10, 12, 14, 16]
-        default: 2
-        description:
-          Selects the drive strength for the specified pins, in mA.
-
-      slew-rate:
-        enum: [0, 1, 2, 3]
-        default: 0
-        description: |
-          0: No adjustments
-          1: Higher Slew rate (faster edges)
-          2: Lower Slew rate (slower edges)
-          3: Reserved (No adjustments)
-
-      bias-bus-hold: true
-      bias-pull-down: true
-      bias-pull-up: true
-      bias-disable: true
-      input-enable: true
-      output-high: true
-      output-low: true
-
-    required:
-      - pins
-      - function
-
-    additionalProperties: false
-
 allOf:
-  - $ref: pinctrl.yaml#
+  - $ref: qcom,lpass-lpi-common.yaml#
 
 required:
   - compatible
   - reg
   - clocks
   - clock-names
-  - gpio-controller
-  - "#gpio-cells"
-  - gpio-ranges
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8550-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8550-lpass-lpi-pinctrl.yaml
index ad5e32130fd7..bf4a72facae1 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8550-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8550-lpass-lpi-pinctrl.yaml
@@ -37,16 +37,6 @@ properties:
       - const: core
       - const: audio
 
-  gpio-controller: true
-
-  "#gpio-cells":
-    description: Specifying the pin number and flags, as defined in
-      include/dt-bindings/gpio/gpio.h
-    const: 2
-
-  gpio-ranges:
-    maxItems: 1
-
 patternProperties:
   "-state$":
     oneOf:
@@ -62,7 +52,8 @@ $defs:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
-    $ref: /schemas/pinctrl/pincfg-node.yaml
+    $ref: qcom,lpass-lpi-common.yaml#/$defs/qcom-tlmm-state
+    unevaluatedProperties: false
 
     properties:
       pins:
@@ -85,48 +76,16 @@ $defs:
           Specify the alternative function to be configured for the specified
           pins.
 
-      drive-strength:
-        enum: [2, 4, 6, 8, 10, 12, 14, 16]
-        default: 2
-        description:
-          Selects the drive strength for the specified pins, in mA.
-
-      slew-rate:
-        enum: [0, 1, 2, 3]
-        default: 0
-        description: |
-          0: No adjustments
-          1: Higher Slew rate (faster edges)
-          2: Lower Slew rate (slower edges)
-          3: Reserved (No adjustments)
-
-      bias-bus-hold: true
-      bias-pull-down: true
-      bias-pull-up: true
-      bias-disable: true
-      input-enable: true
-      output-high: true
-      output-low: true
-
-    required:
-      - pins
-      - function
-
-    additionalProperties: false
-
 allOf:
-  - $ref: pinctrl.yaml#
+  - $ref: qcom,lpass-lpi-common.yaml#
 
 required:
   - compatible
   - reg
   - clocks
   - clock-names
-  - gpio-controller
-  - "#gpio-cells"
-  - gpio-ranges
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml
index f5736ed140ee..db7214362301 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml
@@ -32,16 +32,6 @@ properties:
       - const: core
       - const: audio
 
-  gpio-controller: true
-
-  "#gpio-cells":
-    description: Specifying the pin number and flags, as defined in
-      include/dt-bindings/gpio/gpio.h
-    const: 2
-
-  gpio-ranges:
-    maxItems: 1
-
 patternProperties:
   "-state$":
     oneOf:
@@ -57,7 +47,8 @@ $defs:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
-    $ref: /schemas/pinctrl/pincfg-node.yaml
+    $ref: qcom,lpass-lpi-common.yaml#/$defs/qcom-tlmm-state
+    unevaluatedProperties: false
 
     properties:
       pins:
@@ -80,48 +71,16 @@ $defs:
           Specify the alternative function to be configured for the specified
           pins.
 
-      drive-strength:
-        enum: [2, 4, 6, 8, 10, 12, 14, 16]
-        default: 2
-        description:
-          Selects the drive strength for the specified pins, in mA.
-
-      slew-rate:
-        enum: [0, 1, 2, 3]
-        default: 0
-        description: |
-          0: No adjustments
-          1: Higher Slew rate (faster edges)
-          2: Lower Slew rate (slower edges)
-          3: Reserved (No adjustments)
-
-      bias-bus-hold: true
-      bias-pull-down: true
-      bias-pull-up: true
-      bias-disable: true
-      input-enable: true
-      output-high: true
-      output-low: true
-
-    required:
-      - pins
-      - function
-
-    additionalProperties: false
-
 allOf:
-  - $ref: pinctrl.yaml#
+  - $ref: qcom,lpass-lpi-common.yaml#
 
 required:
   - compatible
   - reg
   - clocks
   - clock-names
-  - gpio-controller
-  - "#gpio-cells"
-  - gpio-ranges
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.34.1


