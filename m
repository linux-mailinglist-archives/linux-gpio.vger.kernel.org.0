Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2685172833
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Feb 2020 19:57:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729816AbgB0Szu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Feb 2020 13:55:50 -0500
Received: from gateway21.websitewelcome.com ([192.185.45.38]:32337 "EHLO
        gateway21.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729638AbgB0Szu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 27 Feb 2020 13:55:50 -0500
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
        by gateway21.websitewelcome.com (Postfix) with ESMTP id 171C7400D73FF
        for <linux-gpio@vger.kernel.org>; Thu, 27 Feb 2020 12:55:49 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id 7OK5jykRPvBMd7OK5juKNg; Thu, 27 Feb 2020 12:55:49 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
        Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=oeJVRwr6+tzB7aIFz/Q1mFYLhzDIrqt7xOL5F5f6fNs=; b=ge/31r8dACB/Cl0FWauYBUzZ5m
        oc90GhNkdOQpJok8BkT5W0DXcA/RkRKPm0duOu833VwvCQrCrnR5FHSviGXMOGY3WNQHvAFnDGLiR
        Xvdof36uPbBsLQZIc3wfirz+avUAVe8QrPtK+KsV7qN5YQQA4ztkgzET3w8LSsoEJh/6J5aabJ+1Q
        pHMweR1dj7k/Oc9nfuX0MYvZhD9fw/htSuburtz/0m/6XlAQ3nRvPQJz2j+5j5dUnmbMbTpB6zsLX
        RaYNVsycnWn3sIHOtnboPzRPz/gg8kmw3XddeBa+pCK/feeKrIdUD9hJSWbMgQTE9KKnpqWsGOiCr
        dooFu8QQ==;
Received: from [201.162.168.186] (port=4092 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1j7OK1-0046LF-GX; Thu, 27 Feb 2020 12:55:46 -0600
Date:   Thu, 27 Feb 2020 12:58:37 -0600
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Barry Song <baohua@kernel.org>
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] pinctrl: sirf/atlas7: Replace zero-length array with
 flexible-array member
Message-ID: <20200227185837.GA4469@embeddedor>
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
X-Source-IP: 201.162.168.186
X-Source-L: No
X-Exim-ID: 1j7OK1-0046LF-GX
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [201.162.168.186]:4092
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
inadvertently introduced[3] to the codebase from now on.

Also, notice that, dynamic memory allocations won't be affected by
this change:

"Flexible array members have incomplete type, and so the sizeof operator
may not be applied. As a quirk of the original implementation of
zero-length arrays, sizeof evaluates to zero."[1]

This issue was found with the help of Coccinelle.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] https://github.com/KSPP/linux/issues/21
[3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/pinctrl/sirf/pinctrl-atlas7.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sirf/pinctrl-atlas7.c b/drivers/pinctrl/sirf/pinctrl-atlas7.c
index b1a9611f46b3..50df9e084414 100644
--- a/drivers/pinctrl/sirf/pinctrl-atlas7.c
+++ b/drivers/pinctrl/sirf/pinctrl-atlas7.c
@@ -352,7 +352,7 @@ struct atlas7_gpio_chip {
 	int nbank;
 	raw_spinlock_t lock;
 	struct gpio_chip chip;
-	struct atlas7_gpio_bank banks[0];
+	struct atlas7_gpio_bank banks[];
 };
 
 /**
-- 
2.25.0

