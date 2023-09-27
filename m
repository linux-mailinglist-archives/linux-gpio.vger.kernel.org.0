Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 401DF7B0F03
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Sep 2023 00:47:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229922AbjI0WrT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Sep 2023 18:47:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjI0WrS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Sep 2023 18:47:18 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59C95FB
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 15:47:17 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5046bf37daeso10471339e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 15:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695854835; x=1696459635; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1dCKjjzeijbdTSPrO4ZzfLQv8741SuwD/1oOGQ2gAfc=;
        b=EksHHACIOzugP9L5JBBVWkXMg6YHHKv386XBzdsO522nZikvBse6aWUNfX4+vvk/sL
         cf1JuZbn5Z5sgWT7MIbivZ8OaBLL6ry6rcyOT6UvxKVD+R5xOD3a/KIwKTGBTe1318UH
         SyuGltCl/IOk2oBGUDLL5B1z+IeCUgGzDsX0flZC7bbZFVxqnmiMxxhPZpW8LPMCcLlB
         A8Em7M4B7g2JAfoSJBsthtB6o+ftlPmWZtW2DYxjCfQdDTfVvzU5yGf/A6F4E8ZEKS67
         dchqTocveEO16oWwTG031mKtEH8faRBzZr3x/HLj8Y+68GhZ5M8kk0+eFqRX62NQqcOb
         aQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695854835; x=1696459635;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1dCKjjzeijbdTSPrO4ZzfLQv8741SuwD/1oOGQ2gAfc=;
        b=DxpFLSrYhs7Rpd4HqvYaWrpb6WZvy9lKx/jQ7C7/KXRTVD9W58N9AF/5cgCXW+3Xu9
         NHbFK6fn/LZ3DkCBnJRiwI2j1+RfOg9bAinOVJwp05FVCS7U8hXScSeAkF2L9Usmlahb
         Vlovv0MjQu0QAQpB5wivz1dVfGI5kNr1DRNR3eVJct5m1RKRFega0skH0lspiuxDZR7Z
         1LXcRvvGv+JQgzvzssiYYakgIk4odfU+b4TjJxifLVoVwKBXnljIFKBk8rPMjKgin/+2
         Dy56Gv9pqv+3d7Tq7qDhJTKYlNbn1LR+Yui5EBXqoovp7UlmyoeumpOgKViv6LwNCInJ
         ITNA==
X-Gm-Message-State: AOJu0YwlOg8QjGmFD67A+irlp8A3gZE8eq0oqt8ZIPzUt+xQgDIn+pK0
        i3shbOVIQ9V5uGMGopZUARp0szaDkVp63VsC0Kk=
X-Google-Smtp-Source: AGHT+IGhFAuBK5ertcQ4xkq/eaYTwDXePJsXKH8GWiwuuhP409Sx4xS0GQOcgVKOghVztPKWhY3JxQ==
X-Received: by 2002:a05:6512:3c88:b0:500:8f66:5941 with SMTP id h8-20020a0565123c8800b005008f665941mr3683799lfv.50.1695854835087;
        Wed, 27 Sep 2023 15:47:15 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id ep14-20020a056512484e00b0050296068a12sm2801746lfb.30.2023.09.27.15.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 15:47:14 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/4] Convert Rockchip ASoC drivers to GPIO descriptors
Date:   Thu, 28 Sep 2023 00:47:13 +0200
Message-Id: <20230928-descriptors-asoc-rockchip-v1-0-a142a42d4787@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPGwFGUC/x3MTQqEMAxA4atI1hPQVpyfqwyzqDHVINiSyCAU7
 25x+S3eK2CswgafpoDyX0zSVtE9GqAlbDOjTNXgWufbtxtwYiOVvCc1DJYINdFKi2R8eR/6ONK
 Tugi1z8pRjvv9/Z3nBWpkjGZrAAAA
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

The Rockchip drivers are pretty straight-forward to convert
over to using GPIO descriptors.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Linus Walleij (4):
      ASoC: rockchip: Convert RK3288 HDMI to GPIO descriptors
      ASoC: rockchip: Drop includes from RK3399
      ASoC: rockchip: Drop includes from Rockchip MAX98090
      ASoC: rockchip: Drop includes from Rockchip RT5645

 sound/soc/rockchip/rk3288_hdmi_analog.c | 54 +++++++++++----------------------
 sound/soc/rockchip/rk3399_gru_sound.c   |  2 --
 sound/soc/rockchip/rockchip_max98090.c  |  2 --
 sound/soc/rockchip/rockchip_rt5645.c    |  2 --
 4 files changed, 17 insertions(+), 43 deletions(-)
---
base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
change-id: 20230926-descriptors-asoc-rockchip-833a4fbc7c1f

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

