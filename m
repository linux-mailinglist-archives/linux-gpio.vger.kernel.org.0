Return-Path: <linux-gpio+bounces-11602-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3769A38E7
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 10:43:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC17F1C208BA
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 08:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBA8418F2EF;
	Fri, 18 Oct 2024 08:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vobr2btS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E532D18E74E
	for <linux-gpio@vger.kernel.org>; Fri, 18 Oct 2024 08:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729240967; cv=none; b=JLPzi86AZHai+vVLS/g1XGbYQjLTSDwS86ZmVpjp3YCkE0nn7OiTXvd8GOjSQ1/kF/tdxX120nZblNP4wk4sbyay1LRov+xEx3e2qbAESOdBALQOdNggJ/tlkZ52n92sFaGUwFjSZtMJ0w15GFDXTr7n+1ne5gG62n2zorLuMvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729240967; c=relaxed/simple;
	bh=jlAblsvCAzmnPMfPaWDHZ1zD+dL0UCw2w1NNWlWDCHE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kJ6juoTjgWQ/+DpWlNTu+y4lEbImrrzic5aNtaaisLXhmib1nh5WsX3eW6GO2URHraCAWhqUYTDd8so6gxdJnTcGIOKJ1mr2D8OTytFAzAB/0SOqVPTKB5/YBDQbqqc2WMc92yZtwSx1yDA+Tk963AT5YN3ndo0uJICVC9PwSS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vobr2btS; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53a0c160b94so2535817e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 18 Oct 2024 01:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729240963; x=1729845763; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ch6W8pq/Lwcx4MuGZ60qPNNis7jLMPoSDWDMQoKS6ss=;
        b=vobr2btSy8IsL6rnbzL8eO6F0/MyfNsXDjL2x+mZqef56aXExt6zx6C3RAb5oBRd90
         Vt8eUJCH2jeynB0AmGAttNnHYNPgEuWhtvMl9rcqcndJqfHtpPA1FC5SKQgvHZyPwR0N
         ejugHXNu3XHQT5t4wLtze80X/gqmXkZ8Veg2GXfQHZwQchRivu0nP7IJOn/Fh/xFDNft
         xM/5Nn72onN97TNw1UkmJduAIjHpwc+icWOgy2YivvzTgCb0Oez8xyjZngNgumXujjPQ
         mjKlmRa+ieg+G6CxwTEdi+vlAq/FrhsgCM3D9MxTGjHOtj/m6F8Zur3d0DzUBneZbZiV
         tHGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729240963; x=1729845763;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ch6W8pq/Lwcx4MuGZ60qPNNis7jLMPoSDWDMQoKS6ss=;
        b=ulOobJNGChXqcaNv47VAb4Ive/8gUSCHPhEiCRLMSBQC4Vz6CITmBob6N7l8XRMQwP
         ttp4UiYI9QgVsmte+VjEJldt0CLj0KOWIZW48SY3URjONM1QlUn4RDuPDaOeN8ZznNlm
         cMAR0c1QphiH4vT+V6C1s6N5s2noUfv5OrhlDwNKZdknAfUs7B7KH2/wSFtmruUx36Zi
         pIjoCXVYNan1ribyygT1zj0lDK7RcGyBhAkG36y5cP4WkJjLpEmVo2mW5ZGkkOrIU0Aq
         tG474sJXaJpVF6EUKBuBkwWA5h/Pcg3PeX573TT4e/7hqMWt8Kl1YBSMLuWYII3DqRDP
         NZPg==
X-Forwarded-Encrypted: i=1; AJvYcCXvii5EUQumM7sB9nGnGmPCHtPE3u6q4uuY47WF+VEeAlK3CRpzJJh4YTI04bEcBaeOaWm50IfMxWrh@vger.kernel.org
X-Gm-Message-State: AOJu0YwtSVRbdcVp5FD19+b29folC53lcY32Je8xoc4NBxezR4+aK8VR
	ynT3sbOdn8HQtcY2/Ad/XTYAwzDCbjZao0X6l2IsxfovQzaxXZZan3ZlKjRYEh1hJ6jf0DtnhhU
	PACA=
X-Google-Smtp-Source: AGHT+IEjTzdTe8IS4bPM2SaSlqRa5hoJFzSI4qujn9tO5ns9BaOVQEUx3BPL3q6Sk7tbOV/vzLFLmQ==
X-Received: by 2002:a05:6512:2210:b0:539:8d9b:b624 with SMTP id 2adb3069b0e04-53a1547049dmr980581e87.55.1729240963052;
        Fri, 18 Oct 2024 01:42:43 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a151b0098sm160702e87.22.2024.10.18.01.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 01:42:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 18 Oct 2024 11:42:39 +0300
