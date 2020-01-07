Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C952A13271A
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 14:09:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728081AbgAGNJK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 08:09:10 -0500
Received: from mail-wr1-f42.google.com ([209.85.221.42]:34828 "EHLO
        mail-wr1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728043AbgAGNJI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 08:09:08 -0500
Received: by mail-wr1-f42.google.com with SMTP id g17so53824154wro.2
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2020 05:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nT9BtMpP3rVSAKnjxKAWmSKBNURpP6V+aXle8yg5Oj0=;
        b=kT/gskwVQaYtPacWxisTNOdjeZ02Fchdla9uUAdtL+pjp25BP78f5U9Qmfzyz1p5Sh
         ew1s+3kig4PWGT0vapCJGh6o73uU/2MAgsyS6FzbGJV0/HyaJjnTJz/NtCvNMCshig0j
         X2NBmFHuKqXGWro+MC4e/CLTJRNWjN/Is3fWOouplWxAyfh7LIQCQPhgdGRnsabhC/5p
         L+FogJDvGmAy4+o0uhqcuyHIMwJVbYMTvjZKf5aXelqTB5XtBAZi+yhhYjE3SZ0m37XJ
         8T9Zs+k3+k7TfZ7gp0vu+/INSQ/evd0zhppLA6XgUcwV0AhNjjxyZEUEqU7nLrKf+wcs
         3hLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nT9BtMpP3rVSAKnjxKAWmSKBNURpP6V+aXle8yg5Oj0=;
        b=D1G6vh5qIP2GsaSOY821SWjnC+2MPP3too1kumFaIg30vjHmqwZKYFIzsPSv6rxI5E
         SCtZRj2/aDpfxyL2jfm+wDTlzv8U6o1loRZxasNDzn39dhhie+sUa+ivHnI68qmEH7g5
         d54ilfdRvplgQijx+ix3gWC+SxeJwUZdl/8bqJ+9yZoCLsS6M+gFvN98DDdQCtmZxxs0
         qupj3D7edyZZ80XwEkotGqY/vdru0mC6XQIczJLcgOw1X4OMN4ij8mg3o1TuZfwNIHdM
         Lkqe4m1ub8Na+OXrVCLdWw1SQxRmkP4xIwCER35WhTy/4RgnrfHfgwwjuCM0VGt8ZTLB
         Mdcg==
X-Gm-Message-State: APjAAAXRwdC+i+mSMEAdQPY1Ou8eZ3f2JfEjOAYBJX3x6S2Xzr8u5Z1y
        7p4e/zr2UMbP6WAsuyeLwwREHw==
X-Google-Smtp-Source: APXvYqxttENx/9O3T41IE34zb2g4P0hFFOZO5gZe8gaTKfCLyHIx/ob0InWWWjitUCuimNSjGRWkZw==
X-Received: by 2002:adf:fa12:: with SMTP id m18mr105006068wrr.309.1578402545458;
        Tue, 07 Jan 2020 05:09:05 -0800 (PST)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id b18sm7287035wru.50.2020.01.07.05.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 05:09:04 -0800 (PST)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Cc:     robh@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, spapothi@codeaurora.org,
        bgoswami@codeaurora.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v7 1/2] dt-bindings: gpio: wcd934x: Add bindings for gpio
Date:   Tue,  7 Jan 2020 13:08:43 +0000
Message-Id: <20200107130844.20763-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200107130844.20763-1-srinivas.kandagatla@linaro.org>
References: <20200107130844.20763-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Qualcomm Technologies Inc WCD9340/WCD9341 Audio Codec has integrated
gpio controller to control 5 gpios on the chip. This patch adds
required device tree bindings for it.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../bindings/gpio/qcom,wcd934x-gpio.yaml      | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/qcom,wcd934x-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/qcom,wcd934x-gpio.yaml b/Documentation/devicetree/bindings/gpio/qcom,wcd934x-gpio.yaml
new file mode 100644
index 000000000000..32a566ec3558
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/qcom,wcd934x-gpio.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/qcom,wcd934x-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: WCD9340/WCD9341 GPIO controller
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description: |
+  Qualcomm Technologies Inc WCD9340/WCD9341 Audio Codec has integrated
+  gpio controller to control 5 gpios on the chip.
+
+properties:
+  compatible:
+    enum:
+      - qcom,wcd9340-gpio
+      - qcom,wcd9341-gpio
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - "#gpio-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    wcdgpio: gpio@42 {
+        compatible = "qcom,wcd9340-gpio";
+        reg = <0x042 0x2>;
+        gpio-controller;
+        #gpio-cells = <2>;
+    };
+
+...
-- 
2.21.0

