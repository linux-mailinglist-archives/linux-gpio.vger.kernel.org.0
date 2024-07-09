Return-Path: <linux-gpio+bounces-8138-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F69092BFC7
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 18:25:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A1F81F21EFE
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 16:25:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9E9F1A3BB4;
	Tue,  9 Jul 2024 16:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fWjla2uf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9201A2FCA
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jul 2024 16:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720542048; cv=none; b=ux6/bSzUrH8C8dVC3B3VyLghFyG6QkrrcZ3QzloxndrB9BWv6CzyoRGIFw/iPbSB0nYi8Z/MiXGmDTqcWbzsFltaRsn7n9RbT6JL3nb7rA3RVjntOyKhZzr5lvohEyCZeS3DUbwmbk6p+qgq/rlNpOTNUwRaAxJRWVJ/SZOIlIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720542048; c=relaxed/simple;
	bh=I+e/Ru/F7i8s3g90eMaGWGwVgP3LUnUVxX5/u8fkRVE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y4JrNov3aQdxGt72r7i7f1dFbeI0cFvJpt1s49INyL3oUrPbIXFHGdNYNwUrzGz8hH91snN2StjMLJUMicMWEZNVly/L2z94Q6DEW+DK3lSyAkW+t4VBqMKr6QnRpj6PeRHmxe/Q5Qt0X1OwT8b0XJtlICdsC6hqNNBg/ASm47U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fWjla2uf; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2eeb2d60efbso17889511fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 09 Jul 2024 09:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720542045; x=1721146845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N0znxVwwjji/DUtWTLARmbZTFvr2yZL9kSRXuxBRwMw=;
        b=fWjla2ufZu3a5Gm6xIE89vs0qzrwL2iAGtlnsYfc2JGZRg739GK7YWdVpwFi6NWinz
         5X/GRwkEalkzqw26LaFNTp2BWfnJcR6BRJSMG7g7H5USMIjTdY0hpoU0/Q1+0ifv237/
         LZYHDCvB0J/iqZMHSXnTNDCARBrqzv1qa4Bk8nRSnoqI3/qzuKKaiHKTgCYj1wurXKbf
         xnrP8AOZdkKTckwZmnde8yIDxw/DdLyvYZEoko994o+2hXgpxEQFQDxEehk0xLNaWMP6
         zAP/7A62QwuBcpbMhvvAXKti3CpKBjBzKdk9kUDZXZTdHaQAh9wbH6AU9H+QaMaLp5ng
         qj/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720542045; x=1721146845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N0znxVwwjji/DUtWTLARmbZTFvr2yZL9kSRXuxBRwMw=;
        b=Sz08/sQP3nmO3aOT4PVPebZogrDJYARo603TpC4afF5G9Nwm7QrimkoWTfA/oZRZmi
         LaOiy6Z4hnlr8S8fFAUaWSO7zAJ+hRy8pB9/pHuFxUoe0QuZAk78l/sNHqrFfNJQVswX
         D0EZKxumE/70QGRCOf2RyCVTLftRpnN6GNasec7PWpjnDRmvKFBNn5eMEhiCvZ3/rdln
         jE8h4Iw29bsM7oXh3nTfcd9USTYEzullnzJdVniOU1c25+HjQKCeaQGpdyGkaL1M2ZuF
         8shoPXoUgMDzEUh7lswo2wX1Gmn/NE5hZI68sCJzIVuoCRlzQu/bBpnAMWNN2xaNXZuc
         OAQw==
X-Forwarded-Encrypted: i=1; AJvYcCU0ys8c1kjLmBfKdUY8ZAbH2zp39ZGYa/bfb6581H8LhFb4UZHta7dyWk0P7YWR7mD8rfKJoSGiXVnurJ9hZhU+3pv9bZl5Q2hcyA==
X-Gm-Message-State: AOJu0YxujXLw+PtBBvOGRE5UZoe5PslkOZSUAF8PxtCse5cicJJBjJDU
	L3ZBFOV2vStcaKjMLHaApTD4aziU72ANDHsKbK41l+yx6ScQWq180q5/FCBNQmo=
X-Google-Smtp-Source: AGHT+IGEHZyHATXkbM3yaENJpeHbND/G7r/St/XcvgZYZHmV6fJy0I7tDkNlNpGUDeCi6fZCEeDukA==
X-Received: by 2002:a05:6512:78c:b0:52c:c5c4:43d4 with SMTP id 2adb3069b0e04-52eb99caf68mr1644174e87.53.1720542044950;
        Tue, 09 Jul 2024 09:20:44 -0700 (PDT)
