Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E02AE134174
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jan 2020 13:11:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727280AbgAHML6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jan 2020 07:11:58 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:8244 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726252AbgAHML5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 8 Jan 2020 07:11:57 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 8C116BDF79AC0C0834EB;
        Wed,  8 Jan 2020 20:11:55 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Wed, 8 Jan 2020
 20:11:45 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] gpiolib: remove set but not used variable 'config'
Date:   Wed, 8 Jan 2020 20:11:17 +0800
Message-ID: <20200108121117.45060-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

drivers/gpio/gpiolib.c: In function gpio_set_config:
drivers/gpio/gpiolib.c:3053:16: warning:
 variable config set but not used [-Wunused-but-set-variable]

commit d90f36851d65 ("gpiolib: have a single place
of calling set_config()") left behind this unused variable.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpio/gpiolib.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 9fd2dfb..aabf801 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3050,7 +3050,6 @@ static int gpio_do_set_config(struct gpio_chip *gc, unsigned int offset,
 static int gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 			   enum pin_config_param mode)
 {
-	unsigned long config;
 	unsigned arg;
 
 	switch (mode) {
@@ -3064,7 +3063,6 @@ static int gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 		arg = 0;
 	}
 
-	config = PIN_CONF_PACKED(mode, arg);
 	return gpio_do_set_config(gc, offset, mode);
 }
 
-- 
2.7.4


