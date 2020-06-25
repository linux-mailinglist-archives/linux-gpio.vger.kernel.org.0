Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2E34209AEC
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2020 10:00:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390370AbgFYIAl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Jun 2020 04:00:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726930AbgFYIAl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Jun 2020 04:00:41 -0400
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [IPv6:2001:67c:2050::465:102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30FB6C061573;
        Thu, 25 Jun 2020 01:00:41 -0700 (PDT)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mout-p-102.mailbox.org (Postfix) with ESMTPS id 49ssrl45D3zKmhM;
        Thu, 25 Jun 2020 10:00:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gorani.run; s=MBO0001;
        t=1593072037;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=KsVtsKXWjb9tO8tIRJnY/G5IWD6O3/lf2qooOuvtG7M=;
        b=kgJJLWN0GF7S7PuFJlCVsbUEp5UJOogFD1jrJnB+i72/fjMBAsDbhrjpYBiCQZubR0wVXN
        xKIUEdWDdLdryqKCb/6yegwRCIaMXdN+crG4DIW1VcegRBsdx5MQkQAOw2atoWrXqwYb5N
        VvPWHu2U49YKCmm0aUo2AnQhC8yoA6qL/batu+hb6c/sKakLy6XFXkgg3HJNgh/1TCM5UF
        te8G4bGrLxSVQH+OxIXy0MghHpIDCZcgVWd0eCCgp7nAxiTJldJi0U1IlJOQ4nyrRm+gva
        jhExuwlN4xJcm5FpSaFFzrFAVPXJUQj/YqzvMUHwtZo3LlOscjR/JD10vs58rw==
Received: from smtp2.mailbox.org ([80.241.60.241])
        by spamfilter05.heinlein-hosting.de (spamfilter05.heinlein-hosting.de [80.241.56.123]) (amavisd-new, port 10030)
        with ESMTP id kSFI7Ov2nZua; Thu, 25 Jun 2020 10:00:35 +0200 (CEST)
From:   Sungbo Eo <mans0n@gorani.run>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Sungbo Eo <mans0n@gorani.run>
Subject: [PATCH v2 2/2] dt-bindings: gpio: Add bindings for NXP PCA9570
Date:   Thu, 25 Jun 2020 16:59:57 +0900
Message-Id: <20200625075957.364273-1-mans0n@gorani.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-SPAM-Probability: 6
X-Rspamd-Score: 1.00 / 15.00 / 15.00
X-Rspamd-Queue-Id: 241F21793
X-Rspamd-UID: a9cf0b
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds device tree bindings for the NXP PCA9570,
a 4-bit I2C GPO expander.

Signed-off-by: Sungbo Eo <mans0n@gorani.run>
---
I don't feel I can really maintain this driver, but it seems all yaml docs
have a maintainers field so I just added it...
---
 .../bindings/gpio/gpio-pca9570.yaml           | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml

diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml b/Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml
new file mode 100644
index 000000000000..996b0ed2f58f
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml
@@ -0,0 +1,42 @@
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
+    gpio@24 {
+        compatible = "nxp,pca9570";
+        reg = <0x24>;
+        gpio-controller;
+        #gpio-cells = <2>;
+    };
+
+...
-- 
2.27.0

