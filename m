Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBBF37CC23F
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 14:05:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234843AbjJQMFg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 08:05:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234941AbjJQMFS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 08:05:18 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F73A114
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:03 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2c5071165d5so43193871fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 05:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697544300; x=1698149100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rjj2L8rLah6r0INEUdpiOGWMpBQyEZBDFUolDbEZ0p0=;
        b=z/CyUMd1BPEubs6df4EZ7TvD76p7XdwoP7J/wDmr0XDNILiLu32z00X2wIvEW5SdsL
         6ncY78DkTmq56BdtHwrHgrhKt+woMqevkAqMQsakShO/ok44/4n5G8lo+nnIsK1m3tpN
         6nfyrKg4mSh8vUYrlGHyFoTNBNe2ORUpl9jDDGS7SHJjZCyBIoee3kfwFD00BbWGnftY
         o5qmVTSd4aVcH42pY2XGzXrlkNjxaLO9WZxz8dBaXLQ+/QdMBgONWFLSOl2fP10B117O
         64cMuq5ykyjZRv0SpTeICMWZkAUGMRQaEiRf1FtYqhMXpztz8D/I7opkx4In0d4UqDYo
         C1mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697544300; x=1698149100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rjj2L8rLah6r0INEUdpiOGWMpBQyEZBDFUolDbEZ0p0=;
        b=fkcny3eiSs6J3+y7po7Ceg4TH7pb16TnWXup7rgdSbeGgO9ZMzL7oMzieciDdMSjgj
         BicVHfEw/Mu0gHONMFKvnSyfjEnACjRjOsobG9BVciHLz5pvOuv2eHy23PJ1EpDKt4fK
         fjvoRRbVmnyNSrxx41kw4Xbi27Gvv41l54PAlaIxpoXTr67C/Ns03t3x/mbR93aayaEX
         BQ93gssyPVFDtJdfGhuao+3Fumjjlg/ZHPVY6eOzQShZAry0E0Dl6taDqP0NS/Xs99XT
         hrQP8jTskoU7Y9XnPGYg/H8cBVZQUJpgV+D4aH4GsbbWuyi+R9jmUioNUcUkwAq4yWQQ
         GKYw==
X-Gm-Message-State: AOJu0Yw2DqA0aECUB1QNoC4pe1AvlQU+OrX0SQ4l08ZujAzPMUJuijzJ
        23S1Gpr+Wg1fEoPvQTu/+zH9M1tlQwZgJMVecTU=
X-Google-Smtp-Source: AGHT+IF6xYqWu+N/+NmMuEJHiscRxkTxhmGb4u2hRcEmQfkg+3wVWPO6ruzuVOlWxi45cXpF52kaWA==
X-Received: by 2002:a2e:9613:0:b0:2bf:7905:12c3 with SMTP id v19-20020a2e9613000000b002bf790512c3mr1427429ljh.40.1697544300349;
        Tue, 17 Oct 2023 05:05:00 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b00405442edc69sm1353859wmm.14.2023.10.17.05.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 05:04:59 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v3 11/73] gpio: rockchip: use new pinctrl GPIO helpers
Date:   Tue, 17 Oct 2023 14:03:29 +0200
Message-Id: <20231017120431.68847-12-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017120431.68847-1-brgl@bgdev.pl>
References: <20231017120431.68847-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Replace the pinctrl helpers taking the global GPIO number as argument
with the improved variants that instead take a pointer to the GPIO chip
and the controller-relative offset.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Acked-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/gpio/gpio-rockchip.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 23040a8cea34..3576793f0bd9 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -159,9 +159,9 @@ static int rockchip_gpio_set_direction(struct gpio_chip *chip,
 
 
 	if (input)
-		pinctrl_gpio_direction_input(bank->pin_base + offset);
+		pinctrl_gpio_direction_input_new(chip, offset);
 	else
-		pinctrl_gpio_direction_output(bank->pin_base + offset);
+		pinctrl_gpio_direction_output_new(chip, offset);
 
 	raw_spin_lock_irqsave(&bank->slock, flags);
 	rockchip_gpio_writel_bit(bank, offset, data, bank->gpio_regs->port_ddr);
-- 
2.39.2

