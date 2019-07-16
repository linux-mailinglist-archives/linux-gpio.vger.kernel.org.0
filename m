Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDD4C6B169
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2019 23:56:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728235AbfGPV4V (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jul 2019 17:56:21 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:38368 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726555AbfGPV4U (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jul 2019 17:56:20 -0400
Received: by mail-io1-f67.google.com with SMTP id j6so10217154ioa.5;
        Tue, 16 Jul 2019 14:56:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kADd+NQKUgWUED+820fdDO7gVP7dDmGj1gYm9p5p3sw=;
        b=ByNn6JN1wwQPUNvt8Gy1n+za6LarrICzIm/WJiOfVT2E1YCot47DwaMpiGAYAUlfXB
         iEmRiOx31C/TBviezpQzIYIEwd+qEtxTP/2BxrNTV1VXMkBZy/4v/YPA84xEfaTUMBpg
         EAAlNy0CvO7x8rTMn1ixPtGNO7MdDBP+qg45JxkKpJB+eGUA5qVtBqctkheDTutsbpjK
         tK/DuBqAiordSAN0P3E/osixbaEpYroA4sR+aYBZUQ6wwvW7cvjK2iI8bfB49duIhOYP
         xTEya26w2gDombfWo8NPvR15xDgkn7j0kfxPaT5o1THesvFD0/OANd4yKNLk+h9AQRQs
         iLfg==
X-Gm-Message-State: APjAAAUcO4uYnqNL8zbFPIYkeStOw8Xb5Q+6BfqRamZFvf0gAlK+NTp8
        wrywa37MiP7Y9MDQWjL/5A==
X-Google-Smtp-Source: APXvYqwDMRb0ggHvOfuex4HW4eSe1qMvzAf6AwQILMzFafLTkg23I/dov4glX6kdigbpojvrSAFSjQ==
X-Received: by 2002:a5e:d51a:: with SMTP id e26mr26126978iom.71.1563314179727;
        Tue, 16 Jul 2019 14:56:19 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.249])
        by smtp.googlemail.com with ESMTPSA id f17sm20074646ioc.2.2019.07.16.14.56.18
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 16 Jul 2019 14:56:19 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        linux-gpio@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH] dt-bindings: pinctrl: stm32: Fix missing 'clocks' property in examples
Date:   Tue, 16 Jul 2019 15:56:18 -0600
Message-Id: <20190716215618.29757-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Now that examples are validated against the DT schema, an error with
required 'clocks' property missing is exposed:

Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.example.dt.yaml: \
pinctrl@40020000: gpio@0: 'clocks' is a required property
Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.example.dt.yaml: \
pinctrl@50020000: gpio@1000: 'clocks' is a required property
Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.example.dt.yaml: \
pinctrl@50020000: gpio@2000: 'clocks' is a required property

Add the missing 'clocks' properties to the examples to fix the errors.

Fixes: 2c9239c125f0 ("dt-bindings: pinctrl: Convert stm32 pinctrl bindings to json-schema")
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: linux-gpio@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
index 3ac5d2088e49..91d3e78b3395 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
@@ -197,6 +197,7 @@ required:
 examples:
   - |
     #include <dt-bindings/pinctrl/stm32-pinfunc.h>
+    #include <dt-bindings/mfd/stm32f4-rcc.h>
     //Example 1
       pinctrl@40020000 {
               #address-cells = <1>;
@@ -210,6 +211,7 @@ examples:
                       #gpio-cells = <2>;
                       reg = <0x0 0x400>;
                       resets = <&reset_ahb1 0>;
+                      clocks = <&rcc 0 STM32F4_AHB1_CLOCK(GPIOA)>;
                       st,bank-name = "GPIOA";
               };
        };
@@ -227,6 +229,7 @@ examples:
                       #gpio-cells = <2>;
                       reg = <0x1000 0x400>;
                       resets = <&reset_ahb1 0>;
+                      clocks = <&rcc 0 STM32F4_AHB1_CLOCK(GPIOB)>;
                       st,bank-name = "GPIOB";
                       gpio-ranges = <&pinctrl 0 0 16>;
               };
@@ -236,6 +239,7 @@ examples:
                       #gpio-cells = <2>;
                       reg = <0x2000 0x400>;
                       resets = <&reset_ahb1 0>;
+                      clocks = <&rcc 0 STM32F4_AHB1_CLOCK(GPIOC)>;
                       st,bank-name = "GPIOC";
                       ngpios = <5>;
                       gpio-ranges = <&pinctrl 0 16 3>,
-- 
2.20.1

