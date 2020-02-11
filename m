Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0430159B0A
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2020 22:24:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727573AbgBKVYQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Feb 2020 16:24:16 -0500
Received: from gateway36.websitewelcome.com ([192.185.188.18]:41595 "EHLO
        gateway36.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726968AbgBKVYQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 11 Feb 2020 16:24:16 -0500
X-Greylist: delayed 1230 seconds by postgrey-1.27 at vger.kernel.org; Tue, 11 Feb 2020 16:24:15 EST
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
        by gateway36.websitewelcome.com (Postfix) with ESMTP id 91DE2414FE1AD
        for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2020 14:17:45 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id 1ch7jHoD5vBMd1ch7jbPwB; Tue, 11 Feb 2020 15:03:45 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
        Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Y7FMQ3aFcSbTB8cXSN/10Y25Q6I9Sqxro0ixjLvyexk=; b=NVUjzx89ff02Y0550Cc9HR4fAV
        y8xgLLMBqHAJcRuoYH/4vdjQlwmneVydHsfxguYwcJemWBAIPTaH5ACThZNw/j9YPPszQTd3icsx7
        U+v8QkoMqssJf+0DLG7bz90E+KHjnEEjbCAcF7/fMJV0CS+I9YjRTsjTeSau8ZIvWL0QO5RZmkBH5
        Mo9HA971WK+zi4licGrT47AWMX8GavgfO5a7EaL3XONr0IgFVBS2Fx+Bnk5oVh9pOOh52jbY5YMpW
        bY4JaEdAmrd6n3YBDyb0tJMBYkMJS4rHr6EFQLvL5BVmnVdN9WDD5iCxqHzkn+aXLokWXCTaEqr5U
        VKHDlH5A==;
Received: from [200.68.140.36] (port=15247 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1j1ch5-0026gU-VR; Tue, 11 Feb 2020 15:03:44 -0600
Date:   Tue, 11 Feb 2020 15:06:18 -0600
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] gpio: uniphier: Replace zero-length array with
 flexible-array member
Message-ID: <20200211210618.GA29823@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 200.68.140.36
X-Source-L: No
X-Exim-ID: 1j1ch5-0026gU-VR
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [200.68.140.36]:15247
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 9
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The current codebase makes use of the zero-length array language
extension to the C90 standard, but the preferred mechanism to declare
variable-length types such as these ones is a flexible array member[1][2],
introduced in C99:

struct foo {
        int stuff;
        struct boo array[];
};

By making use of the mechanism above, we will get a compiler warning
in case the flexible array does not occur last in the structure, which
will help us prevent some kind of undefined behavior bugs from being
inadvertenly introduced[3] to the codebase from now on.

This issue was found with the help of Coccinelle.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] https://github.com/KSPP/linux/issues/21
[3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/gpio/gpio-uniphier.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-uniphier.c b/drivers/gpio/gpio-uniphier.c
index 0f662b297a95..9843638d99d0 100644
--- a/drivers/gpio/gpio-uniphier.c
+++ b/drivers/gpio/gpio-uniphier.c
@@ -33,7 +33,7 @@ struct uniphier_gpio_priv {
 	struct irq_domain *domain;
 	void __iomem *regs;
 	spinlock_t lock;
-	u32 saved_vals[0];
+	u32 saved_vals[];
 };
 
 static unsigned int uniphier_gpio_bank_to_reg(unsigned int bank)
-- 
2.25.0

