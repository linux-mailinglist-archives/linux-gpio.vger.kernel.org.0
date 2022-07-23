Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F252E57F164
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Jul 2022 22:44:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236274AbiGWUoY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 23 Jul 2022 16:44:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230301AbiGWUoX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 23 Jul 2022 16:44:23 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 891951B7BF
        for <linux-gpio@vger.kernel.org>; Sat, 23 Jul 2022 13:44:22 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id ru18so1205389pjb.0
        for <linux-gpio@vger.kernel.org>; Sat, 23 Jul 2022 13:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edgeble-ai.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UIH/FUKfaf3iVr07M5BoFfFgkdWNg4kfOD+oFpaTFV0=;
        b=4ilAccktaqBkbI7AD6uW+TUyoKJ35RQyg9ZWhKczabnUIDgOr6ZuYMrIxO6P1uhKJW
         2fJot/64UaWKxR2vqt4U8g8Y5ax2JuI74Zj7mPI1B+5aDBceN5spmbd0OugCXzHXDGcU
         VzKyXTo5CzobpJXvFvDp/25FWi3kY2cb3wcKmZuHEcIt2a2H6SVdNvuL7iZXhp9byBgF
         IE/jJnjmqa8yeul0BYoMOebKSV09iERaUIr2Ofg/FgI5voU8hojxWN6aae5gBPdipQ0t
         9nLuaK6PT/xF6eKWT8VPjwT06Rg11vrrci3aDGFBVWBrHTe92jo2remrc0k5BwYxiyoa
         yAIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UIH/FUKfaf3iVr07M5BoFfFgkdWNg4kfOD+oFpaTFV0=;
        b=GcJOOKJazg0SyL5LNCfYX5CULj41PjZlC+vbE1nATrjv0WjTVy4XPyiKeEyC5ETAqu
         rirt1GD02onUQwzZqzQ2g7js2vh/pbACcWuYUYpOQpOerjlqyZCLJpt7PPcPckAdEuJY
         gchpNy1CZetJ3KpPECeqWY7LYg59/dASaFIKteF+pS9x6ZUiU9o5JpqnxDb8AR74Zkmr
         cvvW5h18FOAUSVjfJcpDC9UX6OzL0dVpvxHzTMZmFh4NVJ1keon+C1Ui+bsLGBRdV2br
         CPIah/bYvsEyOO/GFI8KrdPAdwtKqhNzF6eruP1tnoOZMse+wiksbs08lnWrN3lU1rdl
         Cwyg==
X-Gm-Message-State: AJIora/oqoLD9g7HS3EvVDBodpyyYcoFdswC2FAa1UsQkkfQFKVyzU6h
        j0BJOcLMVB5IgkQ3YhjHPDGxi5crY9GAhrTZFZKx+A==
X-Google-Smtp-Source: AGRyM1s4yYbf7fdiJdDN4/C/h3NkSLVrRU4nM9zE4lusREcB0ffmV2jDATkpWpR+GKJq1pfEHwPvwQ==
X-Received: by 2002:a17:90b:4d86:b0:1ef:8701:1b4c with SMTP id oj6-20020a17090b4d8600b001ef87011b4cmr6791843pjb.10.1658609061974;
        Sat, 23 Jul 2022 13:44:21 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:a406:cc30:f4ec:f10a])
        by smtp.gmail.com with ESMTPSA id u14-20020a170902e80e00b0016a6caacaefsm6187950plg.103.2022.07.23.13.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Jul 2022 13:44:21 -0700 (PDT)
From:   Jagan Teki <jagan@edgeble.ai>
To:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kever Yang <kever.yang@rock-chips.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        Jagan Teki <jagan@edgeble.ai>, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 06/22] dt-bindings: pinctrl: rockchip: Document RV1126 pinctrl
Date:   Sun, 24 Jul 2022 02:13:19 +0530
Message-Id: <20220723204335.750095-7-jagan@edgeble.ai>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220723204335.750095-1-jagan@edgeble.ai>
References: <20220723204335.750095-1-jagan@edgeble.ai>
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
Signed-off-by: Jagan Teki <jagan@edgeble.ai>
---
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

