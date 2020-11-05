Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 311672A7DCE
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 13:04:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729768AbgKEMEb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 07:04:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730430AbgKEMEZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 07:04:25 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE9AEC061A4D
        for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2020 04:04:23 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id y12so1457635wrp.6
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2020 04:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yoyslaxAm8PV6hIMeTxmfrY9MDfCArcqs8WY1KU6rz0=;
        b=Q/px6eeYJssao3H6yCGM9ZQFzWv/Ip4Qoxgjfan6OtKo0o5oskWa6bYOhfbcNxPhFE
         v+heYa/hHB1iDT3p3jrrUF/oXJJnKFyAp2ShllcVFPo0dlZ8TSaQH1cyvVDyyMMF6gNZ
         kWe+HRQCt9She4HF07U+H3eJp0gYyQdrCfQwukbUF1IKrP/cbeHsVzqSRgDXkbbColrw
         Bm4CnlfOTl4JG5LgB4kTuyso8oaLsWLtmeKhFMGvoV/Tpw1ITjQ1+GdWovEaChYLP6kz
         mAtUBNTpkuCVWKRC1RL910LrmVCVt7sg+EjMvB7lju5bSLyU1srZubVnLrKDVYQWwyll
         uxzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yoyslaxAm8PV6hIMeTxmfrY9MDfCArcqs8WY1KU6rz0=;
        b=d6Uwxr14MS8kFt5fpSRwOqi2wJChNPDkrcP5YBZvcKC8vG58Q5dDTxt/oTSxpE/R7L
         5gBM69KAoDvlbwl2p8bqTpmRQ4MdLWyFKJ3RdMGiIW8jfFs+HIFH5tIJ8DvDCbEpbMxg
         JTFBLiMRkTY01uqyi26dIM87myGyosOT9nREGSriA6RwL3usKGoSTPnMmuutEs94ZP5v
         wyZBThnFKMizwQj3cNAVnj9A8nUO8/M6bcpVPG6FMK1tLxcfpVC4WRlDS/jJ7e58AGNH
         AuAHLz98juz6XeQ58bNQzCt94yvvZzy8loUjxtBqKME1JEu6uGifD0yEHJfEJSC9xpA7
         fxOg==
X-Gm-Message-State: AOAM532lsZtoDyY+SuOYZ5jeSw/FF+rPRhBFBbCZjRue7Rd5uB/+Pgd1
        Z29dKAhLByLbfbeXy7vtBHMVVA==
X-Google-Smtp-Source: ABdhPJy14ngmZTBXFrYMK/+7HY77vo3847Ea+vDsDFSZ/YZYJwZhVirxAi1vXGPy7JHhJ/W+wUjmVg==
X-Received: by 2002:adf:f246:: with SMTP id b6mr2499877wrp.111.1604577862456;
        Thu, 05 Nov 2020 04:04:22 -0800 (PST)
Received: from srini-hackbox.lan (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.gmail.com with ESMTPSA id f4sm2363094wrq.54.2020.11.05.04.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 04:04:21 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     linus.walleij@linaro.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 2/2] dt-bindings: pinctrl: qcom: Add sm8250 lpass lpi pinctrl bindings
Date:   Thu,  5 Nov 2020 12:04:10 +0000
Message-Id: <20201105120410.18305-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20201105120410.18305-1-srinivas.kandagatla@linaro.org>
References: <20201105120410.18305-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add device tree binding Documentation details for Qualcomm SM8250
LPASS(Low Power Audio Sub System) LPI(Low Power Island) pinctrl driver.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../pinctrl/qcom,lpass-lpi-pinctrl.yaml       | 129 ++++++++++++++++++
 1 file changed, 129 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
new file mode 100644
index 000000000000..562520f41a33
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
@@ -0,0 +1,129 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,lpass-lpi-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. Low Power Audio SubSystem (LPASS)
+  Low Power Island (LPI) TLMM block
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description: |
+  This binding describes the Top Level Mode Multiplexer block found in the
+  LPASS LPI IP on most Qualcomm SoCs
+
+properties:
+  compatible:
+    const: qcom,sm8250-lpass-lpi-pinctrl
+
+  reg:
+    minItems: 2
+    maxItems: 2
+
+  clocks:
+    items:
+      - description: LPASS Core voting clock
+      - description: LPASS Audio voting clock
+
+  clock-names:
+    items:
+      - const: core
+      - const: audio
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    description: Specifying the pin number and flags, as defined in
+      include/dt-bindings/gpio/gpio.h
+    const: 2
+
+  gpio-ranges:
+    maxItems: 1
+
+#PIN CONFIGURATION NODES
+patternProperties:
+  '-pins$':
+    if:
+      type: object
+    then:
+      properties:
+        pins:
+          description:
+            List of gpio pins affected by the properties specified in this
+            subnode.
+          items:
+            oneOf:
+              - pattern: "^gpio([0-9]|[1-9][0-9])$"
+          minItems: 1
+          maxItems: 14
+
+        function:
+          enum: [ gpio, swr_tx_clk, qua_mi2s_sclk, swr_tx_data1, qua_mi2s_ws,
+                  swr_tx_data2, qua_mi2s_data0, swr_rx_clk, qua_mi2s_data1,
+                  swr_rx_data1, qua_mi2s_data2, swr_tx_data3, swr_rx_data2,
+                  dmic1_clk, i2s1_clk, dmic1_data, i2s1_ws, dmic2_clk,
+                  i2s1_data0, dmic2_data, i2s1_data1, i2s2_clk, wsa_swr_clk,
+                  i2s2_ws, wsa_swr_data, dmic3_clk, i2s2_data0, dmic3_data,
+                  i2s2_data1 ]
+          description:
+            Specify the alternative function to be configured for the specified
+            pins.
+
+        drive-strength:
+          enum: [2, 4, 6, 8, 10, 12, 14, 16]
+          default: 2
+          description:
+            Selects the drive strength for the specified pins, in mA.
+
+        slew-rate:
+          enum: [0, 1, 2, 3]
+          default: 0
+          description: |
+              0: No adjustments
+              1: Higher Slew rate (faster edges)
+              2: Lower Slew rate (slower edges)
+              3: Reserved (No adjustments)
+
+        bias-pull-down: true
+
+        bias-pull-up: true
+
+        bias-disable: true
+
+        output-high: true
+
+        output-low: true
+
+      required:
+        - pins
+        - function
+
+      additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - gpio-controller
+  - '#gpio-cells'
+  - gpio-ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/sound/qcom,q6afe.h>
+    lpi_tlmm: pinctrl@33c0000 {
+        compatible = "qcom,sm8250-lpass-lpi-pinctrl";
+        reg = <0x33c0000 0x20000>,
+              <0x355a000 0x1000>;
+        clocks = <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+                 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+        clock-names = "core", "audio";
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&lpi_tlmm 0 0 14>;
+    };
-- 
2.21.0

