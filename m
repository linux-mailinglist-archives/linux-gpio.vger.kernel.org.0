Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC1987B0F07
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Sep 2023 00:47:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbjI0WrX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Sep 2023 18:47:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229943AbjI0WrV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Sep 2023 18:47:21 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27F4B114
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 15:47:20 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-50481a0eee7so2545097e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 15:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695854838; x=1696459638; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CY0vsjcVCBgE58w9UR6SBm++3xKyQBSwPNYicIzid6s=;
        b=wqauXqbrRkpccoouQrxJsembbjhcREi5fFXbyjfnDlhz6zjhEkAXxYJ/TCJAYREeP9
         yMNVTCxxz5MZSI01c8BwMa3FK+iIToaZqU4xUjRCoEUCaAcCP5hSqazNd1r0mCgiGqUx
         av8H6Zjd/R5CcVGYgCUWhFsHKDtDlgD5Blr6c2aOLzsaX5qkbrzNYhqyjqo22Vie+oK/
         vVv7r6kf/feBY5hwAxuifIjJE2LdpbTnYkE911o+VjcSU1/lw9+d38s9iXHKkObu2YZ1
         QwEoOWdX4T96oWv9fwbWyzpWK4TH/fi6f3N0ESCcCQm9Fa9y9HsJ9GGcz6zvJQUxjLD0
         K6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695854838; x=1696459638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CY0vsjcVCBgE58w9UR6SBm++3xKyQBSwPNYicIzid6s=;
        b=H79NpGcg9LHAXt75ehfX24P1CvC4NTTEm9y7tEmvDYUbrz0j4L8UN2BkHro6jkFSAd
         DfXv4SCgSbzUfenHTjDPxsRuUuf/aqkHCF76hNehHM9jnMuUZiEDw1YqPhfIWpR/HtJg
         VuwEuXt0q4WR336P2ynGmwXfv75+hm2xwaqG9CilOFwxvECVcBpVhmTmFf0ULO/NtSDC
         jxlJfoltkaegFg6xczIMwmrOylncc8X3Kdm+1OUahNerHy4Zje6/zuH+sgKj/LZX4rwK
         ZX75ILzlY4VbKWZRUpB/sVS7BsU2LowwlZL+mq0icgTYaJGQWe3Ijg0/tUznfRwyPaZO
         rLJQ==
X-Gm-Message-State: AOJu0YwxxG/ZSRUbizj7eJmoWXl2+cgARkZG+WnU7d1o+4HDKeG2EVup
        uUXDG1Qny5P1DETCivZsNQZczQ==
X-Google-Smtp-Source: AGHT+IEX4yAeJVMQ9xLxRU+QUVQR8aPJSks9x5s8hY6YWkQ+B5BI90m9BXzskEw8JTnRLhnt+p9GEg==
X-Received: by 2002:a05:6512:110d:b0:501:bf37:1fb3 with SMTP id l13-20020a056512110d00b00501bf371fb3mr2796624lfg.24.1695854837664;
        Wed, 27 Sep 2023 15:47:17 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id ep14-20020a056512484e00b0050296068a12sm2801746lfb.30.2023.09.27.15.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 15:47:17 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 28 Sep 2023 00:47:16 +0200
Subject: [PATCH 3/4] ASoC: rockchip: Drop includes from Rockchip MAX98090
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230928-descriptors-asoc-rockchip-v1-3-a142a42d4787@linaro.org>
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

