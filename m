Return-Path: <linux-gpio+bounces-25156-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A030B3AAD2
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 21:24:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2830717070A
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 19:24:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63790279DBC;
	Thu, 28 Aug 2025 19:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AxdBJmzN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1530E26FA52;
	Thu, 28 Aug 2025 19:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756409020; cv=none; b=BbzmwW5rmNEUar9b4brUc4uRTgKQDwc/bpkERCDM0GKrp2ynqUymyprd3VGk7nUHH2P6brvLctwShBvisM9emb/pkLSzSoZ/p4OryPgbNUTwrkNeLg6cqRblVAogHodL74Bq8qF7Imen8k72BeFRdob6IGNiJU6BeoajVL8heTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756409020; c=relaxed/simple;
	bh=TkeevkUY7n1ABClQZqrRpxxstVY+PwS2cs6BB3MI2ik=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MHpK5FLT0xuNPinKNulSv5aATtSL2kZokvGHfJ3dUKjEflsXYbCYrOzeuocvCowKWthE256BjSj7Z9Pbu0eLJgr9LlBT5gkA4HgtVYmkfSNNxuzDjuqjEBVGbnPmOpWzm3X0nlkrWoCEML3TluAnFc7JpvOJJCx9ohHL2KRYVAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AxdBJmzN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AE722C4CEF5;
	Thu, 28 Aug 2025 19:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756409019;
	bh=TkeevkUY7n1ABClQZqrRpxxstVY+PwS2cs6BB3MI2ik=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AxdBJmzNuINyvD4nUUo4jTWsb7DfKwqZxp3Abbc54XDRbrrBG+9JkTpBPn/O1i2b9
	 LijnrYlPSHabxR4pzzdaXl2yivwm1ny1INkZA5s7SIXEzVd8Ppxh3+XnAyN+TVpUVT
	 D61zREVJEzeS3mycfw+u+8JI7Aq/UtQbExTD5xiKkliVIWZOwVKXwKP857TT7JFy+H
	 rA1aJVVFL9wLs3UrSfasSQ27xllL8svphX1CAiHM06J+R9+bgW7gqwQ6y3kZzYlm+D
	 C2MvxP01Izqd0BU+yiWOM6UXmPjxc7qaF/me2PmvRuClsHEH0xs0CZZZs61rsBuAaV
	 z873EdXW4lkcA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A81FCCA0FF9;
	Thu, 28 Aug 2025 19:23:39 +0000 (UTC)
From: Nickolay Goppen via B4 Relay <devnull+setotau.yandex.ru@kernel.org>
Date: Thu, 28 Aug 2025 22:23:38 +0300
Subject: [PATCH v4 2/3] dt-bindings: pinctrl: qcom: Add SDM660 LPI pinctrl
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-sdm660-lpass-lpi-v4-2-af4afdd52965@yandex.ru>
References: <20250828-sdm660-lpass-lpi-v4-0-af4afdd52965@yandex.ru>
In-Reply-To: <20250828-sdm660-lpass-lpi-v4-0-af4afdd52965@yandex.ru>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Nickolay Goppen <setotau@yandex.ru>, 
 Richard Acayan <mailingradian@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756409018; l=2869;
 i=setotau@yandex.ru; s=20250815; h=from:subject:message-id;
 bh=vFIjBIiT0xa6pAPf/4umxL0RLwDzLrxG2P7MmgFf9vQ=;
 b=pE6hgqz5HjgMc3QqoNAmcGwhLiDp7PQAoCD+EMIpH11DtRc5z/b6b6CLnxPqPH3YSkMLnWg1+
 270w+qjFHq+ATrxr7prPGPKk2+37Wx4VVFwv+ozNPndUqBMnux4/mhp
X-Developer-Key: i=setotau@yandex.ru; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=
X-Endpoint-Received: by B4 Relay for setotau@yandex.ru/20250815 with
 auth_id=492
X-Original-From: Nickolay Goppen <setotau@yandex.ru>
Reply-To: setotau@yandex.ru

From: Nickolay Goppen <setotau@yandex.ru>

Add bindings for pin controller in SDM660 Low Power Audio SubSystem
LPASS).

Co-developed-by: Richard Acayan <mailingradian@gmail.com>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Signed-off-by: Nickolay Goppen <setotau@yandex.ru>
---
 .../pinctrl/qcom,sdm660-lpass-lpi-pinctrl.yaml     | 74 ++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdm660-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sdm660-lpass-lpi-pinctrl.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..f71dbea9f75b398c9c5dd585635c469e1f426b6f
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
+          pattern: "^gpio([0-9]|[1-2][0-9]|3[0-1])$"
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



