Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5215434D083
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Mar 2021 14:54:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231195AbhC2MyL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Mar 2021 08:54:11 -0400
Received: from mail-lf1-f49.google.com ([209.85.167.49]:40553 "EHLO
        mail-lf1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231646AbhC2Mxz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Mar 2021 08:53:55 -0400
Received: by mail-lf1-f49.google.com with SMTP id a198so18258800lfd.7;
        Mon, 29 Mar 2021 05:53:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eHCRAP6XuwyucOiKsJ2lUJcU0/0jNVJWqtNu+2ue+X4=;
        b=VkbfR1gjRqPkER9k97YTj0h20IKQpM7fVTYeHBRhZDZN1mXDJfhL0xQWlak3L1IW4k
         Plq5zVYD/yUlv37hsxZ0lnCrRkJjJ3SG48xV40rU4cKDq+2wCMBnm3UzBhcWrlsnv4Eq
         Q6R9Yu5sobYFnBoNsvjAMRwfYN6+nhVZ7mT55CZTbXDRLW2z7MPGB3JKTKlFDYEZyMrD
         urEM/XKyQLGrJApqJ4nxwyvCFTbw148F3VW6FdywqXDeIr1VEOFUCc7HRdR1LowRXuvg
         pqJfPOUC3nApOH/YJtTkF8m3ryVYWrd1ZydTtd8GlOrsDleApzXVZQDET04osTl9rCjg
         57rg==
X-Gm-Message-State: AOAM532Z5BfoUQidUyieyxTgHcFiTtIqhiS4K53Ajew7d8E6ihtn2AVL
        5B/noVEhm1VnM3gvn8voRy0=
X-Google-Smtp-Source: ABdhPJy8y6rcbvH34iRN9MkiLSm6cmScFiUCGjpBJbJavDORRi4iq2SlgejArSldGuYt+HjaXi95mQ==
X-Received: by 2002:a19:ac4a:: with SMTP id r10mr16847419lfc.468.1617022434262;
        Mon, 29 Mar 2021 05:53:54 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyyby-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::2])
        by smtp.gmail.com with ESMTPSA id 194sm1830536lfd.116.2021.03.29.05.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 05:53:53 -0700 (PDT)
Date:   Mon, 29 Mar 2021 15:53:47 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-power@fi.rohmeurope.com,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH v5 03/19] dt_bindings: bd71828: Add clock output mode
Message-ID: <2b26725f576f7c64ed507511d9459688d8c90a06.1617020713.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1617020713.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617020713.git.matti.vaittinen@fi.rohmeurope.com>
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
