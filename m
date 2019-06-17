Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 060FC48947
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 18:49:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728293AbfFQQt1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 12:49:27 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:49855 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728483AbfFQQt0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 12:49:26 -0400
Received: from orion.localdomain ([77.2.173.233]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MJW5G-1hwedA01cG-00JpLw; Mon, 17 Jun 2019 18:49:24 +0200
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        orsonzhai@gmail.com, baolin.wang@linaro.org, zhang.lyra@gmail.com,
        linux-gpio@vger.kernel.org
Subject: [PATCH 6/7] drivers: gpio: janz-ttl: drop unneccessary temp variable dev
Date:   Mon, 17 Jun 2019 18:49:19 +0200
Message-Id: <1560790160-3372-6-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560790160-3372-1-git-send-email-info@metux.net>
References: <1560790160-3372-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:pNpxM86V6H6J0TcFgvrzdFN95W8PwxpTys4a/PwbPV3+0P/1T+1
 4E2SsDiG3q7DXA40mm32RU/zb/C+kYlIL6jY9dbAUT1Oh6c0CE9j3+qMamGrHlfiQLExw+S
 ij0YX0dpuWJGBQJYb/h2ax4qDkZHr0LtcHCfW3eAqhO6D5PPhGOcGjxoNBlf+P7CAsMnWBp
 znuO6rqRru7HzQIdsKJWg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:F6WI8Aw4+zI=:UFkM/Nvy868J8oErtbnGRB
 GYSrsHNTi2hwBlTTeXObBbLc89hmyrgTE5Gd2MQCM31+2jipp2u1Lm/9We0HOdC5Ewi1fJInb
 imXVon2jhUrXlSgTh/oHbZtFpjTv/PIWhHLZsxqdEsLDrX++LXNJmW/ensUQWeo0+XyVZEvmb
 Lr1E2rO6ombOu0AqEZwR+QgWQBxp0Vj0D+wF+6xQtr29CcZ8vcl/8rgzYTkWUk0avzRhuxIxJ
 6i77ewAtTGCs9fYFFJd1HBP1gBkh9yaFB6e5bTgg0GY4YAvcEX8vKp/hf3OO0IWx/IUaB5N0o
 wngDUgGJ6xadabeRh6TGzVfrJcWeLoDHDYUNlUhwJIUN81D16/KX8KCuFnAcjcMbJsKu9YdHd
 eU3loGMvuFMzPMvvZyy+uk5mfAfV2j12gjtqy014c0MXTlu/d8DwY0nB6kBlYuTDKGeMz70CO
 gTKlK9aGdD/e9emAK/SiYVfEO4N6kpczVrc2XbITsViL9sm9RY3UUOr3ut3n94peqcDSQheiW
 40MlIR3tgzAbUBHjKgKnRP9lGmVfrg4D9fZI76LGbR+fNmIGIylz88itzLTOx4zjCTbV64bb7
 8AUFgjOIHyQ7wZ9PEdYRBcGw9EuIEGJvRaJGqjQ61VL+9yxmYkH1yxRNwihlqLV9/AEAMq314
 HfT7qLvEH330J27CJKn37dDMDBDlduSAFFyBYG8Ca93yfwCZilAXL6iYDx+Aho2KbL0RjdrSx
 1Ir3cOKAgKC5SFObih84B0C6EZMZV3y6VwYh4w==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

don't need the temporary variable "dev", directly use &pdev->dev

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 drivers/gpio/gpio-janz-ttl.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-janz-ttl.c b/drivers/gpio/gpio-janz-ttl.c
index 6b5b5a8..cdf50e4 100644
--- a/drivers/gpio/gpio-janz-ttl.c
+++ b/drivers/gpio/gpio-janz-ttl.c
@@ -140,18 +140,17 @@ static void ttl_setup_device(struct ttl_module *mod)
 static int ttl_probe(struct platform_device *pdev)
 {
 	struct janz_platform_data *pdata;
-	struct device *dev = &pdev->dev;
 	struct ttl_module *mod;
 	struct gpio_chip *gpio;
 	int ret;
 
 	pdata = dev_get_platdata(&pdev->dev);
 	if (!pdata) {
-		dev_err(dev, "no platform data\n");
+		dev_err(&pdev->dev, "no platform data\n");
 		return -ENXIO;
 	}
 
-	mod = devm_kzalloc(dev, sizeof(*mod), GFP_KERNEL);
+	mod = devm_kzalloc(&pdev->dev, sizeof(*mod), GFP_KERNEL);
 	if (!mod)
 		return -ENOMEM;
 
@@ -177,9 +176,9 @@ static int ttl_probe(struct platform_device *pdev)
 	gpio->base = -1;
 	gpio->ngpio = 20;
 
-	ret = devm_gpiochip_add_data(dev, gpio, NULL);
+	ret = devm_gpiochip_add_data(&pdev->dev, gpio, NULL);
 	if (ret) {
-		dev_err(dev, "unable to add GPIO chip\n");
+		dev_err(&pdev->dev, "unable to add GPIO chip\n");
 		return ret;
 	}
 
-- 
1.9.1

