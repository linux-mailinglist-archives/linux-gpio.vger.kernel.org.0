Return-Path: <linux-gpio+bounces-7395-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD9A9051B6
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2024 13:56:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 970BD28803E
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2024 11:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E26E116F29F;
	Wed, 12 Jun 2024 11:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jrqs7qKL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF37F16F260
	for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2024 11:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718193370; cv=none; b=IqbVMmcr8bLWlmIqAKBFxr4P8AVlsryNxnRlEYdEJhxWgsXWLXXrX2qmDO3D9gEmPkXeHfjqopcyCGBL9x5wNjquxWUijPI/h8S60nd1dy5Rln0BrUgglEwB8w3tDKky5v+bOPWG6r35W+RDGbPgHjJAM3ApBvvb53sdIS5qHvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718193370; c=relaxed/simple;
	bh=aZtdVnXYlOJKHMUmHWZfsO3wqw/EgbmLFQVlM9kELD4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tk76GoysLd/lfjADzO3EO+pfdhNlZ81u7CHV7WbRY+w6H1zmUP1GxELZ6xFPQTPllY8M3+aKzDtGhyujX/EQT61G8QBW3rEMkVh6G+8wzyX0CGwoiGfwDwe0uCjtI+1XUopw7NtuRf7ShdRx1ythWF+7Lzsqgm1UngmMRz27/1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jrqs7qKL; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a6f0dc80ab9so298391166b.2
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2024 04:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718193367; x=1718798167; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UHpZ9gagK7j5wDwUyIomAVNv8cDr2aSk8hvPd70Uupw=;
        b=Jrqs7qKLHG2XCgU8evARi0/dYSAeyrJO+4I+B4PMWlYyH7oBUyBCsF1Zyfd3f3Gi/D
         Hwyh8JuliReaBsLqLpQHfjXQIo+Wl/dzA3b/nss9Nn2io9wvjTFT2LN7/isgDxaJWcgd
         /CPv4Y9sgcubIhtWDgFeL+Q7FK/EAXrNxU/SpPTVD2jdA+bIlcnKOhstoDeaQJMavoUN
         KJrqQ4BxGhKQxxUdMI4RrLrk6IjfzH6RLqVM04YxYMxQZki6U7D/v6/an1BCtWr6ZYuG
         P8zKwk1+OK6su78O5jYjzMaQnE7KeewSk+C3n0n+Fq7LzOEsvU28joIwaCpXmQCm5l2o
         fV0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718193367; x=1718798167;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UHpZ9gagK7j5wDwUyIomAVNv8cDr2aSk8hvPd70Uupw=;
        b=lAK3o3lIINqhJQA+RTmmG1RRlAnvgLnzH1JpnYh7hL4nkvbfRQv77XMRbkHwuBa3vP
         TjplyhApxvmkRoN6gXIuODqSnfq8wWrJZeV1GnqsS/ujZPB2He6hWfH7rAbGCF+wXe0D
         L3zlCgarn6Aecx/yAjcY0kijk6ykco8afPLlMqfsJgACsY6jh24cE0TLWovVBaM/Ob6V
         QYao4Xnq2es7l4+1FFnBa2hcyphvPwSGLNPzXukx7drVFaFjI1nNeMw7oJhojjDg5yzb
         hZgLByoy1vXwOw8qyZyFlM5SpqeVGxyvgZL9n9Rbnnl24gt3yJW1UVQuw0p8Bx9s2rxj
         3/Sg==
X-Forwarded-Encrypted: i=1; AJvYcCVKCXbZ0USIopRqAeQmLsLrz6e/ov4td+Po06+8NCqen+4SFG8PHk4QaLbVWKL+hqyp7qiK/RsQOKpI5ob4NsG2hMWRVXq8iLh/8g==
X-Gm-Message-State: AOJu0Yy9gM6R15yYOswj6iv+bOphz1r4T5lGlW6O0idw1BeOi+fwSoJV
	C/LKUJr+LRp5paHnw/keddvWMicEfuNoJQjbmiQQG1/7OEgYuICkKNlNVqgmaD0=
