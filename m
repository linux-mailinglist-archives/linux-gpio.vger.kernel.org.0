Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 229517B0F05
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Sep 2023 00:47:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229460AbjI0WrV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Sep 2023 18:47:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229934AbjI0WrU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Sep 2023 18:47:20 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 915ED11D
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 15:47:18 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-504a7f9204eso1625995e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 15:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695854837; x=1696459637; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dq20wAX7KyYyuxOCj/4NvQoVluqusmWSS2hLsMjGcCE=;
        b=MuGhvxZb3P9xMRKghwriECI9L9pPR730h8evMNe6sPEsdGZMRBZnvNoetdoIESNxZK
         tafU7EucscUa3GPfxmkyL/NoytBYshArsdGqMbeqf8qGXAv8YFdzFQ0Wf1+U8MkF2G6s
         0jHzKFM9vGNOIVPz6RVkwSAJGEGmP0ZDPz8xLJvELOkIME+x8ERAXFXZVSLfZWpjzBH0
         /ZRCuAW9QUl/rohmvKUjua4u42gzMqgTdwxgz//u52EiF/bFIcXcoIZh9FyEMW+nMzFS
         u+RH92xgZnFbzcdMQVQt9nujSqtOEOnsFIr5xV0ZYMIdbk7Qx5dYStq8J9vbSGkmHLGz
         YsAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695854837; x=1696459637;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dq20wAX7KyYyuxOCj/4NvQoVluqusmWSS2hLsMjGcCE=;
        b=fIYD3EFNqpbjuXII+Fn267KaoPwLDVYzm/zSXlGeEpGXUAJrKZtErEXR3ZRj4x+EwX
         WiQwTLV+iQfHM1o4Ua8/jsyXbA6Eb/RM3aJhq6vHjcLHCIFhFYj6ldIPf+bBFQpy67nv
         nVirfPUV2oNIoi6pMzfzUXnp0k6Dq78zBDarkdoPfZO26shtyWnlCUOcJPPnwXhhBVEd
         ZkqV53GRZl7DXK3vhY6xHlx/vJN6LgQ+iZGKlk/o7b3GYEEYMdNECmxk0kSzfBPcnVJW
         0usPhtS1YBRXYaiv9ciLSll/1GZY7YPTgmj5zDacom9gF5FbGmKtxtkDBHz3uSyuSOk6
         Uz9w==
X-Gm-Message-State: AOJu0Yz2FzXl4B+aEsGWH3CuJDdKss22JaJxg9KGfH60hDIaRCwGA6L0
        TwpqSm79yFpXFZMASuR/IUf+bpw6P3WFFgIBHd4=
X-Google-Smtp-Source: AGHT+IEfC0+hlBUj1Yf/W2nh73lfyeNcEfUcYf/ZYF/GatTdBOlrH90LckfUV5sGFYU2vNlRmcj12Q==
X-Received: by 2002:a05:6512:324e:b0:503:264b:efc9 with SMTP id c14-20020a056512324e00b00503264befc9mr2509397lfr.18.1695854836814;
        Wed, 27 Sep 2023 15:47:16 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id ep14-20020a056512484e00b0050296068a12sm2801746lfb.30.2023.09.27.15.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 15:47:16 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 28 Sep 2023 00:47:15 +0200
Subject: [PATCH 2/4] ASoC: rockchip: Drop includes from RK3399
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230928-descriptors-asoc-rockchip-v1-2-a142a42d4787@linaro.org>
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

