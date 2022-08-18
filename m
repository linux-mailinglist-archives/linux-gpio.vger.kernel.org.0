Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDEE5598346
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Aug 2022 14:43:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244693AbiHRMmJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Aug 2022 08:42:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244679AbiHRMmI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Aug 2022 08:42:08 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F5B0AE23E
        for <linux-gpio@vger.kernel.org>; Thu, 18 Aug 2022 05:42:04 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id w14so1390940plp.9
        for <linux-gpio@vger.kernel.org>; Thu, 18 Aug 2022 05:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edgeble-ai.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=/jwzXk27cMZ6FExh0uoOw9BLTKmtlMZNBpJukme0F8E=;
        b=A7YMiIIt13p4t1dUwQXHF3saHO62+fpD6e0ZUy3PSNLo2d1P3Xc/QObW/L8lPeGb1A
         etenHHrZYHI5PCgm+DXFb5ZPhDE1LBhQK46pDD+Q0Ly9d0FRH7FDB7HDgYuiisr/ze6r
         7VFoVSguuMPsVVJ6Yg/H0j41vKIVSYY4ZOLMD8Ras9V64Daet4QcKRxkWvKEkCSQjl5d
         +VMuC6gXml2IT7trjan0glaAKsj7d2iDIKtOHx2CMA+7MEws8e5Vk6BMWPSKT+JDRK+N
         l6h6qnbtsDck8+OtFvH8qNJYDJ/YZtW7jKMo4CdJIaNUCbA9yg5ggjMhAdA8pgr+zc9E
         zb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=/jwzXk27cMZ6FExh0uoOw9BLTKmtlMZNBpJukme0F8E=;
        b=hrXJTk7o4ie3rt06YNuspSFEOY4p4ipPf4YCnTgKyT06gykxOUOn1lO20N5fkf4ysg
         Sl+Q6PDaP1+ny4VCg83+59PFjeN/Aq3W4DUzSIcNLHGXVd3MxNeQHF0o9cHwr4FB2Ud8
         4tx4ZI0HfeGZLxlCzQOidf4RWXMariqPIJPvR03grQw6O+IzH/d6w0jK4lv4bF0QVEaJ
         KwVYhUbShac019P0Nss/rNGNKfKnitJFbpJ/BYoG/lXtuME9JgcpHkcUmU9DaZWCL/tz
         vwU7j+DklRcgBv+I0KbXKUNKGiI5p+hs1UfOgrznKy5qgDBZC8NZO/qWrDmFvBSKp4SU
         6B2g==
X-Gm-Message-State: ACgBeo1MvrCWgsGcQq3V8VsNSk98U1Lqydw0QIpdQiYK62jEB43s4jMM
        HVD2ghldT1yisvwNlm4wUbxLug==
X-Google-Smtp-Source: AA6agR5PFGBPqbKRlSM05nYD9NjQjJYUOnEF0KRAcV0nMtDmpv/3qPlecBCYhNWJQwfsgS2GeRoA6A==
X-Received: by 2002:a17:90a:c402:b0:1f2:ca71:93a5 with SMTP id i2-20020a17090ac40200b001f2ca7193a5mr2966362pjt.34.1660826523751;
        Thu, 18 Aug 2022 05:42:03 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:d1c4:8ea9:aedc:add1])
        by smtp.gmail.com with ESMTPSA id x6-20020aa78f06000000b005302cef1684sm1495651pfr.34.2022.08.18.05.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 05:42:03 -0700 (PDT)
From:   Jagan Teki <jagan@edgeble.ai>
To:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kever Yang <kever.yang@rock-chips.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        Jagan Teki <jagan@edgeble.ai>, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 06/19] dt-bindings: pinctrl: rockchip: Document RV1126 pinctrl
Date:   Thu, 18 Aug 2022 18:11:19 +0530
Message-Id: <20220818124132.125304-7-jagan@edgeble.ai>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220818124132.125304-1-jagan@edgeble.ai>
References: <20220818124132.125304-1-jagan@edgeble.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
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
Changes for v3:
- none
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

