Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC7917C53C3
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Oct 2023 14:23:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346882AbjJKMX2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Oct 2023 08:23:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346954AbjJKMXB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2023 08:23:01 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCDCE1FE9
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:10:42 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-40572aeb6d0so63421065e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2023 05:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697026204; x=1697631004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EYaubAEjb8jIz/ZTOGnBQzJ0oe0Kyc/ixkibc3BZPzU=;
        b=gJ6o3XNXNqPcrsDzBkzjjR7P/qyRDWUszJX6S21MICz8qC0s4tawavCrpD98GEA+jo
         f0ZGAZDHMPZ46eOG0KCZCTfujTuQG/eiZ1PrW5t2Vbyh5TN37d33IqcmGHbJPBuyz380
         qwB6ZL21T92NOsT01yWhihvMyERSCq0vMSTI2OJXIbmtgfLhe4M+b4bfD4cM1Pf+Lyma
         q1yGNZXtRLkuoKgrNRTlUbq55PpxXP+07EpmAiuFzNYep8CU+JhWSWxLfMIYZhvD1Bi1
         c8AjlmgRyNIBkCUxCXm0s2ZWE+22UR7GkX03d2ANiIdgXoBF2DLeZa4JM78lP2yX4kCE
         wvtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697026204; x=1697631004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EYaubAEjb8jIz/ZTOGnBQzJ0oe0Kyc/ixkibc3BZPzU=;
        b=mkhltnbxeDfvZUveOF8YaNX9Qyzg9cbD9D1POJQbuqCyBoPmLtFRtJpU3YP91GdfUL
         yoAdfFo4Y+WESINQrEwd/t8hIvMyTK9Ahlb4g4b8AwTGKswmf9h+u+DO9JD6VeYD3+Ww
         lj2RHgDMkzBKcqGrUmd82vSQlPaIChbtJ6cOvoMnjPiUOCr5+x8cwiFaFfeyhmF4WgbH
         KNY4uZXgrWhg3ywPnu8wd/xIs2tbffl2+3dN+GGAuXyygrMgG6LZegu+HnRAvQ+KcAfW
         BroWWMDod9VmFDirI1GeRD7cCThUA79pB0KANcvEMGXmHVbYT3E3R02mUJNXfd1aVsqD
         B1SQ==
X-Gm-Message-State: AOJu0YwnLdAsAV5iJA72CH5gl3Y85aR3bwXuOiUU0ADHiqmJmSnGPR7h
        t/VnsFSNZgJaneBk7F5F9HwuVQ==
X-Google-Smtp-Source: AGHT+IGmBAeYs64/RxasQf7SrRNvdthF83D37oFng3awwML8beZt/DpTLPi0E5IrqQczr0w0q42XHg==
X-Received: by 2002:a7b:cd85:0:b0:406:599f:f92c with SMTP id y5-20020a7bcd85000000b00406599ff92cmr18667253wmj.20.1697026204759;
        Wed, 11 Oct 2023 05:10:04 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:e551:3946:26fc:f94])
        by smtp.gmail.com with ESMTPSA id w21-20020a05600c015500b0040652e8ca13sm19012253wmm.43.2023.10.11.05.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 05:10:04 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 62/62] pinctrl: tegra: drop the wrapper around pinctrl_gpio_request()
Date:   Wed, 11 Oct 2023 14:08:30 +0200
Message-Id: <20231011120830.49324-63-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231011120830.49324-1-brgl@bgdev.pl>
References: <20231011120830.49324-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

pinctrl_gpio_request() now has the same signature as the wrapper around
it so we can drop them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-tegra.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index adfbed62eff1..ea5f9cc14bc4 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -137,11 +137,6 @@ static void tegra_gpio_disable(struct tegra_gpio_info *tgi, unsigned int gpio)
 	tegra_gpio_mask_write(tgi, GPIO_MSK_CNF(tgi, gpio), gpio, 0);
 }
 
-static int tegra_gpio_request(struct gpio_chip *chip, unsigned int offset)
-{
-	return pinctrl_gpio_request(chip, offset);
-}
-
 static void tegra_gpio_free(struct gpio_chip *chip, unsigned int offset)
 {
 	struct tegra_gpio_info *tgi = gpiochip_get_data(chip);
@@ -717,7 +712,7 @@ static int tegra_gpio_probe(struct platform_device *pdev)
 	}
 
 	tgi->gc.label			= "tegra-gpio";
-	tgi->gc.request			= tegra_gpio_request;
+	tgi->gc.request			= pinctrl_gpio_request;
 	tgi->gc.free			= tegra_gpio_free;
 	tgi->gc.direction_input		= tegra_gpio_direction_input;
 	tgi->gc.get			= tegra_gpio_get;
-- 
2.39.2

