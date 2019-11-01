Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E7CCEC1F4
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2019 12:32:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729541AbfKALcn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Nov 2019 07:32:43 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:42035 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725904AbfKALcn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Nov 2019 07:32:43 -0400
Received: by mail-lf1-f66.google.com with SMTP id z12so6998289lfj.9;
        Fri, 01 Nov 2019 04:32:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=uO3cZT0ic0CcFPk2pNLXwRpfiUdZPqVh9kgOa3kAJyw=;
        b=QfrW169GZbkFEDTpAy5H2KxbjfwVsM5wLUzmGroDHOM8nl6zsKi1+95aqTURU9n7gH
         OnPscFY7Rgz1Z00k7nS3MJvSli0a4ynDM10Ens6zJf8j8YpTgXyO00LqPkUY1rX4R6Pv
         IpM+bYoqyXQjDBDxGfja6Xc/c0b5e+S3TW+BSLwpERfL7ewS0alUi6rZPCuQKokobr+u
         oz/7i66tRe7rXJs+nZmvp1XfkexudV9Cz2bTRF+ftwuq/8wpKGYwwx+luNM73/yB/hbk
         qH1grvNQdEZBySjyFmg3G6kzLVZ4lP1a94oGBGZRLPmzDAt4Y1CBnpI+m9kR+9lUjUjw
         DCCg==
X-Gm-Message-State: APjAAAUAWHSQWjPc/qfEEzukvvOMFZRQn4GQYtC26KfIyPGNRz1oaDKv
        hsyG4UeXR9c98s5J7VYqx7k=
X-Google-Smtp-Source: APXvYqwuu701wti/qsoFpjZZleMwxBqLpmNNnClhS4X486Ui0XRllnIqWrzHwvFBRzbRkbuTx4NdKw==
X-Received: by 2002:a19:8c1c:: with SMTP id o28mr7025580lfd.105.1572607960686;
        Fri, 01 Nov 2019 04:32:40 -0700 (PDT)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id t22sm2436245lfg.91.2019.11.01.04.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2019 04:32:40 -0700 (PDT)
Date:   Fri, 1 Nov 2019 13:32:33 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [RFC PATCH v3 04/15] dt-bindings: leds: ROHM BD71282 PMIC LED driver
Message-ID: <f9178204ea3925b454ecbe58df4c297fec346a4f.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1572606437.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Document ROHM BD71828 PMIC LED driver device tree bindings.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---

Changes from v2 - new patch

 .../bindings/leds/rohm,leds-bd71828.yaml      | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/rohm,leds-bd71828.yaml

diff --git a/Documentation/devicetree/bindings/leds/rohm,leds-bd71828.yaml b/Documentation/devicetree/bindings/leds/rohm,leds-bd71828.yaml
new file mode 100644
index 000000000000..d8aeac9911ef
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/rohm,leds-bd71828.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/rohm,leds-bd71828.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ROHM BD71828 Power Management Integrated Circuit LED driver
+
+maintainers:
+  - Jacek Anaszewski <jacek.anaszewski@gmail.com>
+  - Pavel Machek <pavel@ucw.cz>
+  - Dan Murphy <dmurphy@ti.com>
+  - Rob Herring <robh+dt@kernel.org>
+  - Mark Rutland <mark.rutland@arm.com>
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
+properties:
+  compatible:
+    const: rohm,bd71828-led
+
+patternProperties:
+  "^led-[1-2]$":
+    type: object
+    description:
+      Properties for a single LED. Nodes must be named as led-1 and led-2.
+    properties:
+      #$ref: "common.yaml#"
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
