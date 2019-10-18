Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BC15DBA8F
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2019 02:20:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503843AbfJRAUC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Oct 2019 20:20:02 -0400
Received: from mail-wm1-f46.google.com ([209.85.128.46]:34313 "EHLO
        mail-wm1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2503824AbfJRAT7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Oct 2019 20:19:59 -0400
Received: by mail-wm1-f46.google.com with SMTP id y135so8124834wmc.1
        for <linux-gpio@vger.kernel.org>; Thu, 17 Oct 2019 17:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n4me+CazbBGjq6Vioao9/Gq1F8FYE0afxuUK4F7+V3U=;
        b=oCiIsJX6F+gH7PaC1dF1wSvdbr3nvuj/rpASrcfUBXDPa9TLVMRNynYfDh1s9gpLC+
         MaXA2dVh2of8i+tP8nNdU/uDgyq2kMPAJolA10VHH+a+6JvIzkzTQmK4wSjglc8Yhzq7
         pz2gDZ/udH1P7WEFFQyV9EPp0zeIe57FdALWZ2IjTqYFUzXkD3k+62elQAkQCUw8L21i
         QDJh//t0JwTcz4/+vgvq6iKNNu3hyYOQn+Lli+O6vbvIf0e61v5ZQRIjVhYWi5QFMxc7
         xtfEKSjK9w0VEDfWRcUILT0rBr4D3w1HJ+lIc2wM6l1EhTqhU+TPsEEcvWLoATzQ0nec
         H08g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n4me+CazbBGjq6Vioao9/Gq1F8FYE0afxuUK4F7+V3U=;
        b=auPV/2QXimTvSuTrsIjdu8PxaUgi5OrMIuLB3rH/X15gixACi8oqnaf5vMWQCyreeQ
         bUozjSXZ51hWVwCi1oaznLCPAaZBayaG5H6F0WqvDdsC2IHzgmWg0bXrQy0HCZBq0WYV
         a9vBmcLd+5943pS665ZpLB4sTALVdq2qsBxWu+9U5IrbsYvpagqNaEozHC9E2c8StPEu
         1B+wiobCwmy7oA0hPu3RvtMa6zkbwxYWmlw6Kn8nYRYXBWzbnvUHBcuHrD/sOFZPpBg6
         TnRXzsWIC7Qdo/4T18B0j37YBa+kUTK0Zekz+uGAAv3zxHHIxuToNBV5MG1ku0bwUxf6
         OPPw==
X-Gm-Message-State: APjAAAU28+OgAZ9PiqmB7H7UMkKJCSYjnIahw3eICpHhQolARxbaZDqS
        x2oCecUcLHw2sPfjOHA5S5chQg==
X-Google-Smtp-Source: APXvYqzWAgCatyNQxkXKKY8raBcd52rYsoa3mCt4DEBAm0RxIzO4n1R2fxlWDSrxfZb7wX0q0Gcm8w==
X-Received: by 2002:a1c:740a:: with SMTP id p10mr5178592wmc.130.1571357997300;
        Thu, 17 Oct 2019 17:19:57 -0700 (PDT)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id z189sm4851248wmc.25.2019.10.17.17.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 17:19:56 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     robh@kernel.org, broonie@kernel.org, linus.walleij@linaro.org,
        lee.jones@linaro.org
Cc:     vinod.koul@linaro.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        spapothi@codeaurora.org, bgoswami@codeaurora.org,
        linux-gpio@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 01/11] ASoC: dt-bindings: add dt bindings for WCD9340/WCD9341 audio codec
Date:   Fri, 18 Oct 2019 01:18:39 +0100
Message-Id: <20191018001849.27205-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191018001849.27205-1-srinivas.kandagatla@linaro.org>
References: <20191018001849.27205-1-srinivas.kandagatla@linaro.org>
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
 .../bindings/sound/qcom,wcd934x.yaml          | 169 ++++++++++++++++++
 1 file changed, 169 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
new file mode 100644
index 000000000000..299d6b96c339
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
@@ -0,0 +1,169 @@
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
+  qcom,micbias1-millivolt:
+    description: Voltage betwee 1800mv-2850mv for micbias1 output
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+
+  qcom,micbias2-millivolt:
+    description: Voltage betwee 1800mv-2850mv for micbias2 output
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+
+  qcom,micbias3-millivolt:
+    description: Voltage betwee 1800mv-2850mv for micbias3 output
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+
+  qcom,micbias4-millivolt:
+    description: Voltage betwee 1800mv-2850mv for micbias4 output
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
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
+      documented in there respective bindings.
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
+  - qcom,micbias1-millivolt
+  - qcom,micbias2-millivolt
+  - qcom,micbias3-millivolt
+  - qcom,micbias4-millivolt
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
+        qcom,micbias1-millivolt = <1800>;
+        qcom,micbias2-millivolt = <1800>;
+        qcom,micbias3-millivolt = <1800>;
+        qcom,micbias4-millivolt = <1800>;
+        clock-names = "extclk";
+        clocks = <&rpmhcc 2>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        wcdpinctrl@42 {
+            reg = <0x42 0x2>;
+        };
+    };
+
+...
-- 
2.21.0

