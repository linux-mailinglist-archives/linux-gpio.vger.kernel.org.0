Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A9977B282A
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Sep 2023 00:13:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232052AbjI1WNC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Sep 2023 18:13:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231446AbjI1WNB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Sep 2023 18:13:01 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BA9719E
        for <linux-gpio@vger.kernel.org>; Thu, 28 Sep 2023 15:13:00 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-50435ad51bbso19381722e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 28 Sep 2023 15:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695939178; x=1696543978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dq20wAX7KyYyuxOCj/4NvQoVluqusmWSS2hLsMjGcCE=;
        b=z3mOPKber0l99I6ExoX9QhHj6wUFnmjRING6Ok7VWq2b2KYtWcGvZ2u5cuzx6jKKA4
         XI5hB5pFDxxKa3hBMVJdNt6PHpDkc2fauDgem97k2p53Eo/jirWzz29ehw4EbXte3IAS
         NhtPueZU3MNfFYB6uOi/pLpa4Ev9/A+HknTsD53+7qtdohCUoy1t0ESrB+SnRDvtmzai
         IkA0HtR6w7Av7Gb21akFUtxX0r8ZGU0ffznwFr29uSs85tgAOPjTbWCmd8MpiTR9BNGU
         pAE42dKox1bWBUfxWGdJ34vGu/tVAuDHFo4ePhfY2tlV3b1yPf/N44xIvgc4ynJ0rnC3
         4gJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695939178; x=1696543978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dq20wAX7KyYyuxOCj/4NvQoVluqusmWSS2hLsMjGcCE=;
        b=AG4XJr8vwghUFjIoS8CSUW/5SqjQdUmS8JkMKGsYCd62OTvKOgk4ANl2duognNrn5x
         G+jo2mBYBN7WsvD/EOHA7eebojehwf1Bn9tJ3YjKKjsTXJvtSlWGiQ/VCuA9kOHSHgbM
         3AbkaHFggH12OOqvlE51MrGdfZIViHsqlrBdVbILN4v/JWaf/o1HDm1vxIfHA0Np3+dP
         yRlnNNrLV/bPKB3hoLyKx8266ZFcaE83TjC1wvRcyIX11qcueJbTGzFA022YVTKnoT8j
         YzBXlzbCXn/5nooxzO5MPXXtnWGBzs0J5EuWN4bO7ffwmcJtCSgOctMbrY0eJq+7X8zF
         VhQw==
X-Gm-Message-State: AOJu0YzwCBn025jKnBUIkoj/eyNUoVTxiPPeglNkqlfsUmKHBa/1rLeN
        OEBCjjnaCweLYHW9EmetmzQb3w==
X-Google-Smtp-Source: AGHT+IH/mmM0nd0grFY56HkYk7pYC0txYkyCfW1BZfmsMKcj26i8WAbOvsdeSjB0ZgiMBG2REuwJsA==
X-Received: by 2002:a05:6512:4011:b0:500:9d6c:913e with SMTP id br17-20020a056512401100b005009d6c913emr2625253lfb.52.1695939178506;
        Thu, 28 Sep 2023 15:12:58 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id r27-20020ac25a5b000000b005030cef433esm3271964lfn.94.2023.09.28.15.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 15:12:58 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 29 Sep 2023 00:12:55 +0200
Subject: [PATCH v2 2/4] ASoC: rockchip: Drop includes from RK3399
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230929-descriptors-asoc-rockchip-v2-2-2d2c0e043aab@linaro.org>
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

The RK3399 ASoC driver includes two legacy GPIO headers but
doesn't use symbols from any of them. Delete the includes.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/rockchip/rk3399_gru_sound.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/rockchip/rk3399_gru_sound.c b/sound/soc/rockchip/rk3399_gru_sound.c
index 0f704d22d21b..a178fcd94d88 100644
--- a/sound/soc/rockchip/rk3399_gru_sound.c
+++ b/sound/soc/rockchip/rk3399_gru_sound.c
@@ -8,8 +8,6 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
-#include <linux/gpio.h>
-#include <linux/of_gpio.h>
 #include <linux/delay.h>
 #include <linux/spi/spi.h>
 #include <linux/i2c.h>

-- 
2.34.1

