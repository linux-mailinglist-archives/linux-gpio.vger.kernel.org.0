Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B469648943
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 18:49:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728332AbfFQQtX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 12:49:23 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:35495 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbfFQQtX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 12:49:23 -0400
Received: from orion.localdomain ([77.2.173.233]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MPGiR-1hzh1w0jJF-00PaW9; Mon, 17 Jun 2019 18:49:21 +0200
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        orsonzhai@gmail.com, baolin.wang@linaro.org, zhang.lyra@gmail.com,
        linux-gpio@vger.kernel.org
Subject: [PATCH 1/7] drivers: gpio: rcar: pedantic formatting
Date:   Mon, 17 Jun 2019 18:49:14 +0200
Message-Id: <1560790160-3372-1-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
X-Provags-ID: V03:K1:SnjedU/ByefI/v0vNbinpChc6ZVtZNlZXKpElIxqUSAyHtl9+px
 07HnozTKE3SX9mBPjHneNa/sjo5Q7zEGb1/X8kGbR4FM6uEhfj5EHfg40sURf3U4DoFPB3p
 70L82paEJ6zUlXe5g70WkgJgg+3/KDbGXAPuslLcKR0pTBuYtagMMGkDZRch5Fe7ZEYW9Zx
 udjHnVPs6o8AnzJKZkhIg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:yFkVa1pZbcs=:NNJ0AO5YnYEUvwuMScIjYC
 zHUH+52tXowPfQmcQSjHODmvaCxdiVAHDYOBBk5rPBIoxeqXTxVO1tyZtb/93N/sIo8K2yuzk
 2TZSCVhniXOZY0Q5xhEadiYtUh4FHKhiFcB+0/UcfdyY49oPDyFSvwsu1wV1Zhoqo8SAInyRz
 7Mr57nqdcE8AkVlPa6awQlPgAU+lMFcrUOuezntcJVPtI+2WeHPbeJ6b2wpDuqE5k5SgDLHkC
 77L3TUQ2pUxIizJJz0Ti3nrFk3v9tgUcftaRX4hJtfI4sH/ztOi0oHh8cgEOkwpcK25IDuivt
 VV5hRxlIuhAO8iEUnBRCMbZCzqf6bOGdJo5kNuSXeHcRH4AiwDafOtyiboSpoD5d2rP4u94Jt
 SAlRbpTyw3EJ1qaeUtPHk3035LT9seVRI2OQDEfGKyvpE/Kg7IYIRux7hccDwZ1DileJ5l7vg
 NaNM6md1zafVefA+4rmXrF8NRUkups9+AlgCVLRucaxPBwmLL8BNWekwh9qARvhSccQsPVT8H
 2rnjLXbZdI/cW1KHCUKxIJiTjLWSTf20vmcG5944jSgu8N8ZC8X+eiHwcdERbt6ejihbpFw3T
 4qO6XYAQJoZ52WpxmYOT+UoJZkO6RjfOcIYdibYnq6LWCF231ll0Ca+cEuQS04+qQC1cExs3A
 sIe82nKmobjJo/TOunyHfYNIYzwi8VJnsw4pcsDWQ0JJbLJgt3v/EGubcTJ01upiz72zFKDEG
 /NrXlxLr9rE1fHp83pD5+Yg8IXpHLEJUYV8zjg==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

A tab sneaked in, where it shouldn't be.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 drivers/gpio/gpio-rcar.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index 70e95fc..187984d 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -489,7 +489,7 @@ static int gpio_rcar_probe(struct platform_device *pdev)
 	irq_chip->irq_unmask = gpio_rcar_irq_enable;
 	irq_chip->irq_set_type = gpio_rcar_irq_set_type;
 	irq_chip->irq_set_wake = gpio_rcar_irq_set_wake;
-	irq_chip->flags	= IRQCHIP_SET_TYPE_MASKED | IRQCHIP_MASK_ON_SUSPEND;
+	irq_chip->flags = IRQCHIP_SET_TYPE_MASKED | IRQCHIP_MASK_ON_SUSPEND;
 
 	ret = gpiochip_add_data(gpio_chip, p);
 	if (ret) {
-- 
1.9.1

