Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B392311FA74
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Dec 2019 19:31:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726559AbfLOSbm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 15 Dec 2019 13:31:42 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:42859 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726148AbfLOSbl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 15 Dec 2019 13:31:41 -0500
Received: by mail-lf1-f67.google.com with SMTP id y19so2629634lfl.9;
        Sun, 15 Dec 2019 10:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8WGNb8baWMu/OjrhEBuLnEY4Hx1XajfUZ1YMdab/qoo=;
        b=NhUiZUfkbwUwbh36Oycqj68dNdHAqfRHuVjH7dBuSS4W0MHBmL2vWQpIzIQP1uik3F
         9S3id+ouVBS2uAJOuNP0kjhWFgL+wGb0zHoIETs9bO7zg3tR9bz75YFilmacFi+7wB9G
         N4SgoJUKeRHIYqILHaytlv4hmb3o+xuOFxQFt/0+ofoQXSMinlNobF+j5E0t4wDYUiHR
         NlrKnewXJk6IG5DxKd4k7fmkxiJUdPFfzmzSuJYWNYOS1ppy9sjCUJ0QWRw8025Bm6TJ
         KlH1edT8CCNVq3CHOzUsQEl6N8eOMG0Hecv9oBHTOCqQMZsptTgoens3d7iN5BlKrOwt
         jqPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8WGNb8baWMu/OjrhEBuLnEY4Hx1XajfUZ1YMdab/qoo=;
        b=blEnD34zGsLishrifzwFYljc2qDOkY5gUK1sHgWLXkM12cejQa9Vdt5ZrmSqHh9OLu
         ldR80+C+Bm5He3aepVNqgF7fEHRq5wVsw593cHHkd5ETjGwxziy8XvB+EdOteMDsSpGl
         ZWg8sU4FDfMRt08rXkN27GE6WclbclMX0Y9X9xG5OW19j2VqIk1TL/GSlNSdukcuaGXj
         Rt7wRgGZgZ64MGPr0qGugsjqqibcvhzYFyQnOl4urrw/iPvH3qj7vTDmmWf3Nh9BTlGJ
         gkzHOq+1px1CelXX4tjnGgCCewlAqkrOi63HlLc/rHaVRFMIpCGXGK81ENqtcyF7syMI
         Bm6Q==
X-Gm-Message-State: APjAAAWdOmLxggiQpcYwpUVbgdlpWRh9Lky6TC/DEYI/i2DiU7xdQBsh
        /gOj+9ZoYJZINF2bQedbCNI=
X-Google-Smtp-Source: APXvYqwAC+Ah7tQUHeZ3RPhMRnv+9rucKa6WFL204I6PVLtkjBFpZRQhumIjSBoL7UkDyziyacPSaQ==
X-Received: by 2002:ac2:5983:: with SMTP id w3mr14711498lfn.137.1576434699420;
        Sun, 15 Dec 2019 10:31:39 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id v2sm8814277ljv.70.2019.12.15.10.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2019 10:31:38 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/3] gpio: tegra: Use NOIRQ phase for suspend/resume
Date:   Sun, 15 Dec 2019 21:30:47 +0300
Message-Id: <20191215183047.9414-4-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191215183047.9414-1-digetx@gmail.com>
References: <20191215183047.9414-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

All GPIO interrupts are disabled during of the NOIRQ suspend/resume
phase, thus there is no need to manually disable the interrupts. This
patch doesn't fix any problem, this is just a minor clean-up.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpio/gpio-tegra.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index 4790dfec7758..acb99eff9939 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -416,11 +416,8 @@ static void tegra_gpio_irq_handler(struct irq_desc *desc)
 static int tegra_gpio_resume(struct device *dev)
 {
 	struct tegra_gpio_info *tgi = dev_get_drvdata(dev);
-	unsigned long flags;
 	unsigned int b, p;
 
-	local_irq_save(flags);
-
 	for (b = 0; b < tgi->bank_count; b++) {
 		struct tegra_gpio_bank *bank = &tgi->bank_info[b];
 
@@ -448,17 +445,14 @@ static int tegra_gpio_resume(struct device *dev)
 		}
 	}
 
-	local_irq_restore(flags);
 	return 0;
 }
 
 static int tegra_gpio_suspend(struct device *dev)
 {
 	struct tegra_gpio_info *tgi = dev_get_drvdata(dev);
-	unsigned long flags;
 	unsigned int b, p;
 
-	local_irq_save(flags);
 	for (b = 0; b < tgi->bank_count; b++) {
 		struct tegra_gpio_bank *bank = &tgi->bank_info[b];
 
@@ -488,7 +482,7 @@ static int tegra_gpio_suspend(struct device *dev)
 					  GPIO_INT_ENB(tgi, gpio));
 		}
 	}
-	local_irq_restore(flags);
+
 	return 0;
 }
 
@@ -562,7 +556,7 @@ static inline void tegra_gpio_debuginit(struct tegra_gpio_info *tgi)
 #endif
 
 static const struct dev_pm_ops tegra_gpio_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(tegra_gpio_suspend, tegra_gpio_resume)
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(tegra_gpio_suspend, tegra_gpio_resume)
 };
 
 static int tegra_gpio_probe(struct platform_device *pdev)
-- 
2.24.0

