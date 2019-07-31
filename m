Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79F847C37B
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2019 15:30:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387759AbfGaN3a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Jul 2019 09:29:30 -0400
Received: from andre.telenet-ops.be ([195.130.132.53]:33478 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729350AbfGaN3a (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Jul 2019 09:29:30 -0400
Received: from ramsan ([84.194.98.4])
        by andre.telenet-ops.be with bizsmtp
        id jRVU2000Q05gfCL01RVVon; Wed, 31 Jul 2019 15:29:29 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hsofY-0001Am-TI; Wed, 31 Jul 2019 15:29:28 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hsofY-0004au-SP; Wed, 31 Jul 2019 15:29:28 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] pinctrl: lantiq: Use kasprintf() instead of fixed buffer formatting
Date:   Wed, 31 Jul 2019 15:29:16 +0200
Message-Id: <20190731132917.17607-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190731132917.17607-1-geert+renesas@glider.be>
References: <20190731132917.17607-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Improve readability and maintainability by replacing a hardcoded string
allocation and formatting by the use of the kasprintf() helper.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/pinctrl-falcon.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-falcon.c b/drivers/pinctrl/pinctrl-falcon.c
index ef133a82e612544a..4a3b8d2677fd498f 100644
--- a/drivers/pinctrl/pinctrl-falcon.c
+++ b/drivers/pinctrl/pinctrl-falcon.c
@@ -96,12 +96,8 @@ static void lantiq_load_pin_desc(struct pinctrl_pin_desc *d, int bank, int len)
 	int i;
 
 	for (i = 0; i < len; i++) {
-		/* strlen("ioXYZ") + 1 = 6 */
-		char *name = kzalloc(6, GFP_KERNEL);
-
-		snprintf(name, 6, "io%d", base + i);
 		d[i].number = base + i;
-		d[i].name = name;
+		d[i].name = kasprintf(GFP_KERNEL, "io%d", base + i);
 	}
 	pad_count[bank] = len;
 }
-- 
2.17.1

