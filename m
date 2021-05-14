Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 932F3380998
	for <lists+linux-gpio@lfdr.de>; Fri, 14 May 2021 14:33:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233202AbhENMef (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 May 2021 08:34:35 -0400
Received: from mx2.suse.de ([195.135.220.15]:41256 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233546AbhENMee (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 14 May 2021 08:34:34 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 1439FB071;
        Fri, 14 May 2021 12:33:22 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/2] dt-bindings: gpio: Add devicetree binding for IDT 79RC32434 GPIO controller
Date:   Fri, 14 May 2021 14:33:08 +0200
Message-Id: <20210514123309.134048-2-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210514123309.134048-1-tsbogend@alpha.franken.de>
References: <20210514123309.134048-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add YAML devicetree binding for IDT 79RC32434 GPIO controller

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
Changes in v5:
 - made interrupt controller optional
 - made ngpios setting optional

Changes in v4:
 - renamed to idt,32434-gpio this time for real

Changes in v3:
 - renamed to idt,32434-gpio
 - drop ngpio description
 - use gpio0: gpio@50004 in example


 .../bindings/gpio/idt,32434-gpio.yaml         | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/idt,32434-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/idt,32434-gpio.yaml b/Documentation/devicetree/bindings/gpio/idt,32434-gpio.yaml
new file mode 100644
index 000000000000..d38de8144656
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/idt,32434-gpio.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/idt,32434-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: IDT 79RC32434 GPIO controller
+
+maintainers:
+  - Thomas Bogendoerfer <tsbogend@alpha.franken.de>
+
+properties:
+  compatible:
+    const: idt,32434-gpio
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: gpio
+      - const: pic
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+  ngpios:
+    minimum: 1
+    maximum: 32
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - gpio-controller
+  - "#gpio-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    gpio0: gpio@50004 {
+        compatible = "idt,32434-gpio";
+        reg = <0x50004 0x10>, <0x38030 0x0c>;
+        reg-names = "gpio", "pic";
+
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        interrupt-parent = <&cpuintc>;
+        interrupts = <6>;
+
+        gpio-controller;
+        #gpio-cells = <2>;
+
+        ngpios = <14>;
+    };
-- 
2.29.2