X-Google-Smtp-Source: AGHT+IHKK6Rk117/R+XENP1DQa2PVtefaSzm+bmyxBJbYeBtfuBibevHdTdhfDlvdPmQ760ZFDkcPA==
X-Received: by 2002:a17:906:f24a:b0:a6e:c5b0:b64b with SMTP id a640c23a62f3a-a6f47c7d974mr91851566b.16.1718193367099;
        Wed, 12 Jun 2024 04:56:07 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f2f8bd62esm275762266b.141.2024.06.12.04.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 04:56:06 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Wed, 12 Jun 2024 12:55:44 +0100
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: qcom: Add SM4250 pinctrl
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-sm4250-lpi-v1-1-f19c33e1cc6e@linaro.org>
References: <20240612-sm4250-lpi-v1-0-f19c33e1cc6e@linaro.org>
In-Reply-To: <20240612-sm4250-lpi-v1-0-f19c33e1cc6e@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4162;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=aZtdVnXYlOJKHMUmHWZfsO3wqw/EgbmLFQVlM9kELD4=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmaYzU5vTNqm+gXSdmuTClTGFLKe+uHY33JI5+1
 H8FoXTruNmJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZmmM1AAKCRB6of1ZxzRV
 N7coB/43VSrAv0NjmZdNhkMwN6/Tatqpombx5w6GwIpybpZCHH+w1RaKrjzqybpqVuIxU+MwY7e
 c69/PQ0gK3r0ZtB/se5Y8CiYPZaptP0zVSYZp6AVliWvb/rMA/L5o6T6Pa2zq1q5zJmVfKsbcXx
 my7rirn2Td8SXWC0KqjpBR5m7pRV9S/KB+wL5pV+RMRF5vU040KtxAxgMUIz/iM0oV9jIwyTb/8
 xWLM3GVMw8Lc10KJZbZ6E2VSU52wOvCytxHycCJ2enmYtfzfSGrBtNqGggTsRWGbDWUOL6mSQdl
 E4Q/Blmol9ftzN0uojcL2/1KXSQTot7yOLDdhyIuQm2J2nhP
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6

Add device tree binding Documentation details for Qualcomm SM4250 LPASS
LPI(Low power Island) pinctrl device.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../pinctrl/qcom,sm4250-lpass-lpi-pinctrl.yaml     | 119 +++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm4250-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm4250-lpass-lpi-pinctrl.yaml
new file mode 100644
index 000000000000..3968a363aa51
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm4250-lpass-lpi-pinctrl.yaml
@@ -0,0 +1,119 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,sm4250-lpass-lpi-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SM4250 SoC LPASS LPI TLMM
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description:
+  Top Level Mode Multiplexer pin controller in the Low Power Audio SubSystem
+  (LPASS) Low Power Island (LPI) of Qualcomm SM4250 SoC.
+
+properties:
+  compatible:
+    const: qcom,sm4250-lpass-lpi-pinctrl
+
+  reg:
+    maxItems: 2
+
+  clocks:
+    items:
+      - description: LPASS Audio voting clock
+
+  clock-names:
+    items:
+      - const: audio
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-sm4250-lpass-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-sm4250-lpass-state"
+        additionalProperties: false
+
+$defs:
+  qcom-sm4250-lpass-state:
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
+          oneOf:
+            - pattern: "^gpio([0-9]|1[0-8])$"
+        minItems: 1
+        maxItems: 19
+
+      function:
+        enum: [ gpio, dmic01_clk, dmic01_data, dmic23_clk, dmic23_data,
+                dmic4_clk, dmic4_data, ext_mclk0_a, ext_mclk0_b, ext_mclk1_a,
+                ext_mclk1_b, ext_mclk1_c, i2s1_clk, i2s1_data, i2s1_ws,
+                i2s2_clk, i2s2_data, i2s2_ws, i2s3_clk, i2s3_data, i2s3_ws,
+                qua_mi2s_data, qua_mi2s_sclk, qua_mi2s_ws, slim_clk, slim_data,
+                swr_rx_clk, swr_rx_data, swr_tx_clk, swr_tx_data, swr_wsa_clk,
+                swr_wsa_data ]
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
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/sound/qcom,q6afe.h>
+    lpi_tlmm: pinctrl@a7c0000 {
+        compatible = "qcom,sm4250-lpass-lpi-pinctrl";
+        reg = <0xa7c0000 0x20000>,
+              <0xa950000 0x10000>;
+        clocks = <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+        clock-names = "audio";
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&lpi_tlmm 0 0 19>;
+
+        i2s2-active-state {
+            clk-pins {
+                pins = "gpio10";
+                function = "i2s2_clk";
+                drive-strength = <2>;
+                slew-rate = <1>;
+                bias-disable;
+            };
+
+            data-pins {
+                pins = "gpio12";
+                function = "i2s2_data";
+                drive-strength = <2>;
+                slew-rate = <1>;
+            };
+        };
+
+        i2s2-sleep-clk-state {
+            pins = "gpio10";
+            function = "i2s2_clk";
+            drive-strength = <2>;
+            bias-pull-down;
+        };
+    };

-- 
2.25.1


