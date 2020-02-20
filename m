Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8BCC166064
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2020 16:03:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728198AbgBTPDE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Feb 2020 10:03:04 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:34507 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727298AbgBTPDE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Feb 2020 10:03:04 -0500
Received: by mail-lf1-f65.google.com with SMTP id l18so3386516lfc.1
        for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2020 07:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ls7pLpSdHmLvEFkt/UXuELoR7+2Vi27HOWMngmu2y9c=;
        b=ZXCEKbYyOuKDjHaLDOyMq1UBBGqfQnxTGHgfFeJKdGnGlLCou86tpaPOyaHAEdGF0v
         JUTiCq5meTiaqU6LEWrfRJSulwaCM1LJaZGL4A1WD36r8Bb+8+ltjlUReece2sdZl+yx
         7YLctmn0muhlMg+/l3HfEdcHqudZwy61eE+cZ/JFgR2KR86FTJHoA3bOBilt21axPRN1
         XebeJDOz827toqR9xZOQn/FQUoDLPVsg+lpt3N/wzNZmXoNrBj/OD4gQnx7gO2LiOnWu
         lM2ywq8GuNJo7Afr3yHqeTwzH0guzSVHd2wwYQCXuIEso6Xu8/teTglG+4M3vm5mEUNW
         ZviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ls7pLpSdHmLvEFkt/UXuELoR7+2Vi27HOWMngmu2y9c=;
        b=VJ4RTxrNZpltxTFOR45WUI8fb7w1PIwy1W8BXPUQUuGHI/YxaXC6bBK4oMd1hV+SIz
         6xBlsQhKuZ/iXkpU+uTlRlOBsufBwt/VtRTJQwAxvaa8OWrz3WVRuMEdjIFp7yv+5nIV
         qVzerOMHY3ZL3XEfqKeUqACALPGbP8Fjuvvf/cuLPRrClAq85vHznUs+/R2mODYxBcqE
         Q9hlQjtpl3+4cT7Ae1V1X7WLHQcmnWmaex6so6SK7ytgL3SI+icEALMn9dMVpiIEktYd
         j56AHaD4/oMkxDyCEB5SQ9E97zzaneX855DlkwiIbnwsyr7musVzseWJ1QfJbyu38Uhf
         ZstQ==
X-Gm-Message-State: APjAAAWQM+r2kKjw9dwvXE2/QK+KQREfW4/MpCbF0krxlfEn8H0u7eCr
        0ypHqP4lZPC5L1zEdrQ1IutPUDulGRo=
X-Google-Smtp-Source: APXvYqyAol62rWQaiN442zOYVrzijsZ4UQHT3ztNTVwVhEXcJJsc1UfLhGIJFqa8lUe56KKR845dfg==
X-Received: by 2002:a05:6512:1107:: with SMTP id l7mr4615459lfg.108.1582210981613;
        Thu, 20 Feb 2020 07:03:01 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id r10sm2203937ljk.9.2020.02.20.07.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2020 07:02:57 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] gpio: Switch timestamps to ktime_get_ns()
Date:   Thu, 20 Feb 2020 16:02:50 +0100
Message-Id: <20200220150250.46226-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The existing use of ktime_get_real_ns() in the timestamps from
the GPIO events is dubious.

We have had several discussions about this timestamp, and it is
unclear whether userspace has ever taken into account that a
timestamp from ktime_get_real_ns() can actually move backwards
in time relative the previous timetamp, and userspace is more
likely to expect a monotonic counter.

Background:
https://lore.kernel.org/linux-gpio/CAK8P3a1Skvm48sje8FNDPLYqyz9Lf8q0qX1QETWtyZTxuX4k1g@mail.gmail.com/
https://marc.info/?l=linux-gpio&m=151661955709074&w=2

The change is ABI incompatible, but incompatible in a way that
is IMO more likely to fix future bugs rather than break current
userspace. To the best of my knowledge all userspace expects
a monotonic timestamp and users are just lucky that they very
seldom move backwards in time.

Cc: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 753283486037..5db16f69c13e 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -945,7 +945,7 @@ static irqreturn_t lineevent_irq_thread(int irq, void *p)
 	 * we didn't get the timestamp from lineevent_irq_handler().
 	 */
 	if (!le->timestamp)
-		ge.timestamp = ktime_get_real_ns();
+		ge.timestamp = ktime_get_ns();
 	else
 		ge.timestamp = le->timestamp;
 
@@ -983,7 +983,7 @@ static irqreturn_t lineevent_irq_handler(int irq, void *p)
 	 * Just store the timestamp in hardirq context so we get it as
 	 * close in time as possible to the actual event.
 	 */
-	le->timestamp = ktime_get_real_ns();
+	le->timestamp = ktime_get_ns();
 
 	return IRQ_WAKE_THREAD;
 }
-- 
2.24.1

