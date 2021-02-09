Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CA3E315038
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Feb 2021 14:33:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231443AbhBINcK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Feb 2021 08:32:10 -0500
Received: from forward103o.mail.yandex.net ([37.140.190.177]:58821 "EHLO
        forward103o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231292AbhBINcH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Feb 2021 08:32:07 -0500
Received: from iva6-b9aa172731b6.qloud-c.yandex.net (iva6-b9aa172731b6.qloud-c.yandex.net [IPv6:2a02:6b8:c0c:9a88:0:640:b9aa:1727])
        by forward103o.mail.yandex.net (Yandex) with ESMTP id C54815F80737;
        Tue,  9 Feb 2021 16:31:23 +0300 (MSK)
Received: from iva1-bc1861525829.qloud-c.yandex.net (iva1-bc1861525829.qloud-c.yandex.net [2a02:6b8:c0c:a0e:0:640:bc18:6152])
        by iva6-b9aa172731b6.qloud-c.yandex.net (mxback/Yandex) with ESMTP id 7x2E8nHkeE-VNIuLRIg;
        Tue, 09 Feb 2021 16:31:23 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1612877483;
        bh=dElC7nQ0BytxegF4+XkB3bMQiY+WpMtoh8a2xZVnmdw=;
        h=In-Reply-To:References:Date:Subject:To:From:Message-Id:Cc;
        b=ICD3iVystfjcZxfTtjwYjbfUySrWT2Uth3SDLL91OqO7IK6wRIGwUk8GQqmoJ2ao8
         eF2JYboZjSwvXxA8vAfjrghIvmb2HQsIUWd1SDleRhhD1z9FKu2eUhf7nNfj2MDTX0
         hL/OqKNfiJ+eZibeWJGEAjHkY6WtWBbLkiYW6anw=
Authentication-Results: iva6-b9aa172731b6.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Received: by iva1-bc1861525829.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id aJNFhJtpP6-VNoas7eL;
        Tue, 09 Feb 2021 16:31:23 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 5/7] gpio: ep93xx: Fix typo s/hierarchial/hierarchical
Date:   Tue,  9 Feb 2021 16:31:08 +0300
Message-Id: <20210209133110.7383-6-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210209133110.7383-1-nikita.shubin@maquefel.me>
References: <20210209133110.7383-1-nikita.shubin@maquefel.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix typo in comment.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 drivers/gpio/gpio-ep93xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index a69bf3100f99..9760df7d1172 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -388,7 +388,7 @@ static int ep93xx_gpio_add_bank(struct ep93xx_gpio_chip *egc,
 
 		/*
 		 * FIXME: convert this to use hierarchical IRQ support!
-		 * this requires fixing the root irqchip to be hierarchial.
+		 * this requires fixing the root irqchip to be hierarchical.
 		 */
 		girq->parent_handler = ep93xx_gpio_f_irq_handler;
 		girq->num_parents = 8;
-- 
2.26.2

