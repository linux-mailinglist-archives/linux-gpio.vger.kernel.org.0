Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CC263075E4
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Jan 2021 13:23:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231181AbhA1MWq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Jan 2021 07:22:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231618AbhA1MWY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Jan 2021 07:22:24 -0500
X-Greylist: delayed 92113 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 28 Jan 2021 04:21:43 PST
Received: from forward101o.mail.yandex.net (forward101o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::601])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D524CC0613ED;
        Thu, 28 Jan 2021 04:21:43 -0800 (PST)
Received: from sas1-6b94a3a85f37.qloud-c.yandex.net (sas1-6b94a3a85f37.qloud-c.yandex.net [IPv6:2a02:6b8:c14:3924:0:640:6b94:a3a8])
        by forward101o.mail.yandex.net (Yandex) with ESMTP id 107BD3C01858;
        Thu, 28 Jan 2021 15:21:41 +0300 (MSK)
Received: from sas1-27140bb19246.qloud-c.yandex.net (sas1-27140bb19246.qloud-c.yandex.net [2a02:6b8:c08:1803:0:640:2714:bb1])
        by sas1-6b94a3a85f37.qloud-c.yandex.net (mxback/Yandex) with ESMTP id UwkmTbB7k9-LeGGgbRD;
        Thu, 28 Jan 2021 15:21:40 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1611836501;
        bh=G6UTnCkG7lzFro6B/bQoc3MicYbEM3+fJ+jQVroguG0=;
        h=In-Reply-To:References:Date:Subject:To:From:Message-Id:Cc;
        b=H06xb9+Xo0Nk+5GnCMF9EBQVnDsg1eRCOsnOj8+W3QVPr/Lb2UkkLwFlXcqfTDh70
         RQPFje6fvygQSVW8fWy6w59dgPWJ3wukZL1Vc3QVyY/u+NSH/5gmrU1aoXyo3azOFk
         0cvSWKs/vV6+zQ/En4tviMqnDol7XHQS2euDgBUQ=
Authentication-Results: sas1-6b94a3a85f37.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by sas1-27140bb19246.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id dVFT85naok-Len8wqOO;
        Thu, 28 Jan 2021 15:21:40 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/7] gpio: ep93xx: Fix typo s/hierarchial/hierarchical
Date:   Thu, 28 Jan 2021 15:21:21 +0300
Message-Id: <20210128122123.25341-6-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210128122123.25341-1-nikita.shubin@maquefel.me>
References: <20210128122123.25341-1-nikita.shubin@maquefel.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix typo in comment.

Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 drivers/gpio/gpio-ep93xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index ee1cb3b894db..d69ec09cd618 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -402,7 +402,7 @@ static int ep93xx_gpio_add_bank(struct gpio_chip *gc,
 
 		/*
 		 * FIXME: convert this to use hierarchical IRQ support!
-		 * this requires fixing the root irqchip to be hierarchial.
+		 * this requires fixing the root irqchip to be hierarchical.
 		 */
 		girq->parent_handler = ep93xx_gpio_f_irq_handler;
 		girq->num_parents = 8;
-- 
2.29.2

