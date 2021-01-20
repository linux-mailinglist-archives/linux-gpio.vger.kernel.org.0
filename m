Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA1C02FC610
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Jan 2021 01:48:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729360AbhATArP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Jan 2021 19:47:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729070AbhATArM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Jan 2021 19:47:12 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FCC7C061757;
        Tue, 19 Jan 2021 16:46:14 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id q8so178647lfm.10;
        Tue, 19 Jan 2021 16:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+yTAnXtjPrGxO02YmxJ6XSfUB2dhdEl68apWpq9Pbuk=;
        b=aWR9uj6s3zndMEFoZ0kLGAmhuCaTsnAHptSyzcafSG7fqIryWI9a5yiM/dJtg7cQ31
         xBuT1njrtSKCDJUwwVbAM2PunBKhKs/LSzcG2bV3C5PKxh5sZ2pMdNKFXtT11CXBXTQc
         95xFXZCtrb0KGKUpfj2P3YJXOyHL9aSDk7y715K94Mkv/aCxnUwZR+pkgLrvbP63yZ4a
         tvYyVQr4BuxHVXuPEO+soQnt9V+9ZXse1vcmQ9YKTou5lId/bjyqGWdoAvog9pRNWIWf
         P7nGzwbSjXFPbF9maU7JyKVY5oMqYdEo7YspHvXT/4qdjqEeUmnkxEVgIdaVWZjfr9Bs
         bNYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+yTAnXtjPrGxO02YmxJ6XSfUB2dhdEl68apWpq9Pbuk=;
        b=mKglqnXoEdfVnkP8iWm5KxLzPmWRmmRQBzFZy1lF75hlCKQgy+oKRdkqEl3zOpDvfo
         mFIPGYZ8MLoODaxoDw8SUmXKlEzQiLs5mg17wEVuvTskYmqfLjuYM/jU+7Zx8Q+EcAAX
         vU8yLAGB+71kwT0DLGXxpV7cE+wLQKm35fOVxuH/15eMr379gEJLhSTROMoW6j34AKMf
         HnqZCbUT0kUV3S2GJLVasnoow9W9yvIC9Q97hSSMIslFYyP3lpXdJTskSTvzLw5wHy7c
         C9kkqnX+Mrs7J3n/lAHbxBFT1ovKQwPZXj5Pja5FY6AzmhdWKvT0i0ZMQo8FHphvKKNY
         LUVw==
X-Gm-Message-State: AOAM532ajCvapBTfGnrskUkXUztnXUbudQyiWzae5CwIliETVELsbaVT
        Ibr4LNVTZqXFLf2fZ7IrklE=
X-Google-Smtp-Source: ABdhPJy8eIsMtMERKkZrAhe3XZuLfuFDeOMsJR2MapSRDZs82HYp5fV158YEgPkRzK0K5NOueIL+tA==
X-Received: by 2002:a19:ee09:: with SMTP id g9mr995874lfb.272.1611103572917;
        Tue, 19 Jan 2021 16:46:12 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id v23sm21046ljg.97.2021.01.19.16.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 16:46:12 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1] gpio: tegra: Fix irq_set_affinity
Date:   Wed, 20 Jan 2021 03:45:48 +0300
Message-Id: <20210120004548.31692-1-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The irq_set_affinity callback should not be set if parent IRQ domain
doesn't present because gpio-tegra driver callback fails in this case,
causing a noisy error messages on system suspend:

 Disabling non-boot CPUs ...
 IRQ 26: no longer affine to CPU1
 IRQ128: set affinity failed(-22).
 IRQ130: set affinity failed(-22).
 IRQ131: set affinity failed(-22).
 IRQ 27: no longer affine to CPU2
 IRQ128: set affinity failed(-22).
 IRQ130: set affinity failed(-22).
 IRQ131: set affinity failed(-22).
 IRQ 28: no longer affine to CPU3
 IRQ128: set affinity failed(-22).
 IRQ130: set affinity failed(-22).
 IRQ131: set affinity failed(-22).
 Entering suspend state LP1

Hence just don't specify the irq_set_affinity callback if parent PMC
IRQ domain is missing. Tegra isn't capable of setting affinity per GPIO,
affinity could be set only per GPIO bank, thus there is nothing to do
for gpio-tegra in regards to CPU affinity without the parent IRQ domain.

Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
Tested-by: Dmitry Osipenko <digetx@gmail.com> # A500 T20 and Nexus7 T30
Fixes: efcdca286eef ("gpio: tegra: Convert to gpio_irq_chip")
Reported-by: Matt Merhar <mattmerhar@protonmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpio/gpio-tegra.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index 6c79e9d2f932..9a43129313fa 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -701,7 +701,6 @@ static int tegra_gpio_probe(struct platform_device *pdev)
 #ifdef CONFIG_PM_SLEEP
 	tgi->ic.irq_set_wake		= tegra_gpio_irq_set_wake;
 #endif
-	tgi->ic.irq_set_affinity	= tegra_gpio_irq_set_affinity;
 	tgi->ic.irq_request_resources	= tegra_gpio_irq_request_resources;
 	tgi->ic.irq_release_resources	= tegra_gpio_irq_release_resources;
 
@@ -754,6 +753,8 @@ static int tegra_gpio_probe(struct platform_device *pdev)
 
 		if (!irq->parent_domain)
 			return -EPROBE_DEFER;
+
+		tgi->ic.irq_set_affinity = tegra_gpio_irq_set_affinity;
 	}
 
 	tgi->regs = devm_platform_ioremap_resource(pdev, 0);
-- 
2.29.2

