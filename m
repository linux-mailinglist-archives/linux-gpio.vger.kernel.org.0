Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 235E621A58F
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2020 19:13:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728362AbgGIRMv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jul 2020 13:12:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728206AbgGIRMl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jul 2020 13:12:41 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26860C08C5CE;
        Thu,  9 Jul 2020 10:12:41 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id d17so3269856ljl.3;
        Thu, 09 Jul 2020 10:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nK7VbiDVUEdbT9jTj1dIkuqtQW8x+06R4ZXLtGmtTpc=;
        b=F6X3fdXBTPdfg/BieULkcyXl6mH1blJUakTku4OeWsLMx5xAjYM4zKCzFp/p763ASl
         F385TQHOCUjVDjY4omJ92gdJq/9K5qJAQeY5s8ZCIPJ+9toKNHsN3q7PUKWIWHpMatA8
         TPO3FVYpip4sjf93DHRuClz/pyzd5S3yP9ogBGstGauXRzLXxaPiE937Z82KH9BWftRJ
         ernFRvxq2iQS/4X9M8x0EY5A3h4e/lydLXhUSa9ffPw1AdIh1Y76FJRdcWQcu5aLrqpD
         rCHxAKzDIhNkeQt+UrFhMz7pdF3RCzHdjVTtmhXyUwPOYN/bVAZDXARmcM6FI2ghIl4C
         ucYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nK7VbiDVUEdbT9jTj1dIkuqtQW8x+06R4ZXLtGmtTpc=;
        b=I2IBUKVZg2Y2ybikgxpKWWe3IianDgF5ZVX/qXm/DdwiH6eJwRrBI60CoNkM1XTW76
         dbvPBirxdlnyKjZkgOwIoHuWlkHx8KYIkKSBQ4n686uigcob4B6qFT5ICQyB4FxP6nJE
         lFeYFqTBaTpE//nMqv17D4krGCWM/YDfelqtJmvlzSi/1WNx5YxoNFxfmhYKzbtzmeGr
         l/i5o3E5+YG6oVN5v2sUHH/SThK55Qfvu2gjrZFd9yditWhUFRGUypwDizQFvuLu8daV
         xxm8M+rR55IL0bxfhse38YkydmxJFiGXfeGc/qRQVITJnUL1b3BV6JHMVAe9lV23gcu9
         qonQ==
X-Gm-Message-State: AOAM533T/UBOYEb204tGxdDSiomobZ01Y4BQXlgztVybkvaoSPjiCcMv
        Pr6bk7Rt7hnSJ1iDC+zXBPw=
X-Google-Smtp-Source: ABdhPJyvykxVIPeM4POspY9+OgMefiSs4FProlmdUWv8fN1EvCKtzrT1HG+hRCKNq0Hpxsr1TvZhfA==
X-Received: by 2002:a2e:2242:: with SMTP id i63mr39532254lji.370.1594314759695;
        Thu, 09 Jul 2020 10:12:39 -0700 (PDT)
Received: from localhost.localdomain (ppp91-79-162-105.pppoe.mtu-net.ru. [91.79.162.105])
        by smtp.gmail.com with ESMTPSA id y22sm998314ljn.2.2020.07.09.10.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 10:12:39 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/6] gpio: max77620: Don't set of_node
Date:   Thu,  9 Jul 2020 20:12:00 +0300
Message-Id: <20200709171203.12950-4-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200709171203.12950-1-digetx@gmail.com>
References: <20200709171203.12950-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The gpiochip_add_data() takes care of setting the of_node to the parent's
device of_node, hence there is no need to do it manually in the driver's
code. This patch corrects the parent's device pointer and removes the
unnecessary setting of the of_node.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Acked-by: Laxman Dewangan <ldewangan@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpio/gpio-max77620.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index 7f7e8d4bf0d3..39d431da2dbc 100644
--- a/drivers/gpio/gpio-max77620.c
+++ b/drivers/gpio/gpio-max77620.c
@@ -279,7 +279,7 @@ static int max77620_gpio_probe(struct platform_device *pdev)
 	mgpio->dev = &pdev->dev;
 
 	mgpio->gpio_chip.label = pdev->name;
-	mgpio->gpio_chip.parent = &pdev->dev;
+	mgpio->gpio_chip.parent = pdev->dev.parent;
 	mgpio->gpio_chip.direction_input = max77620_gpio_dir_input;
 	mgpio->gpio_chip.get = max77620_gpio_get;
 	mgpio->gpio_chip.direction_output = max77620_gpio_dir_output;
@@ -288,9 +288,6 @@ static int max77620_gpio_probe(struct platform_device *pdev)
 	mgpio->gpio_chip.ngpio = MAX77620_GPIO_NR;
 	mgpio->gpio_chip.can_sleep = 1;
 	mgpio->gpio_chip.base = -1;
-#ifdef CONFIG_OF_GPIO
-	mgpio->gpio_chip.of_node = pdev->dev.parent->of_node;
-#endif
 
 	platform_set_drvdata(pdev, mgpio);
 
-- 
2.26.0

