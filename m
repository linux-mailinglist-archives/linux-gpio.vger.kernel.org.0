Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EADC92A6B5D
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Nov 2020 18:04:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731228AbgKDREv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Nov 2020 12:04:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729679AbgKDREv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Nov 2020 12:04:51 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6197C0613D3;
        Wed,  4 Nov 2020 09:04:50 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id v144so296629lfa.13;
        Wed, 04 Nov 2020 09:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PM+5bKcMSZ46q1jbOvyiMjCDhehFrvPVMAJTjDaj6n4=;
        b=moRvfq8ZkG8t5Kg9Ano7uqKBCHtYd+6/Dh9L3ch0s37yOSHy4Qbkc8V1xCgHUKe9x7
         FUSpFbY9v/CxFJxXI/WcDDxAWD9eD6d3dq2b/stFKC+3nSUJ7r8YPxVHHrirlaLCnmVB
         8r2JzG3/3rzRX4aPuDw9cgumrsuyWu1kBsN/TuEdXLkPy2zYO/ewiZ/tUj0Copxl2eb0
         oy/l7U3epqG7FVcjj7skclXAFYb1V714SHELKvFWEqAky3QJijTy6k76hBZYKjXZ+Vja
         2njW0tWN17zYJIK1DQSRm4xMU7lT1KfI8h6iT5dCkcL7j8wuzNpU2HA/r5omBI7fUjV4
         kEpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PM+5bKcMSZ46q1jbOvyiMjCDhehFrvPVMAJTjDaj6n4=;
        b=eel5+0UHqgD7MdCi6FXWU1WwHLjrjEhRI55vgfWahE8U/VN6Do74qz2SqxboIxfw5D
         LL+ZNEBmrkbONnum/fe0IEmTvjBmioM5/taeELZgEzJ+5ZClgmh5o8Hy+y9MAxzndI/D
         wOph2vtdyA2grba4CN9m1AAYGW/Mvt24a9VKjtwcEaAHoHZguj2+bObbMbuOrkTkIaMJ
         9zTu6VvzPs2jGEmoPFKTNit77hi/NoHa5cnpIucynuWivKXm8BYkXy8y10WIBQeygpAL
         iulXMzkkfhY15tfCP1VkEsiNmfrtlh+LyzeMMEqTi/yEX0u82F9F8NrHobRNc/PsMpWn
         pW8Q==
X-Gm-Message-State: AOAM530Zu9d8gvt8omK9bbf/ueJiE9jT/PEaDieS46iI+786t8+rLati
        zCyJxstGH5wP2+ICHluedSc=
X-Google-Smtp-Source: ABdhPJy98s4TXSinPs8ZXdUei0YQUzzDQ+3g2Spn1Am3ie9HfUhnzekmjUi6vDUFCaCiP4WKrNSgNQ==
X-Received: by 2002:ac2:47f3:: with SMTP id b19mr10509958lfp.192.1604509489374;
        Wed, 04 Nov 2020 09:04:49 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru. [109.252.192.83])
        by smtp.gmail.com with ESMTPSA id c4sm457931lfh.60.2020.11.04.09.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 09:04:48 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] gpio: tegra: Add lockdep class
Date:   Wed,  4 Nov 2020 20:04:22 +0300
Message-Id: <20201104170423.23436-1-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add lockdep class in order to fix debug warnings that are coming from a
legit nested use of irq_set_irq_wake() by the Tegra GPIO driver.

 WARNING: possible recursive locking detected
 ...
  (irq_set_irq_wake) from (tegra_gpio_irq_set_wake)
  (tegra_gpio_irq_set_wake) from (irq_set_irq_wake)
  (irq_set_irq_wake) from (brcmf_sdiod_intr_register [brcmfmac])
 ...

Tested-by: Peter Geis <pgwipeout@gmail.com>
Reported-by: Peter Geis <pgwipeout@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---

Changelog:

v2: - No changes.

 drivers/gpio/gpio-tegra.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index 86568154cdb3..98fc78739ebf 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -560,6 +560,9 @@ static const struct dev_pm_ops tegra_gpio_pm_ops = {
 	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(tegra_gpio_suspend, tegra_gpio_resume)
 };
 
+static struct lock_class_key gpio_lock_class;
+static struct lock_class_key gpio_request_class;
+
 static int tegra_gpio_probe(struct platform_device *pdev)
 {
 	struct tegra_gpio_info *tgi;
@@ -661,6 +664,7 @@ static int tegra_gpio_probe(struct platform_device *pdev)
 		bank = &tgi->bank_info[GPIO_BANK(gpio)];
 
 		irq_set_chip_data(irq, bank);
+		irq_set_lockdep_class(irq, &gpio_lock_class, &gpio_request_class);
 		irq_set_chip_and_handler(irq, &tgi->ic, handle_simple_irq);
 	}
 
-- 
2.27.0

