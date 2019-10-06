Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C53A4CCEC9
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Oct 2019 07:40:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726291AbfJFFju (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 6 Oct 2019 01:39:50 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:42824 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726284AbfJFFjq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Oct 2019 01:39:46 -0400
Received: by mail-pg1-f195.google.com with SMTP id z12so6139449pgp.9
        for <linux-gpio@vger.kernel.org>; Sat, 05 Oct 2019 22:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JGpHJMNJmt0D2CtlAvF0BB0ayFvc7p4D4pLv8EbvGc0=;
        b=hrHDoGWgArLcjoy0hg4PkXWTSixMvbFbwkcCa91SIAZRFyGz1B9nRGPJWh7Yy7Ywkt
         e6JGXS3ykmBB5j1QyCEgvzPT77oLwZygN10YdkakXwi5qIw8CbuIVg0P3a2nS2uDk//r
         G18E/AHje4wYYlglCW7eN2fGPGHs5R1Bhm9FeNgF1LKq/J89/nwylmdNe6e08m2sEPPJ
         xU67f7DAAqMtaxiQssJRcLTQ21fI83dyecuUxXZD9VW/qE7B0iQM7+kZ4A1uGJUKxyLW
         Becd1uwkUIwNeh190VTOY7YdSa2bfjdB9WBlXpw9z66aR8H2fnZQnv0CPMgx31dpjJgM
         RyGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JGpHJMNJmt0D2CtlAvF0BB0ayFvc7p4D4pLv8EbvGc0=;
        b=HY6vfkGHI98rk+vb+kV3n9WLU3DYLBIOQSaAntSAY9iW4d302CbouODjo2huJ9HAM/
         xZDE3AY/O0spGW9DzVg/qvjlwjqwwAyoHuV0OZCFRCviJqONvZUSiviv3BztVyy11meM
         DH2rvi8IRN/GIs7Pk9jD2xM+QG3kjTMN/08mBNz4A6DM5uWqxO/38TqzSRhVPRlZIvUk
         kfdtAyqJz4luwydLSXeDhIiGXd6gI77+3kiwAUU1j+nrjivA5qAxzzUjj2qYwQ0wwbXt
         tYpfmoOrEHf/0WiS3l4rwefhMxiN7eBVOC9wL+ICbfs4FXEqHqNMqI/E/MOqsHv4tGta
         O1Yg==
X-Gm-Message-State: APjAAAUiI9SpyjGvEZZu2KoAz09eUxIxV/w9Zm7Epz6E5+9ZCjTLHAqt
        COooRGaFs0Wuo/1Eeyjhyetbmw==
X-Google-Smtp-Source: APXvYqyZkMteRPmIT4lYcc/6t8ZvthXPr2H8kcWCAOiHeEc0hH0NUfT8n8WaSRKA29NDI6H98rKhmw==
X-Received: by 2002:a17:90a:f487:: with SMTP id bx7mr25496934pjb.83.1570340384435;
        Sat, 05 Oct 2019 22:39:44 -0700 (PDT)
Received: from debian-brgl.local (50-255-47-209-static.hfc.comcastbusiness.net. [50.255.47.209])
        by smtp.gmail.com with ESMTPSA id q30sm10019320pja.18.2019.10.05.22.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2019 22:39:44 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 7/8] gpio: mvebu: use devm_platform_ioremap_resource_byname()
Date:   Sun,  6 Oct 2019 07:39:15 +0200
Message-Id: <20191006053916.8849-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191006053916.8849-1-brgl@bgdev.pl>
References: <20191006053916.8849-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Use devm_platform_ioremap_resource_byname() instead of calling
platform_get_resource_byname() and devm_ioremap_resource() separately.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-mvebu.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 6c0687694341..2f0f50336b9a 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -773,23 +773,12 @@ static int mvebu_pwm_probe(struct platform_device *pdev,
 {
 	struct device *dev = &pdev->dev;
 	struct mvebu_pwm *mvpwm;
-	struct resource *res;
 	u32 set;
 
 	if (!of_device_is_compatible(mvchip->chip.of_node,
 				     "marvell,armada-370-gpio"))
 		return 0;
 
-	/*
-	 * There are only two sets of PWM configuration registers for
-	 * all the GPIO lines on those SoCs which this driver reserves
-	 * for the first two GPIO chips. So if the resource is missing
-	 * we can't treat it as an error.
-	 */
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "pwm");
-	if (!res)
-		return 0;
-
 	if (IS_ERR(mvchip->clk))
 		return PTR_ERR(mvchip->clk);
 
@@ -812,7 +801,13 @@ static int mvebu_pwm_probe(struct platform_device *pdev,
 	mvchip->mvpwm = mvpwm;
 	mvpwm->mvchip = mvchip;
 
-	mvpwm->membase = devm_ioremap_resource(dev, res);
+	/*
+	 * There are only two sets of PWM configuration registers for
+	 * all the GPIO lines on those SoCs which this driver reserves
+	 * for the first two GPIO chips. So if the resource is missing
+	 * we can't treat it as an error.
+	 */
+	mvpwm->membase = devm_platform_ioremap_resource_byname(pdev, "pwm");
 	if (IS_ERR(mvpwm->membase))
 		return PTR_ERR(mvpwm->membase);
 
-- 
2.23.0

