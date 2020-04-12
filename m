Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00C6F1A5BCE
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Apr 2020 03:34:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726829AbgDLBeC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 11 Apr 2020 21:34:02 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:43284 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726155AbgDLBeC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 11 Apr 2020 21:34:02 -0400
Received: by mail-qt1-f195.google.com with SMTP id z90so4585529qtd.10;
        Sat, 11 Apr 2020 18:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J22mB3NQXWC/CST6MY0ECTvn5DksxAQMXIJYanPvBBM=;
        b=eB2mHLKxf3oeEvkGJbhlLEyFKxlCPsZXzd2uBK0OA9ZINs+MSzb/oSX+VjeD3Vyf0i
         EgkoLIXo08RM21vB+qTqS6gEIF2UnoXURiwbyGnOsX/JGitRes9Y5UnhMZ5D1S4ELa8P
         lnXYWeWxX6L0JtibzGU8hRR7wuWW8SXp/tuTZ8wKaCLaeNHqpJ0+Vi022TQ9Z6OlSjZf
         eTyouX1ArE25fIMFa2qGH6VOTvBl8jce/avfwr68YaY+sNVtQ1PK+ysc/fWUeYYlu6AB
         +EU3PZcZa/4PHvLjs1zdwhtkPBM7HtilPyBc+RNq8hQKxPDd5osHbXpGb5iG4K3/mAkz
         c9Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J22mB3NQXWC/CST6MY0ECTvn5DksxAQMXIJYanPvBBM=;
        b=YyZyz2b1O5Eh3woxDOnrLDRfOJSyXNiatqvuqctUCAL8ACwFYqf9Z5jmZGQJHrINjh
         Mc3ilZM7RkrlObq6Ek0dA/BaT97/Yi9yIts1hI3A8oqz4NJL3IBHVTQWmH90M0TPDc0X
         sawgXEs9XXNWDDBix+MO6mw8RwoEgCoa8sOTJNgIiyHn1IOYqrE8j+gtrFk7t77MAimY
         JcBR+1TNJwmLow0RaZVKs9P7jBNboEiYEpjtCRYquDOZRT5mp/7QGC0rd1GYx+BzUwOy
         bY5nTUyaOfDA76stK/d4B5CNFOSwfj7nae+B02ZRw6Ii+8GBBTQC6QZqg9OXBPo/7HuM
         QFwQ==
X-Gm-Message-State: AGi0PubWam/vAYqRQvJz3m/xQHF/VR1sfRHCutJvOxzavugQhNUi2A6y
        abB1GQpGeRFcUI7QhfLhZauOL6OMjLw=
X-Google-Smtp-Source: APiQypKIcOmRhbPE7CF37aPdRPiKcrwaissa2BNrJRAb3iEArDqyTm5Cr57d/hsg9V13peD+22f2XQ==
X-Received: by 2002:ac8:65cc:: with SMTP id t12mr5627735qto.310.1586655241329;
        Sat, 11 Apr 2020 18:34:01 -0700 (PDT)
Received: from localhost.localdomain (c-73-37-219-234.hsd1.mn.comcast.net. [73.37.219.234])
        by smtp.gmail.com with ESMTPSA id n92sm4965192qtd.68.2020.04.11.18.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2020 18:34:00 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] gpio: pca953x: Fix pca953x_gpio_set_config
Date:   Sat, 11 Apr 2020 20:33:52 -0500
Message-Id: <20200412013352.674506-2-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200412013352.674506-1-aford173@gmail.com>
References: <20200412013352.674506-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pca953x_gpio_set_config is setup to support pull-up/down
bias.  Currently the driver uses a variable called 'config' to
determine which options to use.  Unfortunately, this is incorrect.

This patch uses function pinconf_to_config_param(config), which
converts this 'config' parameter back to pinconfig to determine
which option to use.

Fixes: 15add06841a3 ("gpio: pca953x: add ->set_config implementation")

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 5638b4e5355f..4269ea9a817e 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -531,7 +531,7 @@ static int pca953x_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
 
-	switch (config) {
+	switch (pinconf_to_config_param(config)) {
 	case PIN_CONFIG_BIAS_PULL_UP:
 	case PIN_CONFIG_BIAS_PULL_DOWN:
 		return pca953x_gpio_set_pull_up_down(chip, offset, config);
-- 
2.25.1

