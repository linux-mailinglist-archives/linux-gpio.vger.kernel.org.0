Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BC851BDFB9
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2020 15:57:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726960AbgD2N5B (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Apr 2020 09:57:01 -0400
Received: from mx2.suse.de ([195.135.220.15]:37370 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727092AbgD2N5B (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 29 Apr 2020 09:57:01 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 6D802AC5B;
        Wed, 29 Apr 2020 13:56:58 +0000 (UTC)
From:   Takashi Iwai <tiwai@suse.de>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Kangjie Lu <kjlu@umn.edu>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: exar: Fix bad handling for ida_simple_get error path
Date:   Wed, 29 Apr 2020 15:56:54 +0200
Message-Id: <20200429135654.30120-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The commit 7ecced0934e5 ("gpio: exar: add a check for the return value
of ida_simple_get fails") added a goto jump to the common error
handler for ida_simple_get() error, but this is wrong in two ways:
it doesn't set the proper return code and, more badly, it invokes
ida_simple_remove() with a negative index that shall lead to a kernel
panic via BUG_ON().

This patch addresses those two issues.

Fixes: 7ecced0934e5 ("gpio: exar: add a check for the return value of ida_simple_get fails")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/gpio/gpio-exar.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-exar.c b/drivers/gpio/gpio-exar.c
index da1ef0b1c291..b1accfba017d 100644
--- a/drivers/gpio/gpio-exar.c
+++ b/drivers/gpio/gpio-exar.c
@@ -148,8 +148,10 @@ static int gpio_exar_probe(struct platform_device *pdev)
 	mutex_init(&exar_gpio->lock);
 
 	index = ida_simple_get(&ida_index, 0, 0, GFP_KERNEL);
-	if (index < 0)
-		goto err_destroy;
+	if (index < 0) {
+		ret = index;
+		goto err_mutex_destroy;
+	}
 
 	sprintf(exar_gpio->name, "exar_gpio%d", index);
 	exar_gpio->gpio_chip.label = exar_gpio->name;
@@ -176,6 +178,7 @@ static int gpio_exar_probe(struct platform_device *pdev)
 
 err_destroy:
 	ida_simple_remove(&ida_index, index);
+err_mutex_destroy:
 	mutex_destroy(&exar_gpio->lock);
 	return ret;
 }
-- 
2.16.4

