Return-Path: <linux-gpio+bounces-24868-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1900B332C9
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Aug 2025 23:05:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 200CE7AA49F
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Aug 2025 21:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36342246768;
	Sun, 24 Aug 2025 21:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EldXTk/f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F961E5B69;
	Sun, 24 Aug 2025 21:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756069526; cv=none; b=fAfwhyjcioY/C4Ma2RKnWA12kCaoC3TyWzhM/gc8n0mFUaQUPxm9Opf79jwRos9/jqc4ZDJn/bdsYVLQl/2uaK5/Wn1ZcWNENHIhzzpl70TyEsBLTLKsrNkVob1Z669Do/gXluqedKRADJimukb0HPgAPoss+vMiOGO8L8m46A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756069526; c=relaxed/simple;
	bh=FiS7jd5aADRgPn/gVSL2fBEPfJMjQCFYti3lIUvrhJM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q+NkIC5QzRvGU4KKA2gr2m5apxubqke/br8SJKhddt6nvFffkejKFU2SLpqHH5ohG+QrgLzt/vN5sUwCahlE/fKvwLxszQItYew1MU8KJdE2q0GeqXZd9844OV5wj1yqdluI/bKdXqsIDpYHNCkfy5NrtSOh8LmgNs/OLlIMzZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EldXTk/f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7548EC4CEF4;
	Sun, 24 Aug 2025 21:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756069525;
	bh=FiS7jd5aADRgPn/gVSL2fBEPfJMjQCFYti3lIUvrhJM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EldXTk/fDzDz1wqaHJb0whUK+fZGqhERZUWeKBLIokflWo4NH4K4DhZ4u1xzAUW8G
	 KbshUZpF5O0ZMJl+RH4XMBHa2kJvz6Ik/hHWqmViDe/wLlzZUb1gcn7q6aF+WaY4cc
	 P7+SfVwtNS0pafSvkEBwFlk7ciydpVyM9ISZA+Eg8R+5UlvU4cqe0zdtcS+wGr0moF
	 y19hlglY3WpRDSCMIhDtRTAPyOnElwzpdXCoiHFbfgnq7O/UFpyo30Ie7YqxVPUrTQ
	 5PI85XiFIcl8MBf4gFMzKpelid1MwacCHJ6+7uXtOIKPMVqkbyfOKuoLcHcphslOGL
	 rp0etmRYpWkkA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D2ADCA0FE9;
	Sun, 24 Aug 2025 21:05:25 +0000 (UTC)
From: Nickolay Goppen via B4 Relay <devnull+setotau.yandex.ru@kernel.org>
Date: Mon, 25 Aug 2025 00:05:25 +0300
Subject: [PATCH v2 2/3] dt-bindings: pinctrl: qcom: Add SDM660 LPI pinctrl
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-sdm660-lpass-lpi-v2-2-af7739f5c27e@yandex.ru>
References: <20250825-sdm660-lpass-lpi-v2-0-af7739f5c27e@yandex.ru>
In-Reply-To: <20250825-sdm660-lpass-lpi-v2-0-af7739f5c27e@yandex.ru>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Nickolay Goppen <setotau@yandex.ru>, 
 Richard Acayan <mailingradian@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756069524; l=2866;
 i=setotau@yandex.ru; s=20250815; h=from:subject:message-id;
 bh=lw+wkCHuwJi81P9r9kd3s9iM9l26tF2/jGo2tCXg0SE=;
 b=ZfvvmARBUQkNVC88dLfkqMEB4S4QPLc+2C0EOrJIiEamMm1aPkCwlRJOIZoXYLdM0xtp8lNg1
 bdMb1AqoI4LDF+Hz7pVrMNYYn+oPM764HsyYvLpaib7eQk5IfyjORMI
X-Developer-Key: i=setotau@yandex.ru; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=
X-Endpoint-Received: by B4 Relay for setotau@yandex.ru/20250815 with
 auth_id=492
X-Original-From: Nickolay Goppen <setotau@yandex.ru>
Reply-To: setotau@yandex.ru

From: Nickolay Goppen <setotau@yandex.ru>

Add bindings for pin controller in SDM660 Low Power Audio SubSystem
(LPASS).

Co-developed-by: Richard Acayan <mailingradian@gmail.com>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Signed-off-by: Nickolay Goppen <setotau@yandex.ru>
---
 .../pinctrl/qcom,sdm660-lpass-lpi-pinctrl.yaml     | 74 ++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdm660-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sdm660-lpass-lpi-pinctrl.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..6b930a5b914bc79a00dbaead41189efc525c2eb2
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdm660-lpass-lpi-pinctrl.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,sdm660-lpass-lpi-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SDM660 SoC LPASS LPI TLMM
+
+maintainers:
+  - Nickolay Goppen <setotau@yandex.ru>
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
+          pattern: "^gpio([0-9]|1[0-9]|2[0-6])$"
+
+      function:
+        enum: [ gpio, comp_rx, dmic12, dmic34, mclk0, pdm_2_gpios,
+                pdm_clk, pdm_rx, pdm_sync ]
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
+    };

-- 
2.51.0



