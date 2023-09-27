Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78C9D7B0F06
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Sep 2023 00:47:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229908AbjI0WrW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Sep 2023 18:47:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbjI0WrV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Sep 2023 18:47:21 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 554CA191
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 15:47:20 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2c123eed8b2so204545061fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 15:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695854838; x=1696459638; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hm24NpX94JBemDRTScZMK9z0G78Go8UKUQZ7xueoWyk=;
        b=BQZ6J6szZCPoRkUo5uoBmrLoJ7QSduCk5dsQ7N86JWpRJBhd8cHcTtfcoBJNWVnp5I
         cNBXNY+Vq5v3IFLIy616cfFCBjvNnt11ivb3yJjteDM/eBQOL7xCSBAYfTfTE7bR3okh
         gYAG2Lq3HfLJm+H6kkuoQCl8PWK+mPdl66ydLC4OlSMUwE6UoTa6mwYFr+CbSdBo1tYF
         ESxFJSZzYS9PSC36rBUdy8mznNPeFw/mcU7KWjRONG3AZhLa+rbzkC7EYUlY6YngqK71
         H5a4hS5J9cMrdEJNdsyDTM3fO4Jguht0j1aGEgYSEAGxkB5N/3M2q3ENbQjdHWUlA8Ak
         eAKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695854838; x=1696459638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hm24NpX94JBemDRTScZMK9z0G78Go8UKUQZ7xueoWyk=;
        b=jMg6H2vu31kip1b3CBc1KbbIRswHwUDuq/AGsSFAYvEEWP+/BBYYQPV5ehDdTAZylk
         b8PyzVktxONyOzMaBu1nWwbu4gEqWpoxxVafQSCkwktuzft7tswUC888tx9+POlWyzmK
         tOGxIppbtxY8bOFCpT5GsYRq/Y9DPNiXWK1iR2la0wz+N4yWgpM6KdN5+pvzkfSyZ1yX
         cBednp9rkUAIwc4QZT2GIrOwDessrbC0qeu5Ati44Wib85OfvMQOFKKUvQOOemaZ29Tj
         0Z4fLc4WvgdnDXMHEj2jRzhkWHQ5l1cM5nyw0DZSHp1vaQWykOvV/ViUxHZMdv14Gr/x
         9C0g==
X-Gm-Message-State: AOJu0YwYQQqf1fhJFW0KMDsV6a/lARVR2PGYfgIidHDJGs8sZ2Vxxp+B
        JIcuoiGRgMhVtrrCDdBRTrQ+n3ylCgnTBCQS45A=
X-Google-Smtp-Source: AGHT+IHIPAOySo0YwjWaGIBqSx3zAKxnJQ1KilKVhhF1C+VnLfsmaRRx1osw7z8l9ymMS10PvpQvMg==
X-Received: by 2002:a05:6512:3b06:b0:503:364d:b93d with SMTP id f6-20020a0565123b0600b00503364db93dmr3348450lfv.20.1695854838581;
        Wed, 27 Sep 2023 15:47:18 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id ep14-20020a056512484e00b0050296068a12sm2801746lfb.30.2023.09.27.15.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 15:47:18 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 28 Sep 2023 00:47:17 +0200
Subject: [PATCH 4/4] ASoC: rockchip: Drop includes from Rockchip RT5645
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230928-descriptors-asoc-rockchip-v1-4-a142a42d4787@linaro.org>
References: <20230928-descriptors-asoc-rockchip-v1-0-a142a42d4787@linaro.org>
In-Reply-To: <20230928-descriptors-asoc-rockchip-v1-0-a142a42d4787@linaro.org>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Heiko Stuebner <heiko@sntech.de>
Cc:     alsa-devel@alsa-project.org, linux-gpio@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
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

