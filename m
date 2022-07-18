Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 528EA578311
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Jul 2022 15:04:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234385AbiGRNE0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jul 2022 09:04:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235202AbiGRNEZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Jul 2022 09:04:25 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC5C7BE34
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 06:04:23 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id t1so19159887lft.8
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 06:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NgsGp3CFDo85Tmtcs8wcVcz72bTIf43vw/+Jn0TKZRI=;
        b=qi45GmX6vvROA36d7gqESppzvdeW8dR0BTk5BAthUOH56NXyH6+VAB3juURHDMnqmH
         HOtOeaXwY8TVe765OFn4KrlGD2zgDWSxrep0ETQlog0p95agQycRnjQCBg4dTrKWJKCa
         adHSqP6f9S6HuEOgYx+RNzshO1E1EBGngKJG7Ag525MOwWXdMqURo1yQPwiq0rgFwDmk
         gMYiqfIj8QOJff8KEqVItq5ayfvkQppvH5zuM6B4wwnaambwuJwWpkxu7EWgqxp9CbgC
         buvfRzwt17D4jZ5K9+6Bm82nHOLpfIGms+8VjDJ1gLaoYXHqSc9qLNtVVlTuqp5v3ugV
         qHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NgsGp3CFDo85Tmtcs8wcVcz72bTIf43vw/+Jn0TKZRI=;
        b=7L6wnVVZs0Ob3BcuWh8w5zaum3oQI1JiCzlZDPnWZMo7SDCUpJ6jXPH00FWp1D66fJ
         hpuflv7seFODms9Q86NKq/AjU0hRsd9O7KnOlI0FngLPAsmwo0bBL9fGwyZrGXGdWFcw
         dTCK+LpsEX483fGIwlr1JzYbrACIS2UBgb0iVRSyn2Obx/Vt5RxOEW/8fjvaGzb19Qat
         0R81lpq+WUH/S4uYbtCSZ2c+aL08p297DhHk1kU+Z/mHEaT3Y7QijsA+tLszHizZ5lbX
         V655KR7RqhOL6Q/Yy3H1id7xhhNiJbSGXwxXEndjlfIh3q4f8HDxMXLZUEFGLw4JL/Jh
         Mx0g==
X-Gm-Message-State: AJIora/uLsrCezCvPvVfcGM62kIrl9BpjunDAl2F2+eMyTgAAMj883R6
        grB2s32NqJzAQDBcIKlTA3xZ99goxwGpZc3Y
X-Google-Smtp-Source: AGRyM1s9zj97yokop0zW2EElk8EDeXs43bp789BikZEdjfc+P1xWSfWQ6pd5JQYqjwTx+S7GFAJKUA==
X-Received: by 2002:a05:6512:3ca2:b0:48a:7f7:3a20 with SMTP id h34-20020a0565123ca200b0048a07f73a20mr15131185lfv.153.1658149461672;
        Mon, 18 Jul 2022 06:04:21 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id e19-20020a05651236d300b00489b1876923sm2584001lfs.298.2022.07.18.06.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 06:04:18 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH] dt-bindings: pinctrl: mt8195: Fix invalid example
Date:   Mon, 18 Jul 2022 15:02:15 +0200
Message-Id: <20220718130215.31547-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The commit switching to use standard drive strength missed to update
the example. I just put in something valid so we don't get the
warnings from the DT bot.

Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reported-by: Rob Herring <robh+dt@kernel.org>
Fixes: 1b3ab63e56f0 ("dt-bindings: pinctrl: mt8195: Add and use drive-strength-microamp")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
index 85e96a5e1708..4be3e8671622 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
@@ -281,7 +281,7 @@ examples:
           pinmux = <PINMUX_GPIO8__FUNC_SDA0>,
                    <PINMUX_GPIO9__FUNC_SCL0>;
           bias-disable;
-          mediatek,drive-strength-adv = <7>;
+          drive-strength = <16>;
         };
       };
     };
-- 
2.36.1

