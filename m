Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D04392CA5A9
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Dec 2020 15:31:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391242AbgLAObR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Dec 2020 09:31:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388073AbgLAObR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Dec 2020 09:31:17 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D6D5C061A47
        for <linux-gpio@vger.kernel.org>; Tue,  1 Dec 2020 06:30:04 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id c198so3262099wmd.0
        for <linux-gpio@vger.kernel.org>; Tue, 01 Dec 2020 06:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7SaOfXSqIXJe9H1pe4hJCZRLqx5qQOZMT95sC7CFiIs=;
        b=ZOyOenJ9eJ7dVhVXSaIfykqtYXPv0BMuUYyu7rT2JgQnPnby+OHjFig7ilE4xWOXfx
         cfnujHImGR5sMeNws3nsbi+TP/9CBta1HOSMijplQIuin4J7ip9Ua/V35gQll2tISVDZ
         lWbuVexvhH+uHoph43yLneDIstc2+eayjnO0YH4vTiwUaf9g0EjO7ooI8yuiacwb+bJU
         H/D1yQrCPd0EKpXmGuzLZfUMZ1w7SiWZWg3paSL+WXPh5Uzsddl4vor+P/41rsbPxSNW
         5WhQF02/IPCBCDiEZVOba/la0UpVcxM2vNMCQV4NNgZENdcwNviSoMcenMuVqHnkNba0
         OXcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7SaOfXSqIXJe9H1pe4hJCZRLqx5qQOZMT95sC7CFiIs=;
        b=YxVlYpE214/0UW4odb9NGlh8RiMIg2XifpFjk1S9IWkxMcK9o9UcykY3q0kHJNnuwd
         L8Yk9b0xl9ojWqf/I/2bRitwuDT8rbZ7phQ7XLwo59+sHNkDuUMs71/JpPbx7emm82Kr
         VM7XUCFtPONw0HGqPAE9SpRFM1Ga/GSUI2ZgOSa0JrBHSWtfAdzGOcJg6m52rCgOmFks
         dbM+n+BqfuJh3ReYpRDHZ+82MzndWfIdkbSBaWP79AkRrJxeFsL4t3EgLeWbjKgiDpzM
         9fsH7OEOP+1rslYAHgOfwMjGe2sqVtn79ne5VpGAPVV5c9ZBy+D0tR9obcPfFxjSZI/U
         XwZw==
X-Gm-Message-State: AOAM533dmUed3URzHdt4nfGSRvgGWK6iAxO8facbq5QZgI066Umi9Rtf
        3Or2xjpdPhOaQCH8NMnQNNIbgA==
X-Google-Smtp-Source: ABdhPJyPxpTGPyOQ5bMctNmZE63ZwcenBxsN190b0R2Gn3BS/mA+GgzoCu9SCSk41X0Pzw8MlBd2aw==
X-Received: by 2002:a1c:2d93:: with SMTP id t141mr2974157wmt.104.1606833002892;
        Tue, 01 Dec 2020 06:30:02 -0800 (PST)
Received: from srini-hackbox.lan (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.gmail.com with ESMTPSA id 20sm50488wmk.16.2020.12.01.06.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 06:30:02 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     linus.walleij@linaro.org, bjorn.andersson@linaro.org
Cc:     robh+dt@kernel.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        srinivas.kandagatla@linaro.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v5 1/2] dt-bindings: pinctrl: qcom: Add sm8250 lpass lpi pinctrl bindings
Date:   Tue,  1 Dec 2020 14:28:29 +0000
Message-Id: <20201201142830.13152-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20201201142830.13152-1-srinivas.kandagatla@linaro.org>
References: <20201201142830.13152-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add device tree binding Documentation details for Qualcomm SM8250
LPASS(Low Power Audio Sub System) LPI(Low Power Island) pinctrl driver.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../pinctrl/qcom,lpass-lpi-pinctrl.yaml       | 132 ++++++++++++++++++
 1 file changed, 132 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
new file mode 100644
index 000000000000..3543324d9194
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
+              <0x3550000 0x10000>;
+        clocks = <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+                 <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+        clock-names = "core", "audio";
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&lpi_tlmm 0 0 14>;
+    };
-- 
2.21.0

