Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1347558602F
	for <lists+linux-gpio@lfdr.de>; Sun, 31 Jul 2022 19:48:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232158AbiGaRsD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 31 Jul 2022 13:48:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234198AbiGaRsD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 31 Jul 2022 13:48:03 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B36CEE0D3
        for <linux-gpio@vger.kernel.org>; Sun, 31 Jul 2022 10:48:01 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id o3so8576329ple.5
        for <linux-gpio@vger.kernel.org>; Sun, 31 Jul 2022 10:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edgeble-ai.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=YgD9TwGCuuBHZJnCn7bWlJjphN4d2OaC6VP0Q8F71/Y=;
        b=r3wtAUPfTHCV5mJiM/deqk2JQLIKvN8flIaQ56ma/wwyURqR6AQzAEfuabfEL8rSh8
         9MbjpoMZW20whGkNy6jkWZn/QVhU+Hc8KaWF8evkAX4PkQAzQAp3dvg5tyYCBHqYKRsh
         T72ki3QuyrUC/m04tARlj3uYhAs+AaB/pvR7wq+jK95imNRT/b3sHYF4u+5eCqjwz8U/
         w/Ab5c6X/RTvwfXai8gROdzbAPeNr3h8PtSIIQ7D075o5cTvB+TJFMXe8AlUCuoaxGGc
         QGfCbcjRP6wxcpC6REbd6g29c+tYm78vA2CJtM4vBcrXV4a2XRVGDS5CrBXEE07XuLcX
         qzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=YgD9TwGCuuBHZJnCn7bWlJjphN4d2OaC6VP0Q8F71/Y=;
        b=iJjzrlt3udUvr2odDcRt3GdraCkC/iGdPvY1NbUmxV5FtSype/HX3+i1NQO+IR7P8H
         ABLL6gC3wRgWkDXiSWDTnLE5uhrzonBAxDpzBaUGTmz8OlWODrIORuTXmtpojbUZv+pk
         9oZTx2ksjTbgNWsovYfgPkD1BquJ4uZiEpPytQRJGjsKrFEgCILSazRfnHL3GL7H4n2b
         hnYhfq/mEGNpu4o5fDlSq+5UZYHNJe5wqDw4kZlODkHW9VxrJZqqJ1q0FZkInpW8epiM
         sFB5CT5Yi7RPs1DmLWcziGlRjZC9E37UuRNwZpc1Grg0lNInnihye55wAntymkRkaqKq
         kgBQ==
X-Gm-Message-State: ACgBeo0j7JK9COcBBmTND16+M6QtmnNj1qByWR2yUnaCjZ+F0ufHCv4K
        6t4awHzT8zICAvNPHHJHWap70w==
X-Google-Smtp-Source: AA6agR7dDfo38veMxE4mlFaHX7QVEzFbUI9cbBpmfuWUFb3j2a5ZD81IPQKvNbpkBH6jUed/bFzvFQ==
X-Received: by 2002:a17:903:18f:b0:16d:6e7a:44b with SMTP id z15-20020a170903018f00b0016d6e7a044bmr13723404plg.113.1659289681256;
        Sun, 31 Jul 2022 10:48:01 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:c5e8:48d3:6a8c:6418])
        by smtp.gmail.com with ESMTPSA id n5-20020a170903110500b0016d3935eff0sm7812062plh.176.2022.07.31.10.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jul 2022 10:48:00 -0700 (PDT)
From:   Jagan Teki <jagan@edgeble.ai>
To:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kever Yang <kever.yang@rock-chips.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        Jagan Teki <jagan@edgeble.ai>, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 06/20] dt-bindings: pinctrl: rockchip: Document RV1126 pinctrl
Date:   Sun, 31 Jul 2022 23:17:12 +0530
Message-Id: <20220731174726.72631-7-jagan@edgeble.ai>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220731174726.72631-1-jagan@edgeble.ai>
References: <20220731174726.72631-1-jagan@edgeble.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Document dt-bindings for RV1126 SoC pinctrl support.

Cc: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jagan Teki <jagan@edgeble.ai>
---
Changes for v2:
- collect Krzysztof ack

 Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
index 677a285ca416..b486f41df65f 100644
--- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
@@ -47,6 +47,7 @@ properties:
       - rockchip,rk3568-pinctrl
       - rockchip,rk3588-pinctrl
       - rockchip,rv1108-pinctrl
+      - rockchip,rv1126-pinctrl
 
   rockchip,grf:
     $ref: "/schemas/types.yaml#/definitions/phandle"
-- 
2.25.1

