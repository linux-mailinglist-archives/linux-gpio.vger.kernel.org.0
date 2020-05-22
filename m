Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C351B1DDE92
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2020 06:13:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbgEVEND (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 May 2020 00:13:03 -0400
Received: from mail.loongson.cn ([114.242.206.163]:56832 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725859AbgEVENC (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 22 May 2020 00:13:02 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxZuolUcdeFrA3AA--.1237S2;
        Fri, 22 May 2020 12:12:21 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Ray Jui <rjui@broadcom.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>
Cc:     bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: [PATCH 1/3] gpio: bcm-kona: Fix return value of bcm_kona_gpio_probe()
Date:   Fri, 22 May 2020 12:12:18 +0800
Message-Id: <1590120740-22912-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9AxZuolUcdeFrA3AA--.1237S2
X-Coremail-Antispam: 1UD129KBjvdXoWruw18Zw1xXFykArW5JFW8Zwb_yoWfGFc_ZF
        s5Cr4fXryDGr1vqFnFyay3Zry2yF9Y9rn7CFn2vay3twnrXr1I9ry5urn3Xrs8Ww45CryU
        JFn0qr12vrs3KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbcAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
        Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_Gryl
        42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
        WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAK
        I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
        4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
        42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUnHqcUUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When call function devm_platform_ioremap_resource(), we should use IS_ERR()
to check the return value and return PTR_ERR() if failed.

Fixes: 72d8cb715477 ("drivers: gpio: bcm-kona: use devm_platform_ioremap_resource()")
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 drivers/gpio/gpio-bcm-kona.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
index baee8c3..cf3687a 100644
--- a/drivers/gpio/gpio-bcm-kona.c
+++ b/drivers/gpio/gpio-bcm-kona.c
@@ -625,7 +625,7 @@ static int bcm_kona_gpio_probe(struct platform_device *pdev)
 
 	kona_gpio->reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(kona_gpio->reg_base)) {
-		ret = -ENXIO;
+		ret = PTR_ERR(kona_gpio->reg_base);
 		goto err_irq_domain;
 	}
 
-- 
2.1.0

