Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBEBA347275
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Mar 2021 08:23:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235980AbhCXHXU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Mar 2021 03:23:20 -0400
Received: from mail-lf1-f52.google.com ([209.85.167.52]:46741 "EHLO
        mail-lf1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235946AbhCXHXL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Mar 2021 03:23:11 -0400
Received: by mail-lf1-f52.google.com with SMTP id w37so30428874lfu.13;
        Wed, 24 Mar 2021 00:23:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eHCRAP6XuwyucOiKsJ2lUJcU0/0jNVJWqtNu+2ue+X4=;
        b=jg8cfmdcnyciPt6pxtka5S5rM8udGtDBcuSlAEvioiofto85l/cSNMYSNYeHOIM1iw
         Gjexjz2I5RSUfuxSwz1TMtK0DaBFiE0vts+xbXYKG9bx7fvCOVcXlFg9qHH61PhC01VC
         FQ37LwCS/e1ybud6HQyAMVNwiWaXMoOOP1XSCdYhDKq9oOsbKEnt/7SRAp08Tt7eL8F7
         3Fbbe1r9VrUALEQJG1ij8V/z1RCk696xvtdSAXybU+2tVMUFbx+lWHNOmt8TQC/5mVpf
         nZSiaUDpQn40L/9QvXGIMemYPM3EcGcgM/kBKdaZja4pgP2yY3UevtC7GPUCnbvrPHlD
         xv7g==
X-Gm-Message-State: AOAM532ezRU15KcR1rzVcptONiPAR9zrSYQrUOJRJN102QpoPp4apxa1
        lFIZ0vmCdYkaN9KhXG3/huGP00Xm6wo=
X-Google-Smtp-Source: ABdhPJyvaw1hcka4ItlGhoNDPV/z0xfXjU8UWSudVaRsrAJZq7dqCpL98+o1mbVLeJ8BAxUsjnPK1A==
X-Received: by 2002:a05:6512:3202:: with SMTP id d2mr1117735lfe.484.1616570590120;
        Wed, 24 Mar 2021 00:23:10 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyyby-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::2])
        by smtp.gmail.com with ESMTPSA id h9sm197952ljh.58.2021.03.24.00.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 00:23:09 -0700 (PDT)
Date:   Wed, 24 Mar 2021 09:23:03 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-power@fi.rohmeurope.com,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH v4 03/16] dt_bindings: bd71828: Add clock output mode
Message-ID: <2b26725f576f7c64ed507511d9459688d8c90a06.1616566395.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1616566395.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1616566395.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The BD71828 allows configuring the clk32kout pin mode to CMOS or
open-drain. Add device-tree property for specifying the preferred mode.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
No changes since v3
 .../devicetree/bindings/mfd/rohm,bd71828-pmic.yaml          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml b/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml
index 3a6a1a26e2b3..8380166d176c 100644
--- a/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml
@@ -44,6 +44,12 @@ properties:
   clock-output-names:
     const: bd71828-32k-out
 
+  rohm,clkout-open-drain:
+    description: clk32kout mode. Set to 1 for "open-drain" or 0 for "cmos".
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    minimum: 0
+    maximum: 1
+
   rohm,charger-sense-resistor-ohms:
     minimum: 10000000
     maximum: 50000000
-- 
2.25.4


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
