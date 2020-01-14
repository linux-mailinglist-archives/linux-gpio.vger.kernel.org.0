Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F67F13AB32
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2020 14:38:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726106AbgANNiH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jan 2020 08:38:07 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:9174 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725994AbgANNiH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Jan 2020 08:38:07 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id B7AC211B0B49B94FF6A5;
        Tue, 14 Jan 2020 21:38:01 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.439.0; Tue, 14 Jan 2020 21:37:53 +0800
From:   Shaokun Zhang <zhangshaokun@hisilicon.com>
To:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Shaokun Zhang <zhangshaokun@hisilicon.com>,
        Jia-Ju Bai <baijiaju1990@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Bartosz Golaszewski" <bgolaszewski@baylibre.com>
Subject: [PATCH -next] gpio: Remove the unused flags
Date:   Tue, 14 Jan 2020 21:37:42 +0800
Message-ID: <1579009062-7154-1-git-send-email-zhangshaokun@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

drivers/gpio/gpio-grgpio.c: In function ‘grgpio_remove’:
drivers/gpio/gpio-grgpio.c:438:16: warning: unused variable ‘flags’ [-Wunused-variable]
  unsigned long flags;
                 ^
Fixes: 25d071b3f6db ("gpio: gpio-grgpio: fix possible sleep-in-atomic-context bugs in grgpio_remove()")
Cc: Jia-Ju Bai <baijiaju1990@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org> 
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com> 
Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>
---
 drivers/gpio/gpio-grgpio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-grgpio.c b/drivers/gpio/gpio-grgpio.c
index 1922adf96fc9..f954359c9544 100644
--- a/drivers/gpio/gpio-grgpio.c
+++ b/drivers/gpio/gpio-grgpio.c
@@ -435,7 +435,6 @@ static int grgpio_probe(struct platform_device *ofdev)
 static int grgpio_remove(struct platform_device *ofdev)
 {
 	struct grgpio_priv *priv = platform_get_drvdata(ofdev);
-	unsigned long flags;
 	int i;
 	int ret = 0;
 
-- 
2.7.4