Received: from rayyan-pc.broadband ([2a0a:ef40:ee7:2401:197d:e048:a80f:bc44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde7e07fsm2966955f8f.17.2024.07.09.09.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 09:20:44 -0700 (PDT)
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
Subject: [PATCH 2/4] dt-bindings: pinctrl: qcom,ipq8064-pinctrl: convert to dtschema
Date: Tue,  9 Jul 2024 17:17:54 +0100
Message-ID: <20240709162009.5166-3-rayyan.ansari@linaro.org>
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

Convert the Qualcomm IPQ8064 TLMM block bindings from text to yaml dt
schema format.

Signed-off-by: Rayyan Ansari <rayyan.ansari@linaro.org>
---
 .../bindings/pinctrl/qcom,ipq8064-pinctrl.txt | 101 ----------------
 .../pinctrl/qcom,ipq8064-pinctrl.yaml         | 108 ++++++++++++++++++
 2 files changed, 108 insertions(+), 101 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,ipq8064-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,ipq8064-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq8064-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/qcom,ipq8064-pinctrl.txt
deleted file mode 100644
index a7aaaa7db83b..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/qcom,ipq8064-pinctrl.txt
+++ /dev/null
@@ -1,101 +0,0 @@
-Qualcomm IPQ8064 TLMM block
-
-Required properties:
-- compatible: "qcom,ipq8064-pinctrl"
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
-Valid values for qcom,pins are:
-  gpio0-gpio68
-   Supports mux, bias, and drive-strength
-
-  sdc3_clk, sdc3_cmd, sdc3_data
-   Supports bias and drive-strength
-
-
-Valid values for function are:
-  mdio, mi2s, pdm, ssbi, spmi, audio_pcm, gpio, gsbi1, gsbi2, gsbi4, gsbi5,
-  gsbi5_spi_cs1, gsbi5_spi_cs2, gsbi5_spi_cs3, gsbi6, gsbi7, nss_spi, sdc1,
-  spdif, nand, tsif1, tsif2, usb_fs_n, usb_fs, usb2_hsic, rgmii2, sata,
-  pcie1_rst, pcie1_prsnt, pcie1_pwren_n, pcie1_pwren, pcie1_pwrflt,
-  pcie1_clk_req, pcie2_rst, pcie2_prsnt, pcie2_pwren_n, pcie2_pwren,
-  pcie2_pwrflt, pcie2_clk_req, pcie3_rst, pcie3_prsnt, pcie3_pwren_n,
-  pcie3_pwren, pcie3_pwrflt, pcie3_clk_req, ps_hold
-
-Example:
-
-	pinmux: pinctrl@800000 {
-		compatible = "qcom,ipq8064-pinctrl";
-		reg = <0x800000 0x4000>;
-
-		gpio-controller;
-		#gpio-cells = <2>;
-		gpio-ranges = <&pinmux 0 0 69>;
-		interrupt-controller;
-		#interrupt-cells = <2>;
-		interrupts = <0 32 0x4>;
-
-		pinctrl-names = "default";
-		pinctrl-0 = <&gsbi5_uart_default>;
-
-		gsbi5_uart_default: gsbi5_uart_default {
-			mux {
-				pins = "gpio18", "gpio19";
-				function = "gsbi5";
-			};
-
-			tx {
-				pins = "gpio18";
-				drive-strength = <4>;
-				bias-disable;
-			};
-
-			rx {
-				pins = "gpio19";
-				drive-strength = <2>;
-				bias-pull-up;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq8064-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,ipq8064-pinctrl.yaml
new file mode 100644
index 000000000000..58f11e1bdd4f
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq8064-pinctrl.yaml
@@ -0,0 +1,108 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,ipq8064-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. IPQ8064 TLMM block
+
+maintainers:
+  - Bjorn Andersson <bjorn.andersson@linaro.org>
+
+description: |
+  Top Level Mode Multiplexer pin controller in Qualcomm IPQ8064 SoC.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,ipq8064-pinctrl
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
+      - $ref: "#/$defs/qcom-ipq8064-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-ipq8064-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-ipq8064-tlmm-state:
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
+            - pattern: "^gpio([0-9]|[1-5][0-9]|6[0-8])$"
+            - enum: [ sdc3_clk, sdc3_cmd, sdc3_data ]
+        minItems: 1
+        maxItems: 36
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+        enum: [ mdio, mi2s, pdm, ssbi, spmi, audio_pcm, gpio, gsbi1, gsbi2, gsbi4, gsbi5,
+                gsbi5_spi_cs1, gsbi5_spi_cs2, gsbi5_spi_cs3, gsbi6, gsbi7, nss_spi, sdc1,
+                spdif, nand, tsif1, tsif2, usb_fs_n, usb_fs, usb2_hsic, rgmii2, sata,
+                pcie1_rst, pcie1_prsnt, pcie1_pwren_n, pcie1_pwren, pcie1_pwrflt,
+                pcie1_clk_req, pcie2_rst, pcie2_prsnt, pcie2_pwren_n, pcie2_pwren,
+                pcie2_pwrflt, pcie2_clk_req, pcie3_rst, pcie3_prsnt, pcie3_pwren_n,
+                pcie3_pwren, pcie3_pwrflt, pcie3_clk_req, ps_hold ]
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
+        compatible = "qcom,ipq8064-pinctrl";
+        reg = <0x00800000 0x4000>;
+
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 69>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+
+        uart-state {
+            rx-pins {
+                pins = "gpio19";
+                function = "gsbi5";
+                bias-pull-up;
+            };
+
+            tx-pins {
+                pins = "gpio18";
+                function = "gsbi5";
+                bias-disable;
+            };
+        };
+    };
-- 
2.45.2


