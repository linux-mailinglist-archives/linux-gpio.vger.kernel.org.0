Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0727713BBCC
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2020 10:03:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729219AbgAOJDT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jan 2020 04:03:19 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:42418 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729066AbgAOJDS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jan 2020 04:03:18 -0500
Received: by mail-lf1-f67.google.com with SMTP id y19so12089260lfl.9;
        Wed, 15 Jan 2020 01:03:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ImkVEgzG+AVTz091gkYI1+8C2pUc7i2OvPU3/SP/nrM=;
        b=cgTYuwr3xLk9XQcd59/ssHJ+mDrE/mjqvWA9u1BDJ6QcopdMDTmc3gBVJBY+4wl6DO
         mfxB8SC2fzn36fIK4x0TpJxJavYMi2RMV5eQS8rcsIHxyrPqZb7mVJ0EcO42/u2Q2SED
         BisHc4Bwu27QoQALrMYoRRVwZAGlIK9A7o8bfiV02Ew9zD6HQ9fMX170YWsrFVieKKkQ
         ONPB2Eu04kPLFAOYRLsqxTjp6TG5khFI9S8bZIEtuK+Op5JwNEYarScpdreBTBbOo31o
         n+hVbZM7w4ELv2eARJt83G6mdLoes/WmQcl/myTZb40FA0EVraOMyLeA19L4raRvHMoy
         eqpw==
X-Gm-Message-State: APjAAAUm54TjxO7vu0GDqnOoOcDq4qwPnCvrS9D+/OQB+3lNPskfhMaI
        rigXrtQvq3oV5Hhths6ZmCE=
X-Google-Smtp-Source: APXvYqx/WL6/RMXIsHXpU3M+ozqDBQ5t8goXRThRHIn1SDc80PBI1w/6CiJnLMiKzB6Cm6CmJKwh6g==
X-Received: by 2002:a19:2213:: with SMTP id i19mr4137407lfi.83.1579078996070;
        Wed, 15 Jan 2020 01:03:16 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id y11sm9834585lfc.27.2020.01.15.01.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 01:03:15 -0800 (PST)
Date:   Wed, 15 Jan 2020 11:03:02 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Lee Jones <lee.jones@linaro.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
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
Subject: [RESEND PATCH v9 01/12] dt-bindings: leds: ROHM BD71282 PMIC LED
 driver
Message-ID: <af1f78b79e5379d488bd946b6581924246981538.1579078681.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1579078681.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1579078681.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Document ROHM BD71828 PMIC LED driver device tree bindings.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Pavel Machek <pavel@ucw.cz>
---

No changes since v8

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
