Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D1E620F91E
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2020 18:10:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728929AbgF3QKE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jun 2020 12:10:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726117AbgF3QKE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jun 2020 12:10:04 -0400
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [IPv6:2001:67c:2050::465:201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2C4CC061755;
        Tue, 30 Jun 2020 09:10:03 -0700 (PDT)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:105:465:1:1:0])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mout-p-201.mailbox.org (Postfix) with ESMTPS id 49x8T56KSVzQlL5;
        Tue, 30 Jun 2020 18:10:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gorani.run; s=MBO0001;
        t=1593533399;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/GvbcSzf93t3Xo8PgTLO0RFe1bXEAMDeF7vWz9G0lXY=;
        b=Ysv+xs4V8Jruw1SxiPoUfjc6pgAqz91VNB8/TGmbrM6bCDpgr6byLNxH1oBz6+X2FsYugj
        6f6t+GJh9046R2sqSJhTQIF2xTrIHb7qWcjFOeHlMoUMHlVTWQ4T0zDXG/gsmV8Og0bN4B
        3S36A6pgFxS+hbBuFkX1/fjP05xLfnjy106gR+ZLXSi1d8t5CIY624T6CoGqn47rH1UmUH
        auD5wx+t8YI2amB2gt9qAngvycTsQPaTWMkvAeRoFAABUXHsFSCctSbcbQetHBC63cnRkI
        7lkQEk9J0hmKRCt+PyKgHUCdZYVnlu4DMNZBgk900GOE4wcRHY224Lf2Mzj+Vg==
Received: from smtp1.mailbox.org ([80.241.60.240])
        by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172]) (amavisd-new, port 10030)
        with ESMTP id 5PLJZsftWcGX; Tue, 30 Jun 2020 18:09:57 +0200 (CEST)
From:   Sungbo Eo <mans0n@gorani.run>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Sungbo Eo <mans0n@gorani.run>
Subject: [PATCH v3 2/2] dt-bindings: gpio: Add bindings for NXP PCA9570
Date:   Wed,  1 Jul 2020 01:09:34 +0900
Message-Id: <20200630160934.1197066-1-mans0n@gorani.run>
In-Reply-To: <20200630160736.1196697-1-mans0n@gorani.run>
References: <20200630160736.1196697-1-mans0n@gorani.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-SPAM-Probability: 8
X-Rspamd-Score: 1.27 / 15.00 / 15.00
X-Rspamd-Queue-Id: 706AB17FE
X-Rspamd-UID: c515cf
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds device tree bindings for the NXP PCA9570,
a 4-bit I2C GPO expander.

Signed-off-by: Sungbo Eo <mans0n@gorani.run>
---
v3:
* fixed dt_binding_check error

v2:
I don't feel I can really maintain this driver, but it seems all yaml docs
have a maintainers field so I just added it...
---
 .../bindings/gpio/gpio-pca9570.yaml           | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml b/Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml
new file mode 100644
index 000000000000..338c5312a106
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/gpio-pca9570.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: PCA9570 I2C GPO expander
+
+maintainers:
+  - Sungbo Eo <mans0n@gorani.run>
+
+properties:
+  compatible:
+    enum:
+      - nxp,pca9570
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
+    i2c0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        gpio@24 {
+            compatible = "nxp,pca9570";
+            reg = <0x24>;
+            gpio-controller;
+            #gpio-cells = <2>;
+        };
+    };
+
+...
-- 
2.27.0

