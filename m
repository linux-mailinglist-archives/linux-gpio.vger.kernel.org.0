Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D334CD0244
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2019 22:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730950AbfJHUkX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Oct 2019 16:40:23 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:55028 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730523AbfJHUkW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Oct 2019 16:40:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=IG1PVwMtQAM28tfOpPtpmdlnReR0UstRu9NVxRsy1Jk=; b=Gz43DLApZQtRZIbtPg1nD6SGm
        35zFAXuI6KC35Dy5Ms8F2kjxI0uvqyt9UaCdlSrS4SsTPyEp1Gnf/GD3BdnuWinJU84hvDYgm7Gzj
        OHLAd/U8Qz8kzAh4FJUOTwd9CV9u+k/3jET6jHYR/aH1CwRRw+yQhc+5QQGdt3pJmLBaDSfe2wELq
        a1vlmVu3vhty/1yXXcnykwEMR1Tz98in9jUrtvAnWxDF2xiC2gTbFNaBHLRP78J4cdmPJGfoUkbMn
        QNOsVxI/h0KHDZagTuovvTg8z+hU60GcMa2SdOQVzOje/Te5Na2SrzvX+b1Yiu3z9rqu7RRlKdMf9
        pw/1/eWEg==;
Received: from [2601:1c0:6280:3f0::9ef4]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iHwHO-0003r9-G9; Tue, 08 Oct 2019 20:40:22 +0000
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Cc:     LKML <linux-kernel@vger.kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] gpio: fix kernel-doc for of_gpio_need_valid_mask()
Message-ID: <6c5d22c8-6e27-3314-9c46-701d932b11a6@infradead.org>
Date:   Tue, 8 Oct 2019 13:40:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Fix kernel-doc for of_gpio_need_valid_mask().
Fixes this warning and uses correct Return: format.

../drivers/gpio/gpiolib-of.c:92: warning: Excess function parameter 'dev' description in 'of_gpio_need_valid_mask'

Fixes: f626d6dfb709 ("gpio: of: Break out OF-only code")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-gpio@vger.kernel.org
---
 drivers/gpio/gpiolib-of.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

--- linux-next-20191008.orig/drivers/gpio/gpiolib-of.c
+++ linux-next-20191008/drivers/gpio/gpiolib-of.c
@@ -84,8 +84,9 @@ static struct gpio_desc *of_xlate_and_ge
 /**
  * of_gpio_need_valid_mask() - figure out if the OF GPIO driver needs
  * to set the .valid_mask
- * @dev: the device for the GPIO provider
- * @return: true if the valid mask needs to be set
+ * @gc: the target gpio_chip
+ *
+ * Return: true if the valid mask needs to be set
  */
 bool of_gpio_need_valid_mask(const struct gpio_chip *gc)
 {

