Return-Path: <linux-gpio+bounces-8137-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A0F92BFB7
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 18:24:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5EA91F22FA1
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 16:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5345B1A2577;
	Tue,  9 Jul 2024 16:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K8H9VEz1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEB91A0B0D
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jul 2024 16:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720542042; cv=none; b=u5Tbuo6AEQ9gBKg41AEkxt1LDsj04z09u2nnBS7AQnjie4IGDifTmuOSGV7iTyHH7xMAOHfn94kWx+4FCB0QCDXEifGMQ6410jIk1L7N7en9W2hkEGkI+81lMSdcH7LqByF6QwgbNN0T96mc/Gwt6fE7t+sej4tMzlBzz1Vsejo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720542042; c=relaxed/simple;
	bh=8NOqBbsSvFK4yjK2xkto5fV0gXtGYQKFlvHQg5hw0Mk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nwDgrc50jGXkFX5vHhsEiWuLHw/v23PjrizNagezEf9Fq5e+dvR0xVKVkXklEb63jQiGcMEgpOmcNqY0GzPsGyf76Mrgxk8t34WrkeLk3wQ3bQhvT65vZxIGuogqG8gpbEh1WrbpMzTSkP9Pfk1ABTaqX29cc8sGsSnRSXT3Wzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K8H9VEz1; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4257d5fc9b7so45222075e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 09 Jul 2024 09:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720542038; x=1721146838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6OcFxIacVPCI9fltIqvuSe/0ZyBydbNragsMq+b3rJs=;
        b=K8H9VEz1b3/h4G5CInOt6zPJk/kZVnfHAbzzA/0uc+bgd/IzLRYddvamulTVze2NCV
         44pwjioDtq6TSP1+rpMbsOZIqJK+pr9MpoR6VuxBqRCCicHQKBWuKvQabZDF9EwOgy0P
         tpDQ6e9Bvz+wrVI5f/pdMj58jmyn6eZijG7oJOWgJvyQvCRo7Mq2hFnfb2AUCASB431m
         paiMJdWCvfGvLCdXH4Gq/gn4BYKdY5K6WHguApYwrUtNoH2DtdFXNJCBx7nyyHK4YdOj
         kXGodousaAyiqSga77k7F32bTsgpvSA9Ew61NL2K3moZ1dvaz7sr0P4aCFG2BT9lz9QM
         t+Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720542038; x=1721146838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6OcFxIacVPCI9fltIqvuSe/0ZyBydbNragsMq+b3rJs=;
        b=AtYg8uNFxtq8z06yUabeVYqQzv6zInCZ4fBFv9M+8gD6I+M2XfwAwkCkVV+iba7214
         BzatP7KXHdZor4fSDECysdZ8TVxYZ80B5HkSbnq+kxxRVVgYc8hz6AyPIecR2lKfukec
         jT0rrBDJ6y71XDV56WlMI5t+3JTWm8FonUj/EU1noCZ7LU2GswEBnVKZRkTRwv+uJEJt
         8oKnoXdeJqTJOApqnXLxdNo/XvZv8A0r1fVw72MrsUnh/cMEL9xVhVZoobYyhRgCvy1d
         gwHP+xQSFpFJKdorzQEb/QV4Vly4kBi5LTg03rAKBs5/dORCRcHRS5t1+VDPuQB9IdW/
         Yd1w==
X-Forwarded-Encrypted: i=1; AJvYcCXQBDSKsCxleztNUZDj2fhAON2pp/+nUJwdB7mbF8KsDlFp7H03blVGOkXH/cTwqRSkAzsgMu/zM9lXKKPzUGizOdBDqjdjjam9ZA==
X-Gm-Message-State: AOJu0YyMSKLejRQmZclBL+T4uA+TgnIVuPFK+HaQs5u0ughwK5bkJCme
	S++79RFGyeTbo+R2f9f+oHtpm/sk+sQdXL/qoVWz8coRoSmIf+O4IQbi+uW8PY8=
