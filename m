Return-Path: <linux-gpio+bounces-24864-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCDDB332A8
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Aug 2025 22:50:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93BEF204854
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Aug 2025 20:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A6DA2367AC;
	Sun, 24 Aug 2025 20:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="pZyGAFlH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from forward204b.mail.yandex.net (forward204b.mail.yandex.net [178.154.239.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84CC1F95C;
	Sun, 24 Aug 2025 20:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756068604; cv=none; b=s61wrooIr9Lb8SYsVcIzIzDhinHWGU91UIdj5p6mMvtlPHi5tbUDbIZpc/qRGGeNTuMnoLpFjZGLf3dbta/L+aV2GOSFx2n8MCL4M8z9blylQvKkR7hFlbukiitLXfx64ZTU5BCk9fq3HyTJUJflMKEAVoXle8sZ1dGipilp2hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756068604; c=relaxed/simple;
	bh=lw+wkCHuwJi81P9r9kd3s9iM9l26tF2/jGo2tCXg0SE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WbJ1CBfLXVvUffkmw/KaCWWQljuf9pVnm09f17tX68kepkAiak5sGYEpDnE14qepBtsOy+5RkcZTpoXEnUFF2RMoMrayh/4mHHO3ls88I/R2zSr/kvcdeQCHFmtyLnX3MyZxveMzCzSpkhYj79MnayM42pHhIFGLfKZNhhRmf94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=pZyGAFlH; arc=none smtp.client-ip=178.154.239.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Received: from forward100b.mail.yandex.net (forward100b.mail.yandex.net [IPv6:2a02:6b8:c02:900:1:45:d181:d100])
	by forward204b.mail.yandex.net (Yandex) with ESMTPS id 50CB482B50;
	Sun, 24 Aug 2025 23:42:35 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-73.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-73.sas.yp-c.yandex.net [IPv6:2a02:6b8:c37:7521:0:640:a008:0])
	by forward100b.mail.yandex.net (Yandex) with ESMTPS id CD97080618;
	Sun, 24 Aug 2025 23:42:25 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-73.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id MgdcKKcLCa60-Ig04LBeh;
	Sun, 24 Aug 2025 23:42:25 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1756068145; bh=vJiDsVwE5O5ovqLkchcKAZLTA0N7DfACsKJu+Tw8KmU=;
	h=Cc:In-Reply-To:Message-Id:To:Date:References:From:Subject;
	b=pZyGAFlHlMfTbXq7+479HHUWmahlPoPx7QT1p3JLtOtSa2vNiqyGLa5vzLJtEExf2
	 2AlqWeRxAyc0LkLTGaIf10m9HKEDkryBca4K+V9PKgC1T8VQsMlpnUR8aww46FFj4W
	 zRyw3MNDLDsSqUsaDRZ1fJXOw0gREDQT2OUMz7x0=
Authentication-Results: mail-nwsmtp-smtp-production-main-73.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Nickolay Goppen <setotau@yandex.ru>
Date: Sun, 24 Aug 2025 23:42:24 +0300
Subject: [PATCH 2/3] dt-bindings: pinctrl: qcom: Add SDM660 LPI pinctrl
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250824-sdm660-lpass-lpi-v1-2-003d5cc28234@yandex.ru>
References: <20250824-sdm660-lpass-lpi-v1-0-003d5cc28234@yandex.ru>
In-Reply-To: <20250824-sdm660-lpass-lpi-v1-0-003d5cc28234@yandex.ru>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Nickolay Goppen <setotau@yandex.ru>, 
 Richard Acayan <mailingradian@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756068142; l=2866;
 i=setotau@yandex.ru; s=20250815; h=from:subject:message-id;
 bh=lw+wkCHuwJi81P9r9kd3s9iM9l26tF2/jGo2tCXg0SE=;
 b=F7pibNqUfOJePDY6F5m7GczkuEvLs0+A1Xs1LrpODEcu/2APuimP5R1tjqIkIA+HQK/LS7G9N
 6SggJcLH1biBs0+h7bhqeL2o66ST5QLia7QuAkDesnn2CdF1d3BRizX
X-Developer-Key: i=setotau@yandex.ru; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=

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


