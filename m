Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC8412B585
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2019 14:40:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726206AbfE0Mkz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 May 2019 08:40:55 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:33088 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726476AbfE0Mky (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 May 2019 08:40:54 -0400
Received: from ramsan ([84.194.111.163])
        by xavier.telenet-ops.be with bizsmtp
        id HQgt2000F3XaVaC01Qgt3w; Mon, 27 May 2019 14:40:53 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hVEvt-0001Wt-GQ; Mon, 27 May 2019 14:40:53 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hVEvt-0001zd-Ev; Mon, 27 May 2019 14:40:53 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] gpio: em: Remove error messages on out-of-memory conditions
Date:   Mon, 27 May 2019 14:40:50 +0200
Message-Id: <20190527124051.7615-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190527124051.7615-1-geert+renesas@glider.be>
References: <20190527124051.7615-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There is no need to print error messages when memory allocations or
related operations fail, as the core will take care of that.

Change the returned error codes to -ENOMEM to match the failure cause
while at it.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpio/gpio-em.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-em.c b/drivers/gpio/gpio-em.c
index 982e699a5b816582..18937a9b1a14a72c 100644
--- a/drivers/gpio/gpio-em.c
+++ b/drivers/gpio/gpio-em.c
@@ -305,16 +305,14 @@ static int em_gio_probe(struct platform_device *pdev)
 	p->base0 = devm_ioremap_nocache(&pdev->dev, io[0]->start,
 					resource_size(io[0]));
 	if (!p->base0) {
-		dev_err(&pdev->dev, "failed to remap low I/O memory\n");
-		ret = -ENXIO;
+		ret = -ENOMEM;
 		goto err0;
 	}
 
 	p->base1 = devm_ioremap_nocache(&pdev->dev, io[1]->start,
 				   resource_size(io[1]));
 	if (!p->base1) {
-		dev_err(&pdev->dev, "failed to remap high I/O memory\n");
-		ret = -ENXIO;
+		ret = -ENOMEM;
 		goto err0;
 	}
 
-- 
2.17.1

