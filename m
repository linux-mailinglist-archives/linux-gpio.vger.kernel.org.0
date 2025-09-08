Return-Path: <linux-gpio+bounces-25739-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D311B48D86
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 14:31:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01CFC3BA0BD
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 12:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F343836124;
	Mon,  8 Sep 2025 12:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="DGwJ/7K4";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="zDYifopc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7C24690;
	Mon,  8 Sep 2025 12:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757334670; cv=none; b=ArRNwyOf4JkBvWl0zVror6SgQOdKglGjh52STrHVAOjOycPqgz4NL5+/yxW3EBEGl8ztL+oxap2Neb+/csmp32SVMymNfgw57JUbkL1XRE7i9/S2kmnchEhU+dpKkUivKb0S7o3sxIM/Fquv8YngFawgNIQd0oaXJk+3VxPqrk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757334670; c=relaxed/simple;
	bh=57/P8ShbhZdUoOg25SawWym1ZMQyoZwUhVUQOx+r3ZA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=knZKkUkuIAzS9q1X+UskH9ITVHECftRPXCKzpfgUmj1NMSOu0byiRjdsWVFJkhFzkFXzXlEC5jq1werVMB8HDD4sFin/BfB1ZLpNNQSzj6sEmxYP5gBz0p5eKMw0j4XRDB2+iMnfmZRbK5+j301ZxW4MVTGeeQmmyT165w++EWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=DGwJ/7K4; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=zDYifopc; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1757334530; bh=FPRJHLtNFSGBAyCNGWStIrU
	1Sflbbmqljzr2VqOO1tc=; b=DGwJ/7K4i2Lq8u7Hf1NqwGkkn7cgtQysKYmG8aegtnEvjHlz/4
	guQVqH7dz2nj0zdB0567gsHc5uaPfRioj9MmiFazR9zOWSyHFja4d74mIUmisdUbI6mFrm+9i1j
	euzVyGAhq0JX+kLjjW/BugFi/D56Q69O65z+O8GBhMznLaPrAgH5NEN9NQAf7jzAvxGYDz/y53r
	p9LlhbkCECkrma5hXsAU9sEr2eSbmq8nN32Cj4f8uu5JQVVcj30flK3mt2mBditCm08GRbfvuMQ
	o7WWnDByhzxIMkn9TfHotdZ4dvpsKcmch4MWZTetMR4K+65N6KajQGkR5lp6TpWe8vg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1757334530; bh=FPRJHLtNFSGBAyCNGWStIrU
	1Sflbbmqljzr2VqOO1tc=; b=zDYifopctpUmM/k5BDkHpOEPIRZuKYizQTR7MKMI3AZe9/+l32
	mqAo3wKXE/Mph83Cad8Yv2y0YLKmGNFNFMCw==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Mon, 08 Sep 2025 15:28:45 +0300
Subject: [PATCH v6 2/3] dt-bindings: pinctrl: qcom: Add SDM660 LPI pinctrl
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-sdm660-lpass-lpi-v6-2-e0a2e2ffff3a@mainlining.org>
References: <20250908-sdm660-lpass-lpi-v6-0-e0a2e2ffff3a@mainlining.org>
In-Reply-To: <20250908-sdm660-lpass-lpi-v6-0-e0a2e2ffff3a@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nickolay Goppen <setotau@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Richard Acayan <mailingradian@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757334525; l=3970;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=57/P8ShbhZdUoOg25SawWym1ZMQyoZwUhVUQOx+r3ZA=;
 b=3iciytCAXBIwXWYLkYSnOfjclsuVZJM1PQXcy8Q4PXDFo1myRjMfeF8etiW4Th5XQGoxZCcW3
 YCb/DDnUKUYC1ZAzzQmSWVxeoG8oJvMnznAw4Hxuo3RRV2Zi2QLhHZx
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=

Add bindings for pin controller in SDM660 Low Power Audio SubSystem
(LPASS).

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Co-developed-by: Richard Acayan <mailingradian@gmail.com>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
 .../pinctrl/qcom,sdm660-lpass-lpi-pinctrl.yaml     | 109 +++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdm660-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sdm660-lpass-lpi-pinctrl.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..409e5a4d4da9c6f81704fbf447b786fe8d0fbe07
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdm660-lpass-lpi-pinctrl.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,sdm660-lpass-lpi-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SDM660 SoC LPASS LPI TLMM
+
+maintainers:
+  - Nickolay Goppen <setotau@mainlining.org>
+
+description:
+  Top Level Mode Multiplexer pin controller in the Low Power Audio SubSystem
+  (LPASS) Low Power Island (LPI) of Qualcomm SDM660 SoC.
+
+properties:
+  compatible:
+    const: qcom,sdm660-lpass-lpi-pinctrl
+
+  reg:
+    items:
+      - description: LPASS LPI TLMM Control and Status registers
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-sdm660-lpass-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-sdm660-lpass-state"
+        additionalProperties: false
+
+$defs:
+  qcom-sdm660-lpass-state:
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    $ref: qcom,lpass-lpi-common.yaml#/$defs/qcom-tlmm-state
+    unevaluatedProperties: false
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this
+          subnode.
+        items:
+          pattern: "^gpio([0-9]|[1-2][0-9]|3[0-1])$"
+
+      function:
+        enum: [ gpio, comp_rx, dmic1_clk, dmic1_data, dmic2_clk, dmic2_data,
+                mclk0, pdm_tx, pdm_clk, pdm_rx, pdm_sync ]
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+
+allOf:
+  - $ref: qcom,lpass-lpi-common.yaml#
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    lpi_tlmm: pinctrl@15070000 {
+        compatible = "qcom,sdm660-lpass-lpi-pinctrl";
+        reg = <0x15070000 0x20000>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&lpi_tlmm 0 0 32>;
+
+        cdc_pdm_default: cdc-pdm-default-state {
+            clk-pins {
+                pins = "gpio18";
+                function = "pdm_clk";
+                drive-strength = <8>;
+                output-high;
+            };
+
+            sync-pins{
+                pins = "gpio19";
+                function = "pdm_sync";
+                drive-strength = <4>;
+                output-high;
+            };
+
+            tx-pins {
+                pins = "gpio20";
+                function = "pdm_tx";
+                drive-strength = <8>;
+            };
+
+            rx-pins {
+                pins = "gpio21", "gpio23", "gpio25";
+                function = "pdm_rx";
+                drive-strength = <4>;
+                output-high;
+            };
+        };
+
+        cdc_comp_default: cdc-comp-default-state {
+            pins = "gpio22", "gpio24";
+            function = "comp_rx";
+            drive-strength = <8>;
+        };
+    };

-- 
2.51.0


