Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B55F7205548
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2020 16:58:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732890AbgFWO54 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Jun 2020 10:57:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732840AbgFWO5z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jun 2020 10:57:55 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13DD7C061573
        for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2020 07:57:54 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed20:26:93a1:ff06:f8b0])
        by albert.telenet-ops.be with bizsmtp
        id uexs2200T4qCYS806exsuM; Tue, 23 Jun 2020 16:57:53 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jnkMy-0007V7-Kv; Tue, 23 Jun 2020 16:57:52 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jnkMy-0007WY-Jz; Tue, 23 Jun 2020 16:57:52 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] gpio: aggregator: Drop pre-initialization in get_arg()
Date:   Tue, 23 Jun 2020 16:57:47 +0200
Message-Id: <20200623145748.28877-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200623145748.28877-1-geert+renesas@glider.be>
References: <20200623145748.28877-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In get_arg(), the variable start is pre-initialized, but overwritten
again in the first statement.  Rework the assignment to not rely on
pre-initialization, to make the code easier to read.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpio/gpio-aggregator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 9b0adbdddbfccb30..62a3fcbd4b4bb106 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -38,9 +38,9 @@ static DEFINE_IDR(gpio_aggregator_idr);
 
 static char *get_arg(char **args)
 {
-	char *start = *args, *end;
+	char *start, *end;
 
-	start = skip_spaces(start);
+	start = skip_spaces(*args);
 	if (!*start)
 		return NULL;
 
-- 
2.17.1

