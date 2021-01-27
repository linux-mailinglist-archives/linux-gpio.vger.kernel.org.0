Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B267E305968
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jan 2021 12:17:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236132AbhA0LQ6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jan 2021 06:16:58 -0500
Received: from forward100p.mail.yandex.net ([77.88.28.100]:32829 "EHLO
        forward100p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235880AbhA0KsL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 27 Jan 2021 05:48:11 -0500
Received: from iva8-40f91c705526.qloud-c.yandex.net (iva8-40f91c705526.qloud-c.yandex.net [IPv6:2a02:6b8:c0c:b9a7:0:640:40f9:1c70])
        by forward100p.mail.yandex.net (Yandex) with ESMTP id 793D0598006C;
        Wed, 27 Jan 2021 13:46:32 +0300 (MSK)
Received: from iva6-2d18925256a6.qloud-c.yandex.net (iva6-2d18925256a6.qloud-c.yandex.net [2a02:6b8:c0c:7594:0:640:2d18:9252])
        by iva8-40f91c705526.qloud-c.yandex.net (mxback/Yandex) with ESMTP id B1f2YTBbXI-kWH0pMdL;
        Wed, 27 Jan 2021 13:46:32 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1611744392;
        bh=7lgwbDJGOdVjkUAGd9EAk0SpTBjvigm0So+KyiwD/NE=;
        h=In-Reply-To:References:Date:Subject:To:From:Message-Id:Cc;
        b=UZ8qzxQ6H63pll0QE5Zi1QUixTSp+ijViWCEqSk95oKwPFI23KT7IMFaUV/LXtltP
         aD1182y75XlaeFSeLd034JJBzVbCfw8ccnwHEn2LuKGhVn3XCXaYnQAvaCopNXyZpX
         I/CmVKqQkZi8Tim5RygbjouOVf9bujXhoyaBaHdY=
Authentication-Results: iva8-40f91c705526.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by iva6-2d18925256a6.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id AUuDuROonk-kVm84C3H;
        Wed, 27 Jan 2021 13:46:31 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/9] gpio: ep93xx: Fix typo s/hierarchial/hierarchical
Date:   Wed, 27 Jan 2021 13:46:13 +0300
Message-Id: <20210127104617.1173-6-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210127104617.1173-1-nikita.shubin@maquefel.me>
References: <20201228150052.2633-1-nikita.shubin@maquefel.me>
 <20210127104617.1173-1-nikita.shubin@maquefel.me>
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
index dee19372ebbd..8f66e3ca0cfb 100644
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

