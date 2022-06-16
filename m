Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EA1B54D693
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jun 2022 02:58:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348683AbiFPAyE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jun 2022 20:54:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349204AbiFPAyC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jun 2022 20:54:02 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08AA15715E
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jun 2022 17:54:00 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id q12-20020a17090a304c00b001e2d4fb0eb4so349369pjl.4
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jun 2022 17:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iTmMhkqlfpVDlkUHNU9nY9SnHGZsapXurBzSo9cHSyY=;
        b=ov/ul4jxhKist2TEfrakrnj2dmKcx7DUNTcwBDLkBudr6r+QfyRL7lSmO1KFBCD5Ul
         QDtD5oAEzoFLAzsk2j+eT1TugvWzSfQeZmcF+mz5gpgaq0/39jBdAZ2D9YWIkCohE74q
         T+FwtwSVTj/FHvtue80lh1EZwpoJhlEE1tPrZhMLl6+zwel4NfaohhiXG3gZy8i/CFH8
         sMoqsGOAOEUroc/WUK4GF0xlNka2ER1S+upnS17j7m+P5guo5CuzWV6pFnlG1Y+DWgbV
         Qgu7yG5mjOA+3oemzHIl+TelmICNTvp6ttQOCYkSy02IlHtAPpm8lrNV0rtEmoN5GkFB
         KFBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iTmMhkqlfpVDlkUHNU9nY9SnHGZsapXurBzSo9cHSyY=;
        b=aJUQOutsySnIZz7pz4eRDmBPVCJn9WI9SajbCepqwIRljTQpSCi29lh/Z/2pFDzNI/
         /Jm24lFTtnqWuA+fKagJBUvWNAhFnDDrlj+jXQDtnZY6rntxHNWM0Z3T3DToykPj5E8s
         H2+b/JGTf1g3kBuBwyFhJTr/FKI4s2bGLqSnZupmelIbCOaPOS69uBKu0uGo+dE3xw+8
         xsSih+3yUooDI4rmwIVvLtrJqd7HVB9W3ev73eP/e5cj4wYxB5gX5rb+Fzo92GnLG3ix
         k7WOlTtPykUzcT3LoN5KHrAEDtQ147K9uM1kbHzGf/4lpmA5QdBL7Vq9BuB53ePjd51w
         cmeg==
X-Gm-Message-State: AJIora/MbxcnT3Na6vpLVePXqKpCZ2Nurz8bjA7xWhmjphWHGXX+JYus
        vHGcvZIiC5doJJ1kaPqDoKjysg==
X-Google-Smtp-Source: AGRyM1uUgtMpbSHwdQrftxmeWaXmKReJq4JcYQ6GGsSyFi4zWRGp6KG9VseBtvRIrdjjHmpi5fMEXg==
X-Received: by 2002:a17:90b:17d0:b0:1e3:5324:c465 with SMTP id me16-20020a17090b17d000b001e35324c465mr2309564pjb.34.1655340840506;
        Wed, 15 Jun 2022 17:54:00 -0700 (PDT)
Received: from krzk-bin.. ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id p4-20020a170902780400b0016760c06b76sm233660pll.194.2022.06.15.17.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 17:54:00 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     arm@kernel.org, soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 04/40] dt-bindings: pinctrl: nuvoton,wpcm450-pinctrl: align key node name
Date:   Wed, 15 Jun 2022 17:52:57 -0700
Message-Id: <20220616005333.18491-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

gpio-keys schema requires keys to have more generic name.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v2:
1. Name it "button-uid"
---
 .../devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml
index 47a56b83a610..7a11beb8f222 100644
--- a/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml
@@ -152,7 +152,7 @@ examples:
       pinctrl-names = "default";
       pinctrl-0 = <&pinctrl_uid>, <&pinmux_uid>;
 
-      uid {
+      button-uid {
         label = "UID";
         linux,code = <102>;
         gpios = <&gpio0 14 GPIO_ACTIVE_HIGH>;
-- 
2.34.1

