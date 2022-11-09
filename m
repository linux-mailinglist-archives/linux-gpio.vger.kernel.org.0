Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9245A622435
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Nov 2022 07:56:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbiKIG4P (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Nov 2022 01:56:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbiKIG4P (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Nov 2022 01:56:15 -0500
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41F941D0D8;
        Tue,  8 Nov 2022 22:56:14 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2A96tv8D095409;
        Wed, 9 Nov 2022 00:55:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1667976957;
        bh=mKUDdJKT+Ky4ObyLz8kIj9aWEi7c/KxZ4F/S8X4K74o=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=WbSrjh4/UqNEMRV6Z2veW6wpKAbPfkWZB7xzPrGvCZF/UYpYEhKHvsCVFs1TPhJLi
         CWH4rczVPCPN8ne/X85/LAskI4kamXVtXQC6CitL4dKFXQan+FuuY+4Q+h3M9cT/re
         WT0jsdqebD8kpC7hSkOiuFd9wBbN1WfTWnheWGEc=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2A96tvUS091524
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 9 Nov 2022 00:55:57 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Wed, 9 Nov
 2022 00:55:57 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Wed, 9 Nov 2022 00:55:57 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2A96tsUq029738;
        Wed, 9 Nov 2022 00:55:56 -0600
From:   Matt Ranostay <mranostay@ti.com>
To:     <brgl@bgdev.pl>, <lee@kernel.org>, <linus.walleij@linaro.org>,
        <kristo@kernel.org>, <alexandre.belloni@bootlin.com>,
        <a.zummo@towertech.it>, <krzysztof.kozlowski+dt@linaro.org>,
        <robh@kernel.org>, <vigneshr@ti.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, Matt Ranostay <mranostay@ti.com>
Subject: [PATCH v3 1/7] Documentation: tps6594x: Add DT bindings for the TPS6594x PMIC
Date:   Tue, 8 Nov 2022 22:55:40 -0800
Message-ID: <20221109065546.24912-2-mranostay@ti.com>
X-Mailer: git-send-email 2.38.GIT
In-Reply-To: <20221109065546.24912-1-mranostay@ti.com>
References: <20221109065546.24912-1-mranostay@ti.com>
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

Signed-off-by: Matt Ranostay <mranostay@ti.com>
---
 .../devicetree/bindings/mfd/ti,tps6594x.yaml  | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/ti,tps6594x.yaml

diff --git a/Documentation/devicetree/bindings/mfd/ti,tps6594x.yaml b/Documentation/devicetree/bindings/mfd/ti,tps6594x.yaml
new file mode 100644
index 000000000000..be87f0037bf9
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/ti,tps6594x.yaml
@@ -0,0 +1,67 @@
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
+    contains:
+      enum:
+        - ti,tps6594x
+
+  reg:
+    const: 0x48
+    description: I2C slave address
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
+        const: ti,tps6594x-rtc
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
+            compatible = "ti,tps6594x";
+            reg = <0x48>;
+
+            rtc {
+                compatible = "ti,tps6594x-rtc";
+            };
+
+            gpio {
+                compatible = "ti,tps6594x-gpio";
+            };
+        };
+    };
+
+...
-- 
2.38.GIT

