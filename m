Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D09C1DDE8E
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2020 06:13:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725981AbgEVENB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 May 2020 00:13:01 -0400
Received: from mail.loongson.cn ([114.242.206.163]:56830 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725928AbgEVENB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 22 May 2020 00:13:01 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxZuolUcdeFrA3AA--.1237S3;
        Fri, 22 May 2020 12:12:22 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Ray Jui <rjui@broadcom.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>
Cc:     bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: [PATCH 2/3] gpio: pxa: Fix return value of pxa_gpio_probe()
Date:   Fri, 22 May 2020 12:12:19 +0800
Message-Id: <1590120740-22912-2-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1590120740-22912-1-git-send-email-yangtiezhu@loongson.cn>
References: <1590120740-22912-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9AxZuolUcdeFrA3AA--.1237S3
X-Coremail-Antispam: 1UD129KBjvdXoWruw18Zw1xXFykAF4fKr4fAFb_yoWfWrg_Gw
        48ZrZ2qryvkF1qvwnFyayakry2vFnY9Fn7ursayayay34UX347uryUZrn3XFWUur47Gr98
        GF1UAr4Ivr4akjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbh8FF20E14v26ryj6rWUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUGwA2048vs2IY02
        0Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84
        ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
        0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
        Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_Gryl42xK82
        IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
        0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMI
        IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF
        0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87
        Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU1E_MUUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When call function devm_platform_ioremap_resource(), we should use IS_ERR()
to check the return value and return PTR_ERR() if failed.

Fixes: 542c25b7a209 ("drivers: gpio: pxa: use devm_platform_ioremap_resource()")
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 drivers/gpio/gpio-pxa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index 1361270..0cb6600 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -660,8 +660,8 @@ static int pxa_gpio_probe(struct platform_device *pdev)
 	pchip->irq1 = irq1;
 
 	gpio_reg_base = devm_platform_ioremap_resource(pdev, 0);
-	if (!gpio_reg_base)
-		return -EINVAL;
+	if (IS_ERR(gpio_reg_base))
+		return PTR_ERR(gpio_reg_base);
 
 	clk = clk_get(&pdev->dev, NULL);
 	if (IS_ERR(clk)) {
-- 
2.1.0

