Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08B873F2F92
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Aug 2021 17:38:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241110AbhHTPig (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Aug 2021 11:38:36 -0400
Received: from smtp09.smtpout.orange.fr ([80.12.242.131]:31090 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241105AbhHTPif (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Aug 2021 11:38:35 -0400
Received: from pop-os.home ([90.126.253.178])
        by mwinf5d04 with ME
        id jrdw2500b3riaq203rdwzy; Fri, 20 Aug 2021 17:37:57 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 20 Aug 2021 17:37:57 +0200
X-ME-IP: 90.126.253.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        alexandru.marginean@nxp.com, Laurentiu.Tudor@nxp.com,
        hui.song_1@nxp.com, andy.shevchenko@gmail.com, ran.wang_1@nxp.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 1/3] gpio: mpc8xxx: Fix a resources leak in the error handling path of 'mpc8xxx_probe()'
Date:   Fri, 20 Aug 2021 17:37:55 +0200
Message-Id: <800564ff82277544269add84bf78a5321e1090ed.1629472813.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1629472813.git.christophe.jaillet@wanadoo.fr>
References: <cover.1629472813.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Commit 698b8eeaed72 ("gpio/mpc8xxx: change irq handler from chained to normal")
has introduced a new 'goto err;' at the very end of the function, but has
not updated the error handling path accordingly.

Add the now missing 'irq_domain_remove()' call which balances a previous
'irq_domain_create_linear() call.

Fixes: 698b8eeaed72 ("gpio/mpc8xxx: change irq handler from chained to normal")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Is the 'irq_set_chained_handler_and_data()' of the remove function also
needed here?
---
 drivers/gpio/gpio-mpc8xxx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index 67dc38976ab6..241bcc80612e 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -416,6 +416,8 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 
 	return 0;
 err:
+	if (mpc8xxx_gc->irq)
+		irq_domain_remove(mpc8xxx_gc->irq);
 	iounmap(mpc8xxx_gc->regs);
 	return ret;
 }
-- 
2.30.2

