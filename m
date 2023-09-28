Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EC327B2829
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Sep 2023 00:13:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230325AbjI1WNA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Sep 2023 18:13:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231446AbjI1WNA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Sep 2023 18:13:00 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2903319E
        for <linux-gpio@vger.kernel.org>; Thu, 28 Sep 2023 15:12:58 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-503397ee920so21115019e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 28 Sep 2023 15:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695939176; x=1696543976; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O6rklr6oFZBRP3XLshOSG7uTOA1JIwCF+2vk+UW3dq0=;
        b=S5DnzMy/8EsJhPaAd3+UVVm0WvXzMEFHYYZiuamsQVMqGDdzOP+mqeykAHqXOTTS4l
         prEDhOmO4pJXpdQqBdPU9RiAqHxlfPGivk1NWNyu5ISWGHpuaJBSM+tyrjx361DadTvG
         f8LB/k3PJjiWmqMJL3aq3+xsw9eYGN1iEeVQZ5Y7Iv2yOZT8uevXqSi94VIdYhO5w4+y
         TdetX/qVEtI1EG403OwE1qeLaRwhmyvr9daz8HTv104V6gD+bkMUdP/XS5Q8nKa8dAef
         ByniP/7rGWsNR0Q8biV/spJyNpyEsbxfCMHxRJLhsnBIG4iW5vXGN3ZNaky5oxY0L92m
         k4lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695939176; x=1696543976;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O6rklr6oFZBRP3XLshOSG7uTOA1JIwCF+2vk+UW3dq0=;
        b=jDEJb5NVcW9qySMAPiwjMiNRyaJutEEtU96luW+G286XhccH4hSC5IqFmuT2zlQd4M
         Vz8NJGLKxeaeEEFgF28R8qtrVTWGX0ak/qHgcDTC+So/xfdx19JEG5B22J7VwZ/hxFHR
         RrROAIgk2tjuZrD3E79TsC6DFiOZCeYiOtmX0J0dLz7U8I3pPXucjFT8S30QseBOwvVz
         EUtS/mDdyzUSFmCGyFwwaiDoXo0L9JUK4NDYh9LsTY5ozBJ3KSuaQhiYLKrQGayxlJsw
         7wdKjjjYKgzcPP6sZVqyY8G2aiMbdFv5/FEFyhKoTwxNsNaRmzL1DEHVr30vOoYaEy6c
         GGoA==
X-Gm-Message-State: AOJu0YzfPEX1yztIv61elMJqQ6+dakrHkX+eZ8X1SEHqM+fVWTvwuHvA
        N/Dz6Yov1/7w5LuDprldjexG1gqsAruB20aWCGE=
X-Google-Smtp-Source: AGHT+IGS4laI4UHVLnIkjLSrMRmia+rD8yaRDC1PhmkavvJYotFSmpNaF2s2LDwJ/U3xrGw2O5pC9A==
X-Received: by 2002:a05:6512:3095:b0:500:94c5:6e06 with SMTP id z21-20020a056512309500b0050094c56e06mr2394386lfd.56.1695939176271;
        Thu, 28 Sep 2023 15:12:56 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id r27-20020ac25a5b000000b005030cef433esm3271964lfn.94.2023.09.28.15.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 15:12:55 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 0/4] Convert Rockchip ASoC drivers to GPIO descriptors
Date:   Fri, 29 Sep 2023 00:12:53 +0200
Message-Id: <20230929-descriptors-asoc-rockchip-v2-0-2d2c0e043aab@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGX6FWUC/32NQQ6CMBBFr0Jm7RhaGkFX3MOwqEOBiYY2M4ZoC
 He3krh1+X7y3l9Bg3BQuBQrSFhYOc4Z7KEAmvw8BuQ+M9jSVuXZnrAPSsLpGUXRaySUSHeaOGF
 TVd4NN6rJDJD9JGHg196+dpkn1my996vFfNdftflTXQyW6I2z3tne1U3dPnj2Eo9RRui2bfsAI
 fpisMMAAAA=
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
Changes in v2:
- Make the GPIOs properly optional in the first patch, preserving the
  old semantics of the driver.
- Link to v1: https://lore.kernel.org/r/20230928-descriptors-asoc-rockchip-v1-0-a142a42d4787@linaro.org

---
Linus Walleij (4):
      ASoC: rockchip: Convert RK3288 HDMI to GPIO descriptors
      ASoC: rockchip: Drop includes from RK3399
      ASoC: rockchip: Drop includes from Rockchip MAX98090
      ASoC: rockchip: Drop includes from Rockchip RT5645

 sound/soc/rockchip/rk3288_hdmi_analog.c | 46 ++++++++++-----------------------
 sound/soc/rockchip/rk3399_gru_sound.c   |  2 --
 sound/soc/rockchip/rockchip_max98090.c  |  2 --
 sound/soc/rockchip/rockchip_rt5645.c    |  2 --
 4 files changed, 14 insertions(+), 38 deletions(-)
---
base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
change-id: 20230926-descriptors-asoc-rockchip-833a4fbc7c1f

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

