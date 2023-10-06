Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 839747BB9AB
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Oct 2023 15:47:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232471AbjJFNrY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Oct 2023 09:47:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232469AbjJFNrE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Oct 2023 09:47:04 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B07E10F5
        for <linux-gpio@vger.kernel.org>; Fri,  6 Oct 2023 06:46:32 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-504427aae4fso3995722e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 06 Oct 2023 06:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696599990; x=1697204790; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rbOUvzEjDlea4hheqP+YItFqmSWqoancs5Dg0PuH8cA=;
        b=mser5/1lL17Pw+gZLiOv/Izo2sdLWvSD+5mNX5aQ5cCixs2F2ZoGk3fsNOq2JFsBEa
         lEFg8eR8JeCU8tqNOfT0KKaLkKmaYzIfXEem/WG/4UOgyRRrvftTcbWI9A9te2Ez+MbN
         Twd/xrZ1G8nr0DMAMxL27hlKLdrzLq5uglp3vXwoIvTaE1ZNIrkih0/et6lyCr1u38Gc
         BGtQmoefyzrZJUa0I+tZhq/7KtWnbuT9CDz/3UFHcVsFiGhpoiPEcftIfKfHLrV3UYOU
         8udafGLcfMsSqT7mbcBOtKskFtdhNc+2jgpOu5K3XyEPfNuFPmFpQowRYC4RZZxbr7kv
         xDCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696599990; x=1697204790;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rbOUvzEjDlea4hheqP+YItFqmSWqoancs5Dg0PuH8cA=;
        b=XajVmOWYAKTZszlRdXmNR2T9c7j9Hzb3gfBqimbIuBt0lyF49m28Sg3FTY2U7QvRSW
         iKXWhobHzgzWqtaSqcTguQIj4u4hKY2478E+/IeP7hfg51/Bc8R9haOYXZvReQy2QOig
         9bj0+WhP83OaA5vi7uHtTaC8ukIJJEkRVDroSvmHmSCZtWP1jIgDENkNMII4qVGl1WHM
         k2ilFqqIhJG6aSU0zi8cj6I4sUPlJRucsyibV+sxKXAwBvE0VzI7iNl6s8PKcKuBHnDp
         dGhslZjlabU0WwJbhzXW6COAH/C5MT6wtOaNZst7Uny7o9uuUO4aqgetoRKpgCHj2UQI
         bv8Q==
X-Gm-Message-State: AOJu0Yye8ZsRyzYknXKN2jcyiYzBLxoJEF06uJS5EO3P1Jd3laO4rKRI
        Ta+BqxI8ofTTqpkmgWV6n55jkQ==
X-Google-Smtp-Source: AGHT+IE03cY9cbfFat4D3ognOlfRjSknFV24Pw5RSzWKwx+wwbMMYFomv7Z/+zEYe9XkBY/RRQgYGA==
X-Received: by 2002:a05:6512:3e0d:b0:504:320a:b420 with SMTP id i13-20020a0565123e0d00b00504320ab420mr3957398lfv.17.1696599990012;
        Fri, 06 Oct 2023 06:46:30 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id v25-20020a197419000000b004fe37199b87sm308733lfe.156.2023.10.06.06.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 06:46:29 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 06 Oct 2023 15:46:26 +0200
Subject: [PATCH 3/8] ASoC: mt8173-max98090: Drop unused include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231006-descriptors-asoc-mediatek-v1-3-07fe79f337f5@linaro.org>
References: <20231006-descriptors-asoc-mediatek-v1-0-07fe79f337f5@linaro.org>
In-Reply-To: <20231006-descriptors-asoc-mediatek-v1-0-07fe79f337f5@linaro.org>
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, alsa-devel@alsa-project.org,
        Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This driver includes the legacy GPIO header <linux/gpio.h> but
is not using any symbols from it. Drop the include.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/mediatek/mt8173/mt8173-max98090.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-max98090.c b/sound/soc/mediatek/mt8173/mt8173-max98090.c
index bfb2094758ff..0200da192116 100644
--- a/sound/soc/mediatek/mt8173/mt8173-max98090.c
+++ b/sound/soc/mediatek/mt8173/mt8173-max98090.c
@@ -9,7 +9,6 @@
 #include <linux/module.h>
 #include <sound/soc.h>
 #include <sound/jack.h>
-#include <linux/gpio.h>
 #include "../../codecs/max98090.h"
 
 static struct snd_soc_jack mt8173_max98090_jack;

-- 
2.34.1

