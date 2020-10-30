Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 088E12A0B3D
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Oct 2020 17:34:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727206AbgJ3Qea (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Oct 2020 12:34:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbgJ3Qe3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Oct 2020 12:34:29 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D1C5C0613CF
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2020 09:34:29 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id x7so7154474wrl.3
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2020 09:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OYYG+bPEQAKrvnUyay3Ge798oMm5TIrWSkpr0tXXXgA=;
        b=IPXpUuBYHk3ry3LWCiDQtSu6JVXDRMasFEoSmK0oT5trABpOaXDfsD728+f337p+lI
         ny80+nakxBsl5E5OT0ehurxFoDzVSQmTijOASIgnXyAFbkfnyjoqHNJ1F5GDZEX7vb8f
         wLQAWg2f6JKwz+Y7vmg31ax+0UmLS4JcwQnLIGdAdLl5GAHwQYQJ8ySrmIZCG0dsggXP
         hWEwyvfMF9RbsDxxfkKw8qEGhCVKLKg5MXWryea2MXp9Di31OysTGNr+SzvXFqvy32ii
         BCxUvQCtzMDB0Meg2q6/YicGfLCQtwWyIQaLyO9GP8AvmpOjqFXDXCvBNl7SveASSvwP
         5ysA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OYYG+bPEQAKrvnUyay3Ge798oMm5TIrWSkpr0tXXXgA=;
        b=M3/Tyk354BwRypia//LwwDRxGvoVPs1Y9M8+Q7LW3+8GG9bNpJNO+b3hrpjsUP0PLL
         6txTWWnDy9o4mIx6TmjatP9NeYKAHAdZNAOJAikIWtYhGX/SE4EU4ybKO4XSUy2GdhIv
         XN47e+vdELo9+Mb0610t7/DCPIKbby7NjK+OknLNWl69YDRhvzuBm/vqKvFV0CJ7nEO0
         P8W6Wh7/avpSGanJNS/dtj6DMkvj7qV3IAuqw4GHtjnZAlQXg6vvIakDf6m1Ks3gBoZ3
         qvmKixsi3Ai0Q+/4Dz7yKUFgDJDWemA5HYxTexfnsAoNpuRSuZbNbp52tK9P1fX3bZAS
         s9Dg==
X-Gm-Message-State: AOAM533hglzPsb5PB03RV6W4NYmQF4S/1IH1Z22ET/P9Uf78e5+39uVN
        vEWT48sMQua3/zTMzdyk9i8YYw==
X-Google-Smtp-Source: ABdhPJxXWB+Eh9fZ/z7qudWHHBxPDXya7nps40isjscACIutSC0MFscAxNvam9WGTjq6I1q2ExdESg==
X-Received: by 2002:adf:ef45:: with SMTP id c5mr4507644wrp.117.1604075668061;
        Fri, 30 Oct 2020 09:34:28 -0700 (PDT)
Received: from srini-hackbox.lan (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.gmail.com with ESMTPSA id z6sm5031989wmi.1.2020.10.30.09.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 09:34:27 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     linus.walleij@linaro.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add sm8250 lpass lpi pinctrl bindings
Date:   Fri, 30 Oct 2020 16:34:20 +0000
Message-Id: <20201030163421.14041-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20201030163421.14041-1-srinivas.kandagatla@linaro.org>
References: <20201030163421.14041-1-srinivas.kandagatla@linaro.org>
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
index 000000000000..8a0732574aee
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
+  '^.*$':
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

