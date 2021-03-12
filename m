Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9014A3386DF
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Mar 2021 08:57:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231775AbhCLH40 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Mar 2021 02:56:26 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:13150 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231370AbhCLHzx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Mar 2021 02:55:53 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DxdNV13SGzmWWd;
        Fri, 12 Mar 2021 15:53:30 +0800 (CST)
Received: from localhost.localdomain (10.175.102.38) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Fri, 12 Mar 2021 15:55:39 +0800
From:   'Wei Yongjun <weiyongjun1@huawei.com>
To:     <weiyongjun1@huawei.com>, Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Saravana Kannan <saravanak@google.com>
CC:     <linux-gpio@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        "Hulk Robot" <hulkci@huawei.com>
Subject: [PATCH -next] gpiolib: Fix error return code in gpiolib_dev_init()
Date:   Fri, 12 Mar 2021 08:04:23 +0000
Message-ID: <20210312080423.278094-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.102.38]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>

Fix to return a negative error code from the error handling
case instead of 0, as done elsewhere in this function.

Fixes: 4731210c09f5 ("gpiolib: Bind gpio_device to a driver to enable fw_devlink=on by default")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/gpio/gpiolib.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index cee4333f8ac7..18086262dd48 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4242,7 +4242,8 @@ static int __init gpiolib_dev_init(void)
 		return ret;
 	}
 
-	if (driver_register(&gpio_stub_drv) < 0) {
+	ret = driver_register(&gpio_stub_drv);
+	if (ret < 0) {
 		pr_err("gpiolib: could not register GPIO stub driver\n");
 		bus_unregister(&gpio_bus_type);
 		return ret;

