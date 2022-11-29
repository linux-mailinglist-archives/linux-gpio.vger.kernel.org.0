Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CC9763B7F6
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Nov 2022 03:34:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235216AbiK2CeL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Nov 2022 21:34:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235019AbiK2CeJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Nov 2022 21:34:09 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95B09421AC
        for <linux-gpio@vger.kernel.org>; Mon, 28 Nov 2022 18:34:08 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id b2so14225055eja.7
        for <linux-gpio@vger.kernel.org>; Mon, 28 Nov 2022 18:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHzYJsu6o55ysC/VZNy1p8R//hSsaPxHyoFnYfPzMc8=;
        b=Qi76vhF9q8A9ALrP1+nc4tr5vlTzbIx+o5acojEYZAQkcuANvn184hZhGaE/aDUxUI
         xrW0IIdoQ7vGR63MoGSAIbqf8hB9Ou3g8KXNqTfRTi4T33aeuefIDhOax+tou03onUVf
         F7m7RWHYie6X+A2J0bUnRxxjVl2WqlWZZipS4uh9ymC/LPhm2tU6rzAxnALilhxm7JAS
         W9bL6ZdYxCgtwG9Z2BksBP3BvrDKtYYc5Mn/XicFYlYN4U7ld0I9CVPZqitM5agMTH2K
         RJlPeGjVkh8sHAorzQG7u72wfSg+OigOzB1Q5pTMk5itN7Rni9aW7ij1OK8Z3b+lwr1w
         7U3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BHzYJsu6o55ysC/VZNy1p8R//hSsaPxHyoFnYfPzMc8=;
        b=NdNkTjEkd0DiOy0hrzA50q/Mn+YST3iP7cDg6Ac65ogMXwLsT5EuNRPQbuSM5FWa4b
         Zn7NWRB6cwwLpcSgj0R8EyBRxy1gi8slhDdqDUwngxDoGeLQHS/t4ZzLUrzEk46XyKRF
         n1YZtJo6kTag7hkokNrOI0EHXBzoVAKU0xzokF5zcaZwVLYopt+Q+Nk11dR2IKZcUHxH
         0ZLjDWVCz5wCFnTuW3bu0sGX6yjmEdSmGWmRQCMTDqu0rrXFL3i9NUERZJ+mD7A0pM1b
         RHWwIXxQL2QU1l4baeyN9FhXwK9Rz9mJ4vUKmGqqEFUtQssoLlv+i6gM8fi5cD53c1ET
         PbPQ==
X-Gm-Message-State: ANoB5pnOt4Sap8T4R5jGzyLj15c4Ln3VwebK9ynIoaGRsnLWY5zbKz3U
        nh+VcFj3xb+2lJs/58ImjbWJFw==
X-Google-Smtp-Source: AA0mqf6Lf3AT2mq69lc2sJzPEUfGRFH+/ZCr1QgpSmG6gf71FTbd3ODAM1B5nKyNTERJ7d+muhccug==
X-Received: by 2002:a17:907:d042:b0:78c:c893:1965 with SMTP id vb2-20020a170907d04200b0078cc8931965mr44638929ejc.247.1669689247159;
        Mon, 28 Nov 2022 18:34:07 -0800 (PST)
Received: from c64.fritz.box ([81.221.122.240])
        by smtp.gmail.com with ESMTPSA id a4-20020aa7d744000000b004615f7495e0sm5733817eds.8.2022.11.28.18.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 18:34:06 -0800 (PST)
From:   =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To:     devicetree@vger.kernel.org
Cc:     linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        krzysztof.kozlowski@linaro.org, matthias.bgg@gmail.com,
        angelogioacchino.delregno@collabora.com, khilman@baylibre.com,
        linux-gpio@vger.kernel.org, linus.walleij@linaro.org
Subject: [PATCH v3 4/7] dt-bindings: pinctrl: st,stm32: Deprecate pins-are-numbered
Date:   Tue, 29 Nov 2022 03:33:58 +0100
Message-Id: <20221129023401.278780-5-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221129023401.278780-1-bero@baylibre.com>
References: <20221129023401.278780-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Deprecate the pins-are-numbered property

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml      | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
index 9d59208d83c18..eeb29b4ad4d1a 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
@@ -34,7 +34,9 @@ properties:
     const: 1
 
   ranges: true
-  pins-are-numbered: true
+  pins-are-numbered:
+    $ref: /schemas/types.yaml#/definitions/flag
+    deprecated: true
   hwlocks: true
 
   interrupts:
@@ -206,7 +208,6 @@ required:
   - '#address-cells'
   - '#size-cells'
   - ranges
-  - pins-are-numbered
 
 additionalProperties: false
 
@@ -220,7 +221,6 @@ examples:
               #size-cells = <1>;
               compatible = "st,stm32f429-pinctrl";
               ranges = <0 0x40020000 0x3000>;
-              pins-are-numbered;
 
               gpioa: gpio@0 {
                       gpio-controller;
@@ -238,7 +238,6 @@ examples:
               #size-cells = <1>;
               compatible = "st,stm32f429-pinctrl";
               ranges = <0 0x50020000 0x3000>;
-              pins-are-numbered;
 
               gpiob: gpio@1000 {
                       gpio-controller;
-- 
2.38.1

