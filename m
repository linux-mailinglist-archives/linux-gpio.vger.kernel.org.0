Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AE8FE9B04
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2019 12:44:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbfJ3Lok (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Oct 2019 07:44:40 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:40240 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726175AbfJ3Loj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Oct 2019 07:44:39 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9UBiTgs059015;
        Wed, 30 Oct 2019 06:44:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572435869;
        bh=BBMovQPwN74mcFSi0y56P8So/6kxuDu5k6r0sU6SXLw=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=hSMXdPdFxOES1xDG1IXcXVKqV/InxJgqTRvjwbFnOB6CmpdgptpmzOkkc9rfc48NV
         5OEvmfPEbUpsAaiLxWu/AzT4/b8OL/5FELsj6i/DOV+Z8Qkk3Ul28W/r78r4fAVQ9Y
         sxAM8ijuZFUaCZD/CYb+leFyTujIROMkIZzJQEEc=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9UBiTOM011267
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 30 Oct 2019 06:44:29 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 30
 Oct 2019 06:44:15 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 30 Oct 2019 06:44:16 -0500
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9UBiMSw006902;
        Wed, 30 Oct 2019 06:44:26 -0500
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <m.szyprowski@samsung.com>, <broonie@kernel.org>,
        <t-kristo@ti.com>, <mripard@kernel.org>, <p.zabel@pengutronix.de>
Subject: [RFC 1/2] dt-bindings: gpio: Add binding document for shared GPIO
Date:   Wed, 30 Oct 2019 13:45:29 +0200
Message-ID: <20191030114530.872-2-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191030114530.872-1-peter.ujfalusi@ti.com>
References: <20191030114530.872-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Some board design opts to use the same GPIO line routed to different
onboard components.

The GPIO in question might be a reset line, enable line or mode selection
line, etc.
The drivers for the components do not know if in some board they have
dedicated GPIO on other boards they might share a GPIO line with other
entities, not necessary from the same class:

Two codec sharing the same enable line
One codec and one amplifier sharing the same line
Regulators sharing the same line
Display panels, backlights and touchscreen controllers

And any variation of these.

There is one thing usually the board designers make sure that the level
needed for the GPIO is matching for the components.

The shared GPIO bindings can be used to describe the board level split of a
single GPIO line.

We have two cases to take care:
1. GPIO line should be LOW to enable any of the components
if any of the shared line is requested to be LOW, set the GPIO line low

2. GPIO line should be HIGH to enable any of the components
if any of the shared line is requested to be HIGH, set the GPIO line high

At the end it is:
1. logical AND for the shared lines
2. logical OR for the shared lines

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 .../devicetree/bindings/gpio/gpio-shared.yaml | 100 ++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-shared.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-shared.yaml b/Documentation/devicetree/bindings/gpio/gpio-shared.yaml
new file mode 100644
index 000000000000..30dbd8f6d2a2
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-shared.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/gpio-shared.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bindings for shared GPIO lines in board level
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+  - Bartosz Golaszewski <bgolaszewski@baylibre.com>
+  - Peter Ujfalusi <peter.ujfalusi@ti.com>
+
+description: |
+  Some board design opts to use the same GPIO line routed to different
+  onboard components.
+  
+  The GPIO in question might be a reset line, enable line or mode selection
+  line, etc.
+  The drivers for the components do not know if in some board they have
+  dedicated GPIO on other boards they might share a GPIO line with other
+  entities, not necessary from the same class:
+  
+  Two codec sharing the same enable line
+  One codec and one amplifier sharing the same line
+  Regulators sharing the same line
+  Display panels, backlights and touchscreen controllers
+  
+  And any variation of these.
+  
+  There is one thing usually the board designers make sure that the level
+  needed for the GPIO is matching for the components.
+  
+  The shared GPIO bindings can be used to describe the board level split of a
+  single GPIO line.
+  
+  We have two cases to take care:
+  1. GPIO line should be LOW to enable any of the components
+  if any of the shared line is requested to be LOW, set the GPIO line low
+  
+  2. GPIO line should be HIGH to enable any of the components
+  if any of the shared line is requested to be HIGH, set the GPIO line high
+  
+  At the end it is:
+  1. logical AND for the shared lines
+  2. logical OR for the shared lines
+
+properties:
+  compatible:
+    items:
+      - const: gpio-shared
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-controller: true
+
+  root-gpios:
+    description: |
+      The shared GPIO line
+    maxItems: 1
+
+  branch-count:
+    description: |
+      Number of users of the shared GPIO line
+    maxItems: 1
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+
+  hold-active-state:
+    description: |
+      The active level of the GPIO line for all of the clients:
+      GPIO_ACTIVE_HIGH: if the GPIO must be high for the components,
+      GPIO_ACTIVE_LOW: if the GPIO must be low for the components
+      to enable them.
+    maxItems: 1
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+  
+required:
+  - compatible
+  - "#gpio-cells"
+  - gpio-controller
+  - root-gpios
+  - branch-count
+  - hold-active-state
+
+examples:
+  - |+
+    #include <dt-bindings/gpio/gpio.h>
+    codec_reset: gpio-shared0 {
+        compatible = "gpio-shared";
+        gpio-controller;
+        #gpio-cells = <2>;
+        
+        root-gpios = <&audio_exp 0 GPIO_ACTIVE_HIGH>;
+        
+        branch-count = <2>;
+        hold-active-state = <GPIO_ACTIVE_HIGH>;
+    };
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

