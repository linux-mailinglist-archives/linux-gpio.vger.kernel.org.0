Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E10062F109
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Nov 2022 10:22:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241890AbiKRJWs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Nov 2022 04:22:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241154AbiKRJWr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Nov 2022 04:22:47 -0500
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A0D1AE58;
        Fri, 18 Nov 2022 01:22:46 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2AI9MSs2076906;
        Fri, 18 Nov 2022 03:22:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1668763348;
        bh=PztJmjGkW1moUkpvQ3xLb4UIDuIpX9uLpfJ7B73luSk=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Rdzv13JnUrJsYcQ4/ZOtPFvdt3GfTzy7v0ebFbaTVQwK2ar3BPly1UxEylXlC7be+
         afatuRruKP9p7r9gQQVbIhrfdz9QMvCzFfkYme4F6AX/C/gnWAvv3p2Wtng+tE9fND
         Te3uOb4hV6yeT7iDZBunwFAf7ZfF6ms5slTYWfAg=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2AI9MSSm029902
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 18 Nov 2022 03:22:28 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 18
 Nov 2022 03:22:28 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 18 Nov 2022 03:22:28 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2AI9MPHY027889;
        Fri, 18 Nov 2022 03:22:27 -0600
From:   Matt Ranostay <mranostay@ti.com>
To:     <vigneshr@ti.com>, <robh@kernel.org>,
        <krzysztof.kozlowski@linaro.org>, <a.zummo@towertech.it>,
        <linus.walleij@linaro.org>, <lee@kernel.org>, <brgl@bgdev.pl>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>, Matt Ranostay <mranostay@ti.com>
Subject: [PATCH v4 1/4] Documentation: ti,tps6594: Add DT bindings for the TPS6594x PMIC
Date:   Fri, 18 Nov 2022 01:22:15 -0800
Message-ID: <20221118092218.480147-2-mranostay@ti.com>
X-Mailer: git-send-email 2.38.GIT
In-Reply-To: <20221118092218.480147-1-mranostay@ti.com>
References: <20221118092218.480147-1-mranostay@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add documentation for the TPS6594x PMIC including its RTC and GPIO
functionalities.

Signed-off-by: Matt Ranostay <mranostay@ti.com>
---
 .../devicetree/bindings/mfd/ti,tps6594.yaml   | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/ti,tps6594.yaml

diff --git a/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml b/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
new file mode 100644
index 000000000000..81613bcef39d
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/ti,tps6594x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TPS6594x Power Management Integrated Circuit (PMIC)
+
+maintainers:
+  - Keerthy <j-keerthy@ti.com>
+
+properties:
+  compatible:
+    enum:
+      - ti,tps6594
+
+  reg:
+    const: 0x48
+
+  ti,system-power-controller:
+    type: boolean
+    description: PMIC is controlling the system power.
+
+  rtc:
+    type: object
+    $ref: /schemas/rtc/rtc.yaml#
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: ti,tps6594-rtc
+
+  gpio:
+    type: object
+    unevaluatedProperties: false
+    properties:
+      compatible:
+        const: ti,tps6594x-gpio
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    i2c0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic: pmic@48 {
+            compatible = "ti,tps6594";
+            reg = <0x48>;
+
+            rtc {
+                compatible = "ti,tps6594-rtc";
+            };
+
+            gpio {
+                compatible = "ti,tps6594-gpio";
+            };
+        };
+    };
+
+...
-- 
2.38.GIT

