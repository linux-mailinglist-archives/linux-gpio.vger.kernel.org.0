Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 146EA210A7C
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2020 13:42:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730437AbgGALmU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Jul 2020 07:42:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730432AbgGALmT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Jul 2020 07:42:19 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51BDBC08C5DB
        for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2020 04:42:19 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed20:503c:ab8:1424:9638])
        by xavier.telenet-ops.be with bizsmtp
        id xniG2200G49uj5301niGpM; Wed, 01 Jul 2020 13:42:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jqb84-0006Pr-7l; Wed, 01 Jul 2020 13:42:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jqb84-0002ED-5I; Wed, 01 Jul 2020 13:42:16 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 1/2] gpio: aggregator: Drop pre-initialization in get_arg()
Date:   Wed,  1 Jul 2020 13:42:11 +0200
Message-Id: <20200701114212.8520-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200701114212.8520-1-geert+renesas@glider.be>
References: <20200701114212.8520-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In get_arg(), the variable start is pre-initialized, but overwritten
again in the first statement.  Rework the assignment to not rely on
pre-initialization, to make the code easier to read.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - No changes.
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

