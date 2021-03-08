Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7362330B6B
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Mar 2021 11:41:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230477AbhCHKkm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Mar 2021 05:40:42 -0500
Received: from mail-lf1-f50.google.com ([209.85.167.50]:43375 "EHLO
        mail-lf1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231128AbhCHKkN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Mar 2021 05:40:13 -0500
Received: by mail-lf1-f50.google.com with SMTP id d3so20178209lfg.10;
        Mon, 08 Mar 2021 02:40:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6l4/p/uXceO3GzG278Mw6H0emnAoX5BJN1c8Nhae8cQ=;
        b=CumBmMcWIXIGr6h7UoKIe/TvvzbvEg1AoJrLzRVU13UN2tg13ZKpW98S5sTywrEt3B
         CedModI1h3cJnrErO0NMxxjnlhw5QWiLNI5kTm6ya6y2kffCRWYFUFyL756v4KAaRkV3
         yNw30yBUvKsk/fhHs9kFW1w6W2LIT5MQ73gk6jCw7UEcwADbb+kcXsLJClTwQH+VLoPM
         XIQjkyOSjioOXftYk4ODM215uZgglSyc64F8+NdMcku4/k9D3jmHuoSOh5rSh0zxvANY
         Z66SZAq1e6ey9kI3DS+UszRxlkkxk8uwREdbDWbhrFiK7C6cjsP6eBT0KqIWlJ6N208Q
         Rh/A==
X-Gm-Message-State: AOAM531pj5FEwn3qc8tnPfVjIrscO90QqrdXWjFWWomRzxMjCaEPdR+J
        2h/toT+uLn9um7Es3e20o2k=
X-Google-Smtp-Source: ABdhPJwlEpiSqQphSkFzGdKXEHuHbIy57Pj5rpgqnfV9HIJRc74wp3jOUqz5Nb5VnYRGTsYhijOCUg==
X-Received: by 2002:a05:6512:2248:: with SMTP id i8mr13473278lfu.632.1615200011484;
        Mon, 08 Mar 2021 02:40:11 -0800 (PST)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::4])
        by smtp.gmail.com with ESMTPSA id j15sm1306721lfm.138.2021.03.08.02.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 02:40:10 -0800 (PST)
Date:   Mon, 8 Mar 2021 12:40:04 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-power@fi.rohmeurope.com,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH v3 03/15] dt_bindings: bd71828: Add clock output mode
Message-ID: <56c4f73c4c0613b282feb8b2c1235c3cd0946076.1615198094.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1615198094.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1615198094.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The BD71828 allows configuring the clk32kout pin mode to CMOS or
open-drain. Add device-tree property for specifying the preferred mode.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
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
