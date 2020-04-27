Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 181231BA1ED
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2020 13:07:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbgD0LHX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Apr 2020 07:07:23 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3351 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726485AbgD0LHX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 27 Apr 2020 07:07:23 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 958FB754D2A32F7543AA;
        Mon, 27 Apr 2020 19:07:19 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.487.0; Mon, 27 Apr 2020 19:07:09 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     Wei Yongjun <weiyongjun1@huawei.com>, <linux-gpio@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] gpio: mlxbf2: fix return value check in mlxbf2_gpio_get_lock_res()
Date:   Mon, 27 Apr 2020 11:08:29 +0000
Message-ID: <20200427110829.154785-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

In case of error, the function devm_ioremap() returns NULL pointer not
ERR_PTR(). The IS_ERR() test in the return value check should be
replaced with NULL test.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/gpio/gpio-mlxbf2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mlxbf2.c b/drivers/gpio/gpio-mlxbf2.c
index 240b488609ac..fca6a50d9308 100644
--- a/drivers/gpio/gpio-mlxbf2.c
+++ b/drivers/gpio/gpio-mlxbf2.c
@@ -109,8 +109,8 @@ static int mlxbf2_gpio_get_lock_res(struct platform_device *pdev)
 	}
 
 	yu_arm_gpio_lock_param.io = devm_ioremap(dev, res->start, size);
-	if (IS_ERR(yu_arm_gpio_lock_param.io))
-		ret = PTR_ERR(yu_arm_gpio_lock_param.io);
+	if (!yu_arm_gpio_lock_param.io)
+		ret = -ENOMEM;
 
 exit:
 	mutex_unlock(yu_arm_gpio_lock_param.lock);





