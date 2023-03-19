Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 836256C0520
	for <lists+linux-gpio@lfdr.de>; Sun, 19 Mar 2023 22:02:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229878AbjCSVCU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 19 Mar 2023 17:02:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229582AbjCSVCS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 19 Mar 2023 17:02:18 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E32DC14E8F
        for <linux-gpio@vger.kernel.org>; Sun, 19 Mar 2023 14:02:16 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id d7so11115348qtr.12
        for <linux-gpio@vger.kernel.org>; Sun, 19 Mar 2023 14:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679259736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9AGJWMFZbo5fpLPkN4Owh4cw9xbOzMAGoq7uOCVoSZk=;
        b=OHZoYgH1vFDpxDzUfb6oxysxHpdW968gDY2DRjbjmtNN15NIytmhLtY4FemgXakpfU
         2XxgnqulDDx5DIl5l4REapTDm2kauedL8LY0dLlvDn7nkatoWCPryT3RKFLDrik4djQP
         p8bTSXXe7YFhCclY8MbQtLFaDgTiIVEsziuaFe/OX143Y82agu+KZ9dWZRxiMYJbaHhO
         JQSWxDIpvNmdGFC8iig+SaUQEos1jxWm9m41nkiBSbFgrO6/oNBNBHDqZLeeZmDzO401
         B+S3ZN3hGRV0DLsPSbKSxeELVL6+bksh9gyjBJZlKHXlW+9dpqx0RIYgAUNjwBcF5CdA
         rQqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679259736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9AGJWMFZbo5fpLPkN4Owh4cw9xbOzMAGoq7uOCVoSZk=;
        b=chA7eSOlVUR4T2iYzRQ4fna97A7NN9aMs/o3Y812oiJMbCal+Nrf6cAWA9GzO3Z2lk
         5AOdz6zBaS99NdtTXHm8i6U+zBVuwd8n9HijeJ5Rwt+O7SKkrdIR5C9MaGKI3EmmNQmf
         rpnEFICBVg7YYN73JJTjSrwJty6BPRmiI1A/xvEFjwkuuZ01xQc6X3iISy9IrEWEmyYf
         hP0QdUYTDwv+giZv5wr8wPKKRtKAQR5rWg41ftbzYmjblHoc0viaAcwcgg77eSkicm6L
         2k/zf7rpCDaOLtIzLPP3U8qZo0JT/cC6n85q4kvMopXkNtRRere2syIfTdeW3ePpzhPi
         XDWA==
X-Gm-Message-State: AO0yUKUDsqVfap8HPEaGGfVI04K00TQcC8S005KLfA7hQVlWveed92wK
        Eq0Kt/I/dB1dYCrv9ycUEW5xgg==
X-Google-Smtp-Source: AK7set9352BrXQD/XMWazbIWFbhxQX8OebwZaJyVoS2yfBQjw+imRAES4FSZCBo/JjDh+lk0EWhEjw==
X-Received: by 2002:a05:622a:1a25:b0:3b8:5057:377b with SMTP id f37-20020a05622a1a2500b003b85057377bmr23995728qtb.65.1679259735796;
        Sun, 19 Mar 2023 14:02:15 -0700 (PDT)
Received: from fedora.attlocal.net (69-109-179-158.lightspeed.dybhfl.sbcglobal.net. [69.109.179.158])
        by smtp.gmail.com with ESMTPSA id o16-20020ac86990000000b003bf9f9f1844sm5225762qtq.71.2023.03.19.14.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 14:02:15 -0700 (PDT)
From:   William Breathitt Gray <william.gray@linaro.org>
To:     Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        William Breathitt Gray <william.gray@linaro.org>
Subject: [PATCH v2 0/2] regmap-irq: Drop map from handle_mask_sync() parameters
Date:   Sun, 19 Mar 2023 17:02:00 -0400
Message-Id: <cover.1679259085.git.william.gray@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Changes in v2:
 - Pull out 104-dio-48e refactor to a precursor patch

Remove the map parameter from the struct regmap_irq_chip callback
handle_mask_sync() because it can be passed via the irq_drv_data
parameter instead. The gpio-104-dio-48e driver is the only consumer of
this callback and is thus updated accordingly.

A couple pending patchsets also utilize handle_mask_sync() [0][1], so
it'll be useful to merge the changes in this series first to avoid
subsequent noise adjusting the dependent drivers.

[0] https://lore.kernel.org/r/cover.1677515341.git.william.gray@linaro.org/
[1] https://lore.kernel.org/r/cover.1678106722.git.william.gray@linaro.org/

William Breathitt Gray (2):
  gpio: 104-dio-48e: Implement struct dio48e_gpio
  regmap-irq: Drop map from handle_mask_sync() parameters

 drivers/base/regmap/regmap-irq.c |  5 ++---
 drivers/gpio/gpio-104-dio-48e.c  | 32 +++++++++++++++++++++++---------
 include/linux/regmap.h           |  3 +--
 3 files changed, 26 insertions(+), 14 deletions(-)


base-commit: 03810031c91dfe448cd116ee987d5dc4139006f4
-- 
2.39.2

