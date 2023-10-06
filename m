Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 608067BB9AF
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Oct 2023 15:47:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232634AbjJFNr2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Oct 2023 09:47:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232530AbjJFNrG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Oct 2023 09:47:06 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6565E10FD
        for <linux-gpio@vger.kernel.org>; Fri,  6 Oct 2023 06:46:33 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50567477b29so2795604e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 06 Oct 2023 06:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696599991; x=1697204791; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yLHdfqqmxuwlIGJBiB8XcSmFMMCFwMYGv/NG27m7YvI=;
        b=An+M2HyRVs4iN2pBuPtoRcc3nHvBviC/tHtdPinZGIyjpGFPZyvj1iY1ZOLuxv7ARL
         Phq0wH1vImt+1YZQNEAOpTCl7yN3g4fPpnpKza8EieA1wdldFIUcv1crR04DIC8kLrxk
         69xXKoFqVdGYNfnX2wiTeru/LjhYxaYcY3h9RIZC/unGMh3bTin9dQRyIxRkcJzfPSh+
         bPXWSd76h3X+mX5cNw8DW1j5ght61jUgOkdwMATJpPmjCq23558GqbMxGQLH8Y6Sa00y
         m9glru/IJPtj0AJHmfQTKU/v824q8YCTaednZa9hIZZuZSf4O0Qe8s/jEw/Hc2dqOkfA
         a4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696599991; x=1697204791;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yLHdfqqmxuwlIGJBiB8XcSmFMMCFwMYGv/NG27m7YvI=;
        b=XM6QMYAFNG6+Cg9c3CGhfXdWpliduoO7Igwo28ISD8hA1U47WzjLnBN/z6KXFlaElP
         /DW2peCs+ui/gnDaPLUXwNIkEz3QrqGFg7NsI97Kh1OQoSkoV4+3FSFczDoqGY9Q8udO
         Toql9LeIVbZCguc6WWghYRuyJaWgN14m/w/zOEYvH4dZ2jIkP/3GZqDrblb3oI8D4k5/
         jNjtOynLg3GpRtYxkDk8GNW3NQiPGHlp29DNrVFd5diAI5lc+gbD79P+KBhCziFMz43D
         P8Nd9b0X9SPd4hwUTmCA2s0o3hncdTVhYTKE0CFY2nL4+wr68jBhNuT3o5r9W1Dk9TwU
         GsvQ==
X-Gm-Message-State: AOJu0YwRcd6I5BAWo1eYa5sn8Po3hdSR9I0ezJZudySUxya1V3nimJFp
        Jm1ikycF8ED0230s6IUWcUOr3A==
X-Google-Smtp-Source: AGHT+IHH6cMZMIc0p+3s1aNepbYLEIdwjOGFxWA8k3GZHEzIsKgLBMyNC5q7KJmT2KWbBpAGygbDMw==
X-Received: by 2002:ac2:5e21:0:b0:502:ff3b:766f with SMTP id o1-20020ac25e21000000b00502ff3b766fmr6194209lfg.6.1696599991178;
        Fri, 06 Oct 2023 06:46:31 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id v25-20020a197419000000b004fe37199b87sm308733lfe.156.2023.10.06.06.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 06:46:30 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 06 Oct 2023 15:46:27 +0200
Subject: [PATCH 4/8] ASoC: mt8173-rt5650-rt5514: Drop unused includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231006-descriptors-asoc-mediatek-v1-4-07fe79f337f5@linaro.org>
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
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This driver includes the legacy GPIO header <linux/gpio.h> and
<linux/of_gpio.h> but does not use any symbols from either of
them so drop the includes.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
index e502cd1670ba..0204b461e291 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c
@@ -7,8 +7,6 @@
  */
 
 #include <linux/module.h>
-#include <linux/gpio.h>
-#include <linux/of_gpio.h>
 #include <sound/soc.h>
 #include <sound/jack.h>
 #include "../../codecs/rt5645.h"

-- 
2.34.1

