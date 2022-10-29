Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7AC261225B
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Oct 2022 13:28:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbiJ2L2S (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 29 Oct 2022 07:28:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbiJ2L2R (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 Oct 2022 07:28:17 -0400
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDDF368893;
        Sat, 29 Oct 2022 04:28:12 -0700 (PDT)
Received: from canpemm500004.china.huawei.com (unknown [172.30.72.53])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Mzxss147wzFq7m;
        Sat, 29 Oct 2022 19:25:21 +0800 (CST)
Received: from localhost (10.175.101.6) by canpemm500004.china.huawei.com
 (7.192.104.92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Sat, 29 Oct
 2022 19:28:10 +0800
From:   Weilong Chen <chenweilong@huawei.com>
To:     <chenweilong@huawei.com>, <linus.walleij@linaro.org>,
        <brgl@bgdev.pl>, <f.fangjian@huawei.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
Subject: [PATCH next v3 2/2] dt-bindings: gpio: add entry for hisilicon,ascend910-gpio
Date:   Sat, 29 Oct 2022 19:35:42 +0800
Message-ID: <20221029113542.170210-2-chenweilong@huawei.com>
X-Mailer: git-send-email 2.31.GIT
In-Reply-To: <20221029113542.170210-1-chenweilong@huawei.com>
References: <20221029113542.170210-1-chenweilong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 canpemm500004.china.huawei.com (7.192.104.92)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add the new compatible for HiSilicon gpio controller driver.

Signed-off-by: Weilong Chen <chenweilong@huawei.com>
---
Change since v2:
- Drop "|" in description
- Same style of quotes
- Same order properties
Link: https://lore.kernel.org/lkml/20221028022453.163186-2-chenweilong@huawei.com/

 .../gpio/hisilicon,ascend910-gpio.yaml        | 56 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/hisilicon,ascend910-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/hisilicon,ascend910-gpio.yaml b/Documentation/devicetree/bindings/gpio/hisilicon,ascend910-gpio.yaml
new file mode 100644
index 000000000000..735d97d645a0
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/hisilicon,ascend910-gpio.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/hisilicon,ascend910-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HiSilicon common GPIO controller
+
+maintainers:
+  - Jay Fang <f.fangjian@huawei.com>
+
+description:
+  The HiSilicon common GPIO controller can be used for many different
+  types of SoC such as Huawei Ascend AI series chips.
+
+properties:
+  compatible:
+    const: hisilicon,ascend910-gpio
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
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
+required:
+  - compatible
+  - reg
+  - interrupts
+  - gpio-controller
+  - "#gpio-cells"
+  - ngpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    gpio@840d0000 {
+      compatible = "hisilicon,ascend910-gpio";
+      reg = <0x840d0000 0x1000>;
+      ngpios = <32>;
+      gpio-controller;
+      #gpio-cells = <2>;
+      interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index d42e34d1e8e2..74ac2e7a8e4b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9212,6 +9212,7 @@ HISILICON GPIO DRIVER
 M:	Jay Fang <f.fangjian@huawei.com>
 L:	linux-gpio@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/gpio/hisilicon,ascend910-gpio.yaml
 F:	drivers/gpio/gpio-hisi.c
 
 HISILICON HIGH PERFORMANCE RSA ENGINE DRIVER (HPRE)
-- 
2.31.GIT

