Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45FC22B45F5
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Nov 2020 15:35:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730216AbgKPOev (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Nov 2020 09:34:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729976AbgKPOeu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Nov 2020 09:34:50 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D67F9C0613D2
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2020 06:34:48 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id k2so18968041wrx.2
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2020 06:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HKpu/mfhoRJU/Ty4aWVBT1w8Lcm0NqmGtTgrnNU+3m4=;
        b=YkBUelOSpBiRyifoGS+HqRrltuJze4ewjB+Uav0dGptLWLk/TLDvGmRdHTN4V8AAeP
         BwT2v1DvC4tjokiypMhkhpt4rGdYkxOU5vfLq+/yqcc0inFtYub1/E/J2U5Kbe3LGFQH
         35sHgPUpFHjJBeD8BOvAQ55oIRhqznBpOEeYgvj6DEst3x2vcQmBJg7zJ/w+CmhArWn1
         OkNew+FzzKe2ymeGMyrQpm9O8oOZgsVfk5e/oeXiBWz+T1sBRranBTpWU41h3OxU9Vdg
         QNjtnmiizynEbHFcIZJvoG50v34xKLVNi3xD4i9XccMQ1sHzwmyDmZ0mLf9j5ZDT14Oi
         OWVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HKpu/mfhoRJU/Ty4aWVBT1w8Lcm0NqmGtTgrnNU+3m4=;
        b=rMsB2r96gPhZrbgTtRudPe2JZQIuleg6qeNlfqTMFKDac3HkyBDxSAX+rV/ESF+1S3
         9u4iRck9bZQFZf1xLCz62//8WwXhcxFndvY379MPCSDytGmENzlEivT/0SDtZH7xHJKj
         BTgEjv80iFLVDReWIx3CZam2Sn9wZAsAtSjO7BxPKEyz3ufk7g4dgbot0apA48Tw35qq
         fUXfpwtTggl66eyQDjdQYATqIG7/hFgwlU5cm6+isbUm6daBomqUuDkHT9B/3AxTUnCn
         rSaVZ+LsCfc/rclXUDBinypJnXr2Gawv/HbKdlqdemZcL9g8CGxJK7HyiD2Ecp123d/G
         Y0rw==
X-Gm-Message-State: AOAM531Hog7u4obTjYrJpkYJsXCiX60McopJmciYItK1UBVDA3mLACDz
        6DahlqF8eywWA00T45mn7bVlqA==
X-Google-Smtp-Source: ABdhPJzyufYNawFO6bVo47vpEmPShbevIysYYh76iUy27+DFowMZ5nPcdd7dOJ1R6zrTQq6x1Lezbw==
X-Received: by 2002:adf:e6c8:: with SMTP id y8mr19390059wrm.414.1605537287568;
        Mon, 16 Nov 2020 06:34:47 -0800 (PST)
Received: from srini-hackbox.lan (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.gmail.com with ESMTPSA id n10sm24013501wrx.9.2020.11.16.06.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 06:34:46 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     linus.walleij@linaro.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v4 1/2] dt-bindings: pinctrl: qcom: Add sm8250 lpass lpi pinctrl bindings
Date:   Mon, 16 Nov 2020 14:34:31 +0000
Message-Id: <20201116143432.15809-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20201116143432.15809-1-srinivas.kandagatla@linaro.org>
References: <20201116143432.15809-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add device tree binding Documentation details for Qualcomm SM8250
LPASS(Low Power Audio Sub System) LPI(Low Power Island) pinctrl driver.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../pinctrl/qcom,lpass-lpi-pinctrl.yaml       | 132 ++++++++++++++++++
 1 file changed, 132 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
new file mode 100644
index 000000000000..704e761146ef
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
@@ -0,0 +1,132 @@
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
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    $ref: "/schemas/pinctrl/pincfg-node.yaml"
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this
+          subnode.
+        items:
+          oneOf:
+            - pattern: "^gpio([0-9]|[1-9][0-9])$"
+        minItems: 1
+        maxItems: 14
+
+      function:
+        enum: [ gpio, swr_tx_clk, qua_mi2s_sclk, swr_tx_data1, qua_mi2s_ws,
+                swr_tx_data2, qua_mi2s_data0, swr_rx_clk, qua_mi2s_data1,
+                swr_rx_data1, qua_mi2s_data2, swr_tx_data3, swr_rx_data2,
+                dmic1_clk, i2s1_clk, dmic1_data, i2s1_ws, dmic2_clk,
+                i2s1_data0, dmic2_data, i2s1_data1, i2s2_clk, wsa_swr_clk,
+                i2s2_ws, wsa_swr_data, dmic3_clk, i2s2_data0, dmic3_data,
+                i2s2_data1 ]
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+
+      drive-strength:
+        enum: [2, 4, 6, 8, 10, 12, 14, 16]
+        default: 2
+        description:
+          Selects the drive strength for the specified pins, in mA.
+
+      slew-rate:
+        enum: [0, 1, 2, 3]
+        default: 0
+        description: |
+            0: No adjustments
+            1: Higher Slew rate (faster edges)
+            2: Lower Slew rate (slower edges)
+            3: Reserved (No adjustments)
+
+      bias-pull-down: true
+
+      bias-pull-up: true
+
+      bias-disable: true
+
+      output-high: true
+
+      output-low: true
+
+    required:
+      - pins
+      - function
+
+    additionalProperties: false
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

