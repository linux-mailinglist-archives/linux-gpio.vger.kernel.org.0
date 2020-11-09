Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BA452ABCD3
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Nov 2020 14:41:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730608AbgKINjI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Nov 2020 08:39:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730624AbgKINCJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Nov 2020 08:02:09 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DB93C0617A6
        for <linux-gpio@vger.kernel.org>; Mon,  9 Nov 2020 05:01:51 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id p8so7790211wrx.5
        for <linux-gpio@vger.kernel.org>; Mon, 09 Nov 2020 05:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yoyslaxAm8PV6hIMeTxmfrY9MDfCArcqs8WY1KU6rz0=;
        b=m+m4v/bb7UJlK/+HVWhrZwb66JVz3/Dec8KF9rail7GxAo7207gpvESFEWZMSwUyjJ
         yTeNoLrOwMqQkhAfabAgYsiG92ZXt+IRbrqzB2AH6nCEVVZ2hdhrO9FthRcKZ9eF+7mp
         B1jVzaoIG0mc9cNs0ZjsdDi9p/Vn/Urmhyb7max9525FBPjLdeZ/bGsJH5Rs+XN8jVYT
         0bF4RUPywXgYmO7bh7O1GpT75MZYl5Bm2i2fZ9XzbHgG/gocm3Fk2Y0DJj4HCWo5rOKE
         znqEx3UIOIqPmSqhVaXr+mhCulSk/l4JkxN9EHrKoGXYHscVd2oJtsDEbC3ilTLJVp32
         OWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yoyslaxAm8PV6hIMeTxmfrY9MDfCArcqs8WY1KU6rz0=;
        b=uT0bok7ffRPrrNhPgzs17zYKxw2QSHhd1amC14gnXIWDhAjeMxTDmzSdyLr0mkVR0M
         prJM1+zeCSy5yTOIEhZK+6VtlQFXYBr1grsKZowbTqZ+Nf7jzwT+eCcr8KfLJH7Dqq4k
         cSKxSfXAITGAqIPSaBCuQQeeOWqJsFeAYAjDFEm30XX1MzJLdFCuVPLA4naNTT/mQta3
         e/gbjq8bMQGVlLgC9v5QeQtWnUeYE27dM8+jnBOHQqszDmX9A7qqod/7Bx2V00slJY/h
         rEQIMycjnOmNxu/JYgLix855pJJHDsZPtzB5C1V3vsPDlh+3N6o9FyOcr2aMynEkKwk6
         t4aQ==
X-Gm-Message-State: AOAM530V4UMPgMTvnCk1/Vfu8l8VMfA4lacJ0cM1FVvWTAO8LCTk83g6
        baETH3sk92vQ9fKgSMKAfPJAng==
X-Google-Smtp-Source: ABdhPJyFdU1tSlPMj0dL88I1SaPEUf75zNPaM5/RRgRE9qFk0wNgGkRC0M8rO3N1AAlvSvazBVVIIQ==
X-Received: by 2002:adf:e60e:: with SMTP id p14mr13229451wrm.188.1604926910033;
        Mon, 09 Nov 2020 05:01:50 -0800 (PST)
Received: from srini-hackbox.lan (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.gmail.com with ESMTPSA id z5sm13135938wrw.87.2020.11.09.05.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 05:01:49 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     linus.walleij@linaro.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 1/2] dt-bindings: pinctrl: qcom: Add sm8250 lpass lpi pinctrl bindings
Date:   Mon,  9 Nov 2020 13:01:34 +0000
Message-Id: <20201109130135.28589-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20201109130135.28589-1-srinivas.kandagatla@linaro.org>
References: <20201109130135.28589-1-srinivas.kandagatla@linaro.org>
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

