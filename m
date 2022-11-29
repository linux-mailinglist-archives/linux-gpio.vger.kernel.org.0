Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1598763B7F5
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Nov 2022 03:34:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234898AbiK2CeK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Nov 2022 21:34:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235200AbiK2CeI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Nov 2022 21:34:08 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1A422A972
        for <linux-gpio@vger.kernel.org>; Mon, 28 Nov 2022 18:34:07 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id vv4so30545292ejc.2
        for <linux-gpio@vger.kernel.org>; Mon, 28 Nov 2022 18:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q1wkbH4Fwaa8TmYZ/6/PrOawCFc3B7G23QtdfVs16J4=;
        b=XBccz8PXofY6f+tvbfXJrE132NfvQoLMkwiFtRpevRN5WX0sRKgnZiT9zFFG5hQghR
         4tOp9yBdOYbBkBz2fmgfp1fMHhVyHIQuwO2sH7bRmY282S9LxuRzgXhgVujROSqykY3N
         7whmBNi8M8RWGzTcgVwQoqew0uq7O8ll+LStP/zaHkDNt1YrKiGLbub4Kclu/imI8z8/
         OzjGID039MbTWBFAoR9VyqRuPis4qjyNfmPt7CopqM6UQTzs8hMXP4WGL50gvkz1r7nr
         QMrZFup1DAxMS8peRNEkpnhYZyEqhlA5XIcJlnUocIcNHIlI7+NjmG2UqzRG2M4TVZg2
         Tzag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q1wkbH4Fwaa8TmYZ/6/PrOawCFc3B7G23QtdfVs16J4=;
        b=5wTjyDSnIpnxblWm1aKGnRuNEZgQlH+PjVgdT2UD0mbu8gGNj0CJWqi80NbiZnd56s
         zO8Dl9qaJaVGfDbiIBoafzGFzQKz2Hz+p4kAg5TUER/1T70h7ZzvOf5T1LOBwNL4jgMI
         ISFeWVPNraRfQXmpm+WbJs5Y9AxkgM5G7w5kGfyMdehNFfsXTcHs3XlEXzB4icQwxwfb
         7nfb7PvFbGqUE8OHfy98m9aMnCvEfAwbfz1eXZaf9zkR9mtNuoeVt1Mxl//7BsP9U8x1
         sE6Adho5/vfYK00wL9ceXHXUljuKDd//0psrcHxvoBUCvuv3Y98OY6K5JkD6jA01viMT
         RzIA==
X-Gm-Message-State: ANoB5pmAapk7kMzfogWaXHquhf4yRtg3s7xdlkA+QPB5kcu+grYK26E5
        fbNLMJ90qUzFwTDNgAzl5E633A==
X-Google-Smtp-Source: AA0mqf49fk527w7g9GqZ/PawNHpaqWh+mthJxsBRUu/tjzjEI2+aP48+dmF5anMP67j4bdYS7fcWYw==
X-Received: by 2002:a17:906:1445:b0:7a1:6786:444f with SMTP id q5-20020a170906144500b007a16786444fmr29233592ejc.409.1669689246257;
        Mon, 28 Nov 2022 18:34:06 -0800 (PST)
Received: from c64.fritz.box ([81.221.122.240])
        by smtp.gmail.com with ESMTPSA id a4-20020aa7d744000000b004615f7495e0sm5733817eds.8.2022.11.28.18.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 18:34:05 -0800 (PST)
From:   =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To:     devicetree@vger.kernel.org
Cc:     linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        krzysztof.kozlowski@linaro.org, matthias.bgg@gmail.com,
        angelogioacchino.delregno@collabora.com, khilman@baylibre.com,
        linux-gpio@vger.kernel.org, linus.walleij@linaro.org
Subject: [PATCH v3 3/7] dt-bindings: pinctrl: mediatek,mt65xx: Deprecate pins-are-numbered
Date:   Tue, 29 Nov 2022 03:33:57 +0100
Message-Id: <20221129023401.278780-4-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221129023401.278780-1-bero@baylibre.com>
References: <20221129023401.278780-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Make pins-are-numbered optional and deprecate it

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
index 33b5f79e741ab..1b44335b1e947 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
@@ -31,7 +31,8 @@ properties:
   pins-are-numbered:
     $ref: /schemas/types.yaml#/definitions/flag
     description: |
-      Specify the subnodes are using numbered pinmux to specify pins.
+      Specify the subnodes are using numbered pinmux to specify pins. (UNUSED)
+    deprecated: true
 
   gpio-controller: true
 
@@ -62,7 +63,6 @@ properties:
 
 required:
   - compatible
-  - pins-are-numbered
   - gpio-controller
   - "#gpio-cells"
 
@@ -150,7 +150,6 @@ examples:
           compatible = "mediatek,mt8135-pinctrl";
           reg = <0 0x1000B000 0 0x1000>;
           mediatek,pctl-regmap = <&syscfg_pctl_a>, <&syscfg_pctl_b>;
-          pins-are-numbered;
           gpio-controller;
           #gpio-cells = <2>;
           interrupt-controller;
-- 
2.38.1

