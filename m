Return-Path: <linux-gpio+bounces-25515-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 78036B4221A
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 15:40:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE4017ABF59
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 13:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A20F30ACEB;
	Wed,  3 Sep 2025 13:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="B+vVnsqh";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="8LInIgP8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E303043CD;
	Wed,  3 Sep 2025 13:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756906816; cv=none; b=piODtro+9gAslhqmbiQRXRCgo+brvYhXy7BhO3UzLkDK/UdQ3Vs+4RSml8U9yYUMtce1fE9BOaYsTWQStFXF6LIzXVp98GG823bQXYVo4uEWKlfpZ4LVJznC6nFYdlF9jVvkaNp4Ad1jb4Gi5gY0TWyb+ntlJCZ5ZPEejfRTFYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756906816; c=relaxed/simple;
	bh=KV7tmARm4/cI7vXGQWTukwZTzHGzjJHbm0LN5Ln/WRs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tFojbIS/iaS9iIzNyDMZqxBfWeb0CMLGrqyBMQBxQrFUD612BZajgPxkJJdWaR7v7EE8Qr8DDVjvuF3FXwo9NW39Cf+u3miePi+83o0yGqtLqsGHCKC3ijGCYGhjN235mizbPbVVRbvEekTGkXG/brFmwhbIgaBq/rE1RWDh9Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=B+vVnsqh; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=8LInIgP8; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1756906766; bh=qv///I3xRhHJMmOj6p8cAFA
	ZOwq9286x2LbIgYLX0TA=; b=B+vVnsqhSbkPaHnBx6UZqypBetg/nobal/jQdAGglm4OFZq9M/
	EI0MTbT0RomSLrVef/crOTZWMqTZ/Dkh7qDMoV/f4f5yjbOatVIoRS4QirZNIUTBR32Tn1c3wP7
	Sqsku8AG+WeDbZEC41JHPrm2iKof9UOjeAiNQPw/OQj50jYVqtlpmhhufiaP2UJgnpWMvcLIlgU
	9HrUPxfu7qubTKAAPMeD/Z2/bo0WU+6Y2VfOP1JXLCIiyaK/wXFdTgvqjVAzZ3TB8hKwpab47kr
	eyUGqO/DIvQsSNa7q+wSiKou4LXRLRWR5h25yyQhPpakyiAWpqk9m/1xaRMXz4a3iOg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1756906766; bh=qv///I3xRhHJMmOj6p8cAFA
	ZOwq9286x2LbIgYLX0TA=; b=8LInIgP8sCdsG/8JrAXq6YEutFGp2cFeoiCCu2oNuldPgOt6Zo
	8sdPrmj4h5LgdVZGO2rlcbWI34qg9OhJ8TCw==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Wed, 03 Sep 2025 16:39:02 +0300
Subject: [PATCH v5 2/3] dt-bindings: pinctrl: qcom: Add SDM660 LPI pinctrl
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-sdm660-lpass-lpi-v5-2-fe171098b6a1@mainlining.org>
References: <20250903-sdm660-lpass-lpi-v5-0-fe171098b6a1@mainlining.org>
In-Reply-To: <20250903-sdm660-lpass-lpi-v5-0-fe171098b6a1@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nickolay Goppen <setotau@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org, 
 Nickolay Goppen <setotau@yandex.ru>, 
 Richard Acayan <mailingradian@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756906764; l=4007;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=KV7tmARm4/cI7vXGQWTukwZTzHGzjJHbm0LN5Ln/WRs=;
 b=N+UbBs354eZlD6wVQ7u5jhywMRihHNUzDBPpu1Sywl8DLlJeVHmLLcPSDeCthnELFNs9eFwY9
 hbIFvCrZvBfB5YsWdMGDBPu8xwO5SquooNAsVX17Tiyk4v68XETucJz
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=

Add bindings for pin controller in SDM660 Low Power Audio SubSystem
(LPASS).

Co-developed-by: Richard Acayan <mailingradian@gmail.com>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
 .../pinctrl/qcom,sdm660-lpass-lpi-pinctrl.yaml     | 109 +++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdm660-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sdm660-lpass-lpi-pinctrl.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..175d5dbf54fa3669805cb69d5b4df19ab57c1520
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
+                clk-pins {
+                    pins = "gpio18";
+                    function = "pdm_clk";
+                    drive-strength = <8>;
+                    output-high;
+                };
+
+                sync-pins{
+                    pins = "gpio19";
+                    function = "pdm_sync";
+                    drive-strength = <4>;
+                    output-high;
+                };
+
+                tx-pins {
+                    pins = "gpio20";
+                    function = "pdm_tx";
+                    drive-strength = <8>;
+                };
+
+                rx-pins {
+                    pins = "gpio21", "gpio23", "gpio25";
+                    function = "pdm_rx";
+                    drive-strength = <4>;
+                    output-high;
+                };
+        };
+
+        cdc_comp_default: cdc-comp-default-state {
+                pins = "gpio22", "gpio24";
+                function = "comp_rx";
+                drive-strength = <8>;
+        };
+    };

-- 
2.51.0