X-Google-Smtp-Source: AGHT+IH9V/uONRD7mQD8SzcFcM47lU1aVaraBEMS3XW7Z4JsftrMZbO+szMbIdNTZXQmBucQ7UBjhg==
X-Received: by 2002:adf:e54b:0:b0:367:9754:8107 with SMTP id ffacd0b85a97d-367ceadc90bmr2886800f8f.62.1720542038248;
        Tue, 09 Jul 2024 09:20:38 -0700 (PDT)
Received: from rayyan-pc.broadband ([2a0a:ef40:ee7:2401:197d:e048:a80f:bc44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde7e07fsm2966955f8f.17.2024.07.09.09.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 09:20:37 -0700 (PDT)
From: Rayyan Ansari <rayyan.ansari@linaro.org>
To: devicetree@vger.kernel.org
Cc: Rayyan Ansari <rayyan.ansari@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH 1/4] dt-bindings: pinctrl: qcom,apq8064-pinctrl: convert to dtschema
Date: Tue,  9 Jul 2024 17:17:53 +0100
Message-ID: <20240709162009.5166-2-rayyan.ansari@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240709162009.5166-1-rayyan.ansari@linaro.org>
References: <20240709162009.5166-1-rayyan.ansari@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Qualcomm APQ8064 TLMM block bindings from text to yaml dt
schema format.

Signed-off-by: Rayyan Ansari <rayyan.ansari@linaro.org>
---
 .../bindings/pinctrl/qcom,apq8064-pinctrl.txt |  95 ---------------
 .../pinctrl/qcom,apq8064-pinctrl.yaml         | 110 ++++++++++++++++++
 2 files changed, 110 insertions(+), 95 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,apq8064-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,apq8064-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,apq8064-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,apq8064-pinctrl.txt
deleted file mode 100644
index 4e90ddd77784..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/qcom,apq8064-pinctrl.txt
+++ /dev/null
@@ -1,95 +0,0 @@
-Qualcomm APQ8064 TLMM block
-
-Required properties:
-- compatible: "qcom,apq8064-pinctrl"
-- reg: Should be the base address and length of the TLMM block.
-- interrupts: Should be the parent IRQ of the TLMM block.
-- interrupt-controller: Marks the device node as an interrupt controller.
-- #interrupt-cells: Should be two.
-- gpio-controller: Marks the device node as a GPIO controller.
-- #gpio-cells : Should be two.
-                The first cell is the gpio pin number and the
-                second cell is used for optional parameters.
-- gpio-ranges: see ../gpio/gpio.txt
-
-Optional properties:
-
-- gpio-reserved-ranges: see ../gpio/gpio.txt
-
-Please refer to ../gpio/gpio.txt and ../interrupt-controller/interrupts.txt for
-a general description of GPIO and interrupt bindings.
-
-Please refer to pinctrl-bindings.txt in this directory for details of the
-common pinctrl bindings used by client devices, including the meaning of the
-phrase "pin configuration node".
-
-Qualcomm's pin configuration nodes act as a container for an arbitrary number of
-subnodes. Each of these subnodes represents some desired configuration for a
-pin, a group, or a list of pins or groups. This configuration can include the
-mux function to select on those pin(s)/group(s), and various pin configuration
-parameters, such as pull-up, drive strength, etc.
-
-The name of each subnode is not important; all subnodes should be enumerated
-and processed purely based on their content.
-
-Each subnode only affects those parameters that are explicitly listed. In
-other words, a subnode that lists a mux function but no pin configuration
-parameters implies no information about any pin configuration parameters.
-Similarly, a pin subnode that describes a pullup parameter implies no
-information about e.g. the mux function.
-
-
-The following generic properties as defined in pinctrl-bindings.txt are valid
-to specify in a pin configuration subnode:
-
- pins, function, bias-disable, bias-pull-down, bias-pull-up, drive-strength,
- output-low, output-high.
-
-Non-empty subnodes must specify the 'pins' property.
-
-Valid values for pins are:
-  gpio0-gpio89
-
-Valid values for function are:
-  cam_mclk, codec_mic_i2s, codec_spkr_i2s, gp_clk_0a, gp_clk_0b, gp_clk_1a,
-  gp_clk_1b, gp_clk_2a, gp_clk_2b, gpio, gsbi1, gsbi2, gsbi3, gsbi4,
-  gsbi4_cam_i2c, gsbi5, gsbi5_spi_cs1, gsbi5_spi_cs2, gsbi5_spi_cs3, gsbi6,
-  gsbi6_spi_cs1, gsbi6_spi_cs2, gsbi6_spi_cs3, gsbi7, gsbi7_spi_cs1,
-  gsbi7_spi_cs2, gsbi7_spi_cs3, gsbi_cam_i2c, hdmi, mi2s, riva_bt, riva_fm,
-  riva_wlan, sdc2, sdc4, slimbus, spkr_i2s, tsif1, tsif2, usb2_hsic, ps_hold
-
-Example:
-
-	msmgpio: pinctrl@800000 {
-		compatible = "qcom,apq8064-pinctrl";
-		reg = <0x800000 0x4000>;
-
-		gpio-controller;
-		#gpio-cells = <2>;
-		interrupt-controller;
-		#interrupt-cells = <2>;
-		interrupts = <0 16 0x4>;
-
-		pinctrl-names = "default";
-		pinctrl-0 = <&gsbi5_uart_default>;
-		gpio-ranges = <&msmgpio 0 0 90>;
-
-		gsbi5_uart_default: gsbi5_uart_default {
-			mux {
-				pins = "gpio51", "gpio52";
-				function = "gsbi5";
-			};
-
-			tx {
-				pins = "gpio51";
-				drive-strength = <4>;
-				bias-disable;
-			};
-
-			rx {
-				pins = "gpio52";
-				drive-strength = <2>;
-				bias-pull-up;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,apq8064-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,apq8064-pinctrl.yaml
new file mode 100644
index 000000000000..f251dcd4bb7f
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,apq8064-pinctrl.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,apq8064-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. APQ8064 TLMM block
+
+maintainers:
+  - Bjorn Andersson <bjorn.andersson@linaro.org>
+
+description: |
+  Top Level Mode Multiplexer pin controller in Qualcomm APQ8064 SoC.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,apq8064-pinctrl
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-reserved-ranges: true
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-apq8064-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-apq8064-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-apq8064-tlmm-state:
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
+    unevaluatedProperties: false
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this
+          subnode.
+        items:
+          oneOf:
+            - pattern: "^gpio([0-9]|[1-8][0-9])$"
+            - enum: [ sdc1_clk, sdc1_cmd, sdc1_data, sdc3_clk, sdc3_cmd, sdc3_data ]
+        minItems: 1
+        maxItems: 36
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+        enum: [ cam_mclk, codec_mic_i2s, codec_spkr_i2s, gp_clk_0a,
+                gp_clk_0b, gp_clk_1a, gp_clk_1b, gp_clk_2a, gp_clk_2b,
+                gpio, gsbi1, gsbi2, gsbi3, gsbi4, gsbi4_cam_i2c,
+                gsbi5, gsbi5_spi_cs1, gsbi5_spi_cs2, gsbi5_spi_cs3,
+                gsbi6, gsbi6_spi_cs1, gsbi6_spi_cs2, gsbi6_spi_cs3,
+                gsbi7, gsbi7_spi_cs1, gsbi7_spi_cs2, gsbi7_spi_cs3,
+                gsbi_cam_i2c, hdmi, mi2s, riva_bt, riva_fm, riva_wlan,
+                sdc2, sdc4, slimbus, spkr_i2s, tsif1, tsif2, usb2_hsic,
+                ps_hold ]
+
+    required:
+      - pins
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    tlmm: pinctrl@800000 {
+        compatible = "qcom,apq8064-pinctrl";
+        reg = <0x800000 0x4000>;
+
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 90>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+
+        uart-state {
+            rx-pins {
+                pins = "gpio52";
+                function = "gsbi5";
+                bias-pull-up;
+            };
+
+            tx-pins {
+                pins = "gpio51";
+                function = "gsbi5";
+                bias-disable;
+            };
+        };
+    };
-- 
2.45.2


