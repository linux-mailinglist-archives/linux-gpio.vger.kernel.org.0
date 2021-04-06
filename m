Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E1FF354DB5
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Apr 2021 09:20:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244231AbhDFHU5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Apr 2021 03:20:57 -0400
Received: from out30-43.freemail.mail.aliyun.com ([115.124.30.43]:51822 "EHLO
        out30-43.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232943AbhDFHU5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Apr 2021 03:20:57 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R291e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04400;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0UUfxBqa_1617693641;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0UUfxBqa_1617693641)
          by smtp.aliyun-inc.com(127.0.0.1);
          Tue, 06 Apr 2021 15:20:48 +0800
From:   Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To:     linus.walleij@linaro.org
Cc:     bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] gpio: gpio-it87: remove unused code
Date:   Tue,  6 Apr 2021 15:20:39 +0800
Message-Id: <1617693639-49182-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix the following clang warning:

drivers/gpio/gpio-it87.c:128:20: warning: unused function 'superio_outw'
[-Wunused-function].

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpio/gpio-it87.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpio/gpio-it87.c b/drivers/gpio/gpio-it87.c
index 8f1be34..f332341 100644
--- a/drivers/gpio/gpio-it87.c
+++ b/drivers/gpio/gpio-it87.c
@@ -125,14 +125,6 @@ static inline int superio_inw(int reg)
 	return val;
 }
 
-static inline void superio_outw(int val, int reg)
-{
-	outb(reg++, REG);
-	outb(val >> 8, VAL);
-	outb(reg, REG);
-	outb(val, VAL);
-}
-
 static inline void superio_set_mask(int mask, int reg)
 {
 	u8 curr_val = superio_inb(reg);
-- 
1.8.3.1

