Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CD31E86F3
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Oct 2019 12:29:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731885AbfJ2L2y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Oct 2019 07:28:54 -0400
Received: from mail-wr1-f45.google.com ([209.85.221.45]:46547 "EHLO
        mail-wr1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731716AbfJ2L2x (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Oct 2019 07:28:53 -0400
Received: by mail-wr1-f45.google.com with SMTP id n15so13186480wrw.13
        for <linux-gpio@vger.kernel.org>; Tue, 29 Oct 2019 04:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=180LRLtVibZuNEGVjJ0cua0pIuWoyx489HZ44l4xhjA=;
        b=PU3WiNMq4xmp4SOp6Nym7RsV7fF+pmSZrVhFa9Gghmlmjgf+AD0zD45oHeA/l0A9hd
         dncbpaNvA995dWoQzYXMncMDHWjUz2K8lA2llvlp3SUG9GF9KX/AILx286Giop9GPLYs
         VrQ+D1Ck9AbEKVZy+EqhtjTLkXLu+6cCvfD+j6dJmaOCgZUmJYTPoIsVO1cpLRDb4kDt
         x8PvNumAgLUgcSLWhwLYtWnM5OlbC0DjZcxsOx4jUxNRlPNFTJe2gkVRvCD4YXaplNvJ
         I983YTh9IAr2CrcP1nYaUEkvSTknzLXbW9/CkHu3DuIT6+tJi4jmB/nZeuZG6IqvZbHV
         LWGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=180LRLtVibZuNEGVjJ0cua0pIuWoyx489HZ44l4xhjA=;
        b=o+eyz1PM+LwQv1XMFaGrJB4+UZYi0sVwxHzDCEXIUOhHou/zAJ2FJNSRUOCf1eOwLO
         JvcrnchQrpylIhMOliMLWWDbcbhEjKXWMRmFQUrbPwXBNs8+cZ0cgR1bSqsbRZzgxYZk
         7ld2gVEoIHAoR0QH/oOTIcd6YBg3S5muVrwcaaQJxLvow/vAV2jlTC5pFv8P/Lk57bpF
         HQbWfOFOWc4jIVFvs2DWnXMx60QSxAhuB8xBkmzOVtczm2MI+iHO0UnZhXaXMFKSRola
         1YkHEE63CN7VSiIxlbiw+gcDXxw2u0PH0MGDeEDUpWtbNdARl5PjQsAkSUeX5ZgpXT8q
         gvIw==
X-Gm-Message-State: APjAAAUDZBd7xhmvQFtNAw5an3oPq6/aG/AqKM4XLKbArRULMihjJbTZ
        WJslGUJvzdSVY1CtNdxsAC7Z7Q==
X-Google-Smtp-Source: APXvYqz/VlwMWdr1F9+5qfi54fdp3VoiqQnl4Rgoi5UDLE6O6zU2YfnT5c/Y4aEp2jbXV2z6+j0JDQ==
X-Received: by 2002:a5d:4b42:: with SMTP id w2mr18948240wrs.360.1572348532034;
        Tue, 29 Oct 2019 04:28:52 -0700 (PDT)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id f20sm2373247wmb.6.2019.10.29.04.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 04:28:51 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     robh@kernel.org, broonie@kernel.org, lee.jones@linaro.org,
        linus.walleij@linaro.org
Cc:     vinod.koul@linaro.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        spapothi@codeaurora.org, bgoswami@codeaurora.org,
        linux-gpio@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 01/11] ASoC: dt-bindings: add dt bindings for WCD9340/WCD9341 audio codec
Date:   Tue, 29 Oct 2019 11:26:50 +0000
Message-Id: <20191029112700.14548-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191029112700.14548-1-srinivas.kandagatla@linaro.org>
References: <20191029112700.14548-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds bindings for wcd9340/wcd9341 audio codec which can
support both SLIMbus and I2S/I2C interface.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../bindings/sound/qcom,wcd934x.yaml          | 162 ++++++++++++++++++
 1 file changed, 162 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
new file mode 100644
index 000000000000..d6cfde6597db
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
@@ -0,0 +1,162 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,wcd934x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bindings for Qualcomm WCD9340/WCD9341 Audio Codec
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description: |
+  Qualcomm WCD9340/WCD9341 Codec is a standalone Hi-Fi audio codec IC.
+  It has in-built Soundwire controller, pin controller, interrupt mux and
+  supports both I2S/I2C and SLIMbus audio interfaces.
+
+properties:
+  compatible:
+    const: slim217,250
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    description: GPIO spec for reset line to use
+    maxItems: 1
+
+  slim-ifc-dev:
+    description: SLIMBus Interface device phandle
+    $ref: '/schemas/types.yaml#/definitions/phandle'
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: extclk
+
+  vdd-buck-supply:
+    description: A reference to the 1.8V buck supply
+
+  vdd-buck-sido-supply:
+    description: A reference to the 1.8V SIDO buck supply
+
+  vdd-rx-supply:
+    description: A reference to the 1.8V rx supply
+
+  vdd-tx-supply:
+    description: A reference to the 1.8V tx supply
+
+  vdd-vbat-supply:
+    description: A reference to the vbat supply
+
+  vdd-io-supply:
+    description: A reference to the 1.8V I/O supply
+
+  vdd-micbias-supply:
+    description: A reference to the micbias supply
+
+  qcom,micbias1-microvolts:
+    description: micbias1 voltage between 1800000 - 2850000 microvolts
+
+  qcom,micbias2-microvolts:
+    description: micbias2 voltage between 1800000 - 2850000 microvolts
+
+  qcom,micbias3-microvolts:
+    description: micbias3 voltage between 1800000 - 2850000 microvolts
+
+  qcom,micbias4-microvolts:
+    description: micbias4 voltage between 1800000 - 2850000 microvolts
+
+  clock-output-names:
+    const: mclk
+
+  clock-frequency:
+    description: Clock frequency of output clk in Hz
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 1
+
+  '#clock-cells':
+    const: 0
+
+  '#sound-dai-cells':
+    const: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+patternProperties:
+  "^.*@[0-9a-f]+$":
+    type: object
+    description: |
+      WCD934x subnode for each slave devices. Bindings of each subnodes
+      depends on the specific driver providing the functionality and
+      documented in their respective bindings.
+
+    properties:
+      reg:
+        maxItems: 1
+
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - slim-ifc-dev
+  - interrupts
+  - interrupt-controller
+  - clock-frequency
+  - clock-output-names
+  - qcom,micbias1-microvolts
+  - qcom,micbias2-microvolts
+  - qcom,micbias3-microvolts
+  - qcom,micbias4-microvolts
+  - "#interrupt-cells"
+  - "#clock-cells"
+  - "#sound-dai-cells"
+  - "#address-cells"
+  - "#size-cells"
+
+examples:
+  - |
+    codec@1,0{
+        compatible = "slim217,250";
+        reg  = <1 0>;
+        reset-gpios = <&tlmm 64 0>;
+        slim-ifc-dev  = <&wcd9340_ifd>;
+        #sound-dai-cells = <1>;
+        interrupt-parent = <&tlmm>;
+        interrupts = <54 4>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+        #clock-cells = <0>;
+        clock-frequency = <9600000>;
+        clock-output-names = "mclk";
+        qcom,micbias1-microvolts = <1800000>;
+        qcom,micbias2-microvolts = <1800000>;
+        qcom,micbias3-microvolts = <1800000>;
+        qcom,micbias4-microvolts = <1800000>;
+        clock-names = "extclk";
+        clocks = <&rpmhcc 2>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        pinctrl@42 {
+            reg = <0x42 0x2>;
+        };
+    };
+
+...
-- 
2.21.0

