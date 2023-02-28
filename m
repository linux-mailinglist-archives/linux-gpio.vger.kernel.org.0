Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 280176A5F19
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Feb 2023 19:59:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbjB1S7f (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Feb 2023 13:59:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbjB1S7e (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Feb 2023 13:59:34 -0500
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C32123670
        for <linux-gpio@vger.kernel.org>; Tue, 28 Feb 2023 10:59:33 -0800 (PST)
Received: by mail-qt1-x82a.google.com with SMTP id y10so7061899qtj.2
        for <linux-gpio@vger.kernel.org>; Tue, 28 Feb 2023 10:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677610772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z1l1qg+H5Cw3LxrAEdYfHcnEmckF633lxPSK9vTgaOo=;
        b=uYezJH4ugTzCehGU9+LLTdr+M6JIPMKVLQWUNYxatamj0wPh6jCjzYzpiIWe/L/dSN
         9VYzbLiH15spQc0EjRC07Y/SlK5qGFLl/qIjUWmTa3BHwpmJiddscRhpjCPRUtnbEK+Q
         4P6sm/GOwzH2UNdkFjM2f3YSpYzmcTRyrU0zMISf5rLeqv+JP/+KTiGO9XQzlE1q8tG0
         F0/qKO6LFnjww0+RW2uFGnu5cfdwQXQKgTrezlTrGiQWiiHFZHv04TJKX5dXgtBipu3l
         wc2IVSGqsWB1NscyjVugb8YSq2Qz32VMOwga9uHaThmTpR4mQBc9NyBKvqnmZnO7AZ9u
         xI7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677610772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z1l1qg+H5Cw3LxrAEdYfHcnEmckF633lxPSK9vTgaOo=;
        b=8ONaWvR3Zkz7VEVQ3gGdKAvK0AIzQSTFX/RP3ad7wOq7jWtOzU3POHMszTv4Tm/qFE
         98TbI0bKEWwdS6ns16tzVnz+ZalUgYwl9YfOsvXK7zqciHctXFZ5cQolmJXqkdei6mP8
         ICG0CuHl0QZrWdmJKaeP9bEHWBGWdMV3Pr8pfnG+hAgAjmRFXAIinZdHl4E5Tqy2MFEA
         xX5cg7bq6fGgq+X5i80Y/vZiQL8J4Z8sUbTunWtdvmvsyykZ+NEFwPSYSJFYzBCHc6JV
         vBZmlhfvD7/o8uGEeHIF8a3d4NIqnyu+PyqGkEaaJieMxfVGDIcxMz8YWBdRM4fWKHes
         FvwQ==
X-Gm-Message-State: AO0yUKUrM/863G9gURLuwzqHCd2HnZYiFsYsIlfsmN69vcjIek0D7YOh
        QNB1vD7oefwI1CFysChdxCOVvA==
X-Google-Smtp-Source: AK7set9jsX/HlQyQM7Q3YSYM0gQKIo/egKde86buusKOOhFesehaelYHJ/oKKdmtQzIU/l03zz8JZA==
X-Received: by 2002:ac8:5b4e:0:b0:3a8:fdf:8ff8 with SMTP id n14-20020ac85b4e000000b003a80fdf8ff8mr6619317qtw.36.1677610772240;
        Tue, 28 Feb 2023 10:59:32 -0800 (PST)
Received: from fedora.attlocal.net (69-109-179-158.lightspeed.dybhfl.sbcglobal.net. [69.109.179.158])
        by smtp.gmail.com with ESMTPSA id e22-20020ac84b56000000b003b646123691sm6905181qts.31.2023.02.28.10.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 10:59:31 -0800 (PST)
From:   William Breathitt Gray <william.gray@linaro.org>
To:     linus.walleij@linaro.org, brgl@bgdev.pl
Cc:     broonie@kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, michael@walle.cc, quarium@gmail.com,
        jhentges@accesio.com, jay.dolan@accesio.com,
        William Breathitt Gray <william.gray@linaro.org>
Subject: [PATCH 0/3] Migrate PCIe-IDIO-24 GPIO driver to the regmap API
Date:   Mon, 27 Feb 2023 20:53:39 -0500
Message-Id: <cover.1677547393.git.william.gray@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DATE_IN_PAST_12_24,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The regmap API supports IO port accessors so we can take advantage of
regmap abstractions rather than handling access to the device registers
directly in the driver.

A patch to pass the device regmap and irq_drv_data as a parameters for
the struct regmap_irq_chip set_type_config() is included. This is needed
by idio_24_set_type_config() in order to update the type configuration
on the device as well as irq_drv_data for idio_24_handle_mask_sync().

A patch moving the struct gpio_regmap declaration to linux/gpio/regmap.h
is also included. This is needed by idio_24_reg_mask_xlate() in order to
determine the current offset's direction by using gpio->regmap in
regmap_read(). One point to consider is whether an alternative solution
is better of passing regmap in the reg_mask_xlate() parameter list; this
would avoid the need to include <linux/gpio/driver.h> in order to
resolve an incomplete type warning for struct gpio_chip due to the move.

William Breathitt Gray (3):
  regmap: Pass regmap and irq_drv_data as parameters for
    set_type_config()
  gpio: gpio-regmap: Expose struct gpio_regmap in linux/gpio/regmap.h
  gpio: pcie-idio-24: Migrate to the regmap API

 drivers/base/regmap/regmap-irq.c |  13 +-
 drivers/gpio/Kconfig             |   3 +
 drivers/gpio/gpio-pcie-idio-24.c | 697 ++++++++++++-------------------
 drivers/gpio/gpio-regmap.c       |  20 -
 include/linux/gpio/regmap.h      |  23 +-
 include/linux/regmap.h           |  12 +-
 6 files changed, 303 insertions(+), 465 deletions(-)


base-commit: 4827aae061337251bb91801b316157a78b845ec7
-- 
2.39.2

