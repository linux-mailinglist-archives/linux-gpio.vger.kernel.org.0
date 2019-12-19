Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA718125DED
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2019 10:45:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726757AbfLSJpA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Dec 2019 04:45:00 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:40572 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726609AbfLSJpA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Dec 2019 04:45:00 -0500
Received: by mail-lj1-f194.google.com with SMTP id u1so5472762ljk.7;
        Thu, 19 Dec 2019 01:44:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NSehp+Csx2//FuzVBj6xVMQdFCBzIJOetbQwBhRQZmg=;
        b=S82YMQ+mXIHh8d9JK/ASuPCpUfAh4X05KvzhON3p4qvb7HKA+3Ne1TLg7m/fsWfqPb
         OShTo0S9nQbLePDUBbwbL7zkKVYdk4z4ICGFU4moKQvI30dKfbi7YB72k5it1ZuvYRTk
         mDQwsA2lvZfTMpKeJmV8o9eA2/qFdSl26bcU/iSJMRdJnRAZu+a0YCH1tGeWfh40++O0
         O1pasVfYYaQ+QfzVhve/dntAR5AN40BNR3b/GJlLFHbKsKAVfjn/3bYom/0P7E74WIUf
         e8qHObApEMijzw3Ym40bkTwKjjz2bpu9REu3rkFLSIvP/QOdfS+ObZbvCtlmtDZDgAVI
         0crw==
X-Gm-Message-State: APjAAAWl0+iHdEMjA1hYhj5UkNwdM1SFN5QIjK00ubv8agiCcUfb7bfP
        c28Fdd4Bnfuogx1Wt/iKL0c=
X-Google-Smtp-Source: APXvYqxlWKSoBe9JFhNqgFRSL+sdviCsdpdkP7A1dHFdduzmfyRbUkLIY8ufv8vkr2yR3jnjhs+Fiw==
X-Received: by 2002:a2e:8797:: with SMTP id n23mr5148240lji.176.1576748697699;
        Thu, 19 Dec 2019 01:44:57 -0800 (PST)
Received: from localhost.localdomain (dyt4gctb359myxd0pkwmt-4.rev.dnainternet.fi. [2001:14bb:430:5140:37cf:5409:8fcc:4495])
        by smtp.gmail.com with ESMTPSA id u16sm2481893ljo.22.2019.12.19.01.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 01:44:57 -0800 (PST)
Date:   Thu, 19 Dec 2019 11:44:50 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [PATCH v7 01/12] dt-bindings: leds: ROHM BD71282 PMIC LED driver
Message-ID: <389367d4bb5283420e22f078c60e0805d23183ee.1576745635.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1576745635.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1576745635.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Document ROHM BD71828 PMIC LED driver device tree bindings.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---

No changes since v6

 .../bindings/leds/rohm,bd71828-leds.yaml      | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/rohm,bd71828-leds.yaml

diff --git a/Documentation/devicetree/bindings/leds/rohm,bd71828-leds.yaml b/Documentation/devicetree/bindings/leds/rohm,bd71828-leds.yaml
new file mode 100644
index 000000000000..b50f4bcc98f1
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/rohm,bd71828-leds.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/rohm,bd71828-leds.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ROHM BD71828 Power Management Integrated Circuit LED driver
+
+maintainers:
+  - Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
+
+description: |
+  This module is part of the ROHM BD71828 MFD device. For more details
+  see Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml.
+
+  The LED controller is represented as a sub-node of the PMIC node on the device
+  tree.
+
+  The device has two LED outputs referred as GRNLED and AMBLED in data-sheet.
+
+select: false
+
+properties:
+  compatible:
+    const: rohm,bd71828-leds
+
+patternProperties:
+  "^led-[1-2]$":
+    type: object
+    description:
+      Properties for a single LED.
+    properties:
+      #allOf:
+        #- $ref: "common.yaml#"
+      rohm,led-compatible:
+        description: LED identification string
+        allOf:
+          - $ref: "/schemas/types.yaml#/definitions/string"
+          - enum:
+            - bd71828-ambled
+            - bd71828-grnled
+      function:
+        description:
+          Purpose of LED as defined in dt-bindings/leds/common.h
+        $ref: "/schemas/types.yaml#/definitions/string"
+      color:
+        description:
+          LED colour as defined in dt-bindings/leds/common.h
+        $ref: "/schemas/types.yaml#/definitions/uint32"
+
+required:
+  - compatible
-- 
2.21.0


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
