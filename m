Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 148DD7BB9A5
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Oct 2023 15:47:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232577AbjJFNrR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Oct 2023 09:47:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232578AbjJFNq7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Oct 2023 09:46:59 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37F9612C
        for <linux-gpio@vger.kernel.org>; Fri,  6 Oct 2023 06:46:28 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2bff936e10fso38982271fa.1
        for <linux-gpio@vger.kernel.org>; Fri, 06 Oct 2023 06:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696599987; x=1697204787; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iyIWSI35ioF9P5y4BP7rlGwfh5ltYmHyWesLeZ41VQA=;
        b=BHSf1B50RJ5iN2Rr0Rq5gJgfP7HqsJMZO8+S+Brs0LrwXBndT7k6vNalyV3C68mC/Z
         OGZCO006+QjRcgBvs0r9MO+UQUhIjVGm9ya0WAnaUw2gM974zw3iLjtCGD/rv+ezRjIB
         rz4IvTHWNekybxFz7JFvouhRMEibhKoJvWySIq2cnGGar57S3nbaAlNosJ2zsNFof5I5
         oy+rI6KaWtmGqgYresyGCDptrMDXmfmapz1yjIBqzSttY21weNEJvOj4HmFwx8HC+UPH
         Pn/FoIXw4MzDTILZfHx7nq1jHvUI3naA++aV8CiKDs7rTPi699INAksqAWnXO3E9I/rb
         HPvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696599987; x=1697204787;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iyIWSI35ioF9P5y4BP7rlGwfh5ltYmHyWesLeZ41VQA=;
        b=GPgvvM5zZj9KJFODyOD5PzZO7pwYBGCMEPDd5Suc8wI8ko5vhJ+v4knUU34eZTcX3d
         o2CJCY+xV4ii5fVO+b7jNio9CfHSjjzerRu8RcjLSSRE4WVu0PknURQp/uc4dkP9CQO5
         zF7wpEhTS2KjhJuPFjwgJ2fquaunQBJJWDUZp6kSWRMmySlw2I2GoZ7pqHrsamHHrz3I
         hTRgy9/VXPgDSmVR9CI6H7UyupDVAJ4zEWZPYxr59KLXZxUbHRSNOMHLAUDdr2aMnRhG
         w0JW2a7XlnvHBYaNiWbxflzkoe38b+2X+V1Nre35Dgj923KfTeOumM8fwZn1PjAP+PDK
         RlTg==
X-Gm-Message-State: AOJu0YwbUS+qMo5WS2KbulAuVvknF8TbbUyc64j62HvLBlDprh3u5YDs
        FfF6uY5oO35FCpEMNfGtm1R1U+qtFvXbreOiBcU=
X-Google-Smtp-Source: AGHT+IHGZbYm5OyG87d6TAKeG9ICFcG1L5jBwIGzi+m4DbZK7DRyNC9xmJcbHkphJg8oT5Yn4KFEDw==
X-Received: by 2002:a05:6512:313c:b0:500:96dd:f95a with SMTP id p28-20020a056512313c00b0050096ddf95amr4307682lfd.24.1696599987078;
        Fri, 06 Oct 2023 06:46:27 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id v25-20020a197419000000b004fe37199b87sm308733lfe.156.2023.10.06.06.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 06:46:26 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/8] Convert Mediatek ASoC codecs to use GPIO descriptors
Date:   Fri, 06 Oct 2023 15:46:23 +0200
Message-Id: <20231006-descriptors-asoc-mediatek-v1-0-07fe79f337f5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK8PIGUC/x3MTQqEMAxA4atI1gZS/xZzlcFFbVMNopVEhgHx7
 haX3+K9C4xV2OBTXaD8E5O8F7i6grD4fWaUWAwNNa0jGjCyBZXjzGroLQfcOIo/eUVyoU2pI+r
 jBKU/lJP83/d3vO8Hdr86wWsAAAA=
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
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Convert over the Mediatek codecs to use GPIO descriptors.

One few-liner affects gpiolib-of.h, I don't think there
will be conflicts so I suggest that all of this can be
merged through ASoC after review.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Linus Walleij (8):
      gpiolib: of: Add quirk for mt2701-cs42448 ASoC sound
      ASoC: mediatek: mt2701-cs42448: Convert to GPIO descriptors
      ASoC: mt8173-max98090: Drop unused include
      ASoC: mt8173-rt5650-rt5514: Drop unused includes
      ASoC: mt8173-rt5650-rt5676: Drop unused includes
      ASoC: mt8173-rt5650: Drop unused includes
      ASoC: mt8186-mt6366-rt1019-rt5682s: Drop unused include
      ASoC: mt8192-afe-gpio: Drop unused include

 drivers/gpio/gpiolib-of.c                          |  4 ++
 sound/soc/mediatek/mt2701/mt2701-cs42448.c         | 54 +++++++++-------------
 sound/soc/mediatek/mt8173/mt8173-max98090.c        |  1 -
 sound/soc/mediatek/mt8173/mt8173-rt5650-rt5514.c   |  2 -
 sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c   |  2 -
 sound/soc/mediatek/mt8173/mt8173-rt5650.c          |  2 -
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c        |  1 -
 .../mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c |  1 -
 sound/soc/mediatek/mt8192/mt8192-afe-gpio.c        |  1 -
 9 files changed, 26 insertions(+), 42 deletions(-)
---
base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
change-id: 20231006-descriptors-asoc-mediatek-01c3ff4005db

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