Subject: [PATCH v2 1/2] dt-bindings: pinctrl : qcom: document SAR2130P TLMM
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241018-sar2130p-tlmm-v2-1-11a1d09a6e5f@linaro.org>
References: <20241018-sar2130p-tlmm-v2-0-11a1d09a6e5f@linaro.org>
In-Reply-To: <20241018-sar2130p-tlmm-v2-0-11a1d09a6e5f@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5501;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=jlAblsvCAzmnPMfPaWDHZ1zD+dL0UCw2w1NNWlWDCHE=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnEh+A4s/ZJsjEmaEAiMaj2vHXZ5zW4SHla/y/T
 25X8wRZcdCJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZxIfgAAKCRAU23LtvoBl
 uPDPD/9VxrKg/rkUeAsZ0OjOobv5eXI/rb0vh1YXHOqrQ1Q9zyOeMJmyDXf/Gy6vI92xwJ3zGuN
 wIHKKaKulkpNX/a55U2E/lCD2PjHqP8jbT/LmEmsjYppzNzjEKKfI0Cup2D/EBXDLYgkXV4jxKH
 0N3VGuU4kaRmfGclD4HqURYJyz4oMgkvvUy7lEHCgujb2TCNaRE2wEcakEVLsCcReO4jkbt6e7U
 3qUp6nwJFb/gr3yS/8Wjy0bBV21nr474DEeU0TMNd0cemdoM8KIpENw3MTzB+ARFu3j0Zktsg2D
 jU3+b050/ueXU/CZHdaYhxQ3ADbD4oNIPrq+yRWhonl/55Basge+d+/AAz5lfa1cxu3YpFHci11
 s0xwtXEltqT/tj+EdC87bMbr+8pUPZiHNk4as1G2gnG+BT10c0ydDb754d4pXszhJvbj/AAGqkJ
 Vj8Oq3dj9BW4oyIpQdfwATcJqecqtvUttnD6VahTE5gLiETkuC3VGjkpK/CzJui80d2zY+cjTZx
 qFKMtJpJMJcLnR5gymE1kYTgEqm587oMaQDI55/WKllrUq+oofAqpcVv2KhtYAB+8JWvpzo4ht+
 1Bt3MkxLb0V2QJDGnb1OV86BfTA0GMGOSC200UEblduQguDznfOsJPhENEhgrS+MvnmNPn8CeC5
 iYQRd9vFTRa8Efg==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add bindings for the pin controller (TLMM) present on the
Qualcomm SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/pinctrl/qcom,sar2130p-tlmm.yaml       | 138 +++++++++++++++++++++
 1 file changed, 138 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sar2130p-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sar2130p-tlmm.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..b388380b1ce02e21283e2200bce241bba6100024
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sar2130p-tlmm.yaml
@@ -0,0 +1,138 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,sar2130p-tlmm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. SAR2130P TLMM block
+
+maintainers:
+  - Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm SAR2130P SoC.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,sar2130p-tlmm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 78
+
+  gpio-line-names:
+    maxItems: 156
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-sar2130p-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-sar2130p-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-sar2130p-tlmm-state:
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
+            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-4][0-9]|15[0-5])$"
+            - enum: [ sdc1_clk, sdc1_cmd, sdc1_data, sdc1_rclk ]
+        minItems: 1
+        maxItems: 36
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+        enum: [ aoss_cti, atest_char, atest_char0, atest_char1, atest_char2,
+                atest_char3, atest_usb0, atest_usb00, atest_usb01, atest_usb02,
+                atest_usb03, audio_ref, cam_mclk, cci_async, cci_i2c,
+                cci_timer0, cci_timer1, cci_timer2, cci_timer3, cci_timer4,
+                cri_trng, cri_trng0, cri_trng1, dbg_out, ddr_bist, ddr_pxi0,
+                ddr_pxi1, ddr_pxi2, ddr_pxi3, dp0_hot, ext_mclk0, ext_mclk1,
+                gcc_gp1, gcc_gp2, gcc_gp3, gpio, host2wlan_sol, i2s0_data0,
+                i2s0_data1, i2s0_sck, i2s0_ws, ibi_i3c, jitter_bist, mdp_vsync,
+                mdp_vsync0, mdp_vsync1, mdp_vsync2, mdp_vsync3, pcie0_clkreqn,
+                pcie1_clkreqn, phase_flag0, phase_flag1, phase_flag10,
+                phase_flag11, phase_flag12, phase_flag13, phase_flag14,
+                phase_flag15, phase_flag16, phase_flag17, phase_flag18,
+                phase_flag19, phase_flag2, phase_flag20, phase_flag21,
+                phase_flag22, phase_flag23, phase_flag24, phase_flag25,
+                phase_flag26, phase_flag27, phase_flag28, phase_flag29,
+                phase_flag3, phase_flag30, phase_flag31, phase_flag4,
+                phase_flag5, phase_flag6, phase_flag7, phase_flag8,
+                phase_flag9, pll_bist, pll_clk, prng_rosc0, prng_rosc1,
+                prng_rosc2, prng_rosc3, qdss_cti, qdss_gpio, qdss_gpio0,
+                qdss_gpio1, qdss_gpio10, qdss_gpio11, qdss_gpio12, qdss_gpio13,
+                qdss_gpio14, qdss_gpio15, qdss_gpio2, qdss_gpio3, qdss_gpio4,
+                qdss_gpio5, qdss_gpio6, qdss_gpio7, qdss_gpio8, qdss_gpio9,
+                qspi0, qspi1, qspi2, qspi3, qspi_clk, qspi_cs0, qspi_cs1, qup0,
+                qup1, qup2, qup3, qup4, qup5, qup6, qup7, qup8, qup9, qup10,
+                qup11, tb_trig, tgu_ch0, tgu_ch1, tgu_ch2, tgu_ch3,
+                tmess_prng0, tmess_prng1, tmess_prng2, tmess_prng3,
+                tsense_pwm1, tsense_pwm2, usb0_phy, vsense_trigger ]
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
+    pinctrl@f100000 {
+        compatible = "qcom,sar2130p-tlmm";
+        reg = <0x0f100000 0x300000>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 156>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+
+        gpio-wo-state {
+            pins = "gpio1";
+            function = "gpio";
+        };
+
+        uart-w-state {
+            rx-pins {
+                pins = "gpio26";
+                function = "qup7";
+                bias-pull-up;
+            };
+
+            tx-pins {
+                pins = "gpio27";
+                function = "qup7";
+                bias-disable;
+            };
+        };
+    };
+...

-- 
2.39.5


