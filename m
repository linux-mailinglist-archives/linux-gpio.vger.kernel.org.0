Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FE9C544A6A
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jun 2022 13:39:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241805AbiFILjY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jun 2022 07:39:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240407AbiFILjW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jun 2022 07:39:22 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CCD347054
        for <linux-gpio@vger.kernel.org>; Thu,  9 Jun 2022 04:39:21 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id fu3so45390404ejc.7
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jun 2022 04:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PsY51Y9LbGxALCP41QTkZafNtgUGmXvRyYQiy6lI9FU=;
        b=zYVkK+/V8ZGti1yZD5tr+qJSCek+CBHl2Nd1S/T3io//rE3MLRz4Uc6JvOZh//3oZf
         NI0ICECMerr05hjz/YzwcnYcowv9p8XnqaiK9gT1FKO+jvGLlLxJTRc5K8Tyl+cw0tli
         GCrWHIkFLBzMLB4NdF9ll+WcNamrxTIkPgLQggG/rhOflxUtLzoFk4K8mZ5BvLElGwt6
         lwfkDaDKEHIUH6k6qBWnaXgka8n9HzeMOXg0ZwINqRaQg3VDZdNZ47Es/FeEi/YCSAuQ
         lCjAvCwH3a90XTLrXe2L173Z0Tt4dh7LQW3aGReoQTnq25LDPafCnA2RrIgWA9aIlpEG
         gJCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PsY51Y9LbGxALCP41QTkZafNtgUGmXvRyYQiy6lI9FU=;
        b=fTIIcplYcNLjTsFaJ8qx6f3sF3QvXhZ/IRa3qdbOBTAjc4L8/u93Ol8uBnhDPBI504
         XId+8MPrNBhwbztxJ+YR63HeEj6R8apw7bO98Nbt/v9G4DAe4j2TFFGRecYlot/hLqNN
         5RE+NJZQYan/mbZqfzwAZntZlmudmxQsza4linXJxsW+MdcwkD6oX8jPUH0lMI86m/xd
         KCnvhuN4YXcxyJWINNJlKOCk2UszWHW9cZ2ZohJcYbFjwfk1tKi38GnzqOajXCjbc0Ji
         hp2nJiFmEovphYpagkZ1zWXH8qqG1vlG3GTDI0cQ4yWbkyTYBqfIVaCfpv6I3fOFlFjI
         MUSQ==
X-Gm-Message-State: AOAM532RC77zQ4S+OibuIEsdfyNfsYC5LSPC8ickvzPG2pHAs2GTWlBH
        KuZLAX3ztZW06KwB9BeXcvxHfw==
X-Google-Smtp-Source: ABdhPJxghBIkt/oPlnkhYfc+sNVuqIIRec7ri31pQri4hdc3zeWjKeem2e8hWbd5rY1utC5lGBYtqQ==
X-Received: by 2002:a17:906:9b86:b0:6f8:24e7:af7d with SMTP id dd6-20020a1709069b8600b006f824e7af7dmr36649187ejc.295.1654774759852;
        Thu, 09 Jun 2022 04:39:19 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id u14-20020aa7d54e000000b0042e21f8c412sm11898495edr.42.2022.06.09.04.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 04:39:19 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        arm@kernel.org, soc@kernel.org,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 04/48] dt-bindings: pinctrl: nuvoton,wpcm450-pinctrl: align key node name
Date:   Thu,  9 Jun 2022 13:39:06 +0200
Message-Id: <20220609113911.380368-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

gpio-keys schema requires keys to have more generic name.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml
index 47a56b83a610..4c7691c38b10 100644
--- a/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml
@@ -152,7 +152,7 @@ examples:
       pinctrl-names = "default";
       pinctrl-0 = <&pinctrl_uid>, <&pinmux_uid>;
 
-      uid {
+      switch-uid {
         label = "UID";
         linux,code = <102>;
         gpios = <&gpio0 14 GPIO_ACTIVE_HIGH>;
-- 
2.34.1

