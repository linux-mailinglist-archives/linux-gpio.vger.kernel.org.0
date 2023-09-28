Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 865BE7B282D
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Sep 2023 00:13:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232470AbjI1WNF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Sep 2023 18:13:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232166AbjI1WND (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Sep 2023 18:13:03 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3492199
        for <linux-gpio@vger.kernel.org>; Thu, 28 Sep 2023 15:13:01 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-50437c618b4so18978199e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 28 Sep 2023 15:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695939180; x=1696543980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hm24NpX94JBemDRTScZMK9z0G78Go8UKUQZ7xueoWyk=;
        b=DoF7MKhTo9a4lu/kRakO8RejjTFwslKe/OgzDCXz8FF44V7GOu1zgfWI5Ghy4ioXKI
         HKK8ZMnz9VT+2V4XGS07w5CwQcm6tRE338cS+XDxQGlx+DBBNqkKpDPeE2OCwKjxx6UD
         NaLY3latSTAQ9i94v0k7XfmP4br7g9VkHReltUknaAUIL9YGYSUoYxw1HDPeLG5NleBd
         4VfjhVOPSlCv7eaSWs27g7NRz1XcBmEjK6ic08VcbaPicuBwtlKGxOJLnUpgW1BU7ELj
         ctJRQQBxC/g3RyxTti/LGKef2riHfxtq6bfp20zMNTyS1sLtsPNILuRAKMf/0BRwRrtH
         QLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695939180; x=1696543980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hm24NpX94JBemDRTScZMK9z0G78Go8UKUQZ7xueoWyk=;
        b=cLLA+p0uuTlrh5k8tDnohlhImbL/XfkLZiNOWNFaVYfQArc85z6a1TRIF7JGa9Bxgd
         sK8EBQxul4j9xaKC/DLIqxQgYWrVL2sJ8z0vSIIuVCkVaWeqsO4jCnJedqgMZkYXCW4p
         4XHqMzebfwIur02A42amGb7qOONAwsOVr2vJBQExIaZY2ERvV5CczA9jpPg6BkAU0TVL
         Hgg62LIDjsu5S1e4+Oyumfbjg1lScFiPVwpYueJPraWeXQKDqYLDog6FglPPtyPU7hVl
         CZE2Y/UOaYDQuOONc01fdvernUi4rEc6bxxH5d/BSxYe5KwTrDXqfqQ3VKDUnJx9LVX8
         ub0w==
X-Gm-Message-State: AOJu0YzUPil9itSbTSJ66P/UP6HjJZwQDfyMhTeY+MrnSmItfZtWfAv5
        f4QEl5kc7xobUTiGaHtVehtnlDukoi6H2t8UJXs=
X-Google-Smtp-Source: AGHT+IEcd7LSxKs1vQhEEohxk1j+l3rrDJD0tdrKzXWF996M/+vrMgyyTbA56OWL+2IlDzI4mvQOvA==
X-Received: by 2002:a05:6512:3b23:b0:500:acf1:b42f with SMTP id f35-20020a0565123b2300b00500acf1b42fmr2510533lfv.53.1695939180185;
        Thu, 28 Sep 2023 15:13:00 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id r27-20020ac25a5b000000b005030cef433esm3271964lfn.94.2023.09.28.15.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 15:12:59 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 29 Sep 2023 00:12:57 +0200
Subject: [PATCH v2 4/4] ASoC: rockchip: Drop includes from Rockchip RT5645
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230929-descriptors-asoc-rockchip-v2-4-2d2c0e043aab@linaro.org>
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

The Rockchip RT5645 ASoC driver includes two legacy GPIO
headers but doesn't use symbols from any of them. Delete
the includes.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/rockchip/rockchip_rt5645.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_rt5645.c b/sound/soc/rockchip/rockchip_rt5645.c
index ef9fdf0386cb..7d4d3a0ac5fd 100644
--- a/sound/soc/rockchip/rockchip_rt5645.c
+++ b/sound/soc/rockchip/rockchip_rt5645.c
@@ -8,8 +8,6 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
-#include <linux/gpio.h>
-#include <linux/of_gpio.h>
 #include <linux/delay.h>
 #include <sound/core.h>
 #include <sound/jack.h>

-- 
2.34.1

