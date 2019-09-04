Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68BBAA8842
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2019 21:21:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730607AbfIDOCC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Sep 2019 10:02:02 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:6657 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730943AbfIDOAu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 4 Sep 2019 10:00:50 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 281942AAC537CF76FDC0;
        Wed,  4 Sep 2019 22:00:47 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.439.0; Wed, 4 Sep 2019 22:00:37 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     Bamvor Jian Zhang <bamv2005@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     Wei Yongjun <weiyongjun1@huawei.com>, <linux-gpio@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
Subject: [PATCH] gpio: mockup: add missing single_release()
Date:   Wed, 4 Sep 2019 14:18:34 +0000
Message-ID: <20190904141834.195294-1-weiyongjun1@huawei.com>
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

When using single_open() for opening, single_release() should be
used instead of seq_release(), otherwise there is a memory leak.

Fixes: 2a9e27408e12 ("gpio: mockup: rework debugfs interface")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/gpio/gpio-mockup.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index f1a9c0544e3f..213aedc97dc2 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -309,6 +309,7 @@ static const struct file_operations gpio_mockup_debugfs_ops = {
 	.read = gpio_mockup_debugfs_read,
 	.write = gpio_mockup_debugfs_write,
 	.llseek = no_llseek,
+	.release = single_release,
 };
 
 static void gpio_mockup_debugfs_setup(struct device *dev,



