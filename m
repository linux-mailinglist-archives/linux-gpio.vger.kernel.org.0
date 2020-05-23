Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9544D1DF6EB
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2020 13:45:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730602AbgEWLp3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 23 May 2020 07:45:29 -0400
Received: from mail.loongson.cn ([114.242.206.163]:41222 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728040AbgEWLp3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 23 May 2020 07:45:29 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_2nWDMleqy84AA--.560S2;
        Sat, 23 May 2020 19:45:26 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: [PATCH 1/2] pinctrl: Fix return value about devm_platform_ioremap_resource()
Date:   Sat, 23 May 2020 19:45:25 +0800
Message-Id: <1590234326-2194-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dx_2nWDMleqy84AA--.560S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr4rGr1fGFW3XF48KFyxAFb_yoW8WFW3pF
        WfGF4rCr15KrW7Cry3Aw18ZFyfC3WxJ3y293y093s3Way5AryDA3WYgFWxJrsYgrW8Cr15
        Jr15JFyUuF18WF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkm14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
        6r4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
        1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8
        KwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r
        1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij
        64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr
        0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6Fyj6rWUJwCI42IY6I8E87Iv67AKxVW8JVWxJwCI
        42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU0lksDUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When call function devm_platform_ioremap_resource(), we should use IS_ERR()
to check the return value and return PTR_ERR() if failed.

Fixes: 4b024225c4a8 ("pinctrl: use devm_platform_ioremap_resource() to simplify code")
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 drivers/pinctrl/bcm/pinctrl-bcm281xx.c | 2 +-
 drivers/pinctrl/pinctrl-at91-pio4.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm281xx.c b/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
index f690fc5..71e6661 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
@@ -1406,7 +1406,7 @@ static int __init bcm281xx_pinctrl_probe(struct platform_device *pdev)
 	pdata->reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pdata->reg_base)) {
 		dev_err(&pdev->dev, "Failed to ioremap MEM resource\n");
-		return -ENODEV;
+		return PTR_ERR(pdata->reg_base);
 	}
 
 	/* Initialize the dynamic part of pinctrl_desc */
diff --git a/drivers/pinctrl/pinctrl-at91-pio4.c b/drivers/pinctrl/pinctrl-at91-pio4.c
index 6949124..54222ccd 100644
--- a/drivers/pinctrl/pinctrl-at91-pio4.c
+++ b/drivers/pinctrl/pinctrl-at91-pio4.c
@@ -1019,7 +1019,7 @@ static int atmel_pinctrl_probe(struct platform_device *pdev)
 
 	atmel_pioctrl->reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(atmel_pioctrl->reg_base))
-		return -EINVAL;
+		return PTR_ERR(atmel_pioctrl->reg_base);
 
 	atmel_pioctrl->clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(atmel_pioctrl->clk)) {
-- 
2.1.0

