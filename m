Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79F1A1DF6ED
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2020 13:45:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387789AbgEWLpe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 23 May 2020 07:45:34 -0400
Received: from mail.loongson.cn ([114.242.206.163]:41232 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730464AbgEWLpe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 23 May 2020 07:45:34 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_2nWDMleqy84AA--.560S3;
        Sat, 23 May 2020 19:45:27 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: [PATCH 2/2] pinctrl: at91-pio4: Add COMPILE_TEST support
Date:   Sat, 23 May 2020 19:45:26 +0800
Message-Id: <1590234326-2194-2-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1590234326-2194-1-git-send-email-yangtiezhu@loongson.cn>
References: <1590234326-2194-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9Dx_2nWDMleqy84AA--.560S3
X-Coremail-Antispam: 1UD129KBjvdXoWrWr48KFWDCFy5XFyxtw48tFb_yoWxWFg_ua
        ykJr1xGryUC3yxZr1Yqw4fury0yay5Wr1IvFnFv34fua47XryIq34Uurs7Xw1xGw48XF9Y
        qrW0qr1Fkr10yjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbh8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUGwA2048vs2IY02
        0Ec7CjxVAFwI0_Jrv_JF4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
        x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS
        0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
        Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_Gw4l42xK82
        IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
        0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMI
        IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF
        0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87
        Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUeApnDUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add COMPILE_TEST support to the AT91 PIO4 pinctrl driver for better compile
testing coverage.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 drivers/pinctrl/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 834c599..649b700 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -82,7 +82,7 @@ config PINCTRL_AT91
 config PINCTRL_AT91PIO4
 	bool "AT91 PIO4 pinctrl driver"
 	depends on OF
-	depends on ARCH_AT91
+	depends on ARCH_AT91 || COMPILE_TEST
 	select PINMUX
 	select GENERIC_PINCONF
 	select GPIOLIB
-- 
2.1.0

