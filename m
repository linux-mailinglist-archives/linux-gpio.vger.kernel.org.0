Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0EED7C363
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2019 15:24:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729397AbfGaNYJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Jul 2019 09:24:09 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:33174 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727161AbfGaNYJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Jul 2019 09:24:09 -0400
Received: from ramsan ([84.194.98.4])
        by michel.telenet-ops.be with bizsmtp
        id jRQ82000C05gfCL06RQ80t; Wed, 31 Jul 2019 15:24:08 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hsoaO-000190-6Z; Wed, 31 Jul 2019 15:24:08 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hsoaO-0004X4-57; Wed, 31 Jul 2019 15:24:08 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: sh-pfc: Use dev_notice_once() instead of open-coding
Date:   Wed, 31 Jul 2019 15:24:06 +0200
Message-Id: <20190731132406.17381-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

At the time of commit 9a643c9a11259955 ("sh-pfc: Convert message
printing from pr_* to dev_*"), the dev_*_once() variants didn't exist
yet, so the once behavior was open-coded.

Since commit e135303bd5bebcd2 ("device: Add dev_<level>_once variants")
they do, so "revert" to the good practice of using a helper.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in sh-pfc-for-v5.4.

 drivers/pinctrl/sh-pfc/gpio.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/gpio.c b/drivers/pinctrl/sh-pfc/gpio.c
index 97c1332c1045739a..64c09aa374ae011f 100644
--- a/drivers/pinctrl/sh-pfc/gpio.c
+++ b/drivers/pinctrl/sh-pfc/gpio.c
@@ -255,18 +255,13 @@ static int gpio_pin_setup(struct sh_pfc_chip *chip)
 #ifdef CONFIG_PINCTRL_SH_FUNC_GPIO
 static int gpio_function_request(struct gpio_chip *gc, unsigned offset)
 {
-	static bool __print_once;
 	struct sh_pfc *pfc = gpio_to_pfc(gc);
 	unsigned int mark = pfc->info->func_gpios[offset].enum_id;
 	unsigned long flags;
 	int ret;
 
-	if (!__print_once) {
-		dev_notice(pfc->dev,
-			   "Use of GPIO API for function requests is deprecated."
-			   " Convert to pinctrl\n");
-		__print_once = true;
-	}
+	dev_notice_once(pfc->dev,
+			"Use of GPIO API for function requests is deprecated, convert to pinctrl\n");
 
 	if (mark == 0)
 		return -EINVAL;
-- 
2.17.1

