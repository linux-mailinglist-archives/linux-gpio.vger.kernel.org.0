Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B7C056B58E
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jul 2022 11:34:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237210AbiGHJeP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jul 2022 05:34:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237315AbiGHJeO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jul 2022 05:34:14 -0400
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 195E32CE20;
        Fri,  8 Jul 2022 02:34:11 -0700 (PDT)
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2687m3hL003535;
        Fri, 8 Jul 2022 05:34:07 -0400
Received: from nwd2mta4.analog.com ([137.71.173.58])
        by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3h5tu88xu0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 08 Jul 2022 05:34:06 -0400
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
        by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 2689Y5KW061351
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 8 Jul 2022 05:34:05 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Fri, 8 Jul 2022
 05:34:04 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 8 Jul 2022 05:34:04 -0400
Received: from nsa.ad.analog.com ([10.44.3.51])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 2689Xi8i017826;
        Fri, 8 Jul 2022 05:33:58 -0400
From:   =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To:     <devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-input@vger.kernel.org>
CC:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 05/10] dt-bindings: input: adp5588-keys: add bindings
Date:   Fri, 8 Jul 2022 11:34:43 +0200
Message-ID: <20220708093448.42617-6-nuno.sa@analog.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220708093448.42617-1-nuno.sa@analog.com>
References: <20220708093448.42617-1-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: 9bcHMhFJod1PBXCyfrKEUObkoVKqFa9E
X-Proofpoint-ORIG-GUID: 9bcHMhFJod1PBXCyfrKEUObkoVKqFa9E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-08_08,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 clxscore=1015 phishscore=0 malwarescore=0
 spamscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207080035
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add device tree bindings for the adp5588-keys driver.

Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 .../bindings/input/adi,adp5588-keys.yaml      | 110 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 111 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/adi,adp5588-keys.yaml

diff --git a/Documentation/devicetree/bindings/input/adi,adp5588-keys.yaml b/Documentation/devicetree/bindings/input/adi,adp5588-keys.yaml
new file mode 100644
index 000000000000..c079af8a063d
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/adi,adp5588-keys.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/adi,adp5588-keys.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices ADP5588 Keypad Controller
+
+maintainers:
+  - Nuno Sá <nuno.sa@analog.com>
+
+description: |
+  Analog Devices Mobile I/O Expander and QWERTY Keypad Controller
+  https://www.analog.com/media/en/technical-documentation/data-sheets/ADP5588.pdf
+
+allOf:
+  - $ref: "/schemas/input/matrix-keymap.yaml#"
+  - $ref: input.yaml#
+
+properties:
+  compatible:
+    enum:
+      - adi,adp5588-keys
+      - adi,adp5587-keys
+
+  reg:
+    maxItems: 1
+
+  vcc-supply:
+    description: Supply Voltage Input
+
+  reset-gpios:
+    description:
+      If specified, it will be asserted during driver probe. As the line is
+      active low, it should be marked GPIO_ACTIVE_LOW.
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-controller:
+    description:
+      This property applies if either keypad,num-rows lower than 8 or
+      keypad,num-columns lower than 10.
+
+  '#gpio-cells':
+    const: 2
+
+  interrupt-controller:
+    description:
+      This property applies if either keypad,num-rows lower than 8 or
+      keypad,num-columns lower than 10.
+
+  '#interrupt-cells':
+    const: 2
+
+  adi,unlock-keys:
+    description:
+      Specifies a maximum of 2 keys that can be used to unlock the keypad.
+      If this property is set, the keyboard will be locked and only unlocked
+      after these keys are pressed. If only one key is set, a double click is
+      needed to unlock the keypad.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 2
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - keypad,num-rows
+  - keypad,num-columns
+  - linux,keymap
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/input/input.h>
+    #include <dt-bindings/gpio/gpio.h>
+    i2c {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          adp5588@34 {
+                  compatible = "adi,adp5588-keys";
+                  reg = <0x34>;
+
+                  vcc-supply = <&vcc>;
+                  interrupts = <21 IRQ_TYPE_EDGE_FALLING>;
+                  interrupt-parent = <&gpio>;
+                  reset-gpios = <&gpio 20 GPIO_ACTIVE_LOW>;
+
+                  keypad,num-rows = <1>;
+                  keypad,num-columns = <9>;
+                  linux,keymap = <
+                        MATRIX_KEY(0x00, 0x00, KEY_1)
+                        MATRIX_KEY(0x00, 0x01, KEY_2)
+                        MATRIX_KEY(0x00, 0x02, KEY_3)
+                        MATRIX_KEY(0x00, 0x03, KEY_4)
+                        MATRIX_KEY(0x00, 0x04, KEY_5)
+                        MATRIX_KEY(0x00, 0x05, KEY_6)
+                        MATRIX_KEY(0x00, 0x06, KEY_7)
+                        MATRIX_KEY(0x00, 0x07, KEY_8)
+                        MATRIX_KEY(0x00, 0x08, KEY_9)
+                 >;
+          };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 41037cfd75fe..f9c09f0ed0d4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -548,6 +548,7 @@ M:	Michael Hennerich <michael.hennerich@analog.com>
 S:	Supported
 W:	http://wiki.analog.com/ADP5588
 W:	https://ez.analog.com/linux-software-drivers
+F:	Documentation/devicetree/bindings/input/adi,adp5588-keys.yaml
 F:	drivers/input/keyboard/adp5588-keys.c
 
 ADP8860 BACKLIGHT DRIVER (ADP8860/ADP8861/ADP8863)
-- 
2.37.0

