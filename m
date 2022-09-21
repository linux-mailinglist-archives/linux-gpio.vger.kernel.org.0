Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28CD65BF88D
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Sep 2022 10:02:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbiIUICr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Sep 2022 04:02:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbiIUICp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Sep 2022 04:02:45 -0400
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 911AD8277C
        for <linux-gpio@vger.kernel.org>; Wed, 21 Sep 2022 01:02:43 -0700 (PDT)
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B52D4207FDD;
        Wed, 21 Sep 2022 10:02:41 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 24EB22080AA;
        Wed, 21 Sep 2022 10:02:41 +0200 (CEST)
Received: from local (shlinux2.ap.freescale.net [10.192.224.44])
        by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id A6D86180222C;
        Wed, 21 Sep 2022 16:02:39 +0800 (+08)
From:   haibo.chen@nxp.com
To:     linus.walleij@linaro.org, brgl@bgdev.pl, dmitry.torokhov@gmail.com
Cc:     linux-gpio@vger.kernel.org, haibo.chen@nxp.com,
        aisheng.dong@nxp.com, linux-imx@nxp.com
Subject: [PATCH] gpiolib: add NULL to the end of arry of_find_gpio_quirks[]
Date:   Wed, 21 Sep 2022 15:43:57 +0800
Message-Id: <1663746237-7133-1-git-send-email-haibo.chen@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Haibo Chen <haibo.chen@nxp.com>

After commit a2b5e207cade ("gpiolib: rework quirk handling in
of_find_gpio()"), it add an arry of_find_gpio_quirks[], but in
the for loop, it use *q to judge whether it is out of the arry
range. Unfortunately, in the arry, forget to add NULL in the end,
which has the risk of out of arry access, here is the dump on
i.MX8MM-evk board:

[    0.773631] Internal error: SP/PC alignment exception: 000000008a000000 [#1] PREEMPT SMP
[    0.781112] Modules linked in:
[    0.784173] CPU: 2 PID: 1 Comm: swapper/0 Not tainted 6.0.0-rc6-next-20220919 #4
[    0.791609] Hardware name: FSL i.MX8MM EVK board (DT)
[    0.796686] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    0.803682] pc : 0x61722d6f697067
[    0.807009] lr : of_find_gpio+0x130/0x170
[    0.811035] sp : ffff80000a44b9d0
[    0.814357] x29: ffff80000a44b9d0 x28: 0000000000000000 x27: ffff0000002ece80
[    0.821534] x26: ffff000003948a00 x25: 0000000000000001 x24: ffff8000098285e8
[    0.828707] x23: ffff800009175f48 x22: ffff80000a44bac0 x21: 0000000000000000
[    0.835882] x20: ffff000000236810 x19: ffff80000978c588 x18: 0000000000000000
[    0.843057] x17: 0000000000009800 x16: 0000000000004650 x15: 0000000000000001
[    0.850232] x14: 0000000000000000 x13: 0000000000000018 x12: 0101010101010101
[    0.857407] x11: ff7f7f7f7f7f7f7f x10: fffffffffff8e088 x9 : 0000000000000003
[    0.864582] x8 : 0101010101010101 x7 : ffff80000971a7b0 x6 : 141047145c43003a
[    0.871757] x5 : 6e61722d6f697067 x4 : fffffffffffffffe x3 : ffff80000a44ba24
[    0.878934] x2 : 0000000000000000 x1 : ffff80000978c588 x0 : ffff00007dbf7d00
[    0.886110] Call trace:
[    0.888560]  0x61722d6f697067
[    0.891534]  gpiod_get_index+0x124/0x3c4
[    0.895470]  devm_gpiod_get_index+0x2c/0xe4
[    0.899670]  devm_gpiod_get_optional+0x18/0x30
[    0.904132]  uart_get_rs485_mode+0x100/0x17c
[    0.908420]  imx_uart_probe+0x3f0/0x800
[    0.912272]  platform_probe+0x68/0xe0
[    0.915945]  really_probe+0xbc/0x2dc
[    0.919532]  __driver_probe_device+0x78/0xe0
[    0.923820]  driver_probe_device+0xd8/0x160
[    0.928020]  __driver_attach+0x80/0x190
[    0.931870]  bus_for_each_dev+0x70/0xd0
[    0.935720]  driver_attach+0x24/0x30
[    0.939307]  bus_add_driver+0x150/0x200
[    0.943159]  driver_register+0x78/0x130
[    0.947007]  __platform_driver_register+0x28/0x34
[    0.951732]  imx_uart_init+0x3c/0x64
[    0.955320]  do_one_initcall+0x50/0x1c0
[    0.959170]  kernel_init_freeable+0x218/0x284
[    0.963545]  kernel_init+0x24/0x12c
[    0.967045]  ret_from_fork+0x10/0x20
[    0.970640] Code: bad PC value
[    0.973700] ---[ end trace 0000000000000000 ]---
[    0.978399] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
[    0.986035] SMP: stopping secondary CPUs
[    0.989978] Kernel Offset: disabled
[    0.993472] CPU features: 0x00000,00800084,0000421b
[    0.998372] Memory Limit: none
[    1.001437] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---

Fixes: a2b5e207cade ("gpiolib: rework quirk handling in of_find_gpio()")
Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 drivers/gpio/gpiolib-of.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 95be5f0d2623..1b60cd04883f 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -498,6 +498,7 @@ static const of_find_gpio_quirk of_find_gpio_quirks[] = {
 	of_find_regulator_gpio,
 	of_find_arizona_gpio,
 	of_find_usb_gpio,
+	NULL,
 };
 
 struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
-- 
2.34.1

