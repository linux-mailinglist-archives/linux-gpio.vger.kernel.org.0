Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE87D447910
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Nov 2021 05:04:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237301AbhKHEGq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 7 Nov 2021 23:06:46 -0500
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131]:59243 "EHLO
        out30-131.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237308AbhKHEGp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 7 Nov 2021 23:06:45 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e01424;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0UvTHIHd_1636344237;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0UvTHIHd_1636344237)
          by smtp.aliyun-inc.com(127.0.0.1);
          Mon, 08 Nov 2021 12:03:59 +0800
From:   Yang Li <yang.lee@linux.alibaba.com>
To:     info@metux.net
Cc:     vireshk@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl,
        linux-gpio@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH -next] gpio: virtio: remove unneeded semicolon
Date:   Mon,  8 Nov 2021 12:03:52 +0800
Message-Id: <1636344232-56537-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Eliminate the following coccicheck warning:
./drivers/gpio/gpio-virtio.c:437:2-3: Unneeded semicolon

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/gpio/gpio-virtio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
index aeec4bf..84f96b7 100644
--- a/drivers/gpio/gpio-virtio.c
+++ b/drivers/gpio/gpio-virtio.c
@@ -434,7 +434,7 @@ static void virtio_gpio_event_vq(struct virtqueue *vq)
 		ret = generic_handle_domain_irq(vgpio->gc.irq.domain, gpio);
 		if (ret)
 			dev_err(dev, "failed to handle interrupt: %d\n", ret);
-	};
+	}
 }
 
 static void virtio_gpio_request_vq(struct virtqueue *vq)
-- 
1.8.3.1

