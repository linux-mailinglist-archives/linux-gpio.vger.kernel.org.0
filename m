Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFDB27B282C
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Sep 2023 00:13:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231980AbjI1WNE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Sep 2023 18:13:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231689AbjI1WNC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Sep 2023 18:13:02 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 073C319F
        for <linux-gpio@vger.kernel.org>; Thu, 28 Sep 2023 15:13:01 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5046bf37daeso12232150e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 28 Sep 2023 15:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695939179; x=1696543979; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CY0vsjcVCBgE58w9UR6SBm++3xKyQBSwPNYicIzid6s=;
        b=SMXp1icOk8WxXF5jmPKLLWUVNIKk+KwUjCR3iKwxCompPgyHlz3goUP4P/M27iEVXh
         cI/G7tI1XhcTFp5wZGgYrWu8Ab2qnpSvQB7wYazOOhmQMEmf3JEBlu60c1HlthVfh81y
         1eukuMYAN/bkoYhlXOwGrD/trVMMbjuU9p82JV3tCBljXJNbvt1xM05Gkq5lHybrUOjQ
         OBnihfRtrz0n3BAWpKsXjMzFbH1zMnRn9RU8K1/4xWj2T3Vt2n6HikkW7Ogb26sOFcfk
         1oYpxg9JnJbEGFDaE1yijw5WEJD2AxMzfxQ5g3BthNzfC+1CMQkPSgYvOAMxk1N6ihi7
         ZPTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695939179; x=1696543979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CY0vsjcVCBgE58w9UR6SBm++3xKyQBSwPNYicIzid6s=;
        b=F/pAWlM6rJLAt5NqRyWBt2H85JdF+3MYU6o/x1MojZly2tjWNbuiJ6u2+nQ/RqiZmR
         7F9fj8lg6/nycIandwKoatZq2ztYDQ9L9ebTrNfqOUhY60rzKF8pB3f5B4Uvm1WNEzlV
         8UUnYbJ9N4sDKLf5zoPMsR1EEUC3aGJ5hRwWF94zdsk9PHE3A3YyhYATrbSxEJSRPHm2
         BczjBY5IKnTVWnklc/Yu0GrBfQ0nf5Nq9MgfoBsHqxwtBvWiE6wmKw5KUmlXQZy92rUD
         ITqcrGXh51Em6abpH96XBOf5eH9uGFVPD5Yk0hZy/gDz5SeQDV3Rj243lYK4yTmr7F/G
         83gw==
X-Gm-Message-State: AOJu0YwH2M449eyEt5PF3ikFQs1ipCxtuP2MwtWVXPXFVA+DQBcag/3Y
        rWESwmFJJPJL9abobdpyquwoMg==
X-Google-Smtp-Source: AGHT+IH+8EEAM93O9nlO+qtWwhEoVV89Rw7mcTI5Ss+i9HtYU7SmmUhL1U+18gaNy0wOYFIltW+FjA==
X-Received: by 2002:a05:6512:2825:b0:503:257a:7f5d with SMTP id cf37-20020a056512282500b00503257a7f5dmr2553724lfb.31.1695939179359;
        Thu, 28 Sep 2023 15:12:59 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id r27-20020ac25a5b000000b005030cef433esm3271964lfn.94.2023.09.28.15.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 15:12:58 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 29 Sep 2023 00:12:56 +0200
Subject: [PATCH v2 3/4] ASoC: rockchip: Drop includes from Rockchip
 MAX98090
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230929-descriptors-asoc-rockchip-v2-3-2d2c0e043aab@linaro.org>
References: <20230929-descriptors-asoc-rockchip-v2-0-2d2c0e043aab@linaro.org>
In-Reply-To: <20230929-descriptors-asoc-rockchip-v2-0-2d2c0e043aab@linaro.org>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>
Cc:     alsa-devel@alsa-project.org, linux-gpio@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The Rockchip MAX98090 ASoC driver includes two legacy GPIO
headers but doesn't use symbols from any of them. Delete
the includes.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/rockchip/rockchip_max98090.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_max98090.c b/sound/soc/rockchip/rockchip_max98090.c
index 150ac524a590..8e48eb8aa7ad 100644
--- a/sound/soc/rockchip/rockchip_max98090.c
+++ b/sound/soc/rockchip/rockchip_max98090.c
@@ -9,8 +9,6 @@
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
-#include <linux/gpio.h>
-#include <linux/of_gpio.h>
 #include <sound/core.h>
 #include <sound/jack.h>
 #include <sound/pcm.h>

-- 
2.34.1

