Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EB023541A6
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Apr 2021 13:41:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234881AbhDELlY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Apr 2021 07:41:24 -0400
Received: from mail-lf1-f53.google.com ([209.85.167.53]:42796 "EHLO
        mail-lf1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232755AbhDELlY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Apr 2021 07:41:24 -0400
Received: by mail-lf1-f53.google.com with SMTP id o10so16942130lfb.9;
        Mon, 05 Apr 2021 04:41:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eHCRAP6XuwyucOiKsJ2lUJcU0/0jNVJWqtNu+2ue+X4=;
        b=Z00pvdqkMWdHIgzXSxDk91qDPCorHH6tC8C1bv852yXHU03sCsKJP34/uVLnb43oYg
         EGKqtVA1YklKzR4qjeD5Cdt54qJREI0HfQAY2ovLUuYY32ZvCeCyIdTwAKVZGiGfyZJZ
         H3VWmoAgvh0HFqCqtCsoSGJQSJXKo0DJntnvXbltIbvj7tnliFI1aXYK/AZNmi0QWzWV
         0B+ObvhgeTk2JClhW7hYytP5lx93PST41Ow5VY/9hEMVR8reRmL1mjRuZCOyj/7femOn
         GzsnNSQda9eGmVujuNTjTOeLxDwX3ZqqcwGR4n52M+NxPSExeUUI1OiIaxq+Lombm2M0
         qoVg==
X-Gm-Message-State: AOAM532JtjswsGiETA3fAVWyJvPXk91+KUOJGH/Gt7cj98zjLUhXgnHz
        +XSDP0t/gDCq4JHwwL30/hSQkin5VX6PXA==
X-Google-Smtp-Source: ABdhPJw1G3jR+vzIAs7X4Ofo1qMMysAeUZXF8JyzMl6Ds6nTKSo8HqRqyQdQzrc5mlxxNcejWtwuUA==
X-Received: by 2002:ac2:5cb3:: with SMTP id e19mr17198252lfq.444.1617622875491;
        Mon, 05 Apr 2021 04:41:15 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyydy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::6])
        by smtp.gmail.com with ESMTPSA id r18sm202363lfm.297.2021.04.05.04.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 04:41:14 -0700 (PDT)
Date:   Mon, 5 Apr 2021 14:41:07 +0300
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
Subject: [PATCH v6 03/16] dt_bindings: bd71828: Add clock output mode
Message-ID: <85707729f86ac958333e6ba0c30b6fcd3b8a7486.1617616855.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1617616855.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617616855.git.matti.vaittinen@fi.rohmeurope.com>
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
