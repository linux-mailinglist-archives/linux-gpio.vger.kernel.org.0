Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBB6BCCEC4
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Oct 2019 07:39:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbfJFFju (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 6 Oct 2019 01:39:50 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:36559 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726291AbfJFFjr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Oct 2019 01:39:47 -0400
Received: by mail-pg1-f195.google.com with SMTP id 23so6166981pgk.3
        for <linux-gpio@vger.kernel.org>; Sat, 05 Oct 2019 22:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o+2cCkacS0/wsdoq+AhwYBV7HAjDIr1+29FN1l6fATg=;
        b=zlR7f3v6X6VUHlmDnEU4rDms8pwdJwwfFhghIIGBJMCzHM+Mj8Y7hUSVAPN0Cb3JOg
         Gm1vfy2oFYliCkbSbasts3bHObYD0QK3/P+QRlH+MLIu6JUPoNPUJX3DII2meRrAWwGr
         YjFpHV0GPS32lYoKZOyL5VPwSibzj5KfsIxaHChxOFonp1xGLXserUJLx0Xkcf6/tvbT
         NMM/+taLAaPaayKF7G4IdbGr711z5zaq516AdwGkTIp4VT57hPZnoPGCcu7WBQv1ZFXG
         qzMnxm4i8bUffPu72P/i3mrXDqUB3N/0jNUtK8frmZxI4vCCOIhbpGhZSJCbx8+SKI3H
         Bwlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o+2cCkacS0/wsdoq+AhwYBV7HAjDIr1+29FN1l6fATg=;
        b=BBG1JSdZ+aViXqiP/9BFib0RSFG61F1mlHh7jvdScFnr02UQohz8uz9xJP8BbyF0yy
         HL+DhJiFTNOYezuWXmb4HXwGTKKO/1EYUfSA7EDj0BHOnbNoUpTXXUbHufN5jXIfzwHj
         UkmoSO41Q0kyGbSAhLR8ZMyORF8bcpPbDhkP88l/t2bdAorVczwSRPKi05HplFDmWn/F
         M3Uc8wSVVP/jybbsdPOhE5vMaus9KwZ4zoYeAopAwX5T80TY1a8PUnwLz/BcEAs/MQTL
         3x0DNUg7LvY7RZmOgqMpqsyViV0g4PW2KLpHkQDtno6Tbinn6Ng9nO/BJ57hvV1iW72n
         baGA==
X-Gm-Message-State: APjAAAUxIqnRKpsr2SM2PDFAc74LsMWTuCtCy9I48KWpTpaZMcA/Q2rK
        YCobeI/LhYNwrRzUlQy2DSKNaeQN9dDkjA==
X-Google-Smtp-Source: APXvYqxK3lP1b5O5P9pkwJr2DSVKlg5gfYiK+vKbxwea7k+/ZUAKfLagdWTvWlycO53oE5WA3dKsUQ==
X-Received: by 2002:aa7:99da:: with SMTP id v26mr26356523pfi.258.1570340385338;
        Sat, 05 Oct 2019 22:39:45 -0700 (PDT)
Received: from debian-brgl.local (50-255-47-209-static.hfc.comcastbusiness.net. [50.255.47.209])
        by smtp.gmail.com with ESMTPSA id q30sm10019320pja.18.2019.10.05.22.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2019 22:39:45 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 8/8] gpio: tegra186: use devm_platform_ioremap_resource_byname()
Date:   Sun,  6 Oct 2019 07:39:16 +0200
Message-Id: <20191006053916.8849-9-brgl@bgdev.pl>
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

Use the devm_platform_ioremap_resource_byname() helper instead of
calling platform_get_resource_byname() and devm_ioremap_resource()
separately.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-tegra186.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index a9058fda187e..ef40fbe923cf 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -407,7 +407,6 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 	unsigned int i, j, offset;
 	struct gpio_irq_chip *irq;
 	struct tegra_gpio *gpio;
-	struct resource *res;
 	char **names;
 	int err;
 
@@ -417,8 +416,7 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 
 	gpio->soc = of_device_get_match_data(&pdev->dev);
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "gpio");
-	gpio->base = devm_ioremap_resource(&pdev->dev, res);
+	gpio->base = devm_platform_ioremap_resource_byname(pdev, "gpio");
 	if (IS_ERR(gpio->base))
 		return PTR_ERR(gpio->base);
 
-- 
2.23.0

